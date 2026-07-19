unit PGSM135;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_canc_proc = class(TDataModule)
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    ds_produto: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_rel_processo_: TQuery;
    qry_rel_processo_NR_PROCESSO: TStringField;
    qry_rel_processo_CD_UNID_NEG: TStringField;
    qry_rel_processo_CD_PRODUTO: TStringField;
    qry_rel_processo_CD_CLIENTE: TStringField;
    qry_rel_processo_CD_SERVICO: TStringField;
    qry_rel_processo_CD_USUARIO: TStringField;
    qry_rel_processo_IN_CANCELADO: TStringField;
    qry_rel_processo_CD_CANCELADOR: TStringField;
    qry_rel_processo_DT_CANCELAMENTO: TDateTimeField;
    qry_rel_processo_IN_LIBERADO: TStringField;
    qry_rel_processo_look_ap_cliente: TStringField;
    qry_rel_processo_look_produto: TStringField;
    qry_rel_processo_look_ap_usuario: TStringField;
    qry_rel_processo_look_ap_unidade: TStringField;
    ds_rel_processo: TDataSource;
    qry_ult_processo_: TQuery;
    qry_ult_processo_ULTIMO: TStringField;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    qry_empresa_nac_AP_EMPRESA: TStringField;
    qry_empresa_nac_END_EMPRESA: TStringField;
    qry_empresa_nac_END_NUMERO: TStringField;
    qry_empresa_nac_END_CIDADE: TStringField;
    qry_empresa_nac_END_BAIRRO: TStringField;
    qry_empresa_nac_END_UF: TStringField;
    qry_empresa_nac_END_CEP: TStringField;
    qry_empresa_nac_CD_TIPO_PESSOA: TStringField;
    qry_empresa_nac_CGC_EMPRESA: TStringField;
    qry_empresa_nac_CPF_EMPRESA: TStringField;
    qry_empresa_nac_IE_EMPRESA: TStringField;
    qry_empresa_nac_OUTRO_DOC: TStringField;
    qry_empresa_nac_DT_INCLUSAO: TDateTimeField;
    qry_empresa_nac_IN_FATURAMENTO: TStringField;
    qry_empresa_nac_IN_ATIVO: TStringField;
    qry_empresa_nac_IN_RESTRICAO: TStringField;
    qry_empresa_nac_IN_EVENTUAL: TStringField;
    qry_empresa_nac_CD_TIPO_REF: TStringField;
    qry_empresa_nac_CD_TAB_SDA: TStringField;
    qry_empresa_nac_IN_CLIENTE: TBooleanField;
    qry_empresa_nac_IN_IMPORTADOR: TBooleanField;
    qry_empresa_nac_IN_EXPORTADOR: TBooleanField;
    qry_empresa_nac_IN_OUTROS: TBooleanField;
    qry_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField;
    qry_empresa_nac_CD_SDA: TStringField;
    qry_empresa_nac_NR_CAE: TStringField;
    qry_empresa_nac_CD_GRUPO: TStringField;
    qry_empresa_nac_IN_REPRESENTANTE: TBooleanField;
    ds_empresa_nac: TDataSource;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_servico_CD_CLASSIFICACAO: TStringField;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_servico_IN_ATIVO: TStringField;
    ds_servico: TDataSource;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_CD_SENHA: TStringField;
    qry_usuario_CD_CARGO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_usuario_IN_ATIVO: TStringField;
    ds_usuario: TDataSource;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_CD_USUARIO: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_CD_CANCELADOR: TStringField;
    qry_processo_DT_CANCELAMENTO: TDateTimeField;
    ds_processo: TDataSource;
    qry_rel_processo_nr_processo_calc: TStringField;
    qry_fat_cc_: TQuery;
    qry_fat_cc_QT_RECEB: TIntegerField;
    qry_fat_cc_QT_SOLIC_CH: TIntegerField;
    qry_fat_cc_QT_FAT_CC: TFloatField;
    procedure qry_rel_processo_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_canc_proc: Tdatm_canc_proc;
  

implementation

{$R *.DFM}


procedure Tdatm_canc_proc.qry_rel_processo_CalcFields(DataSet: TDataSet);
begin
  with datm_canc_proc do
  begin
     qry_rel_processo_nr_processo_calc.AsString := qry_rel_processo_NR_PROCESSO.AsString;
  end;
end;


end.
