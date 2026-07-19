unit PGLI005;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, DBIProcs;

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
    qry_inst_financ_: TQuery;
    qry_inst_financ_CODIGO: TStringField;
    qry_inst_financ_DESCRICAO: TStringField;
    qry_li_NR_PROCESSO_SISCOMEX: TStringField;
    qry_li_TP_ACORDO_ALADI: TStringField;
    ds_anuentes: TDataSource;
    qry_anuentes_: TQuery;
    qry_anuentes_NR_PROCESSO: TStringField;
    qry_anuentes_ORGAO: TStringField;
    qry_anuentes_PROCESSO: TStringField;
    qry_anuentes_CGC: TStringField;
    qry_anuentes_LOOK_ORGAO: TStringField;
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
    qry_fund_legal_: TQuery;
    qry_li_LookFundLegal: TStringField;
    qry_emp_nac_: TQuery;
    qry_reg_trib_: TQuery;
    qry_mod_pagto_: TQuery;
    qry_motivo_: TQuery;
    qry_agencia_secex_: TQuery;
    qry_aladi_: TQuery;
    qry_li_LookRegTrib: TStringField;
    qry_li_LookAgSecex: TStringField;
    qry_li_LookALADI: TStringField;
    qry_li_LookModPagto: TStringField;
    qry_li_LookInstFinanc: TStringField;
    qry_li_LookMotivo: TStringField;
    qry_li_LookMoedaMLE: TStringField;
    qry_li_LookMoedaFrete: TStringField;
    qry_li_LookMoedaSeguro: TStringField;
    qry_li_LookMoedaFob: TStringField;
    qry_ult_ref_cli_: TQuery;
    qry_ult_ref_cli_ULTIMO: TStringField;
    qry_orgao_anuentes_: TQuery;
    qry_tp_acordo_tarif_: TQuery;
    ds_tp_acordo_tarif: TDataSource;
    procedure qry_ref_cli_BeforePost(DataSet: TDataSet);
    procedure qry_ref_cli_AfterPost(DataSet: TDataSet);
    procedure qry_li_BeforeEdit(DataSet: TDataSet);
    procedure VerificaEstado(Habilita : Boolean);
    procedure qry_li_BeforeInsert(DataSet: TDataSet);
    procedure qry_li_AfterScroll(DataSet: TDataSet);
    procedure qry_anuentes_BeforePost(DataSet: TDataSet);
    procedure qry_anuentes_AfterPost(DataSet: TDataSet);
    procedure qry_anuentes_BeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_LI_Capa: Tdatm_LI_Capa;

implementation

{$R *.DFM}
uses GSMLIB, PGGP001, PGGP017, PGDI001, PGDI003, PGLI001;
//uses pggp001, PGLI001, GSMLIB;

procedure Tdatm_LI_Capa.qry_ref_cli_BeforePost(DataSet: TDataSet);
begin
  qry_ref_cli_NR_PROCESSO.AsString  := str_nr_processo;
  qry_ref_cli_NR_SEQUENCIA.AsString := UltCod( qry_ult_ref_cli_, qry_ult_ref_cli_ULTIMO );
end;

procedure Tdatm_LI_Capa.qry_ref_cli_AfterPost(DataSet: TDataSet);
begin
  qry_ref_cli_.Close;
  qry_ref_cli_.Prepare;
  qry_ref_cli_.Open;
  qry_ref_cli_.Last;
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

procedure Tdatm_LI_Capa.qry_li_AfterScroll(DataSet: TDataSet);
begin
  with frm_LI_capa do
  begin
    if qry_li_.FieldByName('CD_REGIME_TRIBUTACAO').AsString <> '' then
    begin
      ValidaRegime( StrToInt( qry_li_.FieldByName('CD_REGIME_TRIBUTACAO').AsString ) );

      if ( qry_li_.FieldByName('CD_REGIME_TRIBUTACAO').AsString = '5' ) and
         ( qry_li_.FieldByName('CD_FUND_LEGAL').AsString = '16' ) then
      begin
        dbedt_cd_agencia_secex.Enabled  := True;
        dbedt_cd_agencia_secex.Color    := clWindow;
        dbedt_cd_agencia_secex.Readonly := False;
        dbedt_cd_numero_ato.Enabled     := True;
        dbedt_cd_numero_ato.Color       := clWindow;
        dbedt_cd_numero_ato.Readonly    := False;
      end
      else
      begin
        dbedt_cd_agencia_secex.Enabled  := False;
        dbedt_cd_agencia_secex.Color    := clMenu;
        dbedt_cd_agencia_secex.Readonly := True;
        dbedt_cd_numero_ato.Enabled     := False;
        dbedt_cd_numero_ato.Color       := clMenu;
        dbedt_cd_numero_ato.Readonly    := True;
      end;
    end;
  end;
end;

procedure Tdatm_LI_Capa.qry_anuentes_BeforePost(DataSet: TDataSet);
begin
  qry_anuentes_.FieldByName('NR_PROCESSO').AsString := qry_li_.FieldByName('NR_PROCESSO').AsString; 
end;

procedure Tdatm_LI_Capa.qry_anuentes_AfterPost(DataSet: TDataSet);
begin
  qry_anuentes_.Close;
  qry_anuentes_.Prepare;
  qry_anuentes_.Open;
  qry_anuentes_.Last;
end;

procedure Tdatm_LI_Capa.qry_anuentes_BeforeDelete(DataSet: TDataSet);
begin
//  Abort;
//  if Not BoxMensagem('Confirma exclusão?', 1) then Abort;
end;







end.
