unit PGPE008;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pe_prepara = class(TDataModule)
    qry_pe_: TQuery;
    ds_pe: TDataSource;
    ds_via_transporte: TDataSource;
    qry_via_transporte_: TQuery;
    qry_via_transporte_CD_VIA_TRANSPORTE: TStringField;
    qry_via_transporte_NM_VIA_TRANSPORTE: TStringField;
    ds_pe_itens: TDataSource;
    qry_pe_itens_: TQuery;
    qry_pe_itens_CalcQTDisp: TFloatField;
    qry_pe_itens_CalcQtBaixada: TFloatField;
    sp_pe_marca_item: TStoredProc;
    qry_prep_pe_: TQuery;
    ds_prep_pe: TDataSource;
    qry_prep_item_: TQuery;
    ds_prep_item: TDataSource;
    qry_pe_selec_: TQuery;
    sp_pe_prep_inc_item: TStoredProc;
    sp_pe_prep_inc_proc: TStoredProc;
    qry_pe_selec_NR_PROCESSO: TStringField;
    qry_pe_selec_IN_SELECIONADO: TStringField;
    qry_pe_valor_: TQuery;
    ds_pe_valor: TDataSource;
    qry_verif_item_: TQuery;
    qry_pe_valor_NR_PROCESSO: TStringField;
    qry_pe_valor_QT_TOTAL_ITEM: TStringField;
    sp_pe_desmarca: TStoredProc;
    sp_pe_exclui_prep: TStoredProc;
    qry_muda_: TQuery;
    sp_pe_monta_exp: TStoredProc;
    qry_pe_NR_PROCESSO: TStringField;
    qry_pe_CD_VIA_TRANSPORTE: TStringField;
    qry_pe_DT_REGISTRO_PEDIDO: TDateTimeField;
    qry_pe_IN_SELECIONADO: TStringField;
    qry_pe_QT_TOTAL_ITENS: TStringField;
    qry_pe_itens_NR_PROCESSO: TStringField;
    qry_pe_itens_NR_ITEM: TStringField;
    qry_pe_itens_CD_MERCADORIA: TStringField;
    qry_pe_itens_CD_NCM: TStringField;
    qry_pe_itens_QT_MERCADORIA: TFloatField;
    qry_pe_itens_QT_BAIXADA: TFloatField;
    qry_pe_itens_IN_SELECIONADO: TStringField;
    qry_pe_itens_VL_UNITARIO: TFloatField;
    qry_pe_itens_QT_BAIXAR: TFloatField;
    qry_pe_itens_QT_DISPONIVEL: TFloatField;
    qry_emp_nac_: TQuery;
    ds_emp_nac: TDataSource;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    qry_prep_pe_NR_PROCESSO: TStringField;
    qry_prep_pe_NR_PROC_OLD: TStringField;
    qry_prep_pe_CD_IMPORTADOR: TStringField;
    qry_prep_pe_CD_EXPORTADOR: TStringField;
    qry_prep_pe_CD_FABRICANTE: TStringField;
    qry_prep_pe_QT_BAIXADA: TFloatField;
    qry_prep_pe_VL_TOT_BAIXADO: TFloatField;
    qry_prep_pe_IN_PREPARACAO: TStringField;
    qry_prep_pe_QT_TOTAL_ITEM: TStringField;
    qry_prep_pe_IN_MONTADO: TStringField;
    qry_prep_item_NR_PROCESSO: TStringField;
    qry_prep_item_NR_ITEM: TStringField;
    qry_prep_item_NR_PROC_OLD: TStringField;
    qry_prep_item_NR_ITEM_OLD: TStringField;
    qry_prep_item_CD_MERCADORIA: TStringField;
    qry_prep_item_DT_BAIXA: TDateTimeField;
    qry_prep_item_IN_PREPARACAO: TStringField;
    qry_prep_item_QT_BAIXADA: TFloatField;
    qry_prep_item_VL_BAIXADO: TFloatField;
    qry_prep_item_IN_MONTADO: TStringField;
    qry_verif_item_NR_PROCESSO: TStringField;
    qry_verif_item_NR_PROC_OLD: TStringField;
    qry_verif_item_NR_ITEM_OLD: TStringField;
    qry_verif_item_QT_BAIXADA: TFloatField;
    qry_verif_item_DT_BAIXA: TDateTimeField;
    ds_processo: TDataSource;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_pe_CD_EXPORTADOR: TStringField;
    qry_pe_LookNmCliente: TStringField;
    qry_pe_LookViaTransporte: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    procedure qry_pe_itens_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pe_prepara: Tdatm_pe_prepara;

implementation

{$R *.DFM}


procedure Tdatm_pe_prepara.qry_pe_itens_CalcFields(DataSet: TDataSet);
begin
  with datm_pe_prepara do
  begin
    if qry_pe_itens_NR_ITEM.AsString <> '' then
    begin
      qry_pe_itens_CalcQtBaixada.AsFloat := qry_pe_itens_QT_BAIXADA.AsFloat + qry_pe_itens_QT_BAIXAR.AsFloat;

      If qry_pe_itens_QT_DISPONIVEL.AsFloat = 0 Then
         qry_pe_itens_CalcQTDisp.AsFloat := qry_pe_itens_QT_MERCADORIA.AsFloat - qry_pe_itens_CalcQtBaixada.AsFloat
      else
      begin
        If qry_pe_itens_QT_BAIXAR.AsFloat <> 0 then
           qry_pe_itens_CalcQTDisp.AsFloat := qry_pe_itens_QT_DISPONIVEL.AsFloat - qry_pe_itens_QT_BAIXAR.AsFloat
        else
           qry_pe_itens_CalcQTDisp.AsFloat := qry_pe_itens_QT_DISPONIVEL.AsFloat;
      end;
    end
    else
      qry_pe_itens_.Cancel;
  end;
end;





end.
