unit dProcComerc;
(*******************************************************************************
SISTEMA: Broker - Cargo
PROGRAMA: PGSM252.PAS - datm_proc_comerc
AUTOR: Paulo do Amaral Costa
DATA: 05/07/2002
MANUTENÇÃO:  -
DATA: -
NÚMERO DOCUMENTO - ADBCEC-0011
ANALISTA RESPONSÁVEL: Claudemir Lopes
CLIENTE: Ecotrans / Sr. Hélio
********************************************************************************)
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Funcoes, ConsOnlineEx;

type
  Tdatm_proc_comerc = class(TDataModule)
    ds_proc_comerc: TDataSource;
    qry_ult_proc_comerc_: TQuery;
    upd_qry_proc_comerc_: TUpdateSQL;
    qry_proc_comerc_: TQuery;
    qry_pais_broker_: TQuery;
    ds_proc_comerc_lista: TDataSource;
    qry_vendedor_: TQuery;
    qry_unid_neg_: TQuery;
    qry_empresa_: TQuery;
    qry_pais_broker_CD_PAIS: TStringField;
    qry_proc_comerc_NR_PROC_COMERC: TStringField;
    qry_proc_comerc_DT_ABERTURA: TDateTimeField;
    qry_proc_comerc_TP_SALES: TStringField;
    qry_proc_comerc_CD_UNID_NEG: TStringField;
    qry_proc_comerc_CD_EMPRESA: TStringField;
    qry_proc_comerc_CD_VENDEDOR: TStringField;
    qry_proc_comerc_NM_EMAIL: TStringField;
    qry_proc_comerc_NM_CONTATO: TStringField;
    qry_empresa_CD_EMPRESA: TStringField;
    qry_empresa_NM_EMPRESA: TStringField;
    qry_empresa_END_EMPRESA: TStringField;
    qry_empresa_END_NUMERO: TStringField;
    qry_empresa_END_CIDADE: TStringField;
    qry_empresa_END_BAIRRO: TStringField;
    qry_empresa_END_UF: TStringField;
    qry_empresa_END_CEP: TStringField;
    qry_empresa_DT_INCLUSAO: TDateTimeField;
    qry_empresa_IN_CLIENTE: TBooleanField;
    qry_empresa_IN_OUTROS: TBooleanField;
    qry_empresa_NR_TELEFONE: TStringField;
    qry_empresa_NR_FAX: TStringField;
    qry_empresa_IN_ATIVO: TStringField;
    qry_empresa_CD_PAIS_IMPORTADOR: TStringField;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_traz_default_: TQuery;
    qry_proc_comerc_CD_USUARIO: TStringField;
    qry_proc_comerc_look_nm_unid_neg: TStringField;
    qry_vendedor_CD_VENDEDOR: TStringField;
    qry_vendedor_NM_VENDEDOR: TStringField;
    qry_proc_comerc_look_nm_vendedor: TStringField;
    qry_ult_proc_comerc_ULTIMO: TStringField;
    qry_pais_broker_NM_PAIS: TStringField;
    qry_tp_sales_: TQuery;
    qry_tp_sales_CD_SALES: TStringField;
    qry_tp_sales_NM_SALES: TStringField;
    ds_tp_sales: TDataSource;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_proc_comerc_TP_CLIENTE: TStringField;
    qry_proc_comerc_lista_: TQuery;
    qry_proc_comerc_lista_NR_PROC_COMERC: TStringField;
    qry_proc_comerc_lista_DT_ABERTURA: TDateTimeField;
    qry_proc_comerc_lista_CD_UNID_NEG: TStringField;
    qry_proc_comerc_lista_CD_EMPRESA: TStringField;
    qry_proc_comerc_lista_NM_EMAIL: TStringField;
    qry_proc_comerc_lista_NM_CONTATO: TStringField;
    qry_proc_comerc_lista_CD_USUARIO: TStringField;
    qry_proc_comerc_lista_NM_EMPRESA: TStringField;
    qry_proc_comerc_lista_CGC_EMPRESA: TStringField;
    qry_agenda_comerc_: TQuery;
    ds_agenda_comerc: TDataSource;
    qry_proc_comerc_historico_: TQuery;
    ds_proc_comerc_historico: TDataSource;
    upd_qry_agenda_comerc_: TUpdateSQL;
    upd_qry_proc_comerc_historico_: TUpdateSQL;
    qry_proc_comerc_historico_NR_PROC_COMERC: TStringField;
    qry_proc_comerc_historico_NM_HISTORICO: TStringField;
    qry_proc_comerc_historico_NM_CONTATO: TStringField;
    qry_proc_comerc_historico_TX_OBS_HISTORICO: TMemoField;
    qry_proc_comerc_historico_CD_AGENDA: TIntegerField;
    qry_agenda_comerc_look_nm_vendedor: TStringField;
    qry_agenda_comerc_look_nm_contato: TStringField;
    qry_ult_proc_comerc_historico_: TQuery;
    qry_proc_comerc_historico_CD_HIST_PROC_COMERC: TIntegerField;
    qry_ult_proc_comerc_historico_ULTIMO: TIntegerField;
    ds_vendedor: TDataSource;
    qry_ult_agenda_comerc_: TQuery;
    qry_ult_agenda_comerc_ULTIMO: TIntegerField;
    qry_agenda_comerc_lista_: TQuery;
    ds_agenda_comerc_lista: TDataSource;
    qry_agenda_comerc_lista_CD_AGENDA: TIntegerField;
    qry_agenda_comerc_lista_CD_VENDEDOR: TStringField;
    qry_agenda_comerc_lista_IN_PERIODO: TStringField;
    qry_agenda_comerc_lista_DT_AGENDA: TDateTimeField;
    qry_agenda_comerc_lista_IN_CANCELADO: TStringField;
    qry_agenda_comerc_lista_OBS_AGENDA: TMemoField;
    qry_agenda_comerc_lista_look_nm_vendedor: TStringField;
    upd_qry_agenda_comerc_lista_: TUpdateSQL;
    qry_proc_comerc_historico_HR_HISTORICO: TDateTimeField;
    qry_agenda_comerc_lista_HR_AGENDA: TDateTimeField;
    qry_agenda_: TQuery;
    qry_agenda_CD_AGENDA: TIntegerField;
    qry_agenda_CD_VENDEDOR: TStringField;
    qry_agenda_IN_PERIODO: TStringField;
    qry_agenda_DT_AGENDA: TDateTimeField;
    qry_agenda_comerc_CD_AGENDA: TIntegerField;
    qry_agenda_comerc_CD_VENDEDOR: TStringField;
    qry_agenda_comerc_IN_PERIODO: TStringField;
    qry_agenda_comerc_DT_AGENDA: TDateTimeField;
    qry_agenda_comerc_HR_AGENDA: TDateTimeField;
    qry_agenda_comerc_IN_CANCELADO: TStringField;
    qry_agenda_comerc_OBS_AGENDA: TMemoField;
    qry_agenda_comerc_lista_NR_PROC_COMERC: TStringField;
    qry_agenda_comerc_NR_PROC_COMERC: TStringField;
    qry_proc_comerc_NM_EMPRESA: TStringField;
    qry_proc_comerc_END_EMPRESA: TStringField;
    qry_proc_comerc_END_NUMERO: TStringField;
    qry_proc_comerc_END_CIDADE: TStringField;
    qry_proc_comerc_END_BAIRRO: TStringField;
    qry_proc_comerc_END_UF: TStringField;
    qry_proc_comerc_END_CEP: TStringField;
    qry_proc_comerc_NR_TELEFONE: TStringField;
    qry_proc_comerc_NR_FAX: TStringField;
    qry_proc_comerc_NM_PAIS: TStringField;
    qry_empresa_NM_PAIS: TStringField;
    qry_proc_comerc_lista_CD_PAIS_IMPORTADOR: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_proc_comerc_NM_GRUPO: TStringField;
    qry_empresa_NM_GRUPO: TStringField;
    qry_proc_comerc_historico_DT_HISTORICO: TDateTimeField;
    qry_proc_comerc_historico_IN_PERIODO: TStringField;
    qry_agenda_comerc_lista_TP_AGENDA: TStringField;
    qry_agenda_comerc_lista_NM_CONTATO: TStringField;
    qry_gera_proposta_: TQuery;
    qry_ult_proposta_: TQuery;
    qry_ult_proposta_ULTIMO: TStringField;
    qry_proposta_: TQuery;
    ds_proposta: TDataSource;
    qry_proposta_NR_PROPOSTA: TStringField;
    qry_proposta_CD_UNID_NEG: TStringField;
    qry_proposta_CD_EMPRESA: TStringField;
    qry_proposta_DT_ABERTURA: TDateTimeField;
    qry_proposta_DT_VALIDADE: TDateTimeField;
    qry_proposta_CD_STATUS: TStringField;
    qry_proposta_DT_STATUS: TDateTimeField;
    qry_proposta_NM_RESPONSAVEL: TStringField;
    qry_proposta_NR_PROC_COMERC: TStringField;
    qry_proposta_CD_USUARIO: TStringField;
    qry_agenda_comerc_TP_AGENDA: TStringField;
    qry_agenda_comerc_NM_CONTATO: TStringField;
    qry_empresa_IN_RESTRICAO: TStringField;
    qry_proc_comerc_IN_RESTRICAO: TStringField;
    qry_proposta_calc_status: TStringField;
    qry_proc_vendedor_: TQuery;
    ds_proc_vendedor: TDataSource;
    qry_proc_vendedor_CD_VENDEDOR: TStringField;
    qry_proc_vendedor_NR_PROC_COMERC: TStringField;
    qry_proc_vendedor_TP_CALC_COMIS_IMP_AEREA: TStringField;
    qry_proc_vendedor_TP_CALC_COMIS_IMP_MARITIMA: TStringField;
    qry_proc_vendedor_TP_CALC_COMIS_EXP_AEREA: TStringField;
    qry_proc_vendedor_TP_CALC_COMIS_EXP_MARITIMA: TStringField;
    qry_proc_vendedor_TP_CALC_DESEMBARACO: TStringField;
    qry_proc_vendedor_VL_CALC_IMP_AEREA: TFloatField;
    qry_proc_vendedor_VL_CALC_IMP_MARITIMA: TFloatField;
    qry_proc_vendedor_VL_CALC_EXP_AEREA: TFloatField;
    qry_proc_vendedor_VL_CALC_DESEMBARACO: TFloatField;
    qry_proc_vendedor_VL_CALC_EXP_MARITIMA: TFloatField;
    UpDate_proc_vendedor: TUpdateSQL;
    qry_proc_vendedor_NM_VENDEDOR: TStringField;
    qry_base_calc_vendedor_: TQuery;
    qry_proc_vendedor_Look_tp_calc_imp_aerea: TStringField;
    qry_proc_vendedor_Look_tp_calc_imp_maritima: TStringField;
    qry_proc_vendedor_Look_tp_exp_aerea: TStringField;
    qry_proc_vendedor_Look_tp_calc_exp_maritima: TStringField;
    qry_proc_vendedor_look_tp_calc_desembaraco: TStringField;
    qry_proc_comerc_historico_calc_tp_historico: TStringField;
    qry_pesquisa_: TQuery;
    qry_proc_comerc_historico_CD_VENDEDOR: TStringField;
    qry_proc_comerc_historico_calcVendedor: TStringField;
    qry_proposta_TIPO_PROPOSTA: TStringField;
    procedure qry_proc_comerc_AfterDelete(DataSet: TDataSet);
    procedure qry_proc_comerc_AfterPost(DataSet: TDataSet);
    procedure qry_proc_comerc_NewRecord(DataSet: TDataSet);
    procedure qry_proc_comerc_BeforePost(DataSet: TDataSet);
    procedure qry_proc_comerc_lista_AfterScroll(DataSet: TDataSet);
    procedure qry_proc_comerc_historico_AfterDelete(DataSet: TDataSet);
    procedure qry_proc_comerc_historico_AfterPost(DataSet: TDataSet);
    procedure qry_agenda_comerc_AfterPost(DataSet: TDataSet);
    procedure qry_agenda_comerc_AfterDelete(DataSet: TDataSet);
    procedure qry_proc_comerc_AfterScroll(DataSet: TDataSet);
    procedure qry_agenda_comerc_lista_AfterPost(DataSet: TDataSet);
    procedure qry_agenda_comerc_lista_BeforePost(DataSet: TDataSet);
    procedure qry_agenda_comerc_BeforePost(DataSet: TDataSet);
    procedure qry_proc_comerc_historico_BeforePost(DataSet: TDataSet);
    procedure qry_proposta_CalcFields(DataSet: TDataSet);
    procedure qry_proc_vendedor_AfterDelete(DataSet: TDataSet);
    procedure qry_proc_vendedor_AfterPost(DataSet: TDataSet);
    procedure qry_proc_comerc_historico_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_proc_comerc: Tdatm_proc_comerc;
  str_cd_empresa: string;
  flt_nr_processo      : Double;

implementation
uses GSMLIB, uProcComerc,PGGP001, PGGP017;
{$R *.DFM}


procedure Tdatm_proc_comerc.qry_proc_comerc_AfterDelete(DataSet: TDataSet);
begin
  qry_proc_comerc_.ApplyUpdates;
end;

procedure Tdatm_proc_comerc.qry_proc_comerc_AfterPost(DataSet: TDataSet);
begin
  qry_proc_comerc_.ApplyUpdates;
end;

procedure Tdatm_proc_comerc.qry_proc_comerc_NewRecord(DataSet: TDataSet);
begin
  qry_proc_comerc_DT_ABERTURA.Value:=dt_server;
  qry_proc_comerc_CD_UNID_NEG.Value:= frm_proc_comerc.msk_cd_unid_neg.Text;
  qry_proc_comerc_look_nm_unid_neg.Value := frm_proc_comerc.edt_nm_unid_neg.Text;
end;

procedure Tdatm_proc_comerc.qry_proc_comerc_BeforePost(DataSet: TDataSet);
begin
  if (qry_proc_comerc_.State = dsInsert) then
  begin
    //** antes era no BeforeInsert **
    qry_ult_proc_comerc_.Close;
    qry_ult_proc_comerc_.ParamByName('CD_UNID_NEG').Value:= frm_proc_comerc.msk_cd_unid_neg.Text;
    qry_ult_proc_comerc_.ParamByName('ANO').Value:= FormatDateTime('YY', dt_server);
    qry_ult_proc_comerc_.Open;

    if Copy(qry_ult_proc_comerc_ULTIMO.AsString, 4, 6) = '' then
       flt_nr_processo := StrToFloat( '000001' )
    else
       flt_nr_processo := StrToFloat( Copy( qry_ult_proc_comerc_ULTIMO.AsString, 4, 6 ) ) + 1;

    qry_ult_proc_comerc_.Close;
    //** fim **

    //*** antes era no OnNewRecord ***
    qry_proc_comerc_NR_PROC_COMERC.AsString  := frm_proc_comerc.msk_cd_unid_neg.Text + '-' +
                                             FormatFloat( '000000', flt_nr_processo ) + '/' +
                                             FormatDateTime('YY', dt_server);
    //*** fim ***
  end;
  qry_proc_comerc_CD_USUARIO.Value:=str_cd_usuario;
end;

procedure Tdatm_proc_comerc.qry_proc_comerc_lista_AfterScroll(
  DataSet: TDataSet);
begin
  frm_Proc_comerc.ctrl_tab_sheet:= true;

end;

procedure Tdatm_proc_comerc.qry_proc_comerc_historico_AfterDelete(
  DataSet: TDataSet);
begin
  qry_proc_comerc_historico_.ApplyUpdates;
end;

procedure Tdatm_proc_comerc.qry_proc_comerc_historico_AfterPost(
  DataSet: TDataSet);
begin
  qry_proc_comerc_historico_.ApplyUpdates;
end;

procedure Tdatm_proc_comerc.qry_agenda_comerc_AfterPost(DataSet: TDataSet);
begin
  qry_agenda_comerc_.ApplyUpdates;
end;

procedure Tdatm_proc_comerc.qry_agenda_comerc_AfterDelete(
  DataSet: TDataSet);
begin
  qry_agenda_comerc_.ApplyUpdates;
end;

procedure Tdatm_proc_comerc.qry_proc_comerc_AfterScroll(DataSet: TDataSet);
begin
{    qry_proc_comerc_historico_.Close;
    qry_proc_comerc_historico_.Prepare;
    qry_proc_comerc_historico_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_NR_PROC_COMERC.AsString;
    qry_proc_comerc_historico_.Open;   }

//  qry_agenda_comerc_lista_.DisableControls;
//  qry_agenda_comerc_lista_.Close;
//  qry_agenda_comerc_lista_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_NR_PROC_COMERC.AsString;
//  qry_agenda_comerc_lista_.Open;
//  qry_agenda_comerc_lista_.EnableControls;
end;

procedure Tdatm_proc_comerc.qry_agenda_comerc_lista_AfterPost(
  DataSet: TDataSet);
begin
  qry_agenda_comerc_lista_.ApplyUpdates;
end;

procedure Tdatm_proc_comerc.qry_agenda_comerc_lista_BeforePost(
  DataSet: TDataSet);
begin
  qry_agenda_comerc_lista_TP_AGENDA.AsString:='1';
end;

procedure Tdatm_proc_comerc.qry_agenda_comerc_BeforePost(
  DataSet: TDataSet);
begin
//qry_agenda_comerc_TP_AGENDA.AsString:='1';
end;

procedure Tdatm_proc_comerc.qry_proc_comerc_historico_BeforePost(
  DataSet: TDataSet);
begin
  if qry_proc_comerc_historico_.State in [dsInsert]then
    begin
      qry_ult_proc_comerc_historico_.Close;
      qry_ult_proc_comerc_historico_.Prepare;
      qry_ult_proc_comerc_historico_.Open;
      qry_proc_comerc_historico_CD_HIST_PROC_COMERC.Value  := qry_ult_proc_comerc_historico_ULTIMO.Value + 1;
    end;
end;

procedure Tdatm_proc_comerc.qry_proposta_CalcFields(DataSet: TDataSet);
begin
 if qry_proposta_CD_STATUS.AsString = '0' then
      qry_proposta_calc_status.AsString:='Aprovada';

  if qry_proposta_CD_STATUS.AsString = '1' then
      qry_proposta_calc_status.AsString:='Ag. Aprovação';

  if qry_proposta_CD_STATUS.AsString = '2' then
      qry_proposta_calc_status.AsString:='Cancelada';

  if qry_proposta_CD_STATUS.AsString = '3' then
      qry_proposta_calc_status.AsString:='Rejeitada';
end;

procedure Tdatm_proc_comerc.qry_proc_vendedor_AfterDelete(
  DataSet: TDataSet);
begin
qry_proc_vendedor_.ApplyUpdates;
end;

procedure Tdatm_proc_comerc.qry_proc_vendedor_AfterPost(DataSet: TDataSet);
begin
qry_proc_vendedor_.ApplyUpdates;
end;

procedure Tdatm_proc_comerc.qry_proc_comerc_historico_CalcFields(
  DataSet: TDataSet);
begin
 if qry_proc_comerc_historico_NM_HISTORICO.AsString = '0' then
      qry_proc_comerc_historico_calc_tp_historico.AsString:='Visita';
 if qry_proc_comerc_historico_NM_HISTORICO.AsString = '1' then
      qry_proc_comerc_historico_calc_tp_historico.AsString:='Telefone';
 if qry_proc_comerc_historico_NM_HISTORICO.AsString = '2' then
      qry_proc_comerc_historico_calc_tp_historico.AsString:='E-mail';
 if qry_proc_comerc_historico_NM_HISTORICO.AsString = '3' then
      qry_proc_comerc_historico_calc_tp_historico.AsString:='Fax';
 if qry_proc_comerc_historico_NM_HISTORICO.AsString = '4' then
      qry_proc_comerc_historico_calc_tp_historico.AsString:='Postagem';


 qry_proc_comerc_historico_calcVendedor.AsString := ConsultaLookUP('TVENDEDOR', 'CD_VENDEDOR', qry_proc_comerc_historico_CD_VENDEDOR.AsString, 'NM_VENDEDOR');
end;

end.

