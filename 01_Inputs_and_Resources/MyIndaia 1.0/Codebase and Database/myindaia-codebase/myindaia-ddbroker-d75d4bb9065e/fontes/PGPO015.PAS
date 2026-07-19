unit PGPO015;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_po_prepara = class(TDataModule)
    qry_ret_unid_neg_: TQuery;
    ds_processo: TDataSource;
    qry_ret_unid_neg_CD_USUARIO: TStringField;
    qry_ret_unid_neg_CD_UNID_NEG: TStringField;
    qry_ret_unid_neg_CD_PRODUTO: TStringField;
    qry_ret_unid_neg_IN_ATIVO: TStringField;
    qry_ret_unid_neg_IN_DEFAULT: TStringField;
    qry_processo_: TQuery;
    qry_po_: TQuery;
    ds_po: TDataSource;
    qry_po_NR_PROCESSO: TStringField;
    qry_po_CD_IMPORTADOR: TStringField;
    qry_po_CD_VIA_TRANSP: TStringField;
    ds_via_transporte: TDataSource;
    qry_via_transporte_: TQuery;
    qry_via_transporte_CD_VIA_TRANSPORTE: TStringField;
    qry_via_transporte_NM_VIA_TRANSPORTE: TStringField;
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
    tbl_empresa_nac_CD_BANCO_IMPOSTOS: TStringField;
    tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField;
    tbl_empresa_nac_CD_SDA: TStringField;
    tbl_empresa_nac_NR_CAE: TStringField;
    tbl_empresa_nac_CD_GRUPO: TStringField;
    tbl_empresa_nac_CD_PAIS_IMPORTADOR: TStringField;
    qry_po_LookNmCliente: TStringField;
    qry_po_LookNmViaTransp: TStringField;
    ds_po_itens: TDataSource;
    qry_po_itens_: TQuery;
    qry_po_DT_ABERTURA: TDateTimeField;
    qry_po_IN_SELECIONADO: TStringField;
    qry_po_itens_NR_PROCESSO: TStringField;
    qry_po_itens_NR_ITEM: TStringField;
    qry_po_itens_CD_MERCADORIA: TStringField;
    qry_po_itens_CD_NCM_SH: TStringField;
    qry_po_itens_IN_NECESSITA_LI: TBooleanField;
    qry_po_itens_QT_INICIAL: TFloatField;
    qry_po_itens_QT_BAIXADA_LI: TFloatField;
    qry_po_itens_QT_BAIXADA_DI: TFloatField;
    qry_po_itens_IN_SELECIONADO: TStringField;
    qry_po_itens_VL_UNITARIO: TFloatField;
    qry_po_itens_CalcQTDisp: TFloatField;
    qry_po_itens_CalcQtBaixada: TFloatField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    sp_po_marca_item: TStoredProc;
    qry_prep_po_: TQuery;
    ds_prep_po: TDataSource;
    qry_prep_item_: TQuery;
    ds_prep_item: TDataSource;
    ds_prep_nve: TDataSource;
    qry_prep_nve_: TQuery;
    qry_prep_item_NR_PROCESSO: TStringField;
    qry_prep_item_NR_ITEM: TStringField;
    qry_prep_item_NR_PROC_OLD: TStringField;
    qry_prep_item_NR_ITEM_OLD: TStringField;
    qry_prep_item_CD_MERCADORIA: TStringField;
    qry_prep_item_DT_BAIXA: TDateTimeField;
    qry_prep_item_QT_BAIXADA: TFloatField;
    qry_prep_item_NR_SEGURO_DEFINITIVO: TStringField;
    qry_prep_item_VL_DESPESA: TFloatField;
    qry_prep_item_VL_DESCONTO: TFloatField;
    qry_prep_item_VL_SEGURO: TFloatField;
    qry_prep_item_VL_ACRESCIMO: TFloatField;
    qry_prep_item_VL_DEDUCAO: TFloatField;
    qry_prep_item_VL_FRETE_NACIONAL: TFloatField;
    qry_prep_item_VL_FRETE_PREPAID: TFloatField;
    qry_prep_item_VL_FRETE_COLLECT: TFloatField;
    qry_prep_item_VL_BAIXADO: TFloatField;
    qry_prep_item_VL_BAIXADO_RATEIO: TFloatField;
    qry_prep_item_IN_PREPARACAO: TStringField;
    qry_prep_nve_NR_PROCESSO: TStringField;
    qry_prep_nve_NR_ITEM: TStringField;
    qry_prep_nve_NR_PROC_OLD: TStringField;
    qry_prep_nve_NR_ITEM_OLD: TStringField;
    qry_prep_nve_CD_MERCADORIA: TStringField;
    qry_prep_nve_DT_BAIXA: TDateTimeField;
    qry_prep_nve_QT_BAIXADA: TFloatField;
    qry_prep_nve_NR_SEGURO_DEFINITIVO: TStringField;
    qry_prep_nve_VL_DESPESA: TFloatField;
    qry_prep_nve_VL_DESCONTO: TFloatField;
    qry_prep_nve_VL_SEGURO: TFloatField;
    qry_prep_nve_VL_ACRESCIMO: TFloatField;
    qry_prep_nve_VL_DEDUCAO: TFloatField;
    qry_prep_nve_VL_FRETE_NACIONAL: TFloatField;
    qry_prep_nve_VL_FRETE_PREPAID: TFloatField;
    qry_prep_nve_VL_FRETE_COLLECT: TFloatField;
    qry_prep_nve_VL_BAIXADO: TFloatField;
    qry_prep_nve_VL_BAIXADO_RATEIO: TFloatField;
    qry_prep_nve_IN_PREPARACAO: TStringField;
    qry_po_selec_: TQuery;
    sp_po_proc_item: TStoredProc;
    qry_po_QT_TOTAL_ITENS: TStringField;
    qry_po_itens_QT_BAIXAR: TFloatField;
    sp_po_prep_inc_item: TStoredProc;
    sp_po_prep_inc_proc: TStoredProc;
    qry_po_selec_NR_PROCESSO: TStringField;
    qry_po_selec_IN_SELECIONADO: TStringField;
    qry_po_valor_: TQuery;
    ds_po_valor: TDataSource;
    qry_po_nve_: TQuery;
    ds_po_nve: TDataSource;
    qry_po_nve_NR_PROCESSO: TStringField;
    qry_po_nve_NR_ITEM: TStringField;
    qry_po_nve_CD_NIVEL_NVE: TStringField;
    qry_po_nve_CD_ATRIBUTO_NCM: TStringField;
    qry_po_nve_CD_ESPECIF_NCM: TStringField;
    sp_po_prep_inc_nve: TStoredProc;
    qry_prep_po_NR_PROCESSO: TStringField;
    qry_prep_po_CD_IMPORTADOR: TStringField;
    qry_prep_po_CD_PAIS_TRANSBORDO: TStringField;
    qry_prep_po_CD_PAGTO_CAMBIO: TStringField;
    qry_prep_po_CD_MOEDA_FRETE: TStringField;
    qry_prep_po_CD_EXPORTADOR: TStringField;
    qry_prep_po_CD_FABRICANTE: TStringField;
    qry_prep_po_CD_PAIS_PROCEDENCIA: TStringField;
    qry_prep_po_CD_VIA_TRANSP: TStringField;
    qry_prep_po_CD_URF_DESPACHO: TStringField;
    qry_prep_po_CD_URF_ENTRADA: TStringField;
    qry_prep_po_DT_REC_FAX_DOCS: TDateTimeField;
    qry_prep_po_DT_REC_DOCS: TDateTimeField;
    qry_prep_po_DT_PREV_CHEGADA_FABR: TDateTimeField;
    qry_prep_po_DT_EMBARQUE: TDateTimeField;
    qry_prep_po_DT_TRANSBORDO: TDateTimeField;
    qry_prep_po_DT_CONH_EMBARQUE: TDateTimeField;
    qry_prep_po_NR_CONH_EMBARQUE: TStringField;
    qry_prep_po_NR_MANIFESTO: TStringField;
    qry_prep_po_NR_CONH_TRANSBORDO: TStringField;
    qry_prep_po_NM_IDENT_TRANSBORDO: TStringField;
    qry_prep_po_QT_BAIXADA: TFloatField;
    qry_prep_po_TP_EMBARQUE: TStringField;
    qry_prep_po_TP_CALC_RAT_DESPESA: TStringField;
    qry_prep_po_VL_TOT_BAIXADO: TFloatField;
    qry_prep_po_VL_TOT_FRETE: TFloatField;
    qry_prep_po_VL_TOT_SEGURO: TFloatField;
    qry_prep_po_IN_PREPARACAO: TStringField;
    qry_prep_po_QT_TOTAL_ITEM: TStringField;
    qry_prep_po_CD_PAIS_AQUISICAO: TStringField;
    qry_prep_po_CD_PAIS_ORIGEM: TStringField;
    qry_po_itens_QT_DISPONIVEL: TFloatField;
    qry_verif_item_: TQuery;
    qry_po_valor_NR_PROCESSO: TStringField;
    qry_po_valor_QT_TOTAL_ITEM: TStringField;
    qry_verif_item_NR_PROC_OLD: TStringField;
    qry_verif_item_NR_ITEM_OLD: TStringField;
    qry_verif_item_QT_BAIXADA: TFloatField;
    qry_verif_item_DT_BAIXA: TDateTimeField;
    qry_verif_item_NR_PROCESSO: TStringField;
    sp_po_desmarca: TStoredProc;
    sp_po_exclui_prep: TStoredProc;
    qry_muda_: TQuery;
    sp_po_monta_li: TStoredProc;
    sp_po_monta_di: TStoredProc;
    procedure qry_po_itens_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_po_prepara: Tdatm_po_prepara;

implementation

{$R *.DFM}


procedure Tdatm_po_prepara.qry_po_itens_CalcFields(DataSet: TDataSet);
begin
  with datm_po_prepara do
  begin
    if qry_po_itens_NR_ITEM.AsString <> '' then
    begin
      qry_po_itens_CalcQtBaixada.AsFloat := qry_po_itens_QT_BAIXADA_DI.AsFloat +
                                            qry_po_itens_QT_BAIXADA_LI.AsFloat +
                                            qry_po_itens_QT_BAIXAR.AsFloat;

      If qry_po_itens_QT_DISPONIVEL.AsFloat = 0 Then
         qry_po_itens_CalcQTDisp.AsFloat := qry_po_itens_QT_INICIAL.AsFloat - qry_po_itens_CalcQtBaixada.AsFloat
      else
         qry_po_itens_CalcQTDisp.AsFloat := qry_po_itens_QT_DISPONIVEL.AsFloat;
    end
    else
      qry_po_itens_.Cancel;
  end;
end;























end.
