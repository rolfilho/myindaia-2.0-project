unit PGLI006;
     
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_LI_Itens = class(TDataModule)
    ds_li_itens: TDataSource;
    qry_li_itens_: TQuery;
    qry_li_itens_NR_PROCESSO: TStringField;
    qry_li_itens_NR_ITEM: TStringField;
    qry_li_itens_CD_EXPORTADOR: TStringField;
    qry_li_itens_CD_FABR_EXPO: TStringField;
    qry_li_itens_CD_FABRICANTE: TStringField;
    qry_li_itens_CD_NALADI_NCCA: TStringField;
    qry_li_itens_CD_NALADI_SH: TStringField;
    qry_li_itens_CD_NCM_SH: TStringField;
    qry_li_itens_CD_PAIS_AQUISICAO: TStringField;
    qry_li_itens_CD_PAIS_ORIGEM: TStringField;
    qry_li_itens_PL_MERCADORIA: TFloatField;
    qry_li_itens_QT_MERC_UN_COMERC: TFloatField;
    qry_li_itens_QT_MERC_UN_ESTAT: TFloatField;
    qry_li_itens_TX_DESC_DET_MERC: TMemoField;
    qry_li_itens_VL_UNIT_MLE: TFloatField;
    qry_li_itens_VL_TOTAL_MLE: TFloatField;
    qry_li_itens_VL_UNIT_MCV: TFloatField;
    qry_unid_medida_: TQuery;
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
    tbl_naladi_ncca_: TTable;
    tbl_naladi_sh_: TTable;
    tbl_pais_: TTable;
    tbl_pais_CODIGO: TStringField;
    tbl_pais_DESCRICAO: TStringField;
    ds_pais: TDataSource;
    ds_li: TDataSource;
    qry_li_: TQuery;
    qry_li_itens_CD_IMPORTADOR: TStringField;
    qry_li_NR_PROCESSO: TStringField;
    qry_li_NR_IDENT_USUARIO: TStringField;
    qry_li_NR_ATO_DRAWBACK: TStringField;
    qry_li_NR_COMUNICADO_COMPRA: TStringField;
    qry_li_NR_REGISTRO_LI: TStringField;
    qry_li_CD_MOD_PAGAMENTO: TStringField;
    qry_li_CD_IMPORTADOR: TStringField;
    qry_li_CD_ACORDO_ALADI: TStringField;
    qry_li_CD_REGIME_TRIBUTACAO: TStringField;
    qry_li_CD_FUND_LEGAL: TStringField;
    qry_li_CD_AGENCIA_SECEX: TStringField;
    qry_li_CD_PAIS_PROCEDENCIA: TStringField;
    qry_li_CD_INCOTERM: TStringField;
    qry_li_CD_INSTITUICAO_FINANC: TStringField;
    qry_li_CD_MOT_SEM_COBERTURA: TStringField;
    qry_li_CD_CONDICAO_MERC: TStringField;
    qry_li_CD_MOEDA_FOB: TStringField;
    qry_li_CD_URF_DESPACHO: TStringField;
    qry_li_CD_URF_ENTRADA: TStringField;
    qry_li_CD_MOEDA_FRETE: TStringField;
    qry_li_CD_MOEDA_SEGURO: TStringField;
    qry_li_CD_MOEDA_MLE: TStringField;
    qry_li_CD_TIPO_IMPORTADOR: TStringField;
    qry_li_CD_SERVICO: TStringField;
    qry_li_DT_PROCESSO_LI: TDateTimeField;
    qry_li_DT_REGISTRO_LI: TDateTimeField;
    qry_li_QT_DIAS_COBERTURA: TIntegerField;
    qry_li_QT_TOTAL_PES_LIQ: TFloatField;
    qry_li_QT_MED_ESTATISTICA: TFloatField;
    qry_li_TP_CAMBIO: TStringField;
    qry_li_TX_INFO_COMPLEMENTAR: TMemoField;
    qry_li_VL_FRETE_MOEDA: TFloatField;
    qry_li_VL_SEGURO_MOEDA: TFloatField;
    qry_li_VL_DESPESA_MOEDA: TFloatField;
    qry_li_VL_DESCONTO_MOEDA: TFloatField;
    qry_li_VL_TOTAL_MOEDA: TFloatField;
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
    ds_empresa_nac: TDataSource;
    qry_li_itens_NR_DESTAQUE_NCM: TStringField;
    qry_li_itens_CD_PAIS_PROCEDENCIA: TStringField;
    qry_li_TP_ACORDO_ALADI: TStringField;
    qry_li_NR_PROCESSO_SISCOMEX: TStringField;
    ds_empresa_est: TDataSource;
    tbl_empresa_est_: TTable;
    tbl_empresa_est_CD_EMPRESA: TStringField;
    tbl_empresa_est_NM_EMPRESA: TStringField;
    tbl_empresa_est_AP_EMPRESA: TStringField;
    tbl_empresa_est_END_NUMERO: TStringField;
    tbl_empresa_est_END_CIDADE: TStringField;
    tbl_empresa_est_END_ESTADO: TStringField;
    tbl_empresa_est_CD_PAIS: TStringField;
    tbl_empresa_est_NR_TELEFONE: TStringField;
    tbl_empresa_est_NR_FAX: TStringField;
    tbl_empresa_est_DT_INCLUSAO: TDateTimeField;
    qry_li_itens_LookExportador: TStringField;
    qry_li_itens_LookFabProd: TStringField;
    qry_li_itens_LookPaisAquisicao: TStringField;
    qry_li_itens_LookPaisOrigem: TStringField;
    qry_li_QT_TOTAL_ITEM: TStringField;
    qry_li_IN_MONTADA: TStringField;
    qry_li_itens_LookUnidMedida: TStringField;
    sp_li_apaga_renum_itens: TStoredProc;
    sp_li_monta_li: TStoredProc;
    qry_li_itens_LookNCM: TStringField;
    qry_li_nve_: TQuery;
    ds_li_nve: TDataSource;
    qry_li_nve_NR_PROCESSO: TStringField;
    qry_li_nve_NR_ITEM: TStringField;
    qry_li_nve_CD_NIVEL_NVE: TStringField;
    qry_li_nve_CD_ATRIBUTO_NCM: TStringField;
    qry_li_nve_CD_ESPECIF_NCM: TStringField;
    qry_nivel_: TQuery;
    qry_nivel_CD_NIVEL_NVE: TStringField;
    qry_atrib_: TQuery;
    qry_atrib_CD_NOMENC_NCM: TStringField;
    qry_atrib_CD_ATRIBUTO_NCM: TStringField;
    qry_atrib_IN_MULTIPLA_ESPECIF: TStringField;
    qry_atrib_CD_NIVEL_NCM: TStringField;
    qry_atrib_NM_ATRIBUTO: TStringField;
    qry_especif_: TQuery;
    qry_especif_CD_NOMENC_NCM: TStringField;
    qry_especif_CD_ATRIBUTO_NCM: TStringField;
    qry_especif_CD_ESPECIF_NCM: TStringField;
    qry_especif_CD_NIVEL_NCM: TStringField;
    qry_especif_NM_ESPECIF_NCM: TStringField;
    ds_nivel: TDataSource;
    ds_atrib: TDataSource;
    ds_especif: TDataSource;
    qry_li_nve_LookNomeAtrib: TStringField;
    qry_li_nve_LookNomeEspec: TStringField;
    qry_dup_nve_: TQuery;
    qry_nivel_NM_NIVEL: TStringField;
    qry_apaga_nve_: TQuery;
    qry_copia_nve_merc_: TQuery;
    sp_li_dupl_nve: TStoredProc;
    qry_li_itens_CD_UN_MED_COMERC: TStringField;
    qry_li_itens_CD_UN_MED_ESTAT: TStringField;
    qry_unid_medida_CD_UNID_MEDIDA: TStringField;
    qry_unid_medida_NM_UNID_MEDIDA: TStringField;
    qry_unid_medida_IN_ATIVO: TStringField;
    qry_unid_medida_CD_GIPLITE: TStringField;
    qry_li_itens_CD_MERCADORIA: TStringField;
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
    qry_li_itens_VL_RAT_FRETE: TFloatField;
    qry_li_itens_VL_RAT_SEGURO: TFloatField;
    qry_li_itens_VL_RAT_DESPESA: TFloatField;
    qry_li_itens_VL_RAT_DESCONTO: TFloatField;
    sp_li_calculo: TStoredProc;
    qry_li_itens_NR_ATO_DRAWBACK: TStringField;
    qry_li_itens_CD_REGIME_TRIBUTACAO: TStringField;
    qry_li_itens_CD_FUND_LEGAL: TStringField;
    qry_fund_legal_: TQuery;
    qry_reg_trib_: TQuery;
    qry_li_itens_LookRegTrib: TStringField;
    qry_li_itens_LookFundLegal: TStringField;
    qry_grupo_: TQuery;
    tbl_empresa_est_END_EMPRESA: TStringField;
    tbl_empresa_est_END_COMPL: TStringField;
    qry_li_itens_IN_DRAWBACK_AUTOMATICO: TStringField;
    qry_li_itens_NR_ITEM_DRAWBACK: TStringField;
    qry_li_itens_QT_PRODUTO_DRAWBACK: TFloatField;
    qry_li_itens_VL_PRODUTO_DRAWBACK: TFloatField;
    qry_grupo_CD_GRUPO: TStringField;
    qry_li_itens_NR_ITEM_PO: TStringField;
    qry_li_itens_NR_PROC_PO: TStringField;
    qry_li_itens_SISTEMA_DRAWBACK: TIntegerField;
    qry_li_itens_NR_QUEBRA_EXTRA: TStringField;
    qry_li_itens_VL_TOTAL_MLE_SEM_FRETE: TFloatField;
    qry_li_itens_VL_RAT_FRETE_MOEDA_MERC: TFloatField;
    procedure qry_li_itens_BeforeEdit(DataSet: TDataSet);
    procedure qry_li_itens_BeforeInsert(DataSet: TDataSet);
    procedure qry_li_itens_CalcFields(DataSet: TDataSet);
    procedure qry_li_itens_AfterScroll(DataSet: TDataSet);
    procedure qry_li_itens_BeforePost(DataSet: TDataSet);
  private

  public

  end;

var
  datm_LI_Itens: Tdatm_LI_Itens;

implementation

uses GSMLIB, PGLI003, PGLI002;

{$R *.DFM}

procedure Tdatm_LI_Itens.qry_li_itens_BeforeEdit(DataSet: TDataSet);
begin
  with frm_LI_itens do
  begin
    if frm_LI.in_montada and not frm_LI.in_retificar then
    begin
      qry_li_itens_.Cancel;
      btn_mi(False, False, False, False, False, False, False);
      dbnvgr_li_itens.Enabled := True;
    end
    else
    begin
      btn_mi(False, True, True, False, False, False, False);
      dbnvgr_li_itens.Enabled := False;
    end;
  end;
end;

procedure Tdatm_LI_Itens.qry_li_itens_BeforeInsert(DataSet: TDataSet);
begin
  with frm_LI_itens do
  begin
    if frm_LI.in_montada and not frm_LI.in_retificar then
    begin
      qry_li_itens_.Cancel;
      btn_mi(False, False, False, False, False, False, False);
      dbnvgr_li_itens.Enabled := True;
    end
    else
    begin
      btn_mi(False, True, True, False, False, False, False);
      dbnvgr_li_itens.Enabled := False;
    end;
  end;
end;

procedure Tdatm_LI_Itens.qry_li_itens_CalcFields(DataSet: TDataSet);
begin
  if qry_li_itens_CD_FUND_LEGAL.AsString = '' then
    qry_li_itens_LookFundLegal.AsString := ''
  else
  begin
    qry_fund_legal_.Close;
    qry_fund_legal_.ParamByName('CODIGO').AsString         := qry_li_itens_CD_FUND_LEGAL.AsString;
    qry_fund_legal_.ParamByName('CD_REGIME_TRIB').AsString := qry_li_itens_CD_REGIME_TRIBUTACAO.AsString;
    qry_fund_legal_.Prepare;
    qry_fund_legal_.Open;
    if Not qry_fund_legal_.EOF then
    begin
      qry_li_itens_LookFundLegal.AsString := qry_fund_legal_.FieldByName('DESCRICAO').AsString;
    end
    else
    begin
      qry_li_itens_LookFundLegal.AsString := '';
    end;
  end;
end;

procedure Tdatm_LI_Itens.qry_li_itens_AfterScroll(DataSet: TDataSet);
begin
  with frm_li_itens do
  begin
    if tbl_ncm_.FindKey([ qry_li_itens_CD_NCM_SH.AsString ]) then
      if qry_unid_medida_.Locate('CD_UNID_MEDIDA', tbl_ncm_UNIDADE_MEDIDA.AsString, []) then
        edt_unid_med_estat.Text := qry_unid_medida_NM_UNID_MEDIDA.AsString;

    rbtn_sistema_drawback1.Checked := (qry_li_itens_.FieldByName('IN_DRAWBACK_AUTOMATICO').AsString = '1');
    rbtn_sistema_drawback2.Checked := (qry_li_itens_.FieldByName('IN_DRAWBACK_AUTOMATICO').AsString = '2');
    rbtn_sistema_drawback3.Checked := (qry_li_itens_.FieldByName('IN_DRAWBACK_AUTOMATICO').AsString = '0');

    lbl_info_drawback.Enabled         := not rbtn_sistema_drawback3.Checked;
    dbedt_nr_item_drawback.Enabled    := not rbtn_sistema_drawback3.Checked;
    dbedt_qt_produto_drawback.Enabled := not rbtn_sistema_drawback3.Checked;
    dbedt_vl_produto_drawback.Enabled := not rbtn_sistema_drawback3.Checked;
  end;
end;

procedure Tdatm_LI_Itens.qry_li_itens_BeforePost(DataSet: TDataSet);
begin
  with frm_LI_Itens do
  begin
    if rbtn_sistema_drawback1.Checked then
      qry_li_itens_.FieldByName('IN_DRAWBACK_AUTOMATICO').AsString := '1';

    if rbtn_sistema_drawback2.Checked then
      qry_li_itens_.FieldByName('IN_DRAWBACK_AUTOMATICO').AsString := '2';

    if rbtn_sistema_drawback3.Checked then
      qry_li_itens_.FieldByName('IN_DRAWBACK_AUTOMATICO').AsString := '0';
  end;
end;

end.
