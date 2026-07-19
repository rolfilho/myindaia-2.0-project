unit PGLI005;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, DBIProcs;

type
  Tdatm_LI_Capa = class(TDataModule)
    ds_li: TDataSource;
    qry_li_: TQuery;
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
    qry_li_DT_PROCESSO_LI: TDateTimeField;
    qry_li_DT_REGISTRO_LI: TDateTimeField;
    qry_li_QT_TOTAL_PES_LIQ: TFloatField;
    qry_li_QT_MED_ESTATISTICA: TFloatField;
    qry_li_TP_CAMBIO: TStringField;
    qry_li_TX_INFO_COMPLEMENTAR: TMemoField;
    qry_li_VL_FRETE_MOEDA: TFloatField;
    qry_li_VL_SEGURO_MOEDA: TFloatField;
    qry_li_VL_DESPESA_MOEDA: TFloatField;
    qry_li_VL_DESCONTO_MOEDA: TFloatField;
    qry_ref_cli_: TQuery;
    qry_ref_cli_NR_PROCESSO: TStringField;
    qry_ref_cli_NR_SEQUENCIA: TStringField;
    qry_ref_cli_CD_REFERENCIA: TStringField;
    qry_li_CD_MOEDA_MLE: TStringField;
    qry_li_CD_TIPO_IMPORTADOR: TStringField;
    qry_li_CD_SERVICO: TStringField;
    qry_li_QT_DIAS_COBERTURA: TIntegerField;
    qry_li_VL_TOTAL_MOEDA: TFloatField;
    ds_taxa_cambio: TDataSource;
    tbl_taxa_cambio_: TTable;
    tbl_taxa_cambio_Codigo: TStringField;
    tbl_taxa_cambio_Descricao: TStringField;
    tbl_taxa_cambio_Taxa_Conversao: TStringField;
    tbl_taxa_cambio_Vigencia_Inicio_Taxa: TStringField;
    tbl_taxa_cambio_Vigencia_Fim_Taxa: TStringField;
    ds_ref_cli_: TDataSource;
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
    tbl_empresa_nac_CD_BANCO_IMPOSTOS: TStringField;
    tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField;
    tbl_empresa_nac_CD_SDA: TStringField;
    ds_empresa_nac: TDataSource;
    ds_fund_legal_reg_trib: TDataSource;
    tbl_reg_trib_: TTable;
    ds_reg_trib: TDataSource;
    ds_mod_pagto: TDataSource;
    tbl_mod_pagto_: TTable;
    tbl_mod_pagto_CODIGO: TStringField;
    tbl_mod_pagto_DESCRICAO: TStringField;
    tbl_motivo_: TTable;
    tbl_motivo_CODIGO: TStringField;
    tbl_motivo_DESCRICAO: TStringField;
    ds_motivo: TDataSource;
    qry_inst_financ_: TQuery;
    ds_inst_financ_: TDataSource;
    tbl_reg_trib_CODIGO: TStringField;
    tbl_reg_trib_DESCRICAO: TStringField;
    ds_agencia_secex: TDataSource;
    tbl_agencia_secex_: TTable;
    tbl_agencia_secex_CODIGO: TStringField;
    tbl_agencia_secex_DESCRICAO: TStringField;
    tbl_agencia_secex_CGC_SECEX: TStringField;
    tbl_fund_legal_reg_trib_: TTable;
    tbl_fund_legal_reg_trib_Codigo: TStringField;
    tbl_fund_legal_reg_trib_Descricao: TStringField;
    ds_ttp_fund_legal: TDataSource;
    tbl_ttp_fund_legal_: TTable;
    tbl_ttp_fund_legal_CD_REGIME_TRIB: TStringField;
    tbl_ttp_fund_legal_CD_FUND_LEGAL: TStringField;
    qry_inst_financ_CODIGO: TStringField;
    qry_inst_financ_DESCRICAO: TStringField;
    tbl_ttp_acordo_tarif_: TTable;
    ds_ttp_acordo_tarif: TDataSource;
    tbl_ttp_acordo_tarif_CD_TIPO_ACORDO_TAR: TStringField;
    tbl_ttp_acordo_tarif_DESCRICAO: TStringField;
    qry_li_NR_PROCESSO_SISCOMEX: TStringField;
    qry_li_TP_ACORDO_ALADI: TStringField;
    ds_orgao_anuente: TDataSource;
    tbl_orgao_anuente_: TTable;
    tbl_orgao_anuente_CODIGO: TStringField;
    tbl_orgao_anuente_DESCRICAO: TStringField;
    tbl_orgao_anuente_CGC: TStringField;
    ds_anuentes: TDataSource;
    qry_anuentes_: TQuery;
    qry_anuentes_NR_PROCESSO: TStringField;
    qry_anuentes_ORGAO: TStringField;
    qry_anuentes_PROCESSO: TStringField;
    qry_anuentes_CGC: TStringField;
    qry_anuentes_LOOK_ORGAO: TStringField;
    ds_aladi: TDataSource;
    tbl_aladi_: TTable;
    tbl_aladi_CODIGO: TStringField;
    tbl_aladi_DESCRICAO: TStringField;
    qry_li_LookImportador: TStringField;
    qry_pais_: TQuery;
    qry_li_LookPaisProc: TStringField;
    qry_urf_: TQuery;
    qry_li_IN_MONTADA: TStringField;
    qry_li_LookURFEntrada: TStringField;
    qry_li_LookURFDespacho: TStringField;
    qry_incoterm_: TQuery;
    qry_moeda_: TQuery;
    qry_li_LookIncoterm: TStringField;
    qry_li_LookMoeda: TStringField;
    procedure qry_ref_cli_BeforePost(DataSet: TDataSet);
    procedure qry_ref_cli_AfterPost(DataSet: TDataSet);
    procedure qry_li_BeforeEdit(DataSet: TDataSet);
    procedure VerificaEstado(Habilita : Boolean);
    procedure qry_li_BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_LI_Capa: Tdatm_LI_Capa;

implementation

{$R *.DFM}
uses pggp001, PGLI001, gsmlib;


procedure Tdatm_LI_Capa.qry_ref_cli_BeforePost(DataSet: TDataSet);
begin
    qry_ref_cli_NR_PROCESSO.AsString  := str_nr_processo;
    qry_ref_cli_NR_SEQUENCIA.AsString := fStrZero( InttoStr(qry_ref_cli_.recordcount + 1 ), 2 );
end;

procedure Tdatm_LI_Capa.qry_ref_cli_AfterPost(DataSet: TDataSet);
begin
    qry_ref_cli_.Close;
    qry_ref_cli_.Open;

end;

procedure Tdatm_LI_Capa.VerificaEstado(Habilita : Boolean);
begin
  frm_LI_capa.btn_salvar.Enabled   := Habilita;
  frm_LI_capa.btn_cancelar.Enabled := Habilita;
  frm_LI_capa.mi_salvar.Enabled    := Habilita;
  frm_LI_capa.mi_cancelar.Enabled  := Habilita;
end;

procedure Tdatm_LI_Capa.qry_li_BeforeEdit(DataSet: TDataSet);
begin
   VerificaEstado( True );
end;

procedure Tdatm_LI_Capa.qry_li_BeforeInsert(DataSet: TDataSet);
begin
   VerificaEstado( True );
end;




end.
