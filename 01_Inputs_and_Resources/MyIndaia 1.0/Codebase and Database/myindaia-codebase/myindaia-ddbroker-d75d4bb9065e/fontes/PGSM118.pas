unit PGSM118;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_mercadoria = class(TDataModule)
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
    StringField1: TStringField;
    qry_lista_AP_MERCADORIA: TStringField;
    qry_lista_NM_EMPRESA: TStringField;
    qry_lista_NM_GRUPO: TStringField;
    ds_lista: TDataSource;
    qry_lista_CD_PAIS_AQUISICAO: TStringField;
    qry_lista_CD_PAIS_ORIGEM: TStringField;
    qry_mercadoria_: TQuery;
    qry_mercadoria_CD_MERCADORIA: TStringField;
    qry_mercadoria_NM_MERCADORIA: TMemoField;
    qry_mercadoria_AP_MERCADORIA: TStringField;
    qry_mercadoria_VL_UNITARIO: TFloatField;
    qry_mercadoria_CD_NCM_SH: TStringField;
    qry_mercadoria_CD_NALADI_SH: TStringField;
    qry_mercadoria_CD_NALADI_NCCA: TStringField;
    qry_mercadoria_PL_MERCADORIA: TFloatField;
    qry_mercadoria_CD_EXPORTADOR: TStringField;
    qry_mercadoria_CD_PAIS_AQUISICAO: TStringField;
    qry_mercadoria_CD_PAIS_ORIGEM: TStringField;
    qry_mercadoria_CD_FABRICANTE: TStringField;
    qry_mercadoria_CD_IMPORTADOR: TStringField;
    qry_mercadoria_CD_GRUPO: TStringField;
    qry_mercadoria_CD_FABR_EXPO: TStringField;
    qry_mercadoria_CD_TIPO_CALCULO: TStringField;
    qry_mercadoria_CD_MATERIAL: TStringField;
    qry_mercadoria_look_pais_aquisicao: TStringField;
    qry_mercadoria_look_pais_origem: TStringField;
    qry_mercadoria_look_med_comerc: TStringField;
    qry_mercadoria_look_importador: TStringField;
    qry_lista_CD_IMPORTADOR: TStringField;
    qry_lista_CD_GRUPO: TStringField;
    qry_unid_medida_: TQuery;
    qry_unid_medida_CD_UNID_MEDIDA: TStringField;
    qry_unid_medida_NM_UNID_MEDIDA: TStringField;
    qry_unid_medida_IN_ATIVO: TStringField;
    qry_mercadoria_CD_UN_MED_COMERC: TStringField;
    qry_nivel_merc_: TQuery;
    qry_nivel_merc_CD_MERCADORIA: TStringField;
    qry_nivel_merc_CD_NIVEL_NVE: TStringField;
    qry_nivel_merc_CD_ATRIBUTO_NCM: TStringField;
    qry_nivel_merc_CD_ESPECIF_NCM: TStringField;
    ds_nivel_merc: TDataSource;
    qry_nivel_: TQuery;
    qry_atrib_: TQuery;
    qry_especif_: TQuery;
    ds_nivel: TDataSource;
    ds_atrib: TDataSource;
    ds_especif: TDataSource;
    qry_nivel_merc_LookNomeAtrib: TStringField;
    qry_nivel_merc_LookNomeEspec: TStringField;
    qry_nivel_merc_LookNivel: TStringField;
    qry_mercadoria_LookNCM: TStringField;
    qry_mercadoria_IN_NECESSITA_LI: TBooleanField;
    qry_mercadoria_CD_FAMILIA_PROD: TStringField;
    qry_mercadoria_CD_MOEDA: TStringField;
    qry_mercadoria_CD_EMBALAGEM: TStringField;
    qry_mercadoria_CD_CATEGORIA_TEXTIL: TStringField;
    qry_mercadoria_CD_FINALIDADE_MERC: TStringField;
    qry_mercadoria_CD_UF_PRODUTOR: TStringField;
    qry_mercadoria_TX_DESC_INGLES: TMemoField;
    qry_mercadoria_TX_DESC_ESP: TMemoField;
    qry_mercadoria_PB_MERCADORIA: TFloatField;
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
    qry_mercadoria_LookExportador: TStringField;
    qry_mercadoria_LookFabricante: TStringField;
    qry_emp_est_: TQuery;
    qry_mercadoria_QT_POR_EMBALAGEM: TFloatField;
    qry_atrib_CD_NOMENC_NCM: TStringField;
    qry_atrib_CD_ATRIBUTO_NCM: TStringField;
    qry_atrib_IN_MULTIPLA_ESPECIF: TStringField;
    qry_atrib_CD_NIVEL_NCM: TStringField;
    qry_atrib_NM_ATRIBUTO: TStringField;
    qry_nivel_CD_NIVEL_NVE: TStringField;
    qry_nivel_NM_NIVEL: TStringField;
    qry_especif_CD_NOMENC_NCM: TStringField;
    qry_especif_CD_ATRIBUTO_NCM: TStringField;
    qry_especif_CD_ESPECIF_NCM: TStringField;
    qry_especif_CD_NIVEL_NCM: TStringField;
    qry_especif_NM_ESPECIF_NCM: TStringField;
    qry_nivel_merc_CD_NCM_ATRIBUTO: TStringField;
    qry_nivel_merc_CD_NCM_ESPECIF: TStringField;
    qry_mercadoria_look_nm_grupo: TStringField;
    qry_mercadoria_CD_ONU: TStringField;
    qry_mercadoria_CD_CLASSE: TStringField;
    qry_mercadoria_CD_AREA: TStringField;
    qry_area_: TQuery;
    qry_area_CD_AREA: TStringField;
    qry_area_NM_AREA: TStringField;
    qry_mercadoria_LookArea: TStringField;
    qry_embalagem_NM_EMBALAGEM_S: TStringField;
    qry_pesquisa: TQuery;
    qry_lista_NM_PAIS_AQUISICAO: TStringField;
    qry_lista_NM_PAIS_ORIGEM: TStringField;
    qry_mercadoria_IN_ATO_DRAWBACK: TStringField;
    qry_yesno_: TQuery;
    ds_yesno: TDataSource;
    qry_mercadoria_CD_PROPRIETARIO: TStringField;
    qry_mercadoria_CD_EMBALAGEM_SCX: TStringField;
    qry_emb_scx_: TQuery;
    qry_prop_merc_: TQuery;
    qry_mercadoria_LookEmbalagemScx: TStringField;
    qry_mercadoria_LookProprietario: TStringField;
    qry_mercadoria_IN_TIPO_M_E: TStringField;
    qry_mercadoria_IN_CAT63: TStringField;
    qry_mercadoria_CD_USUARIO_CRIACAO: TStringField;
    qry_mercadoria_DT_CRIACAO: TDateTimeField;
    qry_mercadoria_CD_USUARIO_ULT_ALTERACAO: TStringField;
    qry_mercadoria_DT_ULT_ALTERACAO: TDateTimeField;
    qry_mercadoria_calcNmCriador: TStringField;
    qry_mercadoria_calcNmAlterador: TStringField;
    qry_mercadoria_IN_DRAWBACK_INDAIA: TStringField;
    qry_mercadoria_NM_MERC_RESUMIDA: TStringField;
    qry_mercadoria_DESTAQUE_NCM: TStringField;
    qry_mercadoria_IN_ATIVO: TStringField;
    qry_mercadoria_CD_TRIBUTACAO_ICMS: TStringField;
    qry_mercadoria_PC_ICMS: TFloatField;
    qry_mercadoria_CD_FUND_LEGAL_ICMS: TStringField;
    qry_mercadoria_IN_ALIQ_DIF: TStringField;
    qry_disp_legal_: TQuery;
    qry_disp_legal_CD_EX: TStringField;
    qry_disp_legal_NM_EX: TStringField;
    qry_disp_legal_CD_TRIB: TStringField;
    qry_disp_legal_LookupTributacao: TStringField;
    qry_disp_legal_NM_FUND_LEGAL: TStringField;
    qry_trat_tribut_: TQuery;
    qry_trat_tribut_CD_TRAT_TRIB_ICMS: TStringField;
    qry_trat_tribut_NM_TRAT_TRIB_ICMS: TStringField;
    qry_mercadoria_IN_NECESSITA_LI_SISCOMEX: TStringField;
    qry_mercadoria_CD_PLANEJADOR: TIntegerField;
    qry_mercadoria_CALC_NM_PLANEJADOR: TStringField;
    qry_mercadoria_IN_DRAWBACK: TStringField;
    qry_mercadoria_PC_PIS: TFloatField;
    qry_mercadoria_PC_COFINS: TFloatField;
    qry_mercadoria_IN_ALIQ_DIF_PIS: TStringField;
    qry_mercadoria_IN_ALIQ_DIF_COFINS: TStringField;
    qry_mercadoria_CD_REG_TRIB_PIS_COFINS: TStringField;
    qry_mercadoria_CD_FUND_LEG_PIS_COFINS: TStringField;
    qry_lista_CD_NCM_SH: TStringField;
    qry_mercadoria_IN_ANTIDUMPING: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_LCC: TQuery;
    qry_LCCCD_LCC: TStringField;
    qry_LCCDESCRICAO: TStringField;
    qry_LCCCD_GRUPO: TStringField;
    ds_LCC: TDataSource;
    qry_mercadoria_DIV_MERC: TStringField;
    qry_mercadoria_NR_DESTAQUE_NCM: TStringField;
    qry_mercadoria_PC_REDUCAO_ICMS: TFloatField;
    qry_mercadoria_CD_CATALOGO_PRODUTOS: TIntegerField;
    qry_mercadoria_NR_VERSAO_CATALOGO_PROD: TStringField;
    procedure qry_nivel_merc_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
    procedure qry_mercadoria_CalcFields(DataSet: TDataSet);
    procedure qry_mercadoria_AfterInsert(DataSet: TDataSet);
    procedure ds_mercadoriaStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_mercadoria: Tdatm_mercadoria;

implementation

uses PGSM117, GSMLIB, ConsOnLineEx;

{$R *.DFM}

procedure Tdatm_mercadoria.qry_nivel_merc_AfterScroll(DataSet: TDataSet);
begin
  qry_atrib_.Close;
  qry_atrib_.SQL[2] := 'CD_NOMENC_NCM = "' + Trim( qry_nivel_merc_CD_NCM_ATRIBUTO.AsString ) + '" AND CD_ATRIBUTO_NCM = "' + Trim( qry_nivel_merc_CD_ATRIBUTO_NCM.AsString ) + '"';
  qry_atrib_.Prepare;
  qry_atrib_.Open;

  qry_especif_.Close;
  qry_especif_.SQL[2] := 'CD_NOMENC_NCM = "' + Trim( qry_nivel_merc_CD_NCM_ESPECIF.AsString ) + '" AND CD_ATRIBUTO_NCM = "' + Trim( qry_nivel_merc_CD_ATRIBUTO_NCM.AsString ) + '" AND CD_ESPECIF_NCM = "' + Trim( qry_nivel_merc_CD_ESPECIF_NCM.AsString ) + '"';
  qry_especif_.Prepare;
  qry_especif_.Open;

  if frm_mercadoria.pgctrl.ActivePage = frm_mercadoria.ts_nve then
  begin
    if Not ( qry_nivel_merc_.State in [dsInsert] ) then
    begin
      qry_nivel_merc_.Edit;
      qry_nivel_merc_.Cancel;
    end;
  end;
end;

procedure Tdatm_mercadoria.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_mercadoria_.Close;
  qry_mercadoria_.Prepare;
  qry_mercadoria_.Open;
  frm_mercadoria.btn_duplica.Enabled := True;
end;

procedure Tdatm_mercadoria.qry_mercadoria_CalcFields(DataSet: TDataSet);
begin
  {Embalagem}
  qry_mercadoria_LookEmbalagemScx.AsString := Lookup( qry_emb_scx_, qry_mercadoria_CD_EMBALAGEM_SCX, 'CD_EMBALAGEM', 'NM_EMBALAGEM' );
  {Proprietário de Mercadoria}
  qry_mercadoria_LookProprietario.AsString := Lookup( qry_prop_merc_, qry_mercadoria_CD_PROPRIETARIO, 'CD_PROPRIETARIO', 'NM_PROPRIETARIO' );
  {usuário criador, último alterador do registro}
  if (qry_mercadoria_CD_USUARIO_CRIACAO.IsNull) or (Trim(qry_mercadoria_CD_USUARIO_CRIACAO.AsString) = '') then
    qry_mercadoria_calcNmCriador.AsString := 'sem informações no sistema!'
  else
    qry_mercadoria_calcNmCriador.AsString :=  ConsultaLookUp('TUSUARIO', 'CD_USUARIO', qry_mercadoria_CD_USUARIO_CRIACAO.AsString, 'NM_USUARIO');
  qry_mercadoria_calcNmAlterador.AsString :=  ConsultaLookUp('TUSUARIO', 'CD_USUARIO', qry_mercadoria_CD_USUARIO_ULT_ALTERACAO.AsString, 'NM_USUARIO');
  qry_mercadoria_CALC_NM_PLANEJADOR.AsString :=  ConsultaLookUPSQL(' SELECT NM_PLANEJADOR ' +
                                                                   ' FROM TPLANEJADORES ' +
                                                                   ' WHERE CD_PLANEJADOR = ''' + qry_mercadoria_CD_PLANEJADOR.AsString + ''' ' +
                                                                   '   AND CD_GRUPO      = ''' + qry_mercadoria_CD_GRUPO.AsString + '''', 'NM_PLANEJADOR');
  if qry_mercadoria_DT_CRIACAO.AsDateTime > 0 then
    qry_mercadoria_calcNmCriador.AsString := qry_mercadoria_calcNmCriador.AsString + ' (' + DateToStr(qry_mercadoria_DT_CRIACAO.AsDateTime) + ')';
  if qry_mercadoria_DT_ULT_ALTERACAO.AsDateTime > 0 then
    qry_mercadoria_calcNmAlterador.AsString := qry_mercadoria_calcNmAlterador.AsString + ' (' + DateToStr(qry_mercadoria_DT_ULT_ALTERACAO.AsDateTime) + ')';
end;

procedure Tdatm_mercadoria.qry_mercadoria_AfterInsert(DataSet: TDataSet);
begin
  qry_mercadoria_IN_ATIVO.AsString             := '1';
  qry_mercadoria_IN_ALIQ_DIF.AsString          := '0';
  qry_mercadoria_NM_MERCADORIA.AsString        := ' ';
end;

procedure Tdatm_mercadoria.ds_mercadoriaStateChange(Sender: TObject);
begin
  if qry_mercadoria_.State in [dsEdit, dsInsert] then
    frm_Mercadoria.Btn_Mi(False, True, True, False)
  else
    frm_Mercadoria.Btn_Mi(True, False, False, True);
end;

end.
