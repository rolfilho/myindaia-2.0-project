unit PGSM185;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StrUtils, KrDialog;

type
  Tdatm_mercadoria_exp = class(TDataModule)
    ds_mercadoria: TDataSource;
    ds_pais: TDataSource;
    tbl_pais_: TTable;
    tbl_pais_CODIGO: TStringField;
    tbl_pais_DESCRICAO: TStringField;
    ds_unid_med: TDataSource;
    ds_ncm: TDataSource;
    tbl_ncm_: TTable;
    tbl_ncm_CODIGO: TStringField;
    tbl_ncm_DESCRICAO: TStringField;
    tbl_ncm_UNIDADE_MEDIDA: TStringField;
    tbl_ncm_ALIQUOTA_II: TStringField;
    tbl_ncm_DATA_INICIO_VIG_II: TStringField;
    tbl_ncm_DATA_FIM_VIG_II: TStringField;
    tbl_ncm_ALIQUOTA_II_MERCOSUL: TStringField;
    tbl_ncm_DATA_INICIO_VIG_II_MSUL: TStringField;
    tbl_ncm_DATA_FIM_VIG_II_MSUL: TStringField;
    tbl_ncm_ALIQUOTA_IPI: TStringField;
    tbl_ncm_DATA_INICIO_VIG_IPI: TStringField;
    tbl_ncm_DATA_FIM_VIG_IPI: TStringField;
    tbl_tp_calc_item_: TTable;
    tbl_tp_calc_item_CD_TIPO_CALCULO_ITEM: TStringField;
    tbl_tp_calc_item_DESCRICAO: TStringField;
    ds_tp_calc_item: TDataSource;
    ds_grupo_: TDataSource;
    ds_empresa_nac: TDataSource;
    tbl_empresa_nac_: TTable;
    tbl_empresa_nac_CD_EMPRESA: TStringField;
    tbl_empresa_nac_AP_EMPRESA: TStringField;
    tbl_empresa_nac_NM_EMPRESA: TStringField;
    tbl_empresa_nac_IN_CLIENTE: TBooleanField;
    ds_empresa_est_: TDataSource;
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
    tbl_empresa_nac_IN_IMPORTADOR: TBooleanField;
    tbl_empresa_nac_IN_EXPORTADOR: TBooleanField;
    tbl_empresa_nac_IN_OUTROS: TBooleanField;
    tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField;
    tbl_empresa_nac_CD_SDA: TStringField;
    tbl_empresa_nac_NR_CAE: TStringField;
    tbl_empresa_nac_CD_GRUPO: TStringField;
    qry_proc_mercadoria_: TQuery;
    qry_proc_mercadoria_CD_MERCADORIA: TStringField;
    qry_lista_: TQuery;
    ds_lista: TDataSource;
    qry_lista_look_nm_aquisicao: TStringField;
    qry_lista_look_pais_origem: TStringField;
    qry_mercadoria_: TQuery;
    qry_mercadoria_look_pais_aquisicao: TStringField;
    qry_mercadoria_look_pais_origem: TStringField;
    qry_mercadoria_look_med_comerc: TStringField;
    qry_unid_medida_: TQuery;
    qry_unid_medida_CD_UNID_MEDIDA: TStringField;
    qry_unid_medida_NM_UNID_MEDIDA: TStringField;
    qry_unid_medida_IN_ATIVO: TStringField;
    qry_mercadoria_LookNCM: TStringField;
    ds_familia_prod: TDataSource;
    qry_familia_prod_: TQuery;
    qry_familia_prod_CD_FAMILIA_PROD: TStringField;
    qry_familia_prod_NM_FAMILIA_PROD: TStringField;
    qry_mercadoria_LookFamiliaProd: TStringField;
    ds_moeda: TDataSource;
    qry_moeda_: TQuery;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_NM_MOEDA: TStringField;
    qry_mercadoria_LookMoeda: TStringField;
    ds_embalagem: TDataSource;
    qry_embalagem_: TQuery;
    qry_embalagem_CD_EMBALAGEM: TStringField;
    qry_mercadoria_LookEmbalagem: TStringField;
    ds_finalidade_merc: TDataSource;
    qry_finalidade_merc_: TQuery;
    ds_uf: TDataSource;
    qry_uf_: TQuery;
    qry_uf_CD_UF: TStringField;
    qry_uf_NM_UF: TStringField;
    qry_finalidade_merc_CD_FINALIDADE_MERC: TStringField;
    qry_finalidade_merc_NM_FINALIDADE_MERC: TStringField;
    qry_mercadoria_LookFinalidadeMerc: TStringField;
    qry_mercadoria_LookUFProdutor: TStringField;
    qry_empresa_est_: TQuery;
    qry_empresa_est_CD_EMPRESA: TStringField;
    qry_empresa_est_NM_EMPRESA: TStringField;
    qry_mercadoria_LookFabricante: TStringField;
    qry_mercadoria_look_nm_grupo: TStringField;
    qry_mercadoria_LookExportador: TStringField;
    qry_mercadoria_Look_nm_Importador: TStringField;
    qry_mercadoria_CD_MERCADORIA: TStringField;
    qry_mercadoria_AP_MERCADORIA: TStringField;
    qry_mercadoria_CD_UN_MED_COMERC: TStringField;
    qry_mercadoria_CD_COR: TStringField;
    qry_mercadoria_CD_NCM_SH: TStringField;
    qry_mercadoria_CD_NALADI_SH: TStringField;
    qry_mercadoria_CD_NALADI_NCCA: TStringField;
    qry_mercadoria_CD_TIPO_CALCULO: TStringField;
    qry_mercadoria_NR_LINHA: TStringField;
    qry_mercadoria_CD_GRUPO: TStringField;
    qry_mercadoria_VL_UNITARIO: TFloatField;
    qry_mercadoria_CD_UF_PRODUTOR: TStringField;
    qry_mercadoria_CD_EXPORTADOR: TStringField;
    qry_mercadoria_PL_MERCADORIA: TFloatField;
    qry_mercadoria_PB_MERCADORIA: TFloatField;
    qry_mercadoria_CD_IMPORTADOR: TStringField;
    qry_mercadoria_CD_PAIS_AQUISICAO: TStringField;
    qry_mercadoria_CD_FABRICANTE: TStringField;
    qry_mercadoria_CD_PAIS_ORIGEM: TStringField;
    qry_mercadoria_CD_FINALIDADE_MERC: TStringField;
    qry_mercadoria_CD_CATEGORIA_TEXTIL: TStringField;
    qry_mercadoria_IN_NECESSITA_LI: TBooleanField;
    qry_mercadoria_CD_FAMILIA_PROD: TStringField;
    qry_mercadoria_CD_FABR_EXPO: TStringField;
    qry_mercadoria_CD_MOEDA: TStringField;
    qry_mercadoria_CD_EMBALAGEM: TStringField;
    qry_mercadoria_QT_POR_EMBALAGEM: TFloatField;
    qry_mercadoria_NM_MERCADORIA: TMemoField;
    ds_acordo: TDataSource;
    qry_acordo_: TQuery;
    ds_normas: TDataSource;
    qry_normas_: TQuery;
    qry_normas_CODIGO: TStringField;
    qry_normas_NOME: TStringField;
    qry_normas_NM_DESCRICAO: TStringField;
    qry_normas_IN_ATIVO: TStringField;
    qry_merc_acordo_: TQuery;
    ds_merc_acordo: TDataSource;
    ds_acordo_norma: TDataSource;
    qry_merc_acordo_CD_MERCADORIA: TStringField;
    qry_merc_acordo_CD_ACORDO: TStringField;
    qry_merc_acordo_CD_NORMA: TStringField;
    qry_merc_acordo_CD_NCM_DOC: TStringField;
    qry_merc_acordo_CD_NALADI_SH_DOC: TStringField;
    qry_merc_acordo_CD_NALADI_NCCA_DOC: TStringField;
    qry_merc_acordo_TX_MERCADORIA: TMemoField;
    qry_merc_acordo_LookAcordo: TStringField;
    qry_ncm_doc_: TQuery;
    ds_ncm_doc: TDataSource;
    qry_ncm_doc_CODIGO: TStringField;
    qry_naladish_doc_: TQuery;
    ds_naladish_doc: TDataSource;
    qry_naladish_doc_CODIGO: TStringField;
    qry_naladish_doc_DESCRICAO: TStringField;
    qry_naladincca_doc_: TQuery;
    ds_naladincca_doc: TDataSource;
    qry_naladincca_doc_CODIGO: TStringField;
    qry_naladincca_doc_DESCRICAO: TStringField;
    qry_apaga_acordo_: TQuery;
    sp_mercadoria_exp_: TStoredProc;
    qry_limpa_aux_: TQuery;
    qry_lista_CD_MERCADORIA: TStringField;
    qry_lista_AP_MERCADORIA: TStringField;
    qry_lista_NM_EMPRESA: TStringField;
    qry_lista_NM_GRUPO: TStringField;
    qry_lista_CD_PAIS_AQUISICAO: TStringField;
    qry_lista_CD_PAIS_ORIGEM: TStringField;
    qry_lista_CD_EXPORTADOR: TStringField;
    qry_lista_CD_GRUPO: TStringField;
    qry_lista_CD_NCM_SH: TStringField;
    qry_acordo_norma_: TQuery;
    qry_acordo_norma_CD_ACORDO: TStringField;
    qry_acordo_norma_CD_NORMA: TStringField;
    qry_acordo_norma_NM_DESCRICAO: TStringField;
    tbl_empresa_nac_CD_PAIS_IMPORTADOR: TStringField;
    qry_merc_acordo_LookNormas: TStringField;
    qry_pais_broker_: TQuery;
    qry_pais_broker_CD_PAIS: TStringField;
    qry_pais_broker_NM_PAIS: TStringField;
    qry_embalagem_NM_EMBALAGEM_S: TStringField;
    qry_merc_acordo_NR_SEQ_NCM: TIntegerField;
    qry_merc_acordo_NR_SEQ_NALADI: TIntegerField;
    qry_merc_acordo_LookNaladiSHDoc: TStringField;
    qry_ncm_doc_DESCRICAO: TStringField;
    qry_merc_acordo_LookNcmDoc: TStringField;
    qry_acordo_CODIGO: TStringField;
    qry_acordo_NOME: TStringField;
    qry_acordo_IN_ATIVO: TStringField;
    qry_area_: TQuery;
    qry_area_CD_AREA: TStringField;
    qry_area_NM_AREA: TStringField;
    qry_mercadoria_CD_AREA: TStringField;
    qry_mercadoria_LookArea: TStringField;
    qry_mat_pri_: TQuery;
    qry_mercadoria_CD_MATERIAL: TStringField;
    qry_mercadoria_CD_USUARIO_CRIACAO: TStringField;
    qry_mercadoria_DT_CRIACAO: TDateTimeField;
    qry_mercadoria_CD_USUARIO_ULT_ALTERACAO: TStringField;
    qry_mercadoria_DT_ULT_ALTERACAO: TDateTimeField;
    qry_mercadoria_calcNmCriador: TStringField;
    qry_mercadoria_calcNmAlterador: TStringField;
    qry_mercadoria_IN_ATIVO: TStringField;
    qry_mercadoria_CD_SULF_NCM: TStringField;
    qry_mercadoria_CD_IMPORTACAO: TStringField;
    qry_mercadoria_IN_IMPORTADO: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_mercadoria_TX_DESC_INGLES: TMemoField;
    qry_mercadoria_TX_DESC_ESP: TMemoField;
    qry_mercadoria_NM_PROCEDENCIA_ING: TMemoField;
    qry_mercadoria_NM_PROCEDENCIA_ESP: TMemoField;
    ds_Mercadoria_Marcacao: TDataSource;
    qry_Mercadoria_Marcacao: TQuery;
    qry_Mercadoria_MarcacaoCD_MERC_MARCACAO: TAutoIncField;
    qry_Mercadoria_MarcacaoCD_MERCADORIA: TStringField;
    qry_Mercadoria_MarcacaoCD_PAIS_DESTINO: TStringField;
    qry_Mercadoria_MarcacaoDS_MARCACAO: TStringField;
    qry_Mercadoria_MarcacaoCALC_NM_PAIS_DESTINO: TStringField;
    qry_Mercadoria_MarcacaoCD_IMPORTADOR: TStringField;
    qry_mercadoria_NR_DECLARACAO_ORIGEM: TStringField;
    qry_mercadoria_NORMA_ORIGEM: TStringField;
    qry_mercadoria_DATA_NORMA_ORIGEM: TDateTimeField;
    qryFederacao: TQuery;
    qryFederacaoID: TAutoIncField;
    qryFederacaoNOME: TStringField;
    dsFederacao: TDataSource;
    qryMERCADORIA_EXP_ACP_: TQuery;
    dsMERCADORIA_EXP_ACP: TDataSource;
    MERCADORIA_EXP_ACP: TUpdateSQL;
    qry_acordo_FIESP_ID: TIntegerField;
    dsDeclaracaoOrigem: TDataSource;
    qryDeclaracaoOrigem: TQuery;
    qryDeclaracaoOrigemID: TAutoIncField;
    qryDeclaracaoOrigemNUMERO: TStringField;
    qryDeclaracaoOrigemFEDERACAO_ID: TIntegerField;
    qryDeclaracaoOrigemVENCIMENTO: TDateTimeField;
    qryDeclaracaoOrigemFederacao: TStringField;
    QryMERCADORIA_EXP_DO_: TQuery;
    dsMERCADORIA_EXP_DO: TDataSource;
    UpdMERCADORIA_EXP_DO: TUpdateSQL;
    QryMERCADORIA_EXP_DO_CD_MERCADORIA: TStringField;
    QryMERCADORIA_EXP_DO_ID_DECLARACAO_ORIGEM: TIntegerField;
    QryMERCADORIA_EXP_DO_NumeroDO: TStringField;
    QryMERCADORIA_EXP_DO_VencimentoDO: TDateField;
    QryMERCADORIA_EXP_DO_Federacao: TStringField;
    qryDeclaracaoOrigemLista: TStringField;
    ds_desc_merc_draft: TDataSource;
    qry_desc_merc_draft: TQuery;
    qry_desc_merc_draftCODIGO: TAutoIncField;
    qry_desc_merc_draftCD_GRUPO: TStringField;
    qry_mercadoria_CD_DESC_MERCADORIA_DRAFT: TIntegerField;
    qry_desc_merc_draftTX_DESCRICAO_PORTUGUES: TMemoField;
    qry_desc_merc_draftTX_DESCRICAO_INGLES: TMemoField;
    qry_desc_merc_draftTX_DESCRICAO_ESPANHOL: TMemoField;
    qry_desc_merc_draftNM_DESCRICAO: TStringField;
    qry_mercadoria_LookDescricaoMercDraft: TStringField;
    qry_mercadoria_LookDescMercDraft_Portugues: TStringField;
    qry_mercadoria_LookDescMercDraft_Espanhol: TStringField;
    qry_mercadoria_LookDescMercDraft_Ingles: TStringField;
    qryMERCADORIA_EXP_ACP_CD_MERCADORIA: TStringField;
    qryMERCADORIA_EXP_ACP_CD_ACORDO: TStringField;
    qryMERCADORIA_EXP_ACP_CD_PAIS: TStringField;
    qryMERCADORIA_EXP_ACP_Acordo: TStringField;
    qryMERCADORIA_EXP_ACP_Pais: TStringField;
    qry_mercadoria_NM_MARCA_CLV: TStringField;
    qry_mercadoria_NM_DESCRICAO_CLV: TMemoField;
    procedure qry_merc_acordo_BeforeEdit(DataSet: TDataSet);
    procedure qry_merc_acordo_BeforeInsert(DataSet: TDataSet);
    procedure qry_merc_acordo_CalcFields(DataSet: TDataSet);
    procedure qry_mercadoria_CalcFields(DataSet: TDataSet);
    procedure qry_mercadoria_AfterInsert(DataSet: TDataSet);
    procedure qry_mercadoria_NewRecord(DataSet: TDataSet);
    procedure qry_Mercadoria_MarcacaoCalcFields(DataSet: TDataSet);
    procedure qry_mercadoria_AfterScroll(DataSet: TDataSet);
    procedure qryDeclaracaoOrigemCalcFields(DataSet: TDataSet);
    procedure QryMERCADORIA_EXP_DO_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_mercadoria_exp: Tdatm_mercadoria_exp;

implementation

uses GSMLIB, PGSM184, ConsOnLineEx;

{$R *.DFM}

procedure Tdatm_mercadoria_exp.qry_merc_acordo_BeforeEdit(
  DataSet: TDataSet);
begin
  frm_mercadoria_exp.btn_salvar.Enabled   := True;
  frm_mercadoria_exp.mi_salvar.Enabled    := True;
  frm_mercadoria_exp.btn_cancelar.Enabled := True;
  frm_mercadoria_exp.mi_cancelar.Enabled  := True;

  frm_mercadoria_exp.btn_incluir.Enabled  := False;
//  frm_mercadoria_exp.btn_aviso.Enabled    := True;
  frm_mercadoria_exp.mi_incluir.Enabled   := False;
  frm_mercadoria_exp.btn_excluir.Enabled  := False;
  frm_mercadoria_exp.mi_excluir.Enabled   := False;

end;

procedure Tdatm_mercadoria_exp.qry_merc_acordo_BeforeInsert(
  DataSet: TDataSet);
begin
  frm_mercadoria_exp.btn_salvar.Enabled   := True;
  frm_mercadoria_exp.mi_salvar.Enabled    := True;
  frm_mercadoria_exp.btn_cancelar.Enabled := True;
  frm_mercadoria_exp.mi_cancelar.Enabled  := True;

  frm_mercadoria_exp.btn_incluir.Enabled  := False;
//  frm_mercadoria_exp.btn_aviso.Enabled    := True;
  frm_mercadoria_exp.mi_incluir.Enabled   := False;
  frm_mercadoria_exp.btn_excluir.Enabled  := False;
  frm_mercadoria_exp.mi_excluir.Enabled   := False;
end;

procedure Tdatm_mercadoria_exp.qry_merc_acordo_CalcFields(
  DataSet: TDataSet);
begin
  qry_ncm_doc_.Close;
  qry_ncm_doc_.ParamByName('CODIGO').AsString  := qry_merc_acordo_CD_NCM_DOC.AsString;
  qry_ncm_doc_.ParamByName('NR_SEQ').AsInteger := qry_merc_acordo_NR_SEQ_NCM.AsInteger;
  qry_ncm_doc_.Prepare;
  qry_ncm_doc_.Open;
  qry_merc_acordo_LookNCMDoc.AsString := qry_ncm_doc_DESCRICAO.AsString;

  qry_naladish_doc_.Close;
  qry_naladish_doc_.ParamByName('CODIGO').AsString  := qry_merc_acordo_CD_NALADI_SH_DOC.AsString;
  qry_naladish_doc_.ParamByName('NR_SEQ').AsInteger := qry_merc_acordo_NR_SEQ_NALADI.AsInteger;
  qry_naladish_doc_.Prepare;
  qry_naladish_doc_.Open;
  qry_merc_acordo_LookNaladiSHDoc.AsString := qry_naladish_doc_DESCRICAO.AsString;
end;

procedure Tdatm_mercadoria_exp.qry_mercadoria_CalcFields(
  DataSet: TDataSet);
begin
  {usuário criador, último alterador do registro}
  if (qry_mercadoria_CD_USUARIO_CRIACAO.IsNull) or (Trim(qry_mercadoria_CD_USUARIO_CRIACAO.AsString) = '') then
    qry_mercadoria_calcNmCriador.AsString := 'sem informações no sistema!'
  else
    qry_mercadoria_calcNmCriador.AsString :=  ConsultaLookUp('TUSUARIO', 'CD_USUARIO', qry_mercadoria_CD_USUARIO_CRIACAO.AsString, 'NM_USUARIO');
  qry_mercadoria_calcNmAlterador.AsString :=  ConsultaLookUp('TUSUARIO', 'CD_USUARIO', qry_mercadoria_CD_USUARIO_ULT_ALTERACAO.AsString, 'NM_USUARIO');

end;

procedure Tdatm_mercadoria_exp.qry_mercadoria_AfterInsert(
  DataSet: TDataSet);
begin
  qry_mercadoria_IN_ATIVO.AsString := '1';
end;

procedure Tdatm_mercadoria_exp.qry_mercadoria_NewRecord(DataSet: TDataSet);
begin
  qry_mercadoria_CD_SULF_NCM.AsString:='00';
end;

procedure Tdatm_mercadoria_exp.qry_Mercadoria_MarcacaoCalcFields(
  DataSet: TDataSet);
begin
  qry_Mercadoria_MarcacaoCALC_NM_PAIS_DESTINO.asstring :=
  ConsultaLookUp('TPAIS_BROKER', 'CD_PAIS', qry_Mercadoria_MarcacaoCD_PAIS_DESTINO.AsString, 'NM_PAIS');
end;

procedure Tdatm_mercadoria_exp.qry_mercadoria_AfterScroll(
  DataSet: TDataSet);
begin
  if datm_mercadoria_exp.qry_mercadoria_CD_GRUPO.asstring = '155' Then //nestle
  begin
    datm_mercadoria_exp.qry_Mercadoria_Marcacao.Close;
    datm_mercadoria_exp.qry_Mercadoria_Marcacao.ParamByName('CD_MERCADORIA').asstring := qry_mercadoria_CD_MERCADORIA.asstring;
    datm_mercadoria_exp.qry_Mercadoria_Marcacao.Prepare;
    datm_mercadoria_exp.qry_Mercadoria_Marcacao.Open;
  end;
end;

procedure Tdatm_mercadoria_exp.qryDeclaracaoOrigemCalcFields(
  DataSet: TDataSet);
begin
  qryDeclaracaoOrigemLista.AsString := qryDeclaracaoOrigemNUMERO.AsString + ' - ' + qryDeclaracaoOrigemFederacao.AsString; 
end;

procedure Tdatm_mercadoria_exp.QryMERCADORIA_EXP_DO_UpdateError(
  DataSet: TDataSet; E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  if AnsiContainsText(E.Message, 'Key violation') then
  begin
    DataSet.Delete;
    Warning('Já existe um registro com as mesmas Informações');
    Abort;
  end;
end;

end.
