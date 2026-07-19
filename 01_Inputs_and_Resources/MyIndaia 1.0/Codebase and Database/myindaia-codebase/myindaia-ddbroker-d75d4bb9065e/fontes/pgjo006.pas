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
    qry_li_itens_CD_MERCADORIA: TStringField;
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
    tbl_mercadoria_: TTable;
    tbl_mercadoria_CD_MERCADORIA: TStringField;
    tbl_mercadoria_NM_MERCADORIA: TMemoField;
    tbl_mercadoria_AP_MERCADORIA: TStringField;
    tbl_mercadoria_VL_UNITARIO: TFloatField;
    tbl_mercadoria_CD_NCM_SH: TStringField;
    tbl_mercadoria_CD_NALADI_SH: TStringField;
    tbl_mercadoria_CD_NALADI_NCCA: TStringField;
    tbl_mercadoria_PL_MERCADORIA: TFloatField;
    tbl_mercadoria_CD_EXPORTADOR: TStringField;
    tbl_mercadoria_CD_PAIS_AQUISICAO: TStringField;
    tbl_mercadoria_CD_PAIS_ORIGEM: TStringField;
    tbl_mercadoria_CD_FABRICANTE: TStringField;
    tbl_mercadoria_CD_IMPORTADOR: TStringField;
    tbl_mercadoria_CD_GRUPO: TStringField;
    tbl_mercadoria_CD_FABR_EXPO: TStringField;
    tbl_mercadoria_CD_TIPO_CALCULO: TStringField;
    tbl_mercadoria_CD_UN_MED_COMERC: TStringField;
    ds_mercadoria: TDataSource;
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
    tbl_empresa_nac_CD_BANCO_IMPOSTOS: TStringField;
    tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField;
    tbl_empresa_nac_CD_SDA: TStringField;
    tbl_empresa_nac_NR_CAE: TStringField;
    tbl_empresa_nac_CD_GRUPO: TStringField;
    ds_empresa_nac: TDataSource;
    qry_li_itens_NR_DESTAQUE_NCM: TStringField;
    qry_li_itens_CD_PAIS_PROCEDENCIA: TStringField;
    qry_li_TP_ACORDO_ALADI: TStringField;
    qry_li_NR_PROCESSO_SISCOMEX: TStringField;
    qry_li_itens_LookMercadoria: TStringField;
    ds_empresa_est: TDataSource;
    tbl_empresa_est_: TTable;
    tbl_empresa_est_CD_EMPRESA: TStringField;
    tbl_empresa_est_NM_EMPRESA: TStringField;
    tbl_empresa_est_AP_EMPRESA: TStringField;
    tbl_empresa_est_END_EMPRESA: TStringField;
    tbl_empresa_est_END_NUMERO: TStringField;
    tbl_empresa_est_END_COMPL: TStringField;
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
    qry_unid_medida_CODIGO: TStringField;
    qry_unid_medida_DESCRICAO: TStringField;
    qry_li_itens_CD_UN_MED_COMERC: TStringField;
    qry_li_itens_CD_UN_MED_ESTAT: TStringField;
    qry_li_itens_LookUnidMedida: TStringField;
    sp_li_apaga_renum_itens: TStoredProc;
    procedure qry_li_itens_BeforeEdit(DataSet: TDataSet);
    procedure qry_li_itens_BeforeInsert(DataSet: TDataSet);

  private
    procedure VerificaEstado(Habilita : Boolean);

  public
    { Public declarations }
  end;

var
  datm_LI_Itens: Tdatm_LI_Itens;

implementation

uses pgli003, gsmlib;

{$R *.DFM}

procedure Tdatm_LI_Itens.VerificaEstado(Habilita : Boolean);
begin
  frm_LI_itens.btn_novo_item.Enabled  := not Habilita;
  frm_LI_itens.mi_novo_item.Enabled   := not Habilita;
  frm_LI_itens.btn_salvar.Enabled     := Habilita;
  frm_LI_itens.mi_salvar.Enabled      := Habilita;
  frm_LI_itens.btn_cancelar.Enabled   := Habilita;
  frm_LI_itens.mi_cancelar.Enabled    := Habilita;

end;

procedure Tdatm_LI_Itens.qry_li_itens_BeforeEdit(DataSet: TDataSet);
begin
   VerificaEstado( True );
end;

procedure Tdatm_LI_Itens.qry_li_itens_BeforeInsert(DataSet: TDataSet);
begin
   VerificaEstado( True );
end;

end.
