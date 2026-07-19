(*************************************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGIN002.PAS - Data Modulo - Integração Work Image - datm_int_work_im

AUTOR: Carla Regina Castelo

DATA: 21/12/2001

*************************************************************************************************)

unit PGIN002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_int_work_im = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_servico_CD_CLASSIFICACAO: TStringField;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_servico_IN_ATIVO: TStringField;
    qry_cliente_servico_: TQuery;
    qry_cliente_servico_CD_CLIENTE: TStringField;
    qry_cliente_servico_CD_UNID_NEG: TStringField;
    qry_cliente_servico_CD_PRODUTO: TStringField;
    qry_cliente_servico_CD_SERVICO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_processo_: TQuery;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    qry_dados_processo_: TQuery;
    qry_arq_proc_: TQuery;
    qry_arq_proc_NR_PROCESSO: TStringField;
    qry_arq_proc_CD_CLIENTE: TStringField;
    qry_arq_proc_NR_DECLARACAO_IMP: TStringField;
    qry_arq_proc_DT_REGISTRO_DI: TStringField;
    qry_arq_proc_VL_MLE_MN: TFloatField;
    qry_arq_proc_NR_CONHECIMENTO: TStringField;
    qry_arq_proc_NR_CONHECIMENTO_MASTER: TStringField;
    qry_arq_proc_TX_MERCADORIA: TMemoField;
    qry_arq_proc_CD_REFERENCIA: TStringField;
    qry_arq_proc_DT_ABERTURA: TDateTimeField;
    qry_arq_proc_DATA_TERMINO: TDateTimeField;
    qry_dados_processo_CD_CLIENTE: TStringField;
    qry_dados_processo_CD_SERVICO: TStringField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_arq_import_: TQuery;
    qry_arq_import_NR_PROCESSO: TStringField;
    qry_arq_import_CD_UNID_NEG: TStringField;
    qry_arq_import_CD_PRODUTO: TStringField;
    qry_arq_import_CD_SERVICO: TStringField;
    qry_arq_import_CGC_EMPRESA: TStringField;
    qry_arq_import_CPF_EMPRESA: TStringField;
    qry_arq_import_NM_EMPRESA: TStringField;
    qry_arq_import_AP_EMPRESA: TStringField;
    qry_arq_import_CD_TIPO_PESSOA: TStringField;
    qry_arq_import_DT_VALID_CRED_RF: TDateTimeField;
    qry_arq_import_CD_CLIENTE: TStringField;
    qry_arq_import_END_CIDADE: TStringField;
    qry_parametro_: TQuery;
    qry_parametro_PATH_WORK_IMAGE: TStringField;
    qry_edita_etiqueta_: TQuery;
    qry_edita_etiqueta_IN_ETIQUETA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_int_work_im: Tdatm_int_work_im;

implementation

{$R *.DFM}




end.
