unit PGPO006;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_po_estorno = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_di_: TQuery;
    qry_di_NR_PROCESSO: TStringField;
    qry_ret_po_di_: TQuery;
    ds_empresa_nac: TDataSource;
    tbl_empresa_nac_: TTable;
    tbl_empresa_nac_CD_EMPRESA: TStringField;
    tbl_empresa_nac_NM_EMPRESA: TStringField;
    tbl_empresa_nac_AP_EMPRESA: TStringField;
    tbl_empresa_nac_END_EMPRESA: TStringField;
    tbl_empresa_nac_END_NUMERO: TStringField;
    tbl_empresa_nac_END_CIDADE: TStringField;
    tbl_empresa_nac_END_BAIRRO: TStringField;
    tbl_empresa_nac_END_UF: TStringField;
    tbl_empresa_nac_END_CEP: TStringField;
    tbl_empresa_nac_CD_TIPO_PESSOA: TStringField;
    tbl_empresa_nac_CGC_EMPRESA: TStringField;
    tbl_empresa_nac_CPF_EMPRESA: TStringField;
    tbl_empresa_nac_IE_EMPRESA: TStringField;
    tbl_empresa_nac_OUTRO_DOC: TStringField;
    tbl_empresa_nac_DT_INCLUSAO: TDateTimeField;
    tbl_empresa_nac_IN_FATURAMENTO: TStringField;
    tbl_empresa_nac_IN_ATIVO: TStringField;
    tbl_empresa_nac_IN_RESTRICAO: TStringField;
    tbl_empresa_nac_IN_EVENTUAL: TStringField;
    tbl_empresa_nac_CD_TIPO_REF: TStringField;
    tbl_empresa_nac_CD_TAB_SDA: TStringField;
    tbl_empresa_nac_IN_CLIENTE: TBooleanField;
    tbl_empresa_nac_IN_IMPORTADOR: TBooleanField;
    tbl_empresa_nac_IN_EXPORTADOR: TBooleanField;
    tbl_empresa_nac_IN_OUTROS: TBooleanField;
    tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField;
    tbl_empresa_nac_CD_SDA: TStringField;
    tbl_empresa_nac_NR_CAE: TStringField;
    tbl_empresa_nac_CD_GRUPO: TStringField;
    tbl_empresa_nac_CD_PAIS_IMPORTADOR: TStringField;
    qry_ret_po_li_: TQuery;
    qry_li_: TQuery;
    qry_li_NR_PROCESSO: TStringField;
    ds_ret_po_li: TDataSource;
    ds_ret_po_di: TDataSource;
    qry_ret_po_li_NR_PROCESSO: TStringField;
    qry_ret_po_li_CD_IMPORTADOR: TStringField;
    qry_ret_po_li_LookNmImportador: TStringField;
    qry_ret_po_di_NR_PROCESSO: TStringField;
    qry_ret_po_di_CD_IMPORTADOR: TStringField;
    qry_ret_po_di_LookNmImportador: TStringField;
    qry_ret_po_li_IN_MONTADO: TStringField;
    qry_ret_po_di_IN_MONTADO: TStringField;
    qry_exec_sp_: TQuery;
    qry_verif_marc_li_: TQuery;
    qry_verif_marc_di_: TQuery;
    qry_verif_marc_di_NR_PROCESSO: TStringField;
    qry_verif_marc_di_CD_IMPORTADOR: TStringField;
    qry_verif_marc_di_IN_MONTADO: TStringField;
    qry_verif_marc_li_NR_PROCESSO: TStringField;
    qry_verif_marc_li_CD_IMPORTADOR: TStringField;
    qry_verif_marc_li_IN_MONTADO: TStringField;
    qry_verif_marc_li_NR_PROC_PO: TStringField;
    qry_verif_marc_di_NR_PROC_PO: TStringField;
    qry_di_NR_DECLARACAO_IMP: TStringField;
    qry_li_NR_REGISTRO_LI: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_po_estorno: Tdatm_po_estorno;

implementation

{$R *.DFM}












end.
