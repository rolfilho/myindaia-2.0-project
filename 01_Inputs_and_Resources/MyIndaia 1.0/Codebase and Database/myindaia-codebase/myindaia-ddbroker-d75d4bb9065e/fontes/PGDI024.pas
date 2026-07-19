unit PGDI024;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_icms_online = class(TDataModule)
    qry_lista_processos_: TQuery;
    ds_lista_processos: TDataSource;
    qry_lista_processos_NR_PROCESSO: TStringField;
    qry_lista_processos_CD_IMPORTADOR: TStringField;
    qry_lista_processos_AP_EMPRESA: TStringField;
    qry_lista_processos_DT_IMPRESSAO: TDateTimeField;
    qry_lista_processos_IN_IMPRESSAO: TStringField;
    qry_lista_processos_VL_BASE_CALC_ICMS: TFloatField;
    qry_lista_processos_IN_REB: TStringField;
    qry_lista_processos_VL_TOTAL_MLE_MN: TFloatField;
    qry_lista_processos_VL_TOTAL_FRETE_MN: TFloatField;
    qry_lista_processos_VL_TOTAL_SEG_MN: TFloatField;
    qry_lista_processos_VL_TOTAL_II: TFloatField;
    qry_lista_processos_VL_TOTAL_IPI: TFloatField;
    qry_lista_processos_VL_TOTAL_AD: TFloatField;
    qry_lista_processos_VL_TOT_ICMS: TFloatField;
    qry_lista_processos_NM_LOCAL_DESP: TStringField;
    qry_lista_processos_CD_UF_ARM: TStringField;
    qry_lista_processos_UF_UNID_NEG: TStringField;
    qry_lista_processos_VL_CIF_MN: TFloatField;
    qry_lista_processos_calc_NR_PROCESSO: TStringField;
    qry_lista_processos_IN_ICMS_IMPRESSO: TStringField;
    qry_lista_processos_calc_STATUS: TStringField;
    qry_unid_neg_: TQuery;
    qry_icms_bloqueado_: TQuery;
    qry_icms_bloqueado_NR_PROCESSO: TStringField;
    qry_icms_bloqueado_IN_BLOQUEADO: TStringField;
    sp_atz_evento: TStoredProc;
    qry_di_imp_: TQuery;
    qry_di_imp_NR_PROCESSO: TStringField;
    qry_di_imp_IN_ICMS_IMPRESSO: TStringField;
    qry_di_imp_DT_ICMS_IMPRESSO: TDateTimeField;
    qry_di_imp_IN_EXON_IMPRESSO: TStringField;
    qry_di_imp_DT_EXON_IMPRESSO: TDateTimeField;
    qry_di_imp_IN_EMBUT_FRT_ITENS: TBooleanField;
    qry_di_imp_IN_EMBUT_SEG_ITENS: TBooleanField;
    qry_despachante_: TQuery;
    qry_despachante_AP_DESPACHANTE: TStringField;
    qry_despachante_CD_DESPACHANTE: TStringField;
    qry_despachante_NM_DESPACHANTE: TStringField;
    qry_despachante_CPF_DESPACHANTE: TStringField;
    qry_usuario_: TQuery;
    qry_lista_processos_IN_EXON_IMPRESSO: TStringField;
    qry_processos_cat63_exoneracao_: TQuery;
    qry_processos_cat63_icms_: TQuery;
    ds_processos_cat63_exoneracao: TDataSource;
    ds_processos_cat63_icms: TDataSource;
    qry_processos_cat63_exoneracao_NR_PROCESSO: TStringField;
    qry_processos_cat63_exoneracao_END_UF: TStringField;
    qry_processos_cat63_exoneracao_CD_IMPORTADOR: TStringField;
    qry_processos_cat63_exoneracao_AP_EMPRESA: TStringField;
    qry_processos_cat63_exoneracao_VL_BASE_CALC_ICMS: TFloatField;
    qry_processos_cat63_icms_NR_PROCESSO: TStringField;
    qry_processos_cat63_icms_END_UF: TStringField;
    qry_processos_cat63_icms_CD_IMPORTADOR: TStringField;
    qry_processos_cat63_icms_AP_EMPRESA: TStringField;
    qry_processos_cat63_icms_VL_BASE_CALC_ICMS: TFloatField;
    qry_processos_cat63_icms_IN_ICMS_IMPRESSO: TStringField;
    qry_processos_cat63_icms_IN_EXON_IMPRESSO: TStringField;
    qry_processos_cat63_exoneracao_IN_ICMS_IMPRESSO: TStringField;
    qry_processos_cat63_exoneracao_IN_EXON_IMPRESSO: TStringField;
    qry_processos_cat63_exoneracao_calc_status: TStringField;
    qry_processos_cat63_icms_calc_status: TStringField;
    qry_lista_processos_VL_TAXA_SISCOMEX: TFloatField;
    qry_lista_processos_VL_TOT_PIS_COFINS: TFloatField;
    qry_lista_processos_VL_PIS: TFloatField;
    qry_lista_processos_VL_COFINS: TFloatField;
    qry_lista_processos_VL_ICMS_A_RECOLHER_AFRMM: TFloatField;
    qry_processos_cat63_exoneracao_VALOR_ICMS: TFloatField;
    qry_processos_cat63_icms_VALOR_ICMS: TFloatField;
    qry_lista_processos_VL_ICMS_A_RECOLHER: TFloatField;
    qry_lista_processos_UF_CLIENTE: TStringField;
    qry_lista_processos_UF_DESPACHO: TStringField;
    qry_processos_cat63_exoneracao_IN_EXONERACAO: TStringField;
    qry_processos_cat63_exoneracao_IN_ICMS_EMITIDO: TStringField;
    qry_processos_cat63_icms_IN_EXONERACAO: TStringField;
    qry_processos_cat63_icms_IN_ICMS_EMITIDO: TStringField;
    qry_lista_processos_VL_BASE_CALC_ICMS_FUNDO: TFloatField;
    qry_Consulta_DI_ICMS: TQuery;
    qry_uf_icms_online: TQuery;
    procedure qry_lista_processos_CalcFields(DataSet: TDataSet);
    procedure qry_processos_cat63_icms_CalcFields(DataSet: TDataSet);
    procedure qry_processos_cat63_exoneracao_CalcFields(DataSet: TDataSet);
    procedure qry_lista_processos_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_icms_online: Tdatm_icms_online;

implementation

uses PGDI023, ConsOnlineEx;

{$R *.DFM}

procedure Tdatm_icms_online.qry_lista_processos_CalcFields(DataSet: TDataSet);
begin
  qry_lista_processos_.FieldByName('Calc_NR_PROCESSO').AsString := Trim(Copy(qry_lista_processos_.FieldByName('NR_PROCESSO').AsString, 5, 14));
  qry_lista_processos_.FieldByName('Calc_STATUS').AsString      := '';
  if frm_icms_online.combo_tipo_icms.ItemIndex = 2 then
  begin
    if ( qry_lista_processos_.FieldByName('IN_EXON_IMPRESSO').AsString = '1' ) then
      qry_lista_processos_.FieldByName('Calc_STATUS').AsString    := 'ü'
    else if ( qry_lista_processos_.FieldByName('IN_EXON_IMPRESSO').AsString = '2' ) then
      qry_lista_processos_.FieldByName('Calc_STATUS').AsString    := '2';
  end else begin
    if ( qry_lista_processos_.FieldByName('IN_ICMS_IMPRESSO').AsString = '1' ) then
      qry_lista_processos_.FieldByName('Calc_STATUS').AsString    := 'ü'
    else if ( qry_lista_processos_.FieldByName('IN_ICMS_IMPRESSO').AsString = '2' ) then
      qry_lista_processos_.FieldByName('Calc_STATUS').AsString    := '2';
  end;
end;

procedure Tdatm_icms_online.qry_processos_cat63_icms_CalcFields(
  DataSet: TDataSet);
begin
//  qry_processos_cat63_icms_.FieldByName('Calc_NR_PROCESSO').AsString := Copy( qry_processos_cat63_icms_.FieldByName('NR_PROCESSO').AsString, 5, 10 );
  qry_processos_cat63_icms_Calc_STATUS.AsString      := '';
  if ( qry_processos_cat63_icms_IN_ICMS_EMITIDO.AsString = '1' ) then
    qry_processos_cat63_icms_Calc_STATUS.AsString    := 'ü'
  else if ( qry_processos_cat63_icms_IN_ICMS_EMITIDO.AsString = '2' ) then
    qry_processos_cat63_icms_Calc_STATUS.AsString    := '2';
end;                                                       

procedure Tdatm_icms_online.qry_processos_cat63_exoneracao_CalcFields(
  DataSet: TDataSet);
begin
//  qry_processos_cat63_exoneracao_.FieldByName('Calc_NR_PROCESSO').AsString := Copy( qry_processos_cat63_exoneracao_.FieldByName('NR_PROCESSO').AsString, 5, 10 );
  qry_processos_cat63_exoneracao_Calc_STATUS.AsString      := '';
  if ( qry_processos_cat63_exoneracao_IN_EXONERACAO.AsString = '1' ) then
    qry_processos_cat63_exoneracao_Calc_STATUS.AsString    := 'ü'
  else if ( qry_processos_cat63_exoneracao_IN_EXONERACAO.AsString = '2' ) then
    qry_processos_cat63_exoneracao_Calc_STATUS.AsString    := '2';
end;

procedure Tdatm_icms_online.qry_lista_processos_AfterScroll(DataSet: TDataSet);
begin
  // As comparações abaixo foram feitas em 19/12/2008 por Michel com base nas regras abaixo
  {  CLIENTE      DESP      GERAR   IMPRIMIR
      = SP        = SP        -       Sim
      = RJ        = RJ     Darj+FP     -
      = SP        = RJ        -       Sim
      = RJ        = SP        FP      Sim
     <> RJ SP    <> RJ SP     -       Sim   }
  with frm_icms_online do
  begin
    if combo_tipo_icms.ItemIndex < 2 then // GARE e GNRE
    begin
      // Só não exibe imprimir se Cliente for RJ e Despacho também for RJ
      btn_imprimir.Visible      := (qry_lista_processos_UF_CLIENTE.AsString <> 'RJ');// and (qry_lista_processos_UF_DESPACHO.AsString <> 'RJ');
      // Só exibe Gerar se o Cliente for RJ (agora também para URF RJ - Michel - 03/05/2012)
      BtnGerar.Visible          := (qry_lista_processos_UF_CLIENTE.AsString = 'RJ');// or (qry_lista_processos_UF_DESPACHO.AsString = 'RJ');
      // Habilita o botão de acordo com a regra para o botão btn_imprimir
      mi_imprimir.Enabled       := btn_imprimir.Visible;

      // Não estão mais sendo utilizados os menus abaixo - Michel - 03/05/2012
      {
      // Para os menus abaixo não é necessário comparar o Cliente com RJ. Pois, só serão exibidos pelo BtnGerar que só exibido nessa condição - Michel - 19/12/2008
      // Exibe ICMS Importação apenas quando Cliente for RJ e Despacho também for RJ
      mnuICMSImportacao.Enabled := (qry_lista_processos_UF_DESPACHO.AsString = 'RJ');
      // Exibr Fundo de Combate apenas se Cliente for RJ e Despacho for RJ ou SP
      mnuFundodeCombate.Enabled := //((qry_lista_processos_UF_DESPACHO.AsString = 'RJ') or (qry_lista_processos_UF_DESPACHO.AsString = 'SP')) and // Comentado para fazer para qualquer URF de Despacho - Michel - 13/10/2010
         (ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                            ' FROM TADICAO_DE_IMPORTACAO ' +
                            ' WHERE NR_PROCESSO = ' + QuotedStr(qry_lista_processos_NR_PROCESSO.AsString) +
                            '   AND ISNULL(IN_FUNDO_POBREZA, ''0'') = ''1''', 'QTD') <> '0');
      }
    end       
    else
    begin
      BtnGerar.Visible          := False;
      mi_imprimir.Enabled       := True;
      btn_imprimir.Visible      := True;
    end;
  end;

end;


end.   


