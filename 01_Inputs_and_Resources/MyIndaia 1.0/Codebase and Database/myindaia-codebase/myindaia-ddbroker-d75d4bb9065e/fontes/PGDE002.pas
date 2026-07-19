(*************************************************************************************************

Sistema: Controle de Demurrage

PROGRAMA: PGDE002.PAS - datm_dem_cntr - Contêineres

AUTOR: Leandro Stipanich

DATA: 15/07/2002

Manutenção: Leandro Stipanich
*************************************************************************************************)
unit PGDE002;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_dem_cntr = class(TDataModule)
    qry_processo_: TQuery;
    ds_processo: TDataSource;
    qry_cntr_: TQuery;
    ds_cntr: TDataSource;
    qry_cntr_NR_CNTR: TStringField;
    qry_cntr_DT_ENT_ARM: TDateTimeField;
    qry_cntr_IN_DESOVA: TStringField;
    qry_cntr_DT_DESOVA: TDateTimeField;
    qry_cntr_IN_DEMURRAGE: TStringField;
    qry_cntr_DT_DEMURRAGE: TDateTimeField;
    qry_cntr_TP_CNTR: TStringField;
    qry_cntr_NR_FREE_TIME: TIntegerField;
    qry_tp_cntr_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_USUARIO: TStringField;
    qry_processo_DT_ABERTURA: TDateTimeField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_CD_REPRESENTANTE: TStringField;
    qry_processo_CD_TRANSP_NAC_DOC: TStringField;
    qry_processo_CD_TRANSP_NAC: TStringField;
    qry_processo_IN_IMP_ARM: TStringField;
    qry_processo_CD_AREA: TStringField;
    qry_processo_TX_MERCADORIA: TMemoField;
    qry_processo_TX_OBSERVACOES: TMemoField;
    qry_processo_CD_RESTRICAO: TStringField;
    qry_processo_CD_LIBERADOR: TStringField;
    qry_processo_DT_LIBERACAO: TDateTimeField;
    qry_processo_IN_ETIQUETA: TStringField;
    qry_processo_LookUnidNeg: TStringField;
    qry_processo_LookProduto: TStringField;
    qry_processo_LookUsuario: TStringField;
    qry_processo_CalcNrProcesso: TStringField;
    qry_processo_LookCliente: TStringField;
    qry_processo_LookServico: TStringField;
    qry_processo_LookRepresentante: TStringField;
    qry_processo_LookViaTransporte: TStringField;
    qry_processo_LookTranspNac: TStringField;
    qry_processo_LookTranspNacDoc: TStringField;
    qry_processo_LookArea: TStringField;
    qry_processo_LookRestricao: TStringField;
    qry_processo_LookLiberador: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_LookServicoAtivo: TStringField;
    qry_processo_CD_DESPACHANTE: TStringField;
    qry_processo_LookDespachante: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    qry_yes_no_: TQuery;
    qry_processo_TX_OBS_INT: TMemoField;
    qry_processo_NR_PRESENCA_CARGA: TStringField;
    qry_processo_DT_PRESENCA_CARGA: TDateTimeField;
    qry_processo_NR_DI: TStringField;
    qry_processo_NR_DA: TStringField;
    qry_processo_NR_PERIODO_ARMAZENAGEM: TIntegerField;
    qry_processo_DT_VENCTO_ARMAZENAGEM: TDateTimeField;
    qry_processo_NR_DDE: TStringField;
    qry_processo_DT_REG_DDE: TDateTimeField;
    qry_cntr_LookDesova: TStringField;
    qry_cntr_LookDemurrage: TStringField;
    qry_cntr_LookTpCntr: TStringField;
    qry_yes_no_CD_YESNO: TStringField;
    qry_yes_no_TX_YESNO: TStringField;
    qry_processo_LookImpArm: TStringField;
    qry_processo_LookEtiqueta: TStringField;
    qry_tp_cntr_TP_CNTR: TStringField;
    qry_tp_cntr_NM_TP_CNTR: TStringField;
    qry_processo_IN_ENTREPOSTO: TStringField;
    qry_processo_LookEntreposto: TStringField;
    qry_processo_NR_PROCESSO_OR_ENTREPOSTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_dt_desova_: TQuery;
    qry_dt_desova_NR_PROCESSO: TStringField;
    qry_dt_desova_DT_DESOVA: TDateTimeField;
    sp_atz_evento: TStoredProc;
    qry_vw_dt_desova_: TQuery;
    qry_vw_dt_desova_NR_PROCESSO: TStringField;
    qry_vw_dt_desova_CD_SERVICO: TStringField;
    qry_vw_dt_desova_DT_REALIZACAO: TDateTimeField;
    qry_dt_ent_: TQuery;
    qry_dt_ent_DT_REALIZACAO: TDateTimeField;
    qry_cntr_NR_PROCESSO: TStringField;
    qry_cntr_DT_ENT: TDateTimeField;
    qry_cntr_TP_DIAS: TStringField;
    qry_cntr_DT_ENTREGA_FABRICA: TDateTimeField;
    qry_cntr_DT_DEVOLUCAO_CNTR: TDateTimeField;
    qry_cntr_CD_STATUS_CNTR: TStringField;
    qry_tp_dias_: TQuery;
    qry_tp_dias_TP_DIAS: TStringField;
    qry_tp_dias_NM_TP_DIAS: TStringField;
    qry_cntr_LookTpDias: TStringField;
    qry_status_cntr_: TQuery;
    qry_status_cntr_CD_STATUS_CNTR: TStringField;
    qry_status_cntr_NM_STATUS_CNTR: TStringField;
    qry_cntr_LookStatusCntr: TStringField;
    qry_dep_: TQuery;
    ds_dep: TDataSource;
    qry_av_lav_: TQuery;
    ds_av_lav: TDataSource;
    qry_dep_NR_PROCESSO: TStringField;
    qry_dep_NR_CNTR: TStringField;
    qry_dep_NR_CHEQUE_CAUCAO: TStringField;
    qry_dep_CD_BANCO_CAUCAO: TStringField;
    qry_dep_DT_EMISSAO_CAUCAO: TDateTimeField;
    qry_dep_VL_DEPOSITO: TFloatField;
    qry_dep_TX_DEPOSITO: TFloatField;
    qry_dep_VL_CHEQUE_CAUCAO: TFloatField;
    qry_dep_IN_DEPOSITADO: TStringField;
    qry_dep_IN_DEVOLVIDO: TStringField;
    qry_av_lav_NR_PROCESSO: TStringField;
    qry_av_lav_NR_CNTR: TStringField;
    qry_av_lav_IN_AVARIA: TStringField;
    qry_av_lav_TX_OBS_AVARIA: TMemoField;
    qry_av_lav_VL_AVARIA: TFloatField;
    qry_av_lav_IN_LAVAGEM: TStringField;
    qry_av_lav_VL_LAVAGEM: TFloatField;
    qry_banco_: TQuery;
    qry_dep_LookBanco: TStringField;
    qry_dep_LookApBanco: TStringField;
    qry_dep_LookDepositado: TStringField;
    qry_dep_LookDevolvido: TStringField;
    qry_av_lav_LookAvaria: TStringField;
    qry_av_lav_LookLavagem: TStringField;
    qry_cntr_CalcDiasCorridos: TFloatField;
    qry_cntr_IN_DEPOSITADO: TStringField;
    qry_cntr_IN_DEVOLVIDO: TStringField;
    qry_cntr_IN_AVARIA: TStringField;
    qry_cntr_IN_LAVAGEM: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_cntr_CalcDiasCobrar: TFloatField;
    qry_cntr_DT_CARREGAMENTO: TDateTimeField;
    qry_cntr_DT_RET_CNTR_FABRICA: TDateTimeField;
    qry_cntr_DT_ENTRADA_PATIO_TRANSP: TDateTimeField;
    sp_calc_dias_cntr: TStoredProc;
    sp_calc_dt_demurrage: TStoredProc;
    qry_dt_nf_transp_: TQuery;
    DateTimeField1: TDateTimeField;
    ds_nf_transp: TDataSource;
    qry_fat_: TQuery;
    qry_fat_CD_UNID_NEG: TStringField;
    qry_fat_NR_FATURA: TStringField;
    qry_fat_NR_CNTR: TStringField;
    qry_fat_NR_PROCESSO: TStringField;
    qry_fat_NR_DIAS_COBRADOS: TSmallintField;
    qry_fat_CD_MOEDA_FATURA: TStringField;
    qry_fat_TX_FATURA: TFloatField;
    qry_fat_VL_DIARIA: TFloatField;
    qry_fat_VL_FATURA_MNEG: TFloatField;
    qry_fat_VL_FATURA_MN: TFloatField;
    qry_fat_VL_DESCONTO: TFloatField;
    qry_fat_VL_DEPOSITO: TFloatField;
    qry_fat_VL_TOTAL: TFloatField;
    qry_fat_DT_INICIO: TDateTimeField;
    qry_fat_DT_FIM: TDateTimeField;
    qry_fat_DT_VENCIMENTO: TDateTimeField;
    qry_fat_DT_PAGAMENTO: TDateTimeField;
    qry_fat_DT_FATURA: TDateTimeField;
    qry_fat_IN_PARCIAL: TStringField;
    qry_fat_IN_RECIBO: TStringField;
    qry_fat_IN_FATURADO: TStringField;
    qry_fat_NR_SOLIC_PAGTO: TStringField;
    qry_fat_LookMoeda: TStringField;
    qry_fat_LookParcial: TStringField;
    qry_fat_LookRecibo: TStringField;
    qry_fat_LookFaturado: TStringField;
    qry_fat_LookNrCheque: TStringField;
    qry_fat_CalcNrProcesso: TStringField;
    qry_fat_CalcDiasCobrar: TIntegerField;
    qry_fat_CalcDiasCorridos: TIntegerField;
    qry_fat_CalcVlTotal: TFloatField;
    ds_tp_dias: TDataSource;
    sp_repassa_tp_dias: TStoredProc;
    qry_cntr_IN_MESQUITA: TStringField;
    qry_transp_: TQuery;
    ds_transp: TDataSource;
    qry_transp_AP_TRANSP_ROD: TStringField;
    procedure qry_processo_AfterOpen(DataSet: TDataSet);
    procedure qry_rel_processo_BeforeOpen(DataSet: TDataSet);
    procedure qry_processo_CalcFields(DataSet: TDataSet);
    procedure qry_processo_AfterScroll(DataSet: TDataSet);
    procedure qry_cntr_PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qry_cntr_DT_DESOVAChange(Sender: TField);
    procedure qry_cntr_AfterCancel(DataSet: TDataSet);
    procedure qry_cntr_CalcFields(DataSet: TDataSet);
    procedure qry_dep_CalcFields(DataSet: TDataSet);
    procedure qry_cntr_AfterOpen(DataSet: TDataSet);
    procedure qry_cntr_AfterClose(DataSet: TDataSet);
    procedure qry_cntr_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_dem_cntr: Tdatm_dem_cntr;

implementation

uses GSMLIB, PGGP001, PGGP017, PGDE001;

{$R *.DFM}

procedure Tdatm_dem_cntr.qry_processo_AfterOpen(DataSet: TDataSet);
begin
  Screen.Cursor:=crDefault;

  with frm_dem_cntr do
  begin
    qry_cntr_.Close;
    qry_cntr_.Prepare;
    qry_cntr_.Open;
    VerCntr;
  end;
end;

procedure Tdatm_dem_cntr.qry_rel_processo_BeforeOpen(DataSet: TDataSet);
begin
  Screen.Cursor:=crHourGlass;
end;

procedure Tdatm_dem_cntr.qry_processo_CalcFields(DataSet: TDataSet);
begin
  {Processo}
  qry_processo_CalcNrProcesso.AsString := Copy( qry_processo_NR_PROCESSO.AsString, 5, 14 );
  {Unidade de Negócio}
  qry_processo_LookUnidNeg.AsString := Lookup( qry_unid_neg_, qry_processo_CD_UNID_NEG, 'CD_UNID_NEG', 'AP_UNID_NEG' );
  {Produto}
  qry_processo_LookProduto.AsString := Lookup( qry_produto_, qry_processo_CD_PRODUTO, 'CD_PRODUTO', 'AP_PRODUTO' );
end;

procedure Tdatm_dem_cntr.qry_processo_AfterScroll(DataSet: TDataSet);
begin
  with frm_dem_cntr do
  begin
    qry_cntr_.Close;
    qry_cntr_.Prepare;
    qry_cntr_.Open;

    VerCntr;

    if ( qry_processo_IN_LIBERADO.AsString = '0' ) or
       ( qry_processo_IN_CANCELADO.AsString = '1' ) then
    begin
      if ( qry_processo_IN_CANCELADO.AsString = '1' ) then
        BoxMensagem('Este processo está cancelado!', 2)
      else
        if ( qry_processo_IN_LIBERADO.AsString = '0' ) then
          BoxMensagem('Este processo não está liberado!', 2);
      ts_cntr.Enabled                       := False;
    end
    else
    begin
      ts_cntr.Enabled                       := True;
    end;

    if ( pgctrl_dem_cntr.ActivePage = ts_cntr ) then
       btn_mi( st_incluir, False, False, st_excluir )
    else
       btn_mi( False, False, False, False );

  end;
end;

procedure Tdatm_dem_cntr.qry_cntr_PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   TrataErro(E);
end;

procedure Tdatm_dem_cntr.qry_cntr_DT_DESOVAChange(Sender: TField);
begin
  qry_dt_desova_.Close;
  qry_dt_desova_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
  qry_dt_desova_.Open;
  if Not qry_dt_desova_.EOF then
  begin
    CloseStoredProc( sp_atz_evento );
    sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := qry_processo_NR_PROCESSO.AsString;
    sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_DESOVA';
    if qry_dt_desova_DT_DESOVA.IsNull then
      sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := qry_cntr_DT_DESOVA.AsDateTime
    else
    begin
      if qry_dt_desova_DT_DESOVA.AsDateTime > qry_cntr_DT_DESOVA.AsDateTime then
         sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := qry_dt_desova_DT_DESOVA.AsDateTime
      else
         sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := qry_cntr_DT_DESOVA.AsDateTime;
    end;
    ExecStoredProc( sp_atz_evento );
    CloseStoredProc( sp_atz_evento );
  end;
end;

procedure Tdatm_dem_cntr.qry_cntr_AfterCancel(DataSet: TDataSet);
begin
  qry_vw_dt_desova_.Close;
  qry_vw_dt_desova_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
  qry_vw_dt_desova_.Prepare;
  qry_vw_dt_desova_.Open;
  if Not qry_vw_dt_desova_.EOF then
  begin
    qry_dt_desova_.Close;
    qry_dt_desova_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
    qry_dt_desova_.Open;
    if Not qry_dt_desova_.EOF then
    begin
      if qry_vw_dt_desova_DT_REALIZACAO.AsDateTime > qry_dt_desova_DT_DESOVA.AsDateTime then
      begin
        CloseStoredProc( sp_atz_evento );
        sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := qry_processo_NR_PROCESSO.AsString;
        sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_DESOVA';
        sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := qry_dt_desova_DT_DESOVA.AsDateTime;
        ExecStoredProc( sp_atz_evento );
        CloseStoredProc( sp_atz_evento );
      end;
    end;
  end;
  qry_vw_dt_desova_.Close;
  qry_dt_desova_.Close;
end;

procedure Tdatm_dem_cntr.qry_cntr_CalcFields(DataSet: TDataSet);
begin
  if qry_cntr_IN_DEMURRAGE.AsString = '0' then
  begin
    qry_cntr_CalcDiasCorridos.AsFloat := 0;
    qry_cntr_CalcDiasCobrar.AsFloat   := 0;
  end
  else
  begin
    CloseStoredProc( sp_calc_dias_cntr );
    sp_calc_dias_cntr.ParamByName('@nr_processo').AsString := qry_cntr_NR_PROCESSO.AsString;
    sp_calc_dias_cntr.ParamByName('@nr_cntr').AsString     := qry_cntr_NR_CNTR.AsString;
    ExecStoredProc( sp_calc_dias_cntr );
    qry_cntr_CalcDiasCorridos.AsInteger := sp_calc_dias_cntr.ParamByName('@nr_dias_corridos').AsInteger;
    qry_cntr_CalcDiasCobrar.AsInteger   := sp_calc_dias_cntr.ParamByName('@nr_dias_cobrar').AsInteger;
    CloseStoredProc( sp_calc_dias_cntr );
  end;
  {Cores}
  if qry_cntr_CalcDiasCorridos.AsInteger <= qry_cntr_NR_FREE_TIME.AsInteger then
    frm_dem_cntr.dbedt_dt_dias_corridos.Font.Color := clGreen
  else
    frm_dem_cntr.dbedt_dt_dias_corridos.Font.Color := clRed;
  {Status}
//  if qry_cntr_DT_DEVOLUCAO_CNTR.AsString <> '' then
//    qry_cntr_CD_STATUS_CNTR.AsString := ''

end;

procedure Tdatm_dem_cntr.qry_dep_CalcFields(DataSet: TDataSet);
begin
  {Banco}
  qry_dep_LookBanco.AsString   := Lookup( qry_banco_, qry_dep_CD_BANCO_CAUCAO, 'CD_BANCO', 'NM_BANCO' );
  qry_dep_LookApBanco.AsString := Lookup( qry_banco_, qry_dep_CD_BANCO_CAUCAO, 'CD_BANCO', 'AP_BANCO' );
end;

procedure Tdatm_dem_cntr.qry_cntr_AfterOpen(DataSet: TDataSet);
begin
  qry_dt_nf_transp_.Close;
  qry_dt_nf_transp_.ParamByName('NR_PROCESSO').AsString := Trim( qry_cntr_NR_PROCESSO.AsString );
  qry_dt_nf_transp_.Prepare;
  qry_dt_nf_transp_.Open;
end;

procedure Tdatm_dem_cntr.qry_cntr_AfterClose(DataSet: TDataSet);
begin
  qry_dt_nf_transp_.Close;
end;

procedure Tdatm_dem_cntr.qry_cntr_AfterScroll(DataSet: TDataSet);
begin
  frm_dem_cntr.VerCntr;

   frm_dem_cntr.DtCarregAnt := qry_cntr_DT_CARREGAMENTO.AsString;
   frm_dem_cntr.DtEntrFabrAnt := qry_cntr_DT_ENTREGA_FABRICA.AsString;
   frm_dem_cntr.DtRetCntrAnt := qry_cntr_DT_RET_CNTR_FABRICA.AsString;
   frm_dem_cntr.DtEntrPatio := qry_cntr_DT_ENTRADA_PATIO_TRANSP.AsString;
   frm_dem_cntr.DtDevolucao := qry_cntr_DT_DEVOLUCAO_CNTR.AsString;

 {  if (qry_cntr_IN_MESQUITA.AsString = '1') then
     frm_dem_cntr.lbl_Dt_Mesquita.Visible := True
   else
     frm_dem_cntr.lbl_Dt_Mesquita.Visible := False;}
end;



end.
