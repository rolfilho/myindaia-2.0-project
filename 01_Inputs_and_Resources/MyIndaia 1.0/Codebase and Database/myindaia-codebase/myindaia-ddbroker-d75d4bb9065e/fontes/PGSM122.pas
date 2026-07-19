unit PGSM122;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StrUtils,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_previsao = class(TDataModule)
    ds_previsao: TDataSource;
    qry_previsao_: TQuery;
    ds_previsao_adicao: TDataSource;
    qry_previsao_adicao_: TQuery;
    ds_via_transp: TDataSource;
    qry_via_transp_: TQuery;
    ds_embalagens: TDataSource;
    qry_embalagens_: TQuery;
    ds_empresa_nac: TDataSource;
    tbl_empresa_nac_: TTable;
    tbl_empresa_nac_CD_EMPRESA: TStringField;
    tbl_empresa_nac_AP_EMPRESA: TStringField;
    tbl_empresa_nac_NM_EMPRESA: TStringField;
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
    tbl_empresa_nac_CD_TIPO_REF: TStringField;
    tbl_empresa_nac_CD_TAB_SDA: TStringField;
    tbl_empresa_nac_DT_INCLUSAO: TDateTimeField;
    tbl_empresa_nac_IN_FATURAMENTO: TStringField;
    tbl_empresa_nac_IN_ATIVO: TStringField;
    tbl_empresa_nac_IN_RESTRICAO: TStringField;
    tbl_empresa_nac_IN_EVENTUAL: TStringField;
    tbl_empresa_nac_IN_CLIENTE: TBooleanField;
    tbl_empresa_nac_IN_IMPORTADOR: TBooleanField;
    tbl_empresa_nac_IN_EXPORTADOR: TBooleanField;
    tbl_empresa_nac_IN_OUTROS: TBooleanField;
    tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField;
    tbl_empresa_nac_CD_SDA: TStringField;
    qry_previsao_CD_CLIENTE: TStringField;
    qry_previsao_CD_VIA_TRANSP: TStringField;
    qry_previsao_DT_ENTRADA: TDateTimeField;
    qry_previsao_CD_MOEDA_MLE: TStringField;
    qry_previsao_CD_MOEDA_FRETE: TStringField;
    qry_previsao_CD_MOEDA_SEGURO: TStringField;
    qry_previsao_VL_MLE_MNEG: TFloatField;
    qry_previsao_VL_MLE_MN: TFloatField;
    qry_previsao_VL_DESP_MN: TFloatField;
    qry_previsao_VL_FRETE_MNEG: TFloatField;
    qry_previsao_VL_FRETE_MN: TFloatField;
    qry_previsao_VL_SEGURO_MNEG: TFloatField;
    qry_previsao_VL_SEGURO_MN: TFloatField;
    qry_previsao_CD_BASE_SEGURO: TStringField;
    qry_previsao_PC_SEGURO: TFloatField;
    qry_previsao_IN_REB: TStringField;
    qry_previsao_PB_PREVISAO: TFloatField;
    qry_previsao_PL_PREVISAO: TFloatField;
    qry_previsao_QT_EMBALAGEM: TFloatField;
    qry_previsao_CD_EMBALAGEM: TStringField;
    qry_previsao_CD_USUARIO: TStringField;
    qry_previsao_DT_PREVISAO: TDateTimeField;
    qry_previsao_QT_ADICOES: TIntegerField;
    qry_previsao_Look_nm_importador: TStringField;
    qry_previsao_Calc_vl_mle_mn: TFloatField;
    qry_previsao_Calc_vl_frete_mn: TFloatField;
    qry_previsao_Calc_vl_seguro_mn: TFloatField;
    qry_previsao_Calc_vl_desp_mn: TFloatField;
    qry_previsao_adicao_CD_NCM_SH: TStringField;
    qry_previsao_adicao_QUANTIDADE: TFloatField;
    qry_previsao_adicao_VL_MLE_MNEG_TOT: TFloatField;
    qry_previsao_adicao_VL_MLE_MNEG_UNIT: TFloatField;
    qry_previsao_adicao_PC_ALIQ_II: TFloatField;
    qry_previsao_adicao_PC_ALIQ_IPI: TFloatField;
    qry_previsao_adicao_PC_ALIQ_ICMS: TFloatField;
    qry_previsao_adicao_PC_ALIQ_ICMS_RED: TFloatField;
    qry_previsao_adicao_VL_II: TFloatField;
    qry_previsao_adicao_VL_IPI: TFloatField;
    qry_previsao_adicao_VL_ICMS: TFloatField;
    qry_previsao_adicao_CD_REG_TRIB_II: TStringField;
    qry_previsao_adicao_CD_REG_TRIB_IPI: TStringField;
    qry_previsao_adicao_VL_ALIQ_ESPEC_IPT: TFloatField;
    qry_previsao_adicao_QT_MERC_UN_ALIQ_ES: TFloatField;
    qry_previsao_adicao_PC_ALIQ_REDUZIDA_II: TFloatField;
    qry_previsao_adicao_PC_ALIQ_REDUZIDA_IPI: TFloatField;
    qry_previsao_adicao_PC_REDUCAO_IPT_BLI: TFloatField;
    qry_embalagens_Codigo: TStringField;
    qry_embalagens_Descricao: TStringField;
    qry_previsao_adicao_IN_IPI_NAO_TRIBUT: TBooleanField;
    qry_unidade_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_AP_UNID_NEG: TStringField;
    qry_previsao_VL_DESP_MNEG: TFloatField;
    qry_conversao_: TQuery;
    qry_ncm_: TQuery;
    ds_ncm: TDataSource;
    ds_reg_trib: TDataSource;
    tbl_reg_trib_: TTable;
    qry_previsao_adicao_NR_ADICAO: TStringField;
    qry_previsao_adicao_Look_Reg_Trib_II: TStringField;
    qry_moeda_: TQuery;
    ds_moeda: TDataSource;
    qry_moeda_CODIGO: TStringField;
    qry_moeda_DESCRICAO: TStringField;
    qry_ncm_CODIGO: TStringField;
    qry_ncm_DESCRICAO: TStringField;
    qry_ncm_UNIDADE_MEDIDA: TStringField;
    qry_ncm_ALIQUOTA_II: TStringField;
    qry_ncm_DATA_INICIO_VIG_II: TStringField;
    qry_ncm_DATA_FIM_VIG_II: TStringField;
    qry_ncm_ALIQUOTA_II_MERCOSUL: TStringField;
    qry_ncm_DATA_INICIO_VIG_II_MSUL: TStringField;
    qry_ncm_DATA_FIM_VIG_II_MSUL: TStringField;
    qry_ncm_ALIQUOTA_IPI: TStringField;
    qry_ncm_DATA_INICIO_VIG_IPI: TStringField;
    qry_ncm_DATA_FIM_VIG_IPI: TStringField;
    qry_apaga_prev_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    qry_previsao_despesa_: TQuery;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_item_CD_TIPO_ITEM: TStringField;
    qry_item_CD_TIPO_LANC_FAT: TStringField;
    qry_item_IN_ATIVO: TStringField;
    qry_item_IN_CPMF: TStringField;
    qry_item_CD_CT_CONTABIL: TStringField;
    qry_item_CD_CT_CUSTO: TStringField;
    qry_item_IN_CONSOLIDA: TStringField;
    qry_item_CD_FORMA_RATEIO: TStringField;
    qry_previsao_despesa_look_nm_item: TStringField;
    ds_previsao_despesa: TDataSource;
    qry_previsao_calc_nr_processo: TStringField;
    qry_previsao_despesa_CD_ITEM: TStringField;
    qry_previsao_despesa_VL_DESPESA: TFloatField;
    qry_previsao_adicao_PL_MERCADORIA: TFloatField;
    sp_prev_calc: TStoredProc;
    StringField8: TStringField;
    StringField9: TStringField;
    qry_previsao_adicao_NR_PROCESSO: TStringField;
    qry_previsao_NR_PROCESSO: TStringField;
    qry_previsao_despesa_NR_PROCESSO: TStringField;
    qry_qt_adicoes_: TQuery;
    qry_qt_adicoes_QT_ADICOES: TIntegerField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_previsao_VL_TAXA_MLE: TFloatField;
    qry_previsao_VL_TAXA_FRETE: TFloatField;
    qry_previsao_VL_TAXA_SEGURO: TFloatField;
    qry_via_transp_CD_VIA_TRANSP: TStringField;
    qry_via_transp_NM_VIA_TRANSP: TStringField;
    qry_tot_pl_: TQuery;
    qry_tot_pl_TOT_PL: TFloatField;
    qry_previsao_DT_CALCULO: TDateTimeField;
    qry_conversao_TX_CAMBIO: TFloatField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_previsao_VL_TX_SISCOMEX: TFloatField;
    qry_previsao_VL_CIF_MN: TFloatField;
    qry_previsao_CD_INCOTERM: TStringField;
    qry_previsao_IN_EMBUT_FRT_ITENS: TBooleanField;
    qry_previsao_adicao_VL_ACRESCIMO: TFloatField;
    qry_previsao_adicao_VL_DEDUCAO: TFloatField;
    qry_previsao_adicao_PC_ALIQ_ACORDO: TFloatField;
    qry_previsao_IN_EMBUT_SEG_ITENS: TBooleanField;
    qry_previsao_adicao_VL_FRETE: TFloatField;
    qry_previsao_adicao_VL_SEGURO: TFloatField;
    qry_previsao_adicao_VL_MLE: TFloatField;
    qry_previsao_adicao_VL_BASE_CALC_II: TFloatField;
    qry_previsao_adicao_VL_BASE_CALC_IPI: TFloatField;
    qry_previsao_adicao_VL_BASE_CALC_ICMS: TFloatField;
    qry_previsao_adicao_VL_DESPESAS: TFloatField;
    qry_previsao_adicao_CD_MOEDA_MLE: TStringField;
    qry_previsao_IN_MOEDA_UNICA: TBooleanField;
    qry_previsao_adicao_ALIQ_PIS: TFloatField;
    qry_previsao_adicao_ALIQ_COFINS: TFloatField;
    qry_previsao_adicao_VL_BASE_PIS: TFloatField;
    qry_previsao_adicao_VL_PIS: TFloatField;
    qry_previsao_adicao_VL_COFINS: TFloatField;
    qry_previsao_adicao_PC_REDUCAO_PIS_COFINS: TFloatField;
    qry_ncm_PIS_COFINS: TQuery;
    ds_ncm_PIS_COFINS: TDataSource;
    qry_ncm_PIS_COFINSNCM: TStringField;
    qry_ncm_PIS_COFINSCAPITULO: TStringField;
    qry_ncm_PIS_COFINSALIQ_PIS: TFloatField;
    qry_ncm_PIS_COFINSALIQ_COFINS: TFloatField;
    qry_ncm_PIS_COFINSTX_ARTIGO: TMemoField;
    qry_previsao_VL_ACRESCIMO: TFloatField;
    qry_previsao_VL_DEDUCAO: TFloatField;
    qry_previsao_VL_FRETE_INTERNO: TFloatField;
    qry_previsao_adicao_CD_TRIBUTACAO_ICMS: TStringField;
    qry_previsao_CD_VINC_IMPO_EXPO: TStringField;
    upd_previsao_: TUpdateSQL;
    upd_previsao_adicao_: TUpdateSQL;
    upd_previsao_despesa_: TUpdateSQL;
    qry_previsao_adicao_CD_EXPORTADOR: TStringField;
    qry_previsao_adicao_CD_FABRICANTE: TStringField;
    qry_previsao_VL_ACRESCIMO_MN: TFloatField;
    qry_previsao_VL_DEDUCAO_MN: TFloatField;
    qry_previsao_adicao_CD_FUND_LEGAL_ICMS: TStringField;
    qry_previsao_adicao_CD_PAIS_AQUISICAO: TStringField;
    tbl_di_volumes_: TTable;
    tbl_di_volumes_NR_SEQUENCIA: TAutoIncField;
    tbl_di_volumes_NR_PROCESSO: TStringField;
    tbl_di_volumes_CD_TIPO_EMBALAGEM: TStringField;
    tbl_di_volumes_QT_VOLUME_CARGA: TStringField;
    tbl_di_volumes_Look_Embalagem: TStringField;
    ds_di_volumes: TDataSource;
    tbl_embalagens_: TTable;
    tbl_embalagens_Codigo: TStringField;
    tbl_embalagens_Descricao: TStringField;
    dts_embalagens: TDataSource;
    qry_previsao_adicao_CD_FUND_LEG_REGIME: TStringField;
    qry_fund_leg_: TQuery;
    qry_fund_leg_Codigo: TStringField;
    qry_fund_leg_Descricao: TStringField;
    qry_fund_leg_Reg_Tribut_1: TStringField;
    qry_fund_leg_Reg_Tribut_2: TStringField;
    qry_fund_leg_Reg_Tribut_3: TStringField;
    qry_fund_leg_Reg_Tribut_4: TStringField;
    ds_fund_leg: TDataSource;
    qry_previsao_adicao_CD_VINC_IMPO_EXPO: TStringField;
    qry_previsao_adicao_CD_APLICACAO_MERC: TStringField;
    tbl_tp_vinc_expo_impo_: TTable;
    tbl_tp_vinc_expo_impo_CD_VINC_EXPO_IMPO: TStringField;
    tbl_tp_vinc_expo_impo_DESCRICAO: TStringField;
    ds_tp_vinc_expo_impo: TDataSource;
    qry_previsao_adicao_CD_INCOTERMS_VENDA: TStringField;
    qry_previsao_adicao_CD_CFOP: TStringField;
    qry_previsao_adicao_CD_TIPO_ACORDO_TAR: TStringField;
    ds_acordo_tarif: TDataSource;
    tbl_acordo_tarif_: TTable;
    tbl_acordo_tarif_CD_TIPO_ACORDO_TAR: TStringField;
    tbl_acordo_tarif_DESCRICAO: TStringField;
    qry_previsao_adicao_CD_TIPO_BENEF_PIS_COFINS: TStringField;
    qry_previsao_adicao_CD_FUND_LEGAL_PISCOFINS: TStringField;
    qry_previsao_adicao_IN_FUNDO_POBREZA: TStringField;
    qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_PIS: TFloatField;
    qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS: TFloatField;
    qry_previsao_adicao_QTD_UNID_ESPECIFICA_PIS: TFloatField;
    qry_previsao_adicao_QTD_UNID_ESPECIFICA_COFINS: TFloatField;
    qry_previsao_adicao_CD_UNIDADE_MEDIDA_PIS: TStringField;
    qry_previsao_adicao_CD_UNIDADE_MEDIDA_COFINS: TStringField;
    qry_previsao_adicao_QT_MESES_ADM_TEMP: TIntegerField;
    qry_previsao_adicao_VL_PIS_CALCULADO: TFloatField;
    qry_previsao_adicao_VL_COFINS_CALCULADO: TFloatField;
    qry_previsao_adicao_IN_SUSPENDE_II_RETIFIC: TBooleanField;
    qry_previsao_adicao_IN_SUSPENDE_IPI_RETIFIC: TBooleanField;
    qry_previsao_adicao_IN_SUSPENDE_PIS_COFINS_RETIFIC: TBooleanField;
    qry_previsao_VL_FRETE_TNAC_MNEG: TFloatField;
    SP_CALCULO_SEGURO_PREVISAO: TStoredProc;
    qry_previsao_adicao_CD_PAIS_FABRICANTE: TStringField;
    qry_previsao_adicao_PC_NORMAL_ANTIDUMPING: TFloatField;
    qry_previsao_adicao_VL_BASE_CALC_ANTIDUMPING: TFloatField;
    qry_previsao_adicao_PC_ESPEC_ANTIDUMPING: TFloatField;
    qry_previsao_adicao_QT_UNID_ESPEC_ANTIDUMPING: TFloatField;
    qry_previsao_adicao_NM_UNID_ESPEC_ANTIDUMPING: TStringField;
    qry_previsao_adicao_VL_BASE_CALC_ICMS_AFRMM: TFloatField;
    qry_previsao_adicao_VL_ICMS_A_RECOLHER_AFRMM: TFloatField;
    qry_previsao_adicao_CD_ACORDO_ALADI: TStringField;
    qry_previsao_adicao_VL_ICMS_DEVIDO_AFRMM: TFloatField;
    qry_previsao_NM_USUARIO: TStringField;
    qry_previsao_adicao_ALIQ_PIS_REDUZIDA: TFloatField;
    qry_previsao_adicao_ALIQ_COFINS_REDUZIDA: TFloatField;
    qryPreencheEvento: TQuery;
    procedure qry_previsao_adicao_BeforeInsert(DataSet: TDataSet);
    procedure qry_previsao_adicao_BeforeEdit(DataSet: TDataSet);
    procedure qry_previsao_adicao_AfterPost(DataSet: TDataSet);
    procedure qry_previsao_adicao_AfterCancel(DataSet: TDataSet);
    procedure qry_previsao_BeforeInsert(DataSet: TDataSet);
    procedure qry_previsao_AfterInsert(DataSet: TDataSet);
    procedure qry_previsao_AfterPost(DataSet: TDataSet);
    procedure qry_previsao_AfterOpen(DataSet: TDataSet);
    procedure qry_previsao_BeforeOpen(DataSet: TDataSet);
    procedure qry_previsao_CalcFields(DataSet: TDataSet);
    procedure qry_previsao_adicao_BeforeScroll(DataSet: TDataSet);
    procedure qry_previsao_adicao_AfterScroll(DataSet: TDataSet);
    procedure datm_previsaoCreate(Sender: TObject);
    procedure qry_previsao_BeforeEdit(DataSet: TDataSet);
    procedure qry_previsao_AfterScroll(DataSet: TDataSet);
    procedure qry_previsao_adicao_CD_NCM_SHChange(Sender: TField);
    procedure qry_previsao_AfterDelete(DataSet: TDataSet);
    procedure qry_previsao_adicao_AfterDelete(DataSet: TDataSet);
    procedure qry_previsao_despesa_AfterDelete(DataSet: TDataSet);
    procedure qry_previsao_despesa_AfterPost(DataSet: TDataSet);
    procedure tbl_di_volumes_AfterPost(DataSet: TDataSet);
    procedure tbl_di_volumes_BeforeDelete(DataSet: TDataSet);
    procedure tbl_di_volumes_BeforeEdit(DataSet: TDataSet);
    procedure tbl_di_volumes_BeforeInsert(DataSet: TDataSet);
    procedure tbl_di_volumes_BeforePost(DataSet: TDataSet);
    procedure qry_previsao_AfterClose(DataSet: TDataSet);
    procedure qry_previsao_adicao_PC_ALIQ_ICMSChange(Sender: TField);
    procedure qry_previsao_adicao_PC_ALIQ_ICMS_REDChange(Sender: TField);
    procedure qry_previsao_adicao_CD_REG_TRIB_IIChange(Sender: TField);
    procedure qry_previsao_adicao_CD_FABRICANTEChange(Sender: TField);
    procedure qry_previsao_adicao_AfterOpen(DataSet: TDataSet);
    procedure ds_previsaoStateChange(Sender: TObject);
  private
    AliquotasSemFundo: array of Double;
    function DoubeIndex(ADoubleArray: array of Double; AValue: Double): Integer;
  public
    Grupo: String;
    in_RJ: Boolean;
    PC_Fundo_Pobreza: Double;
    Navegando : Boolean;
  end;

var
  datm_previsao: Tdatm_previsao;

implementation

{$R *.DFM}

uses GSMLIB, PGSM121, ConsOnlineEx;

procedure Tdatm_previsao.qry_previsao_adicao_BeforeInsert(DataSet: TDataSet);
begin
  frm_previsao.dbnvgr_previsao_adicao.Enabled := False;
end;

procedure Tdatm_previsao.qry_previsao_adicao_BeforeEdit(DataSet: TDataSet);
begin
  frm_previsao.dbnvgr_previsao_adicao.Enabled := False;
end;

procedure Tdatm_previsao.qry_previsao_adicao_AfterPost(DataSet: TDataSet);
begin
  qry_previsao_adicao_.ApplyUpdates;
  frm_previsao.dbnvgr_previsao_adicao.Enabled := True;
end;

procedure Tdatm_previsao.qry_previsao_adicao_AfterCancel(DataSet: TDataSet);
begin
  frm_previsao.dbnvgr_previsao_adicao.Enabled := True;
end;

procedure Tdatm_previsao.qry_previsao_BeforeInsert(DataSet: TDataSet);
begin
  if qry_previsao_adicao_.State in [dsEdit, dsInsert] then
    qry_previsao_adicao_.Cancel;
end;

procedure Tdatm_previsao.qry_previsao_AfterInsert(DataSet: TDataSet);
begin
  if qry_previsao_adicao_.State in [dsEdit, dsInsert] then
    qry_previsao_adicao_.Cancel;
end;

procedure Tdatm_previsao.qry_previsao_AfterPost(DataSet: TDataSet);
begin
  qry_previsao_.ApplyUpdates;
  if qry_previsao_adicao_.State in [dsEdit, dsInsert] then
    qry_previsao_adicao_.Cancel;
end;

procedure Tdatm_previsao.qry_previsao_AfterOpen(DataSet: TDataSet);
var
  vAliquotas, S: String;
  Declaracao: String;
  in_Admissao: Boolean;
begin
  Tbl_di_volumes_.Open;
  Tbl_embalagens_.Open;

  if qry_previsao_adicao_.State in [dsEdit, dsInsert] then
    qry_previsao_adicao_.Cancel;

  frm_previsao.btn_trans_DI.Enabled := False; // Desabilitar a transmissão
  Declaracao := Trim(ConsultaLookUP('TDECLARACAO_IMPORTACAO', 'NR_PROCESSO', qry_previsao_NR_PROCESSO.AsString, 'NR_DECLARACAO_IMP'));
  frm_previsao.btn_trans_DI.Enabled := (Trim(qry_previsao_NR_PROCESSO.AsString) <> '') and (Declaracao = '');

  in_Admissao := ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                                   ' FROM TADICAO_DE_IMPORTACAO ' +
                                   ' WHERE NR_PROCESSO = ' + QuotedStr(qry_previsao_NR_PROCESSO.AsString) +
                                   '   AND CD_REGIME_TRIBUTAR = ''5'' ' +
                                   '   AND CD_FUND_LEG_REGIME = ''37''', 'QTD') <> '0';
  frm_previsao.btn_Retificar.Visible := (Trim(qry_previsao_NR_PROCESSO.AsString) <> '') and (Declaracao <> '') and in_Admissao;
  if frm_previsao.btn_Retificar.Visible then
    frm_previsao.btn_Retificar.Enabled := ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                                                            ' FROM TFOLLOWUP ' +
                                                            ' WHERE NR_PROCESSO = ' + QuotedStr(qry_previsao_NR_PROCESSO.AsString) +
                                                            '   AND CD_EVENTO = ''088'' ' +
                                                            '   AND DT_REALIZACAO IS NOT NULL', 'QTD') = '0';

  Grupo            := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', frm_previsao.msk_cd_unid_neg.Text + '01' + frm_previsao.msk_nr_processo.Text, 'CD_GRUPO');
  vAliquotas       := Trim(ConsultaLookUP('TGRUPO', 'CD_GRUPO', Grupo, 'PC_ALIQUOTAS_SEM_FUNDO_POBREZA'));
  SetLength(AliquotasSemFundo, 0);
  while vAliquotas <> '' do
  begin
    S := '';
    while (vAliquotas <> '') and (vAliquotas[1] <> ',') do 
    begin
      S := S + vAliquotas[1];
      Delete(vAliquotas, 1, 1);
    end;
    Delete(vAliquotas, 1, 1);
    vAliquotas := Trim(vAliquotas);
    SetLength(AliquotasSemFundo, High(AliquotasSemFundo) + 2);
    if DecimalSeparator = '.' then
      AliquotasSemFundo[High(AliquotasSemFundo)] := StrToFloat(S)
    else
      AliquotasSemFundo[High(AliquotasSemFundo)] := StrToFloat(StringReplace(S, '.', DecimalSeparator, []));
  end;
end;

procedure Tdatm_previsao.qry_previsao_BeforeOpen(DataSet: TDataSet);
begin
  if qry_previsao_adicao_.State in [dsEdit, dsInsert] then
    qry_previsao_adicao_.Cancel;
end;

procedure Tdatm_previsao.qry_previsao_CalcFields(DataSet: TDataSet);
begin
  qry_previsao_calc_nr_processo.AsString := Copy( qry_previsao_NR_PROCESSO.AsString, 5, 14 );
end;

procedure Tdatm_previsao.qry_previsao_adicao_BeforeScroll(DataSet: TDataSet);
begin
  Navegando := True;
end;

procedure Tdatm_previsao.qry_previsao_adicao_AfterScroll(DataSet: TDataSet);
begin
  Navegando := False;
  qry_tot_pl_.Close;
  qry_tot_pl_.Open;
  if qry_fund_leg_.Active then
    qry_fund_leg_.Close;
  qry_fund_leg_.ParamByName('CODIGO').AsString := qry_previsao_adicao_CD_FUND_LEG_REGIME.AsString;
  qry_fund_leg_.Open;
end;

procedure Tdatm_previsao.datm_previsaoCreate(Sender: TObject);
begin
  Navegando := False;
  if not tbl_acordo_tarif_.Active then
    tbl_acordo_tarif_.Open; // Incluido para abrir a tabela caso não esteja aberta - Michel - 31/05/2010
  // Incluido para não ficar validando o tempo todo na procedure AtualizaTelaICMSRJ - Michel - 08/03/2010
  PC_Fundo_Pobreza := StrToFloat(ConsultaLookup('TPARAMETROS', '"bla"', 'bla', 'PC_FUNDO_POBREZA_RJ'));
end;

procedure Tdatm_previsao.qry_previsao_BeforeEdit(DataSet: TDataSet);
begin
  frm_previsao.btn_salvar.Enabled := True;
  frm_previsao.btn_cancelar.Enabled := True;
end;

procedure Tdatm_previsao.qry_previsao_AfterScroll(DataSet: TDataSet);
begin
  if qry_previsao_adicao_.State in [ dsInactive ] then
  begin
    qry_previsao_adicao_.Close;
    qry_previsao_adicao_.Prepare;
    qry_previsao_adicao_.Open;
  end;
end;

procedure Tdatm_previsao.qry_previsao_adicao_CD_NCM_SHChange(Sender: TField);
begin
  qry_ncm_.Close;
  qry_ncm_.ParamByName('CODIGO').AsString := qry_previsao_adicao_CD_NCM_SH.AsString;
  qry_ncm_.Prepare;
  qry_ncm_.Open;
  if Not qry_ncm_.Eof then
  begin
    if qry_ncm_ALIQUOTA_II.AsString = 'NT' then
    begin
      qry_previsao_adicao_PC_ALIQ_II.AsFloat := 0;
    end
    else
    begin
      if ( qry_previsao_adicao_PC_ALIQ_II.AsFloat <> qry_ncm_ALIQUOTA_II.AsFloat ) and
         ( ( qry_previsao_adicao_PC_ALIQ_II.IsNull ) or
           ( qry_previsao_adicao_PC_ALIQ_II.AsFloat = 0 ) ) then
      begin
        qry_previsao_adicao_PC_ALIQ_II.AsFloat := qry_ncm_ALIQUOTA_II.AsFloat;
      end;
    end;
    if qry_ncm_ALIQUOTA_IPI.AsString = 'NT' then
    begin
      qry_previsao_adicao_PC_ALIQ_IPI.AsFloat := 0;
    end
    else
    begin
      if ( qry_previsao_adicao_PC_ALIQ_IPI.AsFloat <> qry_ncm_ALIQUOTA_IPI.AsFloat ) and
         ( ( qry_previsao_adicao_PC_ALIQ_IPI.IsNull ) or
           ( qry_previsao_adicao_PC_ALIQ_IPI.AsFloat = 0 ) ) then
      begin
        qry_previsao_adicao_PC_ALIQ_IPI.AsFloat := qry_ncm_ALIQUOTA_IPI.AsFloat;
      end;
    end;
  end;
// PIS/COFINS
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT * FROM TNCM');
    SQL.Add(Format('WHERE CODIGO = ''%s''',[qry_previsao_adicao_CD_NCM_SH.AsString]));
    Open;
    if not IsEmpty then
    begin
      qry_previsao_adicao_ALIQ_COFINS.AsFloat := FieldByName('ALIQUOTA_COFINS_ADVAL').AsFloat;
      qry_previsao_adicao_ALIQ_PIS.AsFloat    := FieldByName('ALIQUOTA_PIS_ADVAL').AsFloat;
    end;
    Free;
  end;
end;

procedure Tdatm_previsao.qry_previsao_AfterDelete(DataSet: TDataSet);
begin
  qry_previsao_.ApplyUpdates; 
end;

procedure Tdatm_previsao.qry_previsao_adicao_AfterDelete(
  DataSet: TDataSet);
begin
  qry_previsao_adicao_.ApplyUpdates;
end;

procedure Tdatm_previsao.qry_previsao_despesa_AfterDelete(
  DataSet: TDataSet);
begin
  qry_previsao_despesa_.ApplyUpdates;
end;

procedure Tdatm_previsao.qry_previsao_despesa_AfterPost(DataSet: TDataSet);
begin
  qry_previsao_despesa_.ApplyUpdates;
end;

procedure Tdatm_previsao.tbl_di_volumes_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_previsao.tbl_di_volumes_BeforeDelete(DataSet: TDataSet);
begin
  if not BoxMensagem('Confirma exclusão?', 1) then
    Abort;
end;

procedure Tdatm_previsao.tbl_di_volumes_BeforeEdit(DataSet: TDataSet);
begin
//  VerificaEstado(True);
end;

procedure Tdatm_previsao.tbl_di_volumes_BeforeInsert(DataSet: TDataSet);
begin
//  VerificaEstado(True);
end;

procedure Tdatm_previsao.tbl_di_volumes_BeforePost(DataSet: TDataSet);
begin
  if tbl_di_volumes_CD_TIPO_EMBALAGEM.AsString = '' then
  begin
    BoxMensagem('Informe a embalagem do volume!', 2);
    Abort;
  end;
  if tbl_di_volumes_.State in [dsInsert] then
  begin
    tbl_di_volumes_NR_PROCESSO.AsString   := Frm_Previsao.Msk_cd_unid_neg.text + '01' + Frm_previsao.Msk_Nr_Processo.text;
    tbl_di_volumes_NR_SEQUENCIA.AsInteger := Sequencia( '11', tbl_di_volumes_NR_PROCESSO.AsString );
  end;
end;

procedure Tdatm_previsao.qry_previsao_AfterClose(DataSet: TDataSet);
begin              
  frm_previsao.btn_trans_DI.Enabled := False;
end;

function Tdatm_previsao.DoubeIndex(ADoubleArray: array of Double; AValue: Double): Integer;
begin
  Result := 0;
  if High(ADoubleArray) >= 0 then
    while (Result <= High(ADoubleArray)) and (ADoubleArray[Result] <> AValue) do
      Inc(Result);
  if Result > High(ADoubleArray) then
    Result := -1;
end;

procedure Tdatm_previsao.qry_previsao_adicao_PC_ALIQ_ICMSChange(Sender: TField);
begin
  if in_RJ and (qry_previsao_adicao_CD_TRIBUTACAO_ICMS.AsString = '1') then
  begin
    if qry_previsao_adicao_.Active and (qry_previsao_adicao_.State in [dsEdit, dsInsert]) then
    begin
      if DoubeIndex(AliquotasSemFundo, qry_previsao_adicao_PC_ALIQ_ICMS.AsFloat) >= 0 then
        qry_previsao_adicao_IN_FUNDO_POBREZA.AsString := '0'
      else
        qry_previsao_adicao_IN_FUNDO_POBREZA.AsString := '1';
    end;
  end
  else if qry_previsao_adicao_IN_FUNDO_POBREZA.AsString <> '0' then
    qry_previsao_adicao_IN_FUNDO_POBREZA.AsString := '0';
end;

procedure Tdatm_previsao.qry_previsao_adicao_PC_ALIQ_ICMS_REDChange(Sender: TField);
begin
  if in_RJ and (qry_previsao_adicao_CD_TRIBUTACAO_ICMS.AsString = '1') then
  begin
    if qry_previsao_adicao_.Active and (qry_previsao_adicao_.State in [dsEdit, dsInsert]) then
    begin
      if DoubeIndex(AliquotasSemFundo, qry_previsao_adicao_PC_ALIQ_ICMS_RED.AsFloat) >= 0 then
        qry_previsao_adicao_IN_FUNDO_POBREZA.AsString := '0'
      else
        qry_previsao_adicao_IN_FUNDO_POBREZA.AsString := '1';
    end;
  end
  else if qry_previsao_adicao_IN_FUNDO_POBREZA.AsString <> '0' then
    qry_previsao_adicao_IN_FUNDO_POBREZA.AsString := '0';
end;

procedure Tdatm_previsao.qry_previsao_adicao_CD_REG_TRIB_IIChange(Sender: TField);
begin
  if ((qry_previsao_adicao_CD_REG_TRIB_II.AsString <> '5') or (qry_previsao_adicao_CD_FUND_LEG_REGIME.AsString <> '37')) and qry_previsao_adicao_IN_SUSPENDE_II_RETIFIC.AsBoolean then
  begin
    if not (qry_previsao_adicao_.State in [dsEdit, dsInsert]) then
      qry_previsao_adicao_.Edit;
    qry_previsao_adicao_IN_SUSPENDE_II_RETIFIC.AsBoolean := False;
  end;

  if ((not qry_previsao_adicao_IN_SUSPENDE_II_RETIFIC.AsBoolean) or (qry_previsao_adicao_CD_REG_TRIB_IPI.AsString <> '5')) and qry_previsao_adicao_IN_SUSPENDE_IPI_RETIFIC.AsBoolean then
  begin
    if not (qry_previsao_adicao_.State in [dsEdit, dsInsert]) then
      qry_previsao_adicao_.Edit;
    qry_previsao_adicao_IN_SUSPENDE_IPI_RETIFIC.AsBoolean := False;
  end;

  if ((not qry_previsao_adicao_IN_SUSPENDE_II_RETIFIC.AsBoolean) or (qry_previsao_adicao_CD_TIPO_BENEF_PIS_COFINS.AsString <> '4')) and qry_previsao_adicao_IN_SUSPENDE_PIS_COFINS_RETIFIC.AsBoolean then
  begin
    if not (qry_previsao_adicao_.State in [dsEdit, dsInsert]) then
      qry_previsao_adicao_.Edit;
    qry_previsao_adicao_IN_SUSPENDE_PIS_COFINS_RETIFIC.AsBoolean := False;
  end;
end;

procedure Tdatm_previsao.qry_previsao_adicao_CD_FABRICANTEChange(Sender: TField);
begin
  //Monta um consulta lookup na TEMPRESA_EST onde o CD_EMPRESA seja = qry_previsao_adicao_CD_FABRICANTE.AsString
  //e retorna o CD_PAIS
  //FERNANDA 11/01/12
   qry_previsao_adicao_CD_PAIS_FABRICANTE.AsString := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', qry_previsao_adicao_CD_FABRICANTE.AsString, 'CD_PAIS');
   // pegando o cd_pais_fabricante que foi criado na qry_previsao_adicao e igualando ao cp_pais da tabela TEMPRESA(CD_EMPRESA COM O CD_FABRICANTE)
  end;
procedure Tdatm_previsao.qry_previsao_adicao_AfterOpen(DataSet: TDataSet);
begin
  with frm_previsao do
  begin
//    if AnsiIndexText(Copy(qry_previsao_adicao_NR_PROCESSO.AsString, 5, 2), ['IE', 'IN']) >= 0 then
//      lblICMS_AFRMM.Visible := False
//    else
    lblICMS_AFRMM.Visible := ConsultaLookUPSQL(' SELECT ISNULL(E.IN_MARINHA_MERCANTE_ICMS, G.IN_MARINHA_MERCANTE_ICMS) AS IN_MARINHA_MERCANTE_ICMS ' +
                                               ' FROM TPROCESSO                 P ' +
                                               '    INNER JOIN TGRUPO           G ON G.CD_GRUPO = P.CD_GRUPO ' +
                                               '    INNER JOIN VW_SERVICO_GERAL S ON S.CD_SERVICO = P.CD_SERVICO ' +
                                               '    INNER JOIN TEMPRESA_NAC     E ON E.CD_EMPRESA = P.CD_CLIENTE ' +
                                               ' WHERE P.NR_PROCESSO = ' + QuotedStr(qry_previsao_adicao_NR_PROCESSO.AsString), 'IN_MARINHA_MERCANTE_ICMS') = '1';
    dbedtICMS_AFRMM.Visible := lblICMS_AFRMM.Visible;
  end;
end;

procedure Tdatm_previsao.ds_previsaoStateChange(Sender: TObject);
begin
  frm_previsao.AtualizaBotoes;
end;

end.
