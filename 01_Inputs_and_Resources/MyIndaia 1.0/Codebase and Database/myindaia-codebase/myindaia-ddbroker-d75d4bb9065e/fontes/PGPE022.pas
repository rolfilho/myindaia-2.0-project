unit PGPE022;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Db, DBTables,
  FormsLog, Provider, DBClient; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_exp_itens = class(TDataModule)
    ds_exp: TDataSource;
    qry_exp_: TQuery;
    qry_exp_NR_PROCESSO: TStringField;
    ds_exp_itens: TDataSource;
    qry_exp_itens_: TQuery;
    qry_exec_sp_: TQuery;
    qry_exp_QT_TOTAL_ITENS: TStringField;
    qry_naladi_: TQuery;
    qry_embalagem_: TQuery;
    qry_emp_nac_: TQuery;
    ds_emp_nac: TDataSource;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    qry_emp_nac_CD_GRUPO: TStringField;
    qry_exp_VL_TOT_QTDE_PROD: TFloatField;
    qry_exp_VL_TOT_QTDE_EMBALAGEM: TFloatField;
    qry_exp_VL_TOT_CUBAGEM: TFloatField;
    qry_exp_VL_PESO_LIQUIDO: TFloatField;
    qry_exp_VL_TOT_EXW: TFloatField;
    qry_exp_VL_TOT_FOB: TFloatField;
    qry_exp_VL_FRETE: TFloatField;
    qry_exp_VL_SEGURO: TFloatField;
    qry_exp_VL_TOT_MCV: TFloatField;
    qry_exp_itens_NR_PROCESSO: TStringField;
    qry_exp_itens_NR_ITEM: TStringField;
    qry_exp_itens_NR_PEDIDO_IMP: TStringField;
    qry_exp_itens_CD_MERCADORIA: TStringField;
    qry_exp_itens_CD_NCM: TStringField;
    qry_exp_itens_CD_NALADI_SH: TStringField;
    qry_exp_itens_CD_UNID_MEDIDA: TStringField;
    qry_exp_itens_CD_EMBALAGEM: TStringField;
    qry_exp_itens_CD_CLASSIF_EMBALAGEM: TStringField;
    qry_exp_itens_CD_FABR_EXPO: TStringField;
    qry_exp_itens_QT_POR_EMB: TFloatField;
    qry_exp_itens_QT_EMBALAGEM: TFloatField;
    qry_exp_itens_QT_MERCADORIA: TFloatField;
    qry_exp_itens_VL_POR_EMB: TFloatField;
    qry_exp_itens_VL_UNITARIO: TFloatField;
    qry_exp_itens_VL_PESO_LIQ_UNIT: TFloatField;
    qry_exp_itens_VL_COMPRIMENTO_EMB: TFloatField;
    qry_exp_itens_VL_LARGURA_EMB: TFloatField;
    qry_exp_itens_VL_ALTURA_EMB: TFloatField;
    qry_exp_itens_VL_PESO_EMB: TFloatField;
    qry_exp_itens_VL_TOT_ITEM: TFloatField;
    qry_exp_itens_VL_TOT_PESO_LIQ: TFloatField;
    qry_exp_itens_VL_TOT_PESO_BRUTO: TFloatField;
    qry_exp_itens_VL_CUBAGEM: TFloatField;
    qry_exp_itens_VL_MLE: TFloatField;
    qry_exp_itens_VL_MCV: TFloatField;
    qry_exp_itens_TX_MERCADORIA: TMemoField;
    qry_exp_itens_NR_PROC_PE: TStringField;
    qry_exp_itens_NR_ITEM_PE: TStringField;
    qry_mercadoria_: TQuery;
    qry_mercadoria_CD_MERCADORIA: TStringField;
    qry_mercadoria_AP_MERCADORIA: TStringField;
    qry_mercadoria_NM_MERCADORIA: TMemoField;
    qry_mercadoria_PL_MERCADORIA: TFloatField;
    qry_mercadoria_VL_UNITARIO: TFloatField;
    qry_mercadoria_CD_IMPORTADOR: TStringField;
    qry_mercadoria_CD_GRUPO: TStringField;
    qry_mercadoria_CD_UN_MED_COMERC: TStringField;
    qry_mercadoria_CD_NCM_SH: TStringField;
    qry_mercadoria_CD_NALADI_SH: TStringField;
    qry_mercadoria_CD_NALADI_NCCA: TStringField;
    qry_mercadoria_CD_EXPORTADOR: TStringField;
    qry_mercadoria_CD_PAIS_AQUISICAO: TStringField;
    qry_mercadoria_CD_PAIS_ORIGEM: TStringField;
    qry_mercadoria_CD_TIPO_CALCULO: TStringField;
    qry_mercadoria_CD_FABR_EXPO: TStringField;
    qry_mercadoria_CD_FABRICANTE: TStringField;
    qry_mercadoria_CD_EMBALAGEM: TStringField;
    qry_mercadoria_QT_POR_EMBALAGEM: TFloatField;
    qry_naladi_CODIGO: TStringField;
    qry_exp_CD_INCOTERM: TStringField;
    qry_total_itens_: TQuery;
    qry_total_itens_TOTAL: TIntegerField;
    qry_exp_CD_LINGUA_PEDIDO: TStringField;
    qry_mercadoria_TX_DESC_INGLES: TMemoField;
    qry_mercadoria_TX_DESC_ESP: TMemoField;
    qry_exp_CD_EXPORTADOR: TStringField;
    qry_exp_itens_CD_EMBALAGEM_SUP: TStringField;
    qry_exp_itens_CD_CLASSIF_EMBALAGEM_SUP: TStringField;
    qry_exp_itens_QT_POR_EMB_SUP: TFloatField;
    qry_exp_itens_QT_EMBALAGEM_SUP: TFloatField;
    qry_exp_itens_VL_POR_EMB_SUP: TFloatField;
    qry_exp_itens_CD_EMBALAGEM_CLIENTE: TStringField;
    qry_exp_CalcNrProcesso: TStringField;
    qry_exp_itens_CD_NORMAS: TStringField;
    qry_exp_itens_CD_FABRICANTE: TStringField;
    qry_exp_itens_NR_PEDIDO: TStringField;
    qry_exp_itens_CD_PAIS_ORIGEM: TStringField;
    qry_exp_itens_CD_NCM_DOC: TStringField;
    qry_ncm_doc_: TQuery;
    qry_ncm_doc_CODIGO: TStringField;
    ds_ncm_doc: TDataSource;
    qry_naladish_doc_: TQuery;
    qry_naladish_doc_CODIGO: TStringField;
    qry_naladish_doc_DESCRICAO: TStringField;
    ds_naladish_doc: TDataSource;
    qry_exp_itens_CD_ACORDO: TStringField;
    qry_acordo_normas_: TQuery;
    qry_acordo_normas_CD_ACORDO: TStringField;
    qry_acordo_normas_CD_NORMA: TStringField;
    qry_acordo_normas_NM_DESCRICAO: TStringField;
    qry_exp_IN_FABR_EXPO: TStringField;
    qry_exp_CD_FABRICANTE: TStringField;
    qry_exp_CD_PAIS_ORIGEM: TStringField;
    qry_exp_CD_IMPORTADOR: TStringField;
    qry_merc_acordo_pais_: TQuery;
    qry_merc_acordo_pais_CD_ACORDO: TStringField;
    qry_merc_acordo_pais_CD_MERCADORIA: TStringField;
    qry_merc_acordo_pais_CD_NORMA: TStringField;
    qry_merc_acordo_pais_CD_NCM_DOC: TStringField;
    qry_merc_acordo_pais_CD_NALADI_SH_DOC: TStringField;
    qry_merc_acordo_pais_TX_MERCADORIA: TMemoField;
    qry_exp_itens_CD_NALADI_DOC: TStringField;
    qry_ncm_doc_NR_SEQ: TIntegerField;
    qry_naladish_doc_NR_SEQ: TIntegerField;
    qry_exp_itens_NR_SEQ_NCM_DOC: TIntegerField;
    qry_exp_itens_NR_SEQ_NALADI_DOC: TIntegerField;
    qry_exp_itens_NR_SEQ_NALADI: TIntegerField;
    qry_exp_itens_NR_SEQ_NCM: TIntegerField;
    qry_merc_acordo_pais_NR_SEQ_NCM: TIntegerField;
    qry_merc_acordo_pais_NR_SEQ_NALADI: TIntegerField;
    qry_ncm_doc_DESCRICAO: TStringField;
    sp_exp_calcula: TStoredProc;
    qry_exp_itens_NR_ANEXO: TStringField;
    qry_exp_itens_NR_ATO_CONCESSORIO: TStringField;
    qry_exp_itens_IN_TRANSFERIDO: TStringField;
    sp_exp_repassa_ncm_naladi_doc: TStoredProc;
    qry_exp_CD_PAIS_DESTINO: TStringField;
    qry_merc_acordo_norma_: TQuery;
    qry_tot_acordo_norma_: TQuery;
    qry_tot_acordo_norma_TOT_ACORDO_NORMA: TIntegerField;
    qry_merc_acordo_norma_CD_ACORDO: TStringField;
    qry_merc_acordo_norma_CD_NORMA: TStringField;
    qry_merc_acordo_norma_CD_MERCADORIA: TStringField;
    qry_merc_acordo_norma_CD_NCM_DOC: TStringField;
    qry_merc_acordo_norma_NR_SEQ_NCM: TIntegerField;
    qry_merc_acordo_norma_CD_NALADI_SH_DOC: TStringField;
    qry_merc_acordo_norma_NR_SEQ_NALADI: TIntegerField;
    qry_merc_acordo_norma_TX_MERCADORIA: TMemoField;
    qry_exp_itens_DT_REMESSA: TDateTimeField;
    qry_exp_itens_NR_ORDER: TStringField;
    qry_exp_itens_NM_EMB_PACKING: TStringField;
    qry_embalagem_CD_EMBALAGEM: TStringField;
    qry_embalagem_CD_EMBALAGEM_SUP: TStringField;
    qry_embalagem_NM_EMBALAGEM_S: TStringField;
    qry_embalagem_NM_EMBALAGEM_P: TStringField;
    qry_embal_: TQuery;
    qry_embal_CD_EMBALAGEM: TStringField;
    qry_embal_NM_EMBALAGEM_S: TStringField;
    qry_embal_NM_EMBALAGEM_P: TStringField;
    qry_embal_CD_TIPO: TStringField;
    qry_embal_IN_ATIVO: TStringField;
    qry_embal_NR_COMPRIMENTO: TFloatField;
    qry_embal_NR_ALTURA: TFloatField;
    qry_embal_NR_PESO: TFloatField;
    qry_embal_NR_LARGURA: TFloatField;
    qry_embal_CD_CLASSIF: TFloatField;
    qry_embal_CD_EMBALAGEM_SUP: TStringField;
    qry_embal_QT_EMBALAGEM_SUP: TFloatField;
    qry_embal_CD_EMBALAGEM_CLIENTE: TStringField;
    qry_embal_NM_DESCR_DETALHADA: TStringField;
    qry_embal_NM_DESCR_DETALHADA_INGLES: TStringField;
    qry_embal_NM_DESCR_DETALHADA_ESPANHOL: TStringField;
    qry_embal_CD_UNID_MED_EMB: TStringField;
    qry_embal_QT_MERC_EMB: TFloatField;
    qry_embalagem_QT_EMBALAGEM_SUP: TFloatField;
    qry_exp_itens_VL_FRETE_INT: TFloatField;
    qry_ncm_: TQuery;
    qry_ncm_CODIGO: TStringField;
    updExp: TUpdateSQL;
    qry_exp_itens_NR_NF: TStringField;
    upd_exp_itens: TUpdateSQL;
    qry_exp_itens_VL_SEGURO: TFloatField;
    qry_exp_itens_VL_FRETE: TFloatField;
    qry_exp_itens_VL_DESPESA: TFloatField;
    qry_exp_itens_VL_DESCONTO: TFloatField;
    qry_exp_itens_IN_ACORDO: TBooleanField;
    qry_exp_itens_TP_ACORDO: TStringField;
    qry_exp_itens_NR_ORDEM_CERT_ORIGEM: TStringField;
    qry_exp_itens_VL_COM_AGENTE: TFloatField;
    qry_exp_itens_VL_SEM_COBERTURA_CAMBIAL: TFloatField;
    qry_exp_itens_VL_ACRESCIMO: TFloatField;
    qry_exp_itens_QT_BAIXADA: TFloatField;
    qry_exp_itens_CD_SULF_NCM: TStringField;
    qry_mercadoria_CD_SULF_NCM: TStringField;
    qry_exp_itens_TX_BILLING_DOC: TStringField;
    qry_exp_itens_TX_DELIVERY_NOTE: TStringField;
    qry_exp_itens_CD_UNID_MEDIDA_ESTAT: TStringField;
    qry_exp_itens_QT_UNID_MEDIDA_ESTAT: TFloatField;
    qry_exp_itens_CD_CFOP: TStringField;
    qryLotes: TQuery;
    qryLotesCD_FORNECIMENTO: TStringField;
    qryLotesCD_SKU: TStringField;
    qryLotesCD_LOTE: TStringField;
    qryLotesCHAVE_NOTA: TStringField;
    qryLotesDT_FABRICACAO: TDateTimeField;
    qryLotesDT_VENCIMENTO: TDateTimeField;
    qryLotesQT_MERCADORIA: TFloatField;
    qryLotesQT_PESO_LIQ: TFloatField;
    qryLotesQT_PESO_BRUTO: TFloatField;
    dsLotes: TDataSource;
    updLotes: TUpdateSQL;
    qryGrupoProcesso: TQuery;
    qryGrupoProcessoCD_GRUPO: TStringField;
    qryLotesCD_GRUPO: TStringField;
    qryLotesCD_RAP_ANO: TStringField;
    qryLotesCD_RAP: TStringField;
    qryRap: TQuery;
    qryRapCD_RAP: TStringField;
    qryRapCD_RAP_ANO: TStringField;
    qryLotesNR_PROCESSO: TStringField;
    qryLotesCD_FORNECIMENTO_LOTE: TIntegerField;
    ds_Exp_Itens_Cntr: TDataSource;
    qry_Exp_Itens_Cntr: TQuery;
    upd_Exp_Itens_Cntr: TUpdateSQL;
    qry_Exp_Itens_CntrNR_PROCESSO: TStringField;
    qry_Exp_Itens_CntrNR_CONTR: TStringField;
    qry_Exp_Itens_CntrNR_ITEM: TStringField;
    qry_Exp_Itens_CntrQT_MERCADORIA: TFloatField;
    qry_Exp_Itens_CntrQT_PESO_BRUTO: TFloatField;
    qry_Exp_Itens_CntrVL_CUBAGEM: TFloatField;
    qryProcContainer: TQuery;
    qryProcContainerNR_CNTR: TStringField;
    dsProcContainer: TDataSource;
    cdsProcContainer: TClientDataSet;
    cdsProcContainerNR_CNTR: TStringField;
    dspProcContainer: TDataSetProvider;
    qry_exp_itens_NR_CONTAINER_PEDIDO: TStringField;
    procedure qry_exp_itens_BeforeEdit(DataSet: TDataSet);
    procedure qry_exp_itens_BeforeInsert(DataSet: TDataSet);
    procedure qry_exp_CalcFields(DataSet: TDataSet);
    procedure qry_exp_itens_CalcFields(DataSet: TDataSet);
    procedure qry_exp_itens_BeforePost(DataSet: TDataSet);
    procedure qry_exp_itens_QT_MERCADORIAChange(Sender: TField);
    procedure qry_exp_AfterPost(DataSet: TDataSet);
    procedure qry_exp_AfterDelete(DataSet: TDataSet);
    procedure qry_exp_itens_AfterDelete(DataSet: TDataSet);
    procedure qry_exp_itens_AfterPost(DataSet: TDataSet);
    procedure qry_exp_itens_CD_NCMChange(Sender: TField);
    procedure qry_exp_itens_AfterScroll(DataSet: TDataSet);
    procedure qryLotesBeforeEdit(DataSet: TDataSet);
    procedure qryLotesAfterDelete(DataSet: TDataSet);
    procedure qryLotesAfterPost(DataSet: TDataSet);
    procedure qryLotesBeforeInsert(DataSet: TDataSet);
    procedure qryLotesBeforePost(DataSet: TDataSet);
    procedure qryLotesAfterOpen(DataSet: TDataSet);
    procedure qry_Exp_Itens_CntrBeforeEdit(DataSet: TDataSet);
    procedure qry_Exp_Itens_CntrAfterDelete(DataSet: TDataSet);
    procedure qry_Exp_Itens_CntrAfterPost(DataSet: TDataSet);
    procedure qry_Exp_Itens_CntrBeforeInsert(DataSet: TDataSet);
    procedure qry_Exp_Itens_CntrBeforePost(DataSet: TDataSet);
  private
    procedure VerificaEstado(Habilita : Boolean);

  public
    { Public declarations }
  end;

var
  datm_exp_itens: Tdatm_exp_itens;

implementation

uses GSMLIB, PGPE019, ConsOnLineEx;

{$R *.DFM}

procedure Tdatm_exp_itens.VerificaEstado(Habilita : Boolean);
begin
  frm_exp_itens.btn_novo_item.Enabled  := not Habilita;
  frm_exp_itens.mi_novo_item.Enabled   := not Habilita;
  frm_exp_itens.btn_salvar.Enabled     := Habilita;
  frm_exp_itens.mi_salvar.Enabled      := Habilita;
  frm_exp_itens.btn_cancelar.Enabled   := Habilita;
  frm_exp_itens.mi_cancelar.Enabled    := Habilita;
  frm_exp_itens.btn_duplicar.Enabled   := not Habilita;
  frm_exp_itens.mi_duplicar.Enabled    := not Habilita;
  frm_exp_itens.btn_calculo.Enabled    := False;
end;

procedure Tdatm_exp_itens.qry_exp_itens_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );
  frm_exp_itens.btn_novo_item.Enabled := False;
  frm_exp_itens.btn_capa_exp.Enabled  := False;
  frm_exp_itens.btn_excluir.Enabled   := False;
  frm_exp_itens.btn_duplicar.Enabled  := False;
  frm_exp_itens.mi_novo_item.Enabled  := False;
  frm_exp_itens.mi_excluir.Enabled    := False;
  frm_exp_itens.mi_duplicar.Enabled   := False;
end;

procedure Tdatm_exp_itens.qry_exp_itens_BeforeInsert(DataSet: TDataSet);
begin
   VerificaEstado( True );
end;

procedure Tdatm_exp_itens.qry_exp_CalcFields(DataSet: TDataSet);
begin
  qry_exp_CalcNrProcesso.AsString := Copy( qry_exp_NR_PROCESSO.AsString, 5 , 14 );
end;

procedure Tdatm_exp_itens.qry_exp_itens_CalcFields(DataSet: TDataSet);
begin
{  qry_ncm_doc_.Close;
  qry_ncm_doc_.ParamByName('CODIGO').AsString  := qry_exp_itens_CD_NCM_DOC.AsString;
  qry_ncm_doc_.ParamByName('NR_SEQ').AsInteger := qry_exp_itens_NR_SEQ_NCM_DOC.AsInteger;
  qry_ncm_doc_.Prepare;
  qry_ncm_doc_.Open;
  qry_exp_itens_LookNCMDoc.AsString := qry_ncm_doc_DESCRICAO.AsString;

  qry_naladish_doc_.Close;
  qry_naladish_doc_.ParamByName('CODIGO').AsString  := qry_exp_itens_CD_NALADI_DOC.AsString;
  qry_naladish_doc_.ParamByName('NR_SEQ').AsInteger := qry_exp_itens_NR_SEQ_NALADI_DOC.AsInteger;
  qry_naladish_doc_.Prepare;
  qry_naladish_doc_.Open;
  qry_exp_itens_LookNALADISHDoc.AsString := qry_naladish_doc_DESCRICAO.AsString; }
end;

procedure Tdatm_exp_itens.qry_exp_itens_BeforePost(DataSet: TDataSet);
begin
  qry_exp_itens_IN_TRANSFERIDO.AsString := '0';
  qry_exp_itens_IN_ACORDO.AsBoolean     := False;   //tipo BIT no banco
end;

procedure Tdatm_exp_itens.qry_exp_itens_QT_MERCADORIAChange(Sender: TField);
begin
  frm_exp_itens.lCalculo := False;
end;

procedure Tdatm_exp_itens.qry_exp_AfterPost(DataSet: TDataSet);
begin
  qry_exp_.ApplyUpdates;
end;

procedure Tdatm_exp_itens.qry_exp_AfterDelete(DataSet: TDataSet);
begin
  qry_exp_.ApplyUpdates;
end;

procedure Tdatm_exp_itens.qry_exp_itens_AfterDelete(DataSet: TDataSet);
begin
  qry_exp_itens_.ApplyUpdates;
end;

procedure Tdatm_exp_itens.qry_exp_itens_AfterPost(DataSet: TDataSet);
begin
  qry_exp_itens_.ApplyUpdates;
end;

procedure Tdatm_exp_itens.qry_exp_itens_CD_NCMChange(Sender: TField);
begin
  if Trim(qry_exp_itens_CD_UNID_MEDIDA_ESTAT.AsString) = '' then
    qry_exp_itens_CD_UNID_MEDIDA_ESTAT.AsString := ConsultaLookUP('TNCM', 'CODIGO', qry_exp_itens_CD_NCM.AsString + qry_exp_itens_CD_SULF_NCM.AsString, 'UNIDADE_MEDIDA');
end;

procedure Tdatm_exp_itens.qry_exp_itens_AfterScroll(DataSet: TDataSet);
begin
  qryGrupoProcesso.close;
  qryGrupoProcesso.ParamByName('NR_PROCESSO').AsString     := qry_exp_itens_NR_PROCESSO.asString;
  qryGrupoProcesso.open;

  qryRap.close;
  qryRap.ParamByName('NR_PROCESSO').AsString       := qry_exp_itens_NR_PROCESSO.asString;
  qryRap.ParamByName('NR_FORNECIMENTO').AsString   := qry_exp_itens_NR_PEDIDO_IMP.asString;
  qryRap.ParamByName('CD_GRUPO').AsString          := qryGrupoProcessoCD_GRUPO.asString;
  qryRap.open;

  qryLotes.Close;
  qryLotes.ParamByName('CD_FORNECIMENTO').AsString := qry_exp_itens_NR_PEDIDO_IMP.asString;
  qryLotes.ParamByName('CD_GRUPO').AsString        := qryGrupoProcessoCD_GRUPO.asString;
  qryLotes.ParamByName('CD_MERCADORIA').AsString   := qry_exp_itens_CD_MERCADORIA.asString;
  qryLotes.Prepare;
  qryLotes.Open;

  qry_Exp_Itens_Cntr.Close;
  qry_Exp_Itens_Cntr.ParamByName('NR_PROCESSO').AsString   := qry_exp_itens_NR_PROCESSO.asString;
  qry_Exp_Itens_Cntr.ParamByName('NR_ITEM').AsString       := qry_exp_itens_NR_ITEM.asString;
  qry_Exp_Itens_Cntr.prepare;
  qry_Exp_Itens_Cntr.Open;
end;

procedure Tdatm_exp_itens.qryLotesBeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );
  frm_exp_itens.btn_novo_item.Enabled := False;
  frm_exp_itens.btn_capa_exp.Enabled  := False;
  frm_exp_itens.btn_excluir.Enabled   := False;
  frm_exp_itens.btn_duplicar.Enabled  := False;
  frm_exp_itens.mi_novo_item.Enabled  := False;
  frm_exp_itens.mi_excluir.Enabled    := False;
  frm_exp_itens.mi_duplicar.Enabled   := False;
end;

procedure Tdatm_exp_itens.qryLotesAfterDelete(DataSet: TDataSet);
begin
  qryLotes.ApplyUpdates;
end;

procedure Tdatm_exp_itens.qryLotesAfterPost(DataSet: TDataSet);
begin
  qryLotes.ApplyUpdates;
end;

procedure Tdatm_exp_itens.qryLotesBeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_itens.qryLotesBeforePost(DataSet: TDataSet);
begin
  datm_exp_itens.qryLotes.fieldByName('CD_SKU').AsString          := datm_exp_itens.qry_exp_itens_CD_MERCADORIA.AsString;
  datm_exp_itens.qryLotes.fieldByName('CD_GRUPO').AsString        := datm_exp_itens.qryGrupoProcessoCD_GRUPO.asString;
  datm_exp_itens.qryLotes.fieldByName('NR_PROCESSO').AsString     := datm_exp_itens.qry_exp_itens_NR_PROCESSO.AsString;
  datm_exp_itens.qryLotes.fieldByName('CD_FORNECIMENTO').AsString := datm_exp_itens.qry_exp_itens_NR_PEDIDO_IMP.asString;

  if not datm_exp_itens.qryRap.isempty then
  begin
    datm_exp_itens.qryLotes.fieldByName('CD_RAP').AsString        := datm_exp_itens.qryRapCD_RAP.AsString;
    datm_exp_itens.qryLotes.fieldByName('CD_RAP_ANO').AsString    := datm_exp_itens.qryRapCD_RAP_ANO.AsString;
  end
  else
  begin
    datm_exp_itens.qryLotes.fieldByName('CD_RAP').AsString        := '';
    datm_exp_itens.qryLotes.fieldByName('CD_RAP_ANO').AsString    := '';
  end;
end;

procedure Tdatm_exp_itens.qryLotesAfterOpen(DataSet: TDataSet);
begin
  if datm_exp_itens.qrylotes.EOF then
  begin
    frm_exp_itens.btn_excluir.Enabled   := False;
    frm_exp_itens.mi_excluir.Enabled    := False;
  end
  else
  begin
    frm_exp_itens.btn_excluir.Enabled   := true;
    frm_exp_itens.mi_excluir.Enabled    := true;
  end; 
end;

procedure Tdatm_exp_itens.qry_Exp_Itens_CntrBeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );
  frm_exp_itens.btn_novo_item.Enabled := False;
  frm_exp_itens.btn_capa_exp.Enabled  := False;
  frm_exp_itens.btn_excluir.Enabled   := False;
  frm_exp_itens.btn_duplicar.Enabled  := False;
  frm_exp_itens.mi_novo_item.Enabled  := False;
  frm_exp_itens.mi_excluir.Enabled    := False;
  frm_exp_itens.mi_duplicar.Enabled   := False;
end;

procedure Tdatm_exp_itens.qry_Exp_Itens_CntrAfterDelete(DataSet: TDataSet);
begin
  qry_Exp_Itens_Cntr.ApplyUpdates;
end;

procedure Tdatm_exp_itens.qry_Exp_Itens_CntrAfterPost(DataSet: TDataSet);
begin
  qry_Exp_Itens_Cntr.ApplyUpdates;
end;

procedure Tdatm_exp_itens.qry_Exp_Itens_CntrBeforeInsert(
  DataSet: TDataSet);
begin
   VerificaEstado( True );
end;

procedure Tdatm_exp_itens.qry_Exp_Itens_CntrBeforePost(DataSet: TDataSet);
begin
  qry_Exp_Itens_CntrNR_PROCESSO.asstring   := qry_exp_itens_NR_PROCESSO.asString;
  qry_Exp_Itens_CntrNR_ITEM.asstring       := qry_exp_itens_NR_ITEM.asString;
 
end;

end.
