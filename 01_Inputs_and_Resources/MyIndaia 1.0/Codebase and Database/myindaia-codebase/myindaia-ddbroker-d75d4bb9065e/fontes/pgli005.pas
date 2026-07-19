unit PGLI005;

interface
          
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Funcoes;

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
    qry_li_NR_PROCESSO_SISCOMEX: TStringField;
    qry_li_TP_ACORDO_ALADI: TStringField;
    ds_anuentes: TDataSource;
    qry_anuentes_: TQuery;
    qry_anuentes_NR_PROCESSO: TStringField;
    qry_anuentes_ORGAO: TStringField;
    qry_anuentes_PROCESSO: TStringField;
    qry_anuentes_CGC: TStringField;
    qry_anuentes_look_orgao: TStringField;
    qry_li_IN_MONTADA: TStringField;
    qry_orgao_anuentes_: TQuery;
    qry_tp_acordo_tarif_: TQuery;
    ds_tp_acordo_tarif: TDataSource;
    sp_li_exclui: TStoredProc;
    qry_li_QT_TOTAL_ITEM: TStringField;
    sp_li_monta_li: TStoredProc;
    qry_li_CD_PAIS_PROCEDENCIA: TStringField;
    qry_anuentes_CalcCodNomeOrgao: TStringField;
    qry_li_NR_LI_SUBSTITUIDO: TStringField;
    qry_li_calc_nr_proc: TStringField;
    qry_ref_cli_NR_ITEM_PO: TStringField;
    sp_li_calculo: TStoredProc;
    qry_fund_legal_: TQuery;
    qry_li_IN_EMBUT_FRT_ITENS: TStringField;
    qry_li_DT_TRANSMISSAO: TDateTimeField;
    qry_li_NR_IDENT_TRANSMISSAO: TIntegerField;
    SqlAuxiliar: TQuery;
    qry_li_ENQ_MAT_USADO: TIntegerField;
    qry_li_OP_NACIONALIZACAO: TStringField;
    qry_li_VL_FRETE_MOEDA_MERC: TFloatField;
    procedure qry_li_BeforeEdit(DataSet: TDataSet);
    procedure qry_li_BeforeInsert(DataSet: TDataSet);
    procedure qry_li_AfterScroll(DataSet: TDataSet);
    procedure qry_anuentes_BeforePost(DataSet: TDataSet);
    procedure qry_anuentes_AfterPost(DataSet: TDataSet);
    procedure qry_anuentes_BeforeDelete(DataSet: TDataSet);
    procedure qry_anuentes_CalcFields(DataSet: TDataSet);
    procedure qry_li_CalcFields(DataSet: TDataSet);
    procedure qry_li_CD_MOEDA_FOBChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_LI_Capa: Tdatm_LI_Capa;

implementation

{$R *.DFM}
uses GSMLIB, PGGP001, PGGP017, PGLI001;

procedure Tdatm_LI_Capa.qry_li_BeforeEdit(DataSet: TDataSet);
begin
   frm_LI_capa.btn_mi(True, True, False, False, False, True);
end;

procedure Tdatm_LI_Capa.qry_li_BeforeInsert(DataSet: TDataSet);
begin
   frm_LI_capa.btn_mi(True, True, False, False, False, True);
end;

procedure Tdatm_LI_Capa.qry_li_AfterScroll(DataSet: TDataSet);
begin
{  with frm_LI_capa do
  begin
    if qry_li_.FieldByName('CD_REGIME_TRIBUTACAO').AsString <> '' then
    begin
      ValidaRegime( StrToInt( qry_li_.FieldByName('CD_REGIME_TRIBUTACAO').AsString ) );

      if ( ( qry_li_.FieldByName('CD_REGIME_TRIBUTACAO').AsString = '3' ) or
           ( qry_li_.FieldByName('CD_REGIME_TRIBUTACAO').AsString = '5' ) ) and
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
  end;}
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

procedure Tdatm_LI_Capa.qry_anuentes_CalcFields(DataSet: TDataSet);
begin
  qry_anuentes_CalcCodNomeOrgao.AsString := Trim( qry_anuentes_ORGAO.AsString ) + ' - ' +
                                            Trim( qry_anuentes_LOOK_ORGAO.AsString );
end;

procedure Tdatm_LI_Capa.qry_li_CalcFields(DataSet: TDataSet);
begin
  qry_li_calc_nr_proc.AsString := Copy( qry_li_NR_PROCESSO.AsString, 5, 14 );
end;

procedure Tdatm_LI_Capa.qry_li_CD_MOEDA_FOBChange(Sender: TField);
begin
  // O que for diferente é o outro campo, se for diferente. Assim utilizo um único evento para os dois campos - Michel - 21/09/2011
  if qry_li_CD_MOEDA_MLE.AsString <> Sender.AsString then
    qry_li_CD_MOEDA_MLE.AsString := Sender.AsString
  else if qry_li_CD_MOEDA_FOB.AsString <> Sender.AsString then
    qry_li_CD_MOEDA_FOB.AsString := Sender.AsString;
end;

end.
