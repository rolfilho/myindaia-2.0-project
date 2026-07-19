unit PGPE016;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pe_consulta_prod = class(TDataModule)
    qry_pe_itens1_: TQuery;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    ds_pe_itens1: TDataSource;
    qry_pe_itens2_: TQuery;
    ds_pe_itens2: TDataSource;
    qry_pe_itens1_NR_PROCESSO: TStringField;
    qry_pe_itens1_CD_EXPORTADOR: TStringField;
    qry_pe_itens1_QT_MERCADORIA: TFloatField;
    qry_pe_itens1_NR_ITEM: TStringField;
    qry_pe_itens1_CD_NCM: TStringField;
    qry_pe_itens2_NR_PROCESSO: TStringField;
    qry_pe_itens2_CD_EXPORTADOR: TStringField;
    qry_pe_itens2_QT_MERCADORIA: TFloatField;
    qry_pe_itens2_NR_ITEM: TStringField;
    qry_pe_itens2_CD_NCM: TStringField;
    qry_cliente_END_EMPRESA: TStringField;
    qry_cliente_END_NUMERO: TStringField;
    qry_cliente_END_CIDADE: TStringField;
    qry_cliente_END_BAIRRO: TStringField;
    qry_cliente_END_UF: TStringField;
    qry_cliente_END_CEP: TStringField;
    qry_cliente_CD_TIPO_PESSOA: TStringField;
    qry_cliente_CGC_EMPRESA: TStringField;
    qry_cliente_CPF_EMPRESA: TStringField;
    qry_cliente_IE_EMPRESA: TStringField;
    qry_cliente_OUTRO_DOC: TStringField;
    qry_cliente_DT_INCLUSAO: TDateTimeField;
    qry_cliente_IN_FATURAMENTO: TStringField;
    qry_cliente_IN_ATIVO: TStringField;
    qry_cliente_IN_RESTRICAO: TStringField;
    qry_cliente_IN_EVENTUAL: TStringField;
    qry_cliente_CD_TIPO_REF: TStringField;
    qry_cliente_CD_TAB_SDA: TStringField;
    qry_cliente_IN_CLIENTE: TBooleanField;
    qry_cliente_IN_IMPORTADOR: TBooleanField;
    qry_cliente_IN_EXPORTADOR: TBooleanField;
    qry_cliente_IN_OUTROS: TBooleanField;
    qry_cliente_NR_AG_BANCO_IMPOSTOS: TStringField;
    qry_cliente_CD_SDA: TStringField;
    qry_cliente_NR_CAE: TStringField;
    qry_cliente_CD_GRUPO: TStringField;
    qry_cliente_IN_REPRESENTANTE: TBooleanField;
    qry_cliente_NM_INDICADO_POR: TStringField;
    qry_cliente_CD_CT_CONTABIL: TStringField;
    qry_cliente_TX_OBS: TMemoField;
    qry_cliente_CD_PAIS_IMPORTADOR: TStringField;
    qry_cliente_CD_ATIV_ECONOMICA: TStringField;
    qry_cliente_IN_SEGURADORA: TBooleanField;
    qry_cliente_CD_ACESSO: TStringField;
    qry_cliente_CD_AUX: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pe_consulta_prod: Tdatm_pe_consulta_prod;

implementation

{$R *.DFM}






end.
