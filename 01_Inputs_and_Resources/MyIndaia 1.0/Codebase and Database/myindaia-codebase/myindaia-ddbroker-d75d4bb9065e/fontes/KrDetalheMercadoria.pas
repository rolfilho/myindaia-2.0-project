{
Obs:
NR_ITEM=NR_ITEM (não é o item da tlicenca_itens)
****Estes dois é uma condição do sistema, ou seja, tem varias verificações para determinar os numeros da adição e item. Podemos verificar qual a procedure que faz isto. Acho que pode ser a StoredProcedure [dbo].[sp_di_adicao_com_li] ou analisar como esta pegando hoje.
Toda vez que salva tambem deve chamar alguma procedure.

NR_OPER_TRAT_PREV=???????????
Fazer joins entre as tabelas TLICENCA_ITENS e TLICENCA_IMPORTACAO, trazendo o campo NR_REGISTRO_LI

unit PGDI005
linha 1428 - SE não funcionar tentar o processo de duplicação

}
unit KrDetalheMercadoria;

interface

uses Forms, KrQuery, KrCloneDataSet, DB, DBTables, Classes;

procedure CloneLicencaItens(const Processo: string);

implementation

uses GSMLIB;

function GetInsertTDetalheMercadoria: string;
begin
  Result := 'INSERT INTO TDETALHE_MERCADORIA ( '+
    ' NR_PROCESSO '+
    ' ,NR_ADICAO '+
    ' ,NR_ITEM '+
    ' ,CD_EXPORTADOR '+
    ' ,CD_FABR_EXPO '+
    ' ,CD_FABRICANTE '+
    ' ,CD_MERCADORIA '+
    ' ,CD_NALADI_NCCA '+
    ' ,CD_NALADI_SH '+
    ' ,CD_NCM_SH '+
    ' ,CD_PAIS_AQUISICAO '+
    ' ,CD_PAIS_ORIGEM '+
    ' ,CD_TIPO_CALCULO_ITEM '+
    ' ,CD_UN_MED_COMERC '+
    ' ,NR_FATURA '+
    ' ,PC_DESCONTO_MERC '+
    ' ,PL_MERCADORIA '+
    ' ,QT_MERC_UN_COMERC '+
    ' ,QT_MERC_UN_ESTAT '+
    ' ,TX_DESC_DET_MERC '+
    ' ,VL_DESCONTO_MERC '+
    ' ,VL_FRETE_ITEM '+
    ' ,VL_MCV_ITEM '+
    ' ,VL_MLE_ITEM '+
    ' ,VL_SEGURO_ITEM '+
    ' ,VL_UNID_COND_VENDA '+
    ' ,VL_UNITARIO '+
    ' ,NR_OPER_TRAT_PREV '+
    ' ,NR_PEDIDO '+
    ' ,VL_II_ITEM '+
    ' ,VL_IPI_ITEM '+
    ' ,VL_AD_ITEM '+
    ' ,VL_ICMS_ITEM '+
    ' ,VL_MLE_ITEM_MN '+
    ' ,VL_FRETE_ITEM_MN '+
    ' ,VL_SEGURO_ITEM_MN '+
    ' ,VL_MCV_ITEM_MN '+
    ' ,VL_UNID_COND_VENDA_MN '+
    ' ,VL_ACRESCIMO_ITEM '+
    ' ,VL_DEDUCAO_ITEM '+
    ' ,VL_ACRESCIMO_ITEM_MN '+
    ' ,VL_DEDUCAO_ITEM_MN '+
    ' ,VL_DESPESA_ITEM '+
    ' ,VL_DESPESA_ITEM_MN '+
    ' ,NR_ORDEM '+
    ' ,NR_ITEM_PO '+
    ' ,NR_PROC_PO '+
    ' ,VL_DESPESAS_ITEM '+
    ' ,VL_DED_CPT_MNEG '+
    ' ,NR_DESTAQUE_NCM '+
    ' ,IN_PROVEM_PO '+
    ' ,VL_TX_SCX_ITEM '+
    ' ,VL_PIS_ITEM '+
    ' ,VL_COFINS_ITEM '+
    ' ,VL_BASE_CALC_II '+
    ' ,FRETE_COLLECT_ITEM '+
    ' ,FRETE_PREPAID_ITEM '+
    ' ,FRETE_TNAC_ITEM '+
    ' ,FRETE_COLLECT_ITEM_REAL '+
    ' ,FRETE_PREPAID_ITEM_REAL '+
    ' ,FRETE_TNAC_ITEM_REAL '+
    ' ,FRETE_COLLECT_ITEM_DOLAR '+
    ' ,FRETE_PREPAID_ITEM_DOLAR '+
    ' ,FRETE_TNAC_ITEM_DOLAR '+
    ' ,PB_MERCADORIA '+
    ' ,VL_BASE_ICMS_ITEM '+
    ' ,NR_PARCIAL '+
    ' ,CD_EMPRESA '+
    ' ,NR_DANFE '+
    ' ,NR_CNTR '+
    ' ,ID_CLIENTE '+
    ' ,CD_CFOP '+
    ' ,VL_BASE_PIS_COFINS '+
    ' ,VL_AFRMM_ITEM '+
    ' ,VL_UNITARIO_FOB '+
    ' ,NumeroLote '+
    ' ) '+
    ' VALUES ( '+
    ' :NR_PROCESSO '+
    ' ,''***'' '+ //:NR_ADICAO '+
    ' ,''***'' '+ //:NR_ITEM '+
    ' ,:CD_EXPORTADOR '+
    ' ,:CD_FABR_EXPO '+
    ' ,:CD_FABRICANTE '+
    ' ,:CD_MERCADORIA '+
    ' ,:CD_NALADI_NCCA '+
    ' ,:CD_NALADI_SH '+
    ' ,:CD_NCM_SH '+
    ' ,:CD_PAIS_AQUISICAO '+
    ' ,:CD_PAIS_ORIGEM '+
    ' ,''1'' '+
    ' ,:CD_UN_MED_COMERC '+
    ' ,NULL '+
    ' ,0 '+
    ' ,:PL_MERCADORIA '+
    ' ,:QT_MERC_UN_COMERC '+
    ' ,:QT_MERC_UN_ESTAT '+
    ' ,:TX_DESC_DET_MERC '+
    ' ,0 '+ //:VL_DESCONTO_MERC
    ' ,0 '+ //:VL_FRETE_ITEM
    ' ,:VL_TOTAL_MLE '+ //VL_MCV_ITEM
    ' ,:VL_TOTAL_MLE '+ //VL_MLE_ITEM
    ' ,0 '+  //:VL_SEGURO_ITEM
    ' ,:VL_UNIT_MLE '+ //VL_UNID_COND_VENDA
    ' ,:VL_UNIT_MLE '+ //VL_UNITARIO
    ' ,:NR_OPER_TRAT_PREV '+
    ' ,NULL '+ //:NR_PEDIDO
    ' ,0 '+ //:VL_II_ITEM
    ' ,0 '+ //:VL_IPI_ITEM
    ' ,NULL '+ //:VL_AD_ITEM
    ' ,0 '+ //:VL_ICMS_ITEM
    ' ,0 '+ //:VL_MLE_ITEM_MN '+
    ' ,0 '+ //:VL_FRETE_ITEM_MN '+
    ' ,0 '+ //:VL_SEGURO_ITEM_MN '+
    ' ,0 '+ //:VL_MCV_ITEM_MN '+
    ' ,0 '+ //:VL_UNID_COND_VENDA_MN '+
    ' ,0 '+ //:VL_ACRESCIMO_ITEM '+
    ' ,0 '+ //:VL_DEDUCAO_ITEM '+
    ' ,0 '+ //:VL_ACRESCIMO_ITEM_MN '+
    ' ,0 '+ //:VL_DEDUCAO_ITEM_MN '+
    ' ,0 '+ //:VL_DESPESA_ITEM '+
    ' ,0 '+ //:VL_DESPESA_ITEM_MN '+
    ' ,0 '+ //:NR_ORDEM
    ' ,:NR_ITEM_PO '+
    ' ,:NR_PROC_PO '+
    ' ,0 '+ //:VL_DESPESAS_ITEM '+
    ' ,0 '+ //:VL_DED_CPT_MNEG '+
    ' ,:NR_DESTAQUE_NCM '+
    ' ,0 '+ //:IN_PROVEM_PO '+
    ' ,0 '+ //:VL_TX_SCX_ITEM '+
    ' ,0 '+ //:VL_PIS_ITEM '+
    ' ,0 '+ //:VL_COFINS_ITEM '+
    ' ,0 '+ //:VL_BASE_CALC_II '+
    ' ,0 '+ //:FRETE_COLLECT_ITEM '+
    ' ,0 '+ //:FRETE_PREPAID_ITEM '+
    ' ,0 '+ //:FRETE_TNAC_ITEM '+
    ' ,0 '+ //:FRETE_COLLECT_ITEM_REAL '+
    ' ,0 '+ //:FRETE_PREPAID_ITEM_REAL '+
    ' ,0 '+ //:FRETE_TNAC_ITEM_REAL '+
    ' ,0 '+ //:FRETE_COLLECT_ITEM_DOLAR '+
    ' ,0 '+ //:FRETE_PREPAID_ITEM_DOLAR '+
    ' ,0 '+ //:FRETE_TNAC_ITEM_DOLAR '+
    ' ,0 '+ //:PB_MERCADORIA '+
    ' ,0 '+ //:VL_BASE_ICMS_ITEM '+
    ' ,:NR_PARCIAL '+
    ' ,NULL '+ //:CD_EMPRESA '+
    ' ,NULL '+ //:NR_DANFE '+
    ' ,NULL '+ //:NR_CNTR '+
    ' ,NULL '+ //:ID_CLIENTE '+
    ' ,NULL '+ //:CD_CFOP '+
    ' ,NULL '+ //:VL_BASE_PIS_COFINS '+
    ' ,NULL '+ //:VL_AFRMM_ITEM '+
    ' ,NULL '+ //:VL_UNITARIO_FOB '+
    ' ,NULL '+ //:NumeroLote '+
    ' ) ';
end;

function GetSelectLicencaItens: string;
begin
  Result := 'SELECT '+
    'LII.CD_EXPORTADOR, '+
    'LII.CD_FABR_EXPO, '+
    'LII.CD_FABRICANTE, '+
    'LII.CD_MERCADORIA, '+
    'LII.CD_NALADI_NCCA, '+
    'LII.CD_NALADI_SH, '+
    'LII.CD_NCM_SH, '+
    'LII.CD_PAIS_AQUISICAO, '+
    'LII.CD_PAIS_ORIGEM, '+
    'LII.CD_UN_MED_COMERC, '+
    'LII.PL_MERCADORIA, '+
    'LII.QT_MERC_UN_COMERC, '+
    'LII.QT_MERC_UN_ESTAT, '+
    'LII.TX_DESC_DET_MERC, '+
    'LI.NR_REGISTRO_LI, '+
    'LII.NR_ITEM_PO, '+
    'LII.NR_PROC_PO, '+
    'LII.VL_UNIT_MLE, '+
    'LII.VL_TOTAL_MLE, '+
    'LII.NR_DESTAQUE_NCM '+
    //'isnull(RC.NR_PARCIAL, 1) as NR_PARCIAL '+
    'FROM TLICENCA_ITENS LII '+
    'LEFT JOIN TLICENCA_IMPORTACAO LI ON LI.NR_PROCESSO = LII.NR_PROCESSO '+
    //'LEFT JOIN TREF_CLIENTE RC ON RC.CD_REFERENCIA = LII.NR_ITEM_PO AND RC.NR_ITEM_PO = LII.NR_ITEM_PO '+
    'WHERE LII.NR_PROCESSO LIKE :NR_PROCESSO ';
end;

procedure CloneLicencaItens(const Processo: string);
var
  qryLI: TLocalSQLQuery;
  qryDM: TLocalSQLQuery;
  qryExec: TLocalSQLQuery;
  FieldMap: TStrings;
begin
  FieldMap := TStringList.Create;
  qryExec := AutoQuery.DBXQuery('EXEC SP_DI_CLASSIFICA_ITEM :NR_PROCESSO, ''***'', ''***'' ');
  try
    qryLI := AutoQuery.DBXQuery(GetSelectLicencaItens);
    qryLI.ParamByName('NR_PROCESSO').AsString := Processo+'%';
    qryLI.Open;
    qryDM := AutoQuery.DBXQuery(GetInsertTDetalheMercadoria);
    FieldMap.Add('NR_REGISTRO_LI=NR_OPER_TRAT_PREV');
    while not qryLI.Eof do
    begin
      qryDM.ParamByName('NR_PROCESSO').AsString := Processo;
      CloneDataSetFieldsViaParam(qryLI, qryDM, FieldMap);
      qryDM.ParamByName('NR_PARCIAL').AsInteger := qryDM.ParamByName('NR_ITEM_PO').AsInteger;
      qryDM.ExecSQL;
      qryExec.ParamByName('NR_PROCESSO').AsString := Processo;
      qryExec.ExecSQL;
      qryLI.Next;
    end;
    qryExec.SQL.Text := 'EXEC SP_DI_RECLASSIFICA_ITEM :NR_PROCESSO, ''***'', ''***'' ';
    qryExec.ExecSQL;
  finally
    FieldMap.Free;
  end;
end;



end.
