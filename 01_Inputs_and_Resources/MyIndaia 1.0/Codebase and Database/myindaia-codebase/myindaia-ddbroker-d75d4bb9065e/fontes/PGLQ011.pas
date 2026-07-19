unit PGLQ011;

interface
                  
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ConsOnlineEx;

type
  Tdatm_liq = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_usuario_habilitacao_: TQuery;
    qry_fs_fatura_: TQuery;
    ds_fs_fatura: TDataSource;
    qry_fs_fatura_NR_SOLICITACAO: TStringField;
    qry_fs_fatura_DT_FATURA: TDateTimeField;
    qry_fs_fatura_TP_TIPO_FAT: TStringField;
    qry_fs_fatura_NR_NOTA_FATURA: TStringField;
    qry_fs_fatura_VL_FATURA: TFloatField;
    qry_fs_fatura_VL_LIQUIDACAO: TFloatField;
    qry_fs_fatura_NR_PROCESSO: TStringField;
    qry_fs_fatura_VL_FATURA_PROC: TFloatField;
    qry_fs_fatura_VL_LIQUIDACAO_PROC: TFloatField;
    ds_liquidacao: TDataSource;
    qry_fs_fatura_NR_PROCESSO_CALC: TStringField;
    qry_nr_liquidacao_: TQuery;
    qry_nr_liquidacao_NR_LIQUIDACAO: TStringField;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_yes_no_: TQuery;
    qry_yes_no_CD_YESNO: TStringField;
    qry_yes_no_TX_YESNO: TStringField;
    qry_forma_pagto_: TQuery;
    qry_forma_pagto_CD_FORMA_PAGTO: TStringField;
    qry_forma_pagto_NM_FORMA_PAGTO: TStringField;
    qry_tp_liquidacao_: TQuery;
    qry_tp_liquidacao_CD_TP_LIQUIDACAO: TStringField;
    qry_tp_liquidacao_NM_TP_LIQUIDACAO: TStringField;
    qry_rel_: TQuery;
    qry_fs_fatura_CalcNrSolicitacao: TStringField;
    qry_caixa_ctrl_: TQuery;
    qry_existe_fav_cli_: TQuery;
    qry_proc_rel_: TQuery;
    qry_cancela_liq_: TQuery;
    StringField1: TStringField;
    qry_soma_pend_: TQuery;
    qry_soma_pend_VL_TOTAL: TFloatField;
    ds_soma_pend: TDataSource;
    qry_fs_fatura_NM_EMPRESA: TStringField;
    qry_fs_fatura_CD_GRUPO: TStringField;
    qry_fs_fatura_CD_UNID_NEG: TStringField;
    qry_fs_fatura_CD_PRODUTO: TStringField;
    sp_liq_processo: TStoredProc;
    sp_liq_cancela: TStoredProc;
    qry_soma_liq_: TQuery;
    ds_soma_liq: TDataSource;
    qry_soma_liq_VL_TOTAL: TFloatField;
    qry_liquidacao_: TQuery;
    qry_processo_: TQuery;
    qry_liquidacao_CalcProcesso: TStringField;
    qry_liquidacao_CalcNrSolicFat: TStringField;
    qry_atz_fat_proc_: TQuery;
    qry_fat_notas_: TQuery;
    ds_fat_notas: TDataSource;
    qry_fat_notas_CalcProcesso: TStringField;
    qry_fat_notas_CalcNrSolicFat: TStringField;
    qry_existe_fav_grupo_: TQuery;
    qry_fat_notas_NR_PROCESSO: TStringField;
    qry_fat_notas_NR_LIQUIDACAO: TStringField;
    qry_fat_notas_DT_LIQUIDACAO: TDateTimeField;
    qry_fat_notas_TP_LIQUIDACAO: TStringField;
    qry_fat_notas_VL_LIQUIDACAO: TFloatField;
    qry_fat_notas_IN_CANCELADO: TStringField;
    qry_fat_notas_CD_USUARIO: TStringField;
    qry_fat_notas_calcCancelado: TStringField;
    qry_fat_notas_calcUsuario: TStringField;
    qry_fat_notas_CD_UNID_NEG: TStringField;
    qry_fat_notas_CD_PRODUTO: TStringField;
    qry_fat_notas_NR_SOLICITACAO: TStringField;
    qry_liquidacao_NR_PROCESSO: TStringField;
    qry_liquidacao_NR_LIQUIDACAO: TStringField;
    qry_liquidacao_DT_LIQUIDACAO: TDateTimeField;
    qry_liquidacao_TP_LIQUIDACAO: TStringField;
    qry_liquidacao_VL_LIQUIDACAO: TFloatField;
    qry_liquidacao_IN_CANCELADO: TStringField;
    qry_liquidacao_CD_CANCELADOR: TStringField;
    qry_liquidacao_DT_CANCELAMENTO: TDateTimeField;
    qry_liquidacao_CD_USUARIO: TStringField;
    qry_liquidacao_CD_UNID_NEG: TStringField;
    qry_liquidacao_CD_PRODUTO: TStringField;
    qry_liquidacao_CD_FORMA_PAGTO: TStringField;
    qry_liquidacao_CD_BANCO: TStringField;
    qry_liquidacao_IN_TRANSFERIDO: TStringField;
    qry_liquidacao_DT_TRANSFERENCIA: TDateTimeField;
    qry_liquidacao_DT_SOLIC_CH: TStringField;
    qry_liquidacao_NR_SOLIC_CH: TStringField;
    qry_liquidacao_calcCheque: TStringField;
    qry_liquidacao_calcCdCliente: TStringField;
    qry_liquidacao_calcNmCliente: TStringField;
    qry_liquidacao_calcUnid: TStringField;
    qry_liquidacao_calcProduto: TStringField;
    qry_liquidacao_calcFormaPagto: TStringField;
    qry_liquidacao_calcBanco: TStringField;
    qry_liquidacao_calcCancelador: TStringField;
    qry_liquidacao_calcCancelado: TStringField;
    qry_liquidacao_calcTransferencia: TStringField;
    qry_liquidacao_calcUsuario: TStringField;
    qry_liquidacao_calcTpLiquidacao: TStringField;
    procedure qry_fs_fatura_CalcFields(DataSet: TDataSet);
    procedure qry_liquidacao_CalcFields(DataSet: TDataSet);
    procedure qry_fs_fatura_AfterPost(DataSet: TDataSet);
    procedure qry_liquidacao_AfterPost(DataSet: TDataSet);
    procedure qry_liquidacao_AfterScroll(DataSet: TDataSet);
    procedure qry_liquidacao_BeforePost(DataSet: TDataSet);
    procedure qry_fs_fatura_AfterOpen(DataSet: TDataSet);
    procedure qry_liquidacao_AfterOpen(DataSet: TDataSet);
    procedure qry_fat_notas_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    st_edit_insert: String;
  public
    { Public declarations }
  end;

var
  datm_liq: Tdatm_liq;

implementation

uses PGLQ010, GSMLIB;

{$R *.DFM}

procedure Tdatm_liq.qry_fs_fatura_CalcFields(DataSet: TDataSet);
begin
  qry_fs_fatura_NR_PROCESSO_CALC.AsString  := Copy(qry_fs_fatura_NR_PROCESSO.AsString, 5, 14 );
  qry_fs_fatura_CalcNrSolicitacao.AsString := Copy( qry_fs_fatura_NR_SOLICITACAO.AsString, 1, 2 ) + '/' +
                                              Copy( qry_fs_fatura_NR_SOLICITACAO.AsString, 3, 4 );
end;

procedure Tdatm_liq.qry_liquidacao_CalcFields(DataSet: TDataSet);
begin
  qry_liquidacao_CalcProcesso.AsString   := Copy( qry_liquidacao_NR_PROCESSO.AsString, 5, 14 );
  qry_liquidacao_calcCdCliente.AsString := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', qry_liquidacao_NR_PROCESSO.AsString, 'CD_CLIENTE');
  qry_liquidacao_calcNmCliente.AsString := ConsultaLookUp('TEMPRESA_NAC', 'CD_EMPRESA',qry_liquidacao_calcCdCliente.AsString, 'NM_EMPRESA');
  qry_liquidacao_calcUnid.AsString := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', qry_liquidacao_CD_UNID_NEG.AsString , 'NM_UNID_NEG');
  qry_liquidacao_calcProduto.AsString := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', qry_liquidacao_CD_PRODUTO.AsString , 'NM_PRODUTO');
  qry_liquidacao_calcFormaPagto.AsString := ConsultaLookUp('TTP_FORMA_PAGTO', 'CD_FORMA_PAGTO', qry_liquidacao_CD_FORMA_PAGTO.AsString, 'NM_FORMA_PAGTO');
  qry_liquidacao_calcBanco.AsString := ConsultaLookUp('TBANCO', 'CD_BANCO', qry_liquidacao_CD_BANCO.AsString, 'NM_BANCO');
  qry_liquidacao_calcCancelador.AsString := ConsultaLookUp('TUSUARIO', 'CD_USUARIO', qry_liquidacao_CD_CANCELADOR.AsString, 'NM_USUARIO');
  qry_liquidacao_calcCancelado.AsString := '';
  if qry_liquidacao_IN_CANCELADO.AsString = '1' then
    qry_liquidacao_calcCancelado.AsString := 'ü';
  qry_liquidacao_calcTransferencia.AsString := '';
  if qry_liquidacao_IN_TRANSFERIDO.AsString = '1' then
    qry_liquidacao_calcTransferencia.AsString := 'ü';
  qry_liquidacao_calcUsuario.AsString := ConsultaLookUp('TUSUARIO', 'CD_USUARIO', qry_liquidacao_CD_USUARIO.AsString, 'NM_USUARIO');
  qry_liquidacao_calcTpLiquidacao.asString := ConsultaLookUp('TTP_LIQUIDACAO', 'CD_TP_LIQUIDACAO', qry_liquidacao_TP_LIQUIDACAO.AsString, 'NM_TP_LIQUIDACAO');
  qry_liquidacao_calcCheque.AsString := ConsultaLookUpSQL('SELECT NR_DOCTO FROM TSOLIC_PAGTO (NOLOCK) ' +
                                                          ' WHERE NR_PROCESSO = "' + qry_liquidacao_NR_PROCESSO.AsString + '" AND ' +
                                                          ' NR_LANCAMENTO = "' + qry_liquidacao_NR_SOLIC_CH.AsString + '" ', 'NR_DOCTO');


  if ConsultaLookUpSQL('SELECT COUNT(*) CONT FROM TS_FATURA_PROCESSO WHERE ' +
                       ' NR_PROCESSO_LIQ = "' + qry_liquidacao_NR_PROCESSO.AsString + '" ', 'CONT') > '0' then   //                       ' AND NR_LIQUIDACAO = "' + qry_liquidacao_NR_LIQUIDACAO.AsString + '" '
     qry_liquidacao_CalcNrSolicFat.AsString := ConsultaLookUpSQL('SELECT SUBSTRING(NR_SOLICITACAO, 1, 2) + "/" + SUBSTRING(NR_SOLICITACAO, 3, 4) SOLIC ' +
                                                                 ' FROM TS_FATURA_PROCESSO (NOLOCK) WHERE NR_PROCESSO_LIQ = "' + qry_liquidacao_NR_PROCESSO.AsString + '" ', 'SOLIC')  //' AND NR_LIQUIDACAO = "' + qry_liquidacao_NR_LIQUIDACAO.AsString + '" ' 
  else
     qry_liquidacao_CalcNrSolicFat.AsString := '';
end;

procedure Tdatm_liq.qry_fs_fatura_AfterPost(DataSet: TDataSet);
var chave:string;
begin
  with frm_liq do
  begin
    Chave:=
      msk_cd_unid_neg.Text + msk_cd_produto.Text + qry_fs_fatura_NR_SOLICITACAO.Value;
  end;
end;

procedure Tdatm_liq.qry_liquidacao_AfterPost(DataSet: TDataSet);
var chave : String;
begin
  with frm_liq do
  begin
    Chave:=
      msk_cd_unid_neg.Text + msk_cd_produto.Text + qry_liquidacao_NR_PROCESSO.Value +
      qry_liquidacao_NR_LIQUIDACAO.Value;
  end;
end;

procedure Tdatm_liq.qry_liquidacao_AfterScroll(DataSet: TDataSet);
begin
  if frm_liq.pgctrl_geral.ActivePage = frm_liq.ts_liquidacao then
    if qry_liquidacao_IN_CANCELADO.Value = '0' then
      frm_liq.btn_mi( False, False, False, frm_liq.st_modificar)
    else frm_liq.btn_mi( False, False, False, False);
end;

procedure Tdatm_liq.qry_liquidacao_BeforePost(DataSet: TDataSet);
begin
  if qry_liquidacao_.State = dsEdit then st_edit_insert:= 'dsEdit'
  else st_edit_insert:= 'dsInsert';
end;

procedure Tdatm_liq.qry_fs_fatura_AfterOpen(DataSet: TDataSet);
begin
  with frm_liq do
  begin
    qry_soma_pend_.Close;
    qry_soma_pend_.ParamByName('CD_UNID_NEG').AsString  := msk_cd_unid_neg.Text;
    qry_soma_pend_.ParamByName('CD_PRODUTO').AsString   := msk_cd_produto.Text;
    qry_soma_pend_.ParamByName('CD_GRUPO').AsString     := msk_cd_grupo.Text;
    qry_soma_pend_.ParamByName('CD_CLIENTE').AsString   := msk_cd_cliente.Text;
    qry_soma_pend_.ParamByName('NR_RELATORIO').AsString := msk_nr_relatorio.Text;
    qry_soma_pend_.ParamByName('NR_ANO').AsString       := msk_nr_ano.Text;
    qry_soma_pend_.Prepare;
    qry_soma_pend_.Open;
  end;
end;

procedure Tdatm_liq.qry_liquidacao_AfterOpen(DataSet: TDataSet);
begin
  with frm_liq do
  begin
    qry_soma_liq_.Close;
    qry_soma_liq_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    if rdgrp_liq.ItemIndex = 0 then {Por data}
    begin
      qry_soma_liq_.ParamByName('CD_PRODUTO').AsString          := msk_cd_produto.Text;
      qry_soma_liq_.ParamByName('DT_LIQUIDACAO').AsDate         := StrToDate(msk_dt_liquidacao.Text);
      qry_soma_liq_.ParamByName('NR_PROCESSO').AsString         := '';
      qry_soma_liq_.ParamByName('CD_GRUPO').AsString            := '';
      qry_soma_liq_.ParamByName('CD_CLIENTE').AsString          := '';
      qry_soma_liq_.ParamByName('NR_RELATORIO').AsString        := '';
      qry_soma_liq_.ParamByName('NR_ANO').AsString              := '';
    end;
    if rdgrp_liq.ItemIndex = 1 then {Por processo}
    begin
      qry_soma_liq_.ParamByName('CD_PRODUTO').AsString          := msk_cd_produto.Text;
      qry_soma_liq_.ParamByName('DT_LIQUIDACAO').AsString       := '';
      qry_soma_liq_.ParamByName('NR_PROCESSO').AsString         := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
      qry_soma_liq_.ParamByName('CD_GRUPO').AsString            := '';
      qry_soma_liq_.ParamByName('CD_CLIENTE').AsString          := '';
      qry_soma_liq_.ParamByName('NR_RELATORIO').AsString        := '';
      qry_soma_liq_.ParamByName('NR_ANO').AsString              := '';
    end;
    if rdgrp_liq.ItemIndex = 2 then {Por relatório}
    begin
      qry_soma_liq_.ParamByName('CD_PRODUTO').AsString          := '';
      qry_soma_liq_.ParamByName('DT_LIQUIDACAO').AsString       := '';
      qry_soma_liq_.ParamByName('NR_PROCESSO').AsString         := '';
      qry_soma_liq_.ParamByName('CD_GRUPO').AsString            := Trim( msk_cd_grupo2.Text );
      qry_soma_liq_.ParamByName('CD_CLIENTE').AsString          := Trim( msk_cd_cliente2.Text );
      qry_soma_liq_.ParamByName('NR_RELATORIO').AsString        := msk_nr_relatorio2.Text;
      qry_soma_liq_.ParamByName('NR_ANO').AsString              := msk_nr_ano2.Text;
    end;
    if rdgrp_liq.ItemIndex = 3 then {Por nº Grupo}
    begin
      qry_soma_liq_.ParamByName('CD_PRODUTO').AsString          := '';
      qry_soma_liq_.ParamByName('DT_LIQUIDACAO').AsDate         := StrToDate(msk_dt_liquidacao.Text);
      qry_soma_liq_.ParamByName('NR_PROCESSO').AsString         := '';
      qry_soma_liq_.ParamByName('CD_GRUPO').AsString            := '';
      qry_soma_liq_.ParamByName('CD_CLIENTE').AsString          := '';
      qry_soma_liq_.ParamByName('NR_RELATORIO').AsString        := '';
      qry_soma_liq_.ParamByName('NR_ANO').AsString              := '';
    end;
    qry_soma_liq_.Prepare;
    qry_soma_liq_.Open;
  end;
end;




procedure Tdatm_liq.qry_fat_notas_CalcFields(DataSet: TDataSet);
begin
  qry_fat_notas_CalcProcesso.AsString   := Copy( qry_fat_notas_NR_PROCESSO.AsString, 5, 14 );

  qry_fat_notas_CalcNrSolicFat.AsString := Copy( qry_fat_notas_NR_SOLICITACAO.AsString, 1, 2 ) + '/' +
                                           Copy( qry_fat_notas_NR_SOLICITACAO.AsString, 3, 4 );

  qry_fat_notas_calcUsuario.AsString :=  ConsultaLookUp('TUSUARIO', 'CD_USUARIO', qry_fat_notas_CD_USUARIO.ASString, 'NM_USUARIO');

  qry_fat_notas_calcCancelado.AsString := ' ';
  if qry_fat_notas_IN_CANCELADO.AsString = '1' then
    qry_fat_notas_calcCancelado.AsString := 'ü';

end;


end.
