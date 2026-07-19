(*******************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGSM258.PAS - datm_vendedores

AUTOR: Ricardo Giacomi Lopes

DATA: 29/05/2002

Manutenção: Ricardo Giacomi Lopes

Data: 29/05/2002 - XXXXXXXX - Cadastro de Vendedores

********************************************************************************)

unit dVendedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_vendedores = class(TDataModule)
    ds_vendedor: TDataSource;
    qry_vendedor_: TQuery;
    qry_pais_broker: TQuery;
    ds_pais: TDataSource;
    qry_ult_vend_: TQuery;
    qry_local_embarque_: TQuery;
    qry_tp_comissao_: TQuery;
    ds_tp_comissao: TDataSource;
    ds_contato: TDataSource;
    qry_contato_: TQuery;
    upd_vendedor: TUpdateSQL;
    upd_contato: TUpdateSQL;
    qry_vendedor_look_nm_cidade: TStringField;
    qry_vendedor_look_nm_pais: TStringField;
    qry_vendedor_CD_VENDEDOR: TStringField;
    qry_vendedor_NM_VENDEDOR: TStringField;
    qry_vendedor_DS_ENDERECO: TStringField;
    qry_vendedor_CD_CIDADE: TStringField;
    qry_vendedor_NM_UF: TStringField;
    qry_vendedor_CD_PAIS: TStringField;
    qry_vendedor_DS_EMAIL: TStringField;
    qry_vendedor_DS_HOMEPAGE: TStringField;
    qry_vendedor_DS_TIPO_CALCULO: TStringField;
    qry_vendedor_DS_VALOR: TStringField;
    qry_vendedor_NR_FAX: TStringField;
    qry_vendedor_NR_COMPLEM: TStringField;
    qry_vendedor_NM_BAIRRO: TStringField;
    qry_vendedor_NR_CEP: TStringField;
    qry_vendedor_VL_CALC_IMP_AEREA: TFloatField;
    qry_vendedor_VL_CALC_IMP_MARITIMA: TFloatField;
    qry_vendedor_VL_CALC_EXP_AEREA: TFloatField;
    qry_vendedor_VL_CALC_EXP_MARITIMA: TFloatField;
    qry_pais_brokerCD_PAIS: TStringField;
    qry_pais_brokerNM_PAIS: TStringField;
    qry_pais_brokerNM_PAIS_PORT: TStringField;
    qry_pais_brokerNM_PAIS_ING: TStringField;
    qry_pais_brokerNM_PAIS_ESP: TStringField;
    qry_pais_brokerCD_SCX_EXP: TStringField;
    qry_pais_brokerNM_SIGLA_CRT: TStringField;
    qry_tp_comissao_CD_CALC_COMISSAO: TStringField;
    qry_tp_comissao_NM_CALC_COMISSAO: TStringField;
    qry_ult_vend_ULTIMO: TStringField;
    qry_local_embarque_CODIGO: TStringField;
    qry_local_embarque_DESCRICAO: TStringField;
    qry_local_embarque_CD_UNID_NEG_LOCAL: TStringField;
    qry_local_embarque_CD_UF: TStringField;
    qry_contato_CD_CONTATO: TStringField;
    qry_contato_NM_CONTATO: TStringField;
    qry_contato_NR_FONE_CONTATO: TStringField;
    qry_contato_DS_EMAIL_CONTATO: TStringField;
    qry_contato_DS_CARGO_CONTATO: TStringField;
    qry_contato_DS_DEPTO_CONTATO: TStringField;
    qry_contato_CD_VENDEDOR: TStringField;
    qry_local_embarque_CD_PAIS: TStringField;
    qry_pesquisa_: TQuery;
    qry_ult_contato_: TQuery;
    qry_ult_contato_ULTIMO: TStringField;
    qry_vendedor_TP_CALC_COMIS_IMP_AEREA: TStringField;
    qry_vendedor_TP_CALC_COMIS_IMP_MARITIMA: TStringField;
    qry_vendedor_TP_CALC_COMIS_EXP_AEREA: TStringField;
    qry_vendedor_TP_CALC_COMIS_EXP_MARITIMA: TStringField;
    qry_base_calc_: TQuery;
    qry_base_calc_CD_TP_BASE_CALC_VEND: TStringField;
    qry_base_calc_NM_TP_BSE_CALC_VEND: TStringField;
    qry_vendedor_Look_nm_tp_imp_aere: TStringField;
    qry_vendedor_Look_nm_tp_imp_marit: TStringField;
    qry_vendedor_Look_nm_tp_exp_aerea: TStringField;
    qry_vendedor_Look_nm_tp_exp_marit: TStringField;
    qry_vendedor_CD_UNID_NEG: TStringField;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_vendedor_NM_UNID_NEG: TStringField;
    qry_vendedor_VL_CALC_DESEMBARACO: TFloatField;
    qry_vendedor_TP_CALC_DESEMBARACO: TStringField;
    qry_vendedor_Look_nm_tp_desembaraco: TStringField;
    procedure qry_contato_NewRecord(DataSet: TDataSet);
    procedure qry_vendedor_AfterPost(DataSet: TDataSet);
    procedure qry_vendedor_AfterDelete(DataSet: TDataSet);
    procedure qry_contato_AfterDelete(DataSet: TDataSet);
    procedure qry_contato_AfterPost(DataSet: TDataSet);
    procedure qry_vendedor_BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_vendedores: Tdatm_vendedores;

implementation

uses uVendedores,GSMLIB;

{$R *.DFM}

procedure Tdatm_vendedores.qry_contato_NewRecord(DataSet: TDataSet);
begin
  qry_contato_CD_VENDEDOR.Value := qry_vendedor_CD_VENDEDOR.Value;
end;

procedure Tdatm_vendedores.qry_vendedor_AfterPost(DataSet: TDataSet);
begin
  qry_vendedor_.ApplyUpdates;
end;

procedure Tdatm_vendedores.qry_vendedor_AfterDelete(DataSet: TDataSet);
begin
  qry_vendedor_.ApplyUpdates;
end;

procedure Tdatm_vendedores.qry_contato_AfterDelete(DataSet: TDataSet);
begin
  qry_contato_.ApplyUpdates;
end;

procedure Tdatm_vendedores.qry_contato_AfterPost(DataSet: TDataSet);
begin
  qry_contato_.ApplyUpdates;
end;


procedure Tdatm_vendedores.qry_vendedor_BeforePost(DataSet: TDataSet);
begin
  if qry_vendedor_.State in [dsInsert] then
     qry_vendedor_.FieldByName('CD_VENDEDOR').AsString := UltCod( qry_ult_vend_, qry_ult_vend_ULTIMO );
end;

end.
