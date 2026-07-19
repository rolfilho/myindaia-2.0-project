unit PGPG018;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pesq_adm = class(TDataModule)
    ds_pesq: TDataSource;
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_favorecido_: TQuery;
    ds_favorecido: TDataSource;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_ct_contabil_: TQuery;
    ds_ct_contabil: TDataSource;
    qry_status_solic_adm_: TQuery;
    ds_status_solic_adm: TDataSource;
    qry_status_solic_adm_CODIGO: TStringField;
    qry_status_solic_adm_DESCRICAO: TStringField;
    qry_historico_: TQuery;
    ds_historico: TDataSource;
    qry_usuario_: TQuery;
    ds_usuario: TDataSource;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_banco_: TQuery;
    ds_calculo: TDataSource;
    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_historico_CD_HISTORICO: TStringField;
    qry_historico_NM_HISTORICO: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    qry_pesq_: TQuery;
    qry_pesq_CD_UNID_NEG: TStringField;
    qry_pesq_CD_CT_CONTABIL: TStringField;
    qry_pesq_CD_FAVORECIDO: TStringField;
    qry_pesq_CD_ACESSO: TStringField;
    qry_pesq_CD_AUX: TStringField;
    qry_pesq_CD_BANCO: TStringField;
    qry_pesq_NR_DOCTO: TStringField;
    qry_pesq_VL_LANCTO: TFloatField;
    qry_pesq_TP_NATUREZA: TStringField;
    qry_pesq_CD_STATUS_ADM: TStringField;
    qry_pesq_CD_USUARIO_SOLIC: TStringField;
    qry_pesq_DT_VENCTO: TDateTimeField;
    qry_pesq_DT_PAGTO: TDateTimeField;
    qry_pesq_CD_HISTORICO: TStringField;
    qry_pesq_LookCtContabil: TStringField;
    qry_pesq_LookFavorecido: TStringField;
    qry_pesq_LookBanco: TStringField;
    qry_pesq_LookStatus: TStringField;
    qry_pesq_LookUsuario: TStringField;
    qry_pesq_LookHistorico: TStringField;
    qry_pesq_LookUnidNeg: TStringField;
    qry_pesq_NR_LANCAMENTO: TStringField;
    qry_param_: TQuery;
    qry_param_HM_PARA_SOLIC_CH: TStringField;
    qry_param_CD_SISTEMA_CONTABIL: TStringField;
    qry_ct_contabilRM_: TQuery;
    qry_ct_contabilRM_CD_CT_CONTABIL: TStringField;
    qry_ct_contabilRM_NM_CT_CONTABIL: TStringField;
    qry_pesq_LookCtContabilRM: TStringField;
    qry_pesq_DT_LANCTO: TDateTimeField;
    qry_pesq_IN_SELECIONADO: TStringField;
    qry_pesq_calcIN_SELECIONADO: TStringField;
    qry_pesq_NR_LANCAMENTO_SELECIONADO: TStringField;
    procedure qry_pesq_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pesq_adm: Tdatm_pesq_adm;

implementation

{$R *.DFM}





procedure Tdatm_pesq_adm.qry_pesq_CalcFields(DataSet: TDataSet);
begin
  if qry_pesq_IN_SELECIONADO.AsString = '1' then
    qry_pesq_calcIN_SELECIONADO.AsString := 'ü'
  else qry_pesq_calcIN_SELECIONADO.AsString := '';
end;

end.
