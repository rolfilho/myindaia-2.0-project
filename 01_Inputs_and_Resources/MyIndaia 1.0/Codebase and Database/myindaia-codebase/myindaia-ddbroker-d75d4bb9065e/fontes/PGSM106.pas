unit PGSM106;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables,GSMLIB;

type
  Tdatm_transportador_itl = class(TDataModule)
    ds_transp_itl: TDataSource;
    qry_transp_itl_: TQuery;
    qry_transp_itl_CODIGO: TStringField;
    qry_transp_itl_DESCRICAO: TStringField;
    qry_transp_itl_APELIDO: TStringField;
    qry_transp_itl_CD_PAIS: TStringField;
    qry_ult_cod_: TQuery;
    qry_ult_cod_ULTIMO: TStringField;
    qry_transp_itl_CD_IATA_CIA_TRANSP: TStringField;
    qry_transp_itl_END_CIA_TRANSP: TStringField;
    qry_transp_itl_END_COMPL_CIA_TRANSP: TStringField;
    qry_transp_itl_NM_HOME_PAGE_CIA_TRANSP: TStringField;
    qry_transp_itl_CD_CIDADE: TStringField;
    qry_transp_itl_CEP_END_VIA_TRANSP: TStringField;
    qry_transp_itl_PERC_COMISSAO_CIA_TRANSP: TFloatField;
    qry_transp_itl_SIGLA_CIA_TRANSP: TStringField;
    qry_serie_conhec_: TQuery;
    ds_serie_conec: TDataSource;
    qry_ult_serie_: TQuery;
    qry_serie_conhec_CODIGO: TStringField;
    qry_serie_conhec_DT_ABERTURA: TDateTimeField;
    qry_serie_conhec_CONHEC_INICIAL: TStringField;
    qry_serie_conhec_CONHEC_FINAL: TStringField;
    qry_serie_conhec_IN_INCLUSAO: TStringField;
    qry_serie_conhec_IN_IATA: TStringField;
    qry_serie_conhec_QTDE_CONHEC: TIntegerField;
    qry_transp_itl_NM_PAIS: TStringField;
    qry_transp_itl_NM_CIDADE: TStringField;
    UpDate_transp: TUpdateSQL;
    qry_serie_conhec_CD_SERIE: TStringField;
    UpDate_serie: TUpdateSQL;
    qry_ult_serie_ULTIMO: TStringField;
    qry_serie_conhec_CONHEC_DISP: TIntegerField;
    qry_transp_itl_ST_CALCULO_IATA: TStringField;
    qry_var_iata_: TQuery;
    ds_var_iata: TDataSource;
    qry_var_iata_CD_CAMPO: TStringField;
    qry_var_iata_NM_VARIAVEL: TStringField;
    qry_var_iata_NM_CAMPO: TStringField;
    qry_transp_itl_TP_COMISSAO: TStringField;
    qry_serie_conhec_DIG_INICIAL: TStringField;
    qry_serie_conhec_DIG_FINAL: TStringField;
    qry_transp_itl_TP_TRANSPORTADOR: TStringField;
    qry_notificador_: TQuery;
    qry_notificador_CD_ARMADOR: TStringField;
    qry_notificador_CD_NOTIFICADOR: TStringField;
    qry_notificador_NM_NOTIFICADOR: TStringField;
    qry_notificador_CD_CIDADE: TStringField;
    qry_notificador_NM_CIDADE: TStringField;
    qry_notificador_CD_PAIS: TStringField;
    ds_notificador: TDataSource;
    qry_pesquisa_: TQuery;
    UpDate_notificador: TUpdateSQL;
    qry_navio_: TQuery;
    ds_navio: TDataSource;
    qry_navio_CD_ARMADOR: TStringField;
    qry_navio_CD_BANDEIRA: TStringField;
    qry_navio_CD_VEICULO: TStringField;
    qry_navio_NM_BANDEIRA: TStringField;
    UpDate_navio: TUpdateSQL;
    qry_transp_itl_calc_tp_transportador: TStringField;
    qry_transp_itl_TP_TARIFA: TStringField;
    qry_transp_itl_PERC_TARIFA: TFloatField;
    qry_notificador_END_FONE: TStringField;
    qry_notificador_NM_CONTATO: TStringField;
    qry_transp_itl_VL_DEMURRAGE: TFloatField;
    qry_transp_itl_CD_MOEDA_DEMURRAGE: TStringField;
    qry_transp_itl_DIAS_DEMURRAGE: TIntegerField;
    qry_transp_itl_NM_MOEDA: TStringField;
    qry_navio_NM_EMBARCACAO: TStringField;
    qry_transp_itl_CGC_TRANSPORTADOR: TStringField;
    qry_transp_itl_UF: TStringField;
    qry_transp_itl_NR_ACCOUNT: TStringField;
    qry_transp_itl_IN_IRRF_MIN: TStringField;
    qry_transp_itl_IN_IRRF_FATURA: TStringField;
    qry_ir_fat_: TQuery;
    qry_ir_fat_CD_IR_FAT: TStringField;
    qry_ir_fat_NM_IR_FAT: TStringField;
    qry_yesno_: TQuery;
    qry_yesno_CD_YESNO: TStringField;
    qry_yesno_TX_YESNO: TStringField;
    qry_yesno_IN_YESNO: TBooleanField;
    qry_transp_itl_Look_ir_fatura: TStringField;
    qry_transp_itl_look_ir_min: TStringField;
    qry_transp_itl_TP_FATURA: TStringField;
    qry_transp_itl_IN_CALC_IR_IATA: TStringField;
    qry_transp_itl_IN_CALC_IR_OVER: TStringField;
    qry_transp_itl_calc_in_ir_iata: TStringField;
    qry_transp_itl_calc_in_ir_over: TStringField;
    qry_transp_itl_vl_tt_relatorio: TFloatField;
    qry_transp_itl_TX_OBS: TMemoField;
    qry_transp_itl_IN_CONVERSAO_IATA: TStringField;
    procedure qry_transp_itl_AfterPost(DataSet: TDataSet);
    procedure qry_transp_itl_AfterDelete(DataSet: TDataSet);
    procedure qry_serie_conhec_AfterDelete(DataSet: TDataSet);
    procedure qry_serie_conhec_AfterPost(DataSet: TDataSet);
    procedure qry_serie_conhec_BeforePost(DataSet: TDataSet);
    procedure qry_serie_conhec_IN_IATAChange(Sender: TField);
    procedure qry_transp_itl_AfterScroll(DataSet: TDataSet);
    procedure qry_notificador_AfterDelete(DataSet: TDataSet);
    procedure qry_notificador_AfterPost(DataSet: TDataSet);
    procedure qry_navio_AfterDelete(DataSet: TDataSet);
    procedure qry_navio_AfterPost(DataSet: TDataSet);
    procedure qry_transp_itl_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_transportador_itl: Tdatm_transportador_itl;

implementation

uses PGSM019;

{$R *.DFM}



procedure Tdatm_transportador_itl.qry_transp_itl_AfterPost(
  DataSet: TDataSet);
  var codigo: String;
begin
 qry_transp_itl_.ApplyUpDates;
end;

procedure Tdatm_transportador_itl.qry_transp_itl_AfterDelete(
  DataSet: TDataSet);
begin
qry_transp_itl_.ApplyUpDates;
end;

procedure Tdatm_transportador_itl.qry_serie_conhec_AfterDelete(
  DataSet: TDataSet);
begin
qry_serie_conhec_.ApplyUpDates;
end;

procedure Tdatm_transportador_itl.qry_serie_conhec_AfterPost(
  DataSet: TDataSet);
begin
qry_serie_conhec_.ApplyUpDates;
end;

procedure Tdatm_transportador_itl.qry_serie_conhec_BeforePost(
  DataSet: TDataSet);
begin
  if qry_serie_conhec_.State in [dsinsert] then
    begin
      qry_serie_conhec_CD_SERIE.AsString:=Ultcod(qry_ult_serie_,qry_ult_serie_ULTIMO);
    end;
end;

procedure Tdatm_transportador_itl.qry_serie_conhec_IN_IATAChange(
  Sender: TField);
begin
  if qry_serie_conhec_IN_IATA.AsString ='0' then
    begin
    qry_serie_conhec_CONHEC_INICIAL.Editmask:='!999-9999-9999;1;_';
    qry_serie_conhec_CONHEC_FINAL.Editmask:='!999-9999-9999;1;_';
    end
  else
    begin
     qry_serie_conhec_CONHEC_INICIAL.Editmask:='!999-9999-999;1;_';
     qry_serie_conhec_CONHEC_FINAL.Editmask:='!999-9999-999;1;_';
    end;
end;

procedure Tdatm_transportador_itl.qry_transp_itl_AfterScroll(
  DataSet: TDataSet);
begin



   if qry_transp_itl_TP_TRANSPORTADOR.AsString = '0' then
     begin
      frm_transportador_itl.ts_conhececimentos.TabVisible:=frm_transportador_itl.in_avancado;
      frm_transportador_itl.ts_calculos.TabVisible:=frm_transportador_itl.in_avancado;
      frm_transportador_itl.ts_agencias.TabVisible:=false;
      frm_transportador_itl.dbedt_sigla.visible:=frm_transportador_itl.in_avancado;
      frm_transportador_itl.dbedt_cd_iata.visible:=frm_transportador_itl.in_avancado;
      frm_transportador_itl.lb_sigla_iata.visible:=frm_transportador_itl.in_avancado;
      frm_transportador_itl.lb_sigla.visible:=frm_transportador_itl.in_avancado;
      frm_transportador_itl.pnl_demurrage.visible:=false;
     end;
   if qry_transp_itl_TP_TRANSPORTADOR.AsString = '1' then
     begin
       frm_transportador_itl.ts_conhececimentos.TabVisible:=false;
       frm_transportador_itl.ts_calculos.TabVisible:=false;
       frm_transportador_itl.ts_agencias.TabVisible:=frm_transportador_itl.in_avancado;
       frm_transportador_itl.dbedt_sigla.visible:=false;
       frm_transportador_itl.dbedt_cd_iata.visible:=false;
       frm_transportador_itl.lb_sigla_iata.visible:=false;
       frm_transportador_itl.lb_sigla.visible:=false;
       frm_transportador_itl.pnl_demurrage.visible:=frm_transportador_itl.in_avancado;
     end;
   if qry_transp_itl_TP_TRANSPORTADOR.AsString = '2' then
     begin
       frm_transportador_itl.ts_conhececimentos.TabVisible:=false;
       frm_transportador_itl.ts_calculos.TabVisible:=false;
       frm_transportador_itl.ts_agencias.TabVisible:=false;
       frm_transportador_itl.dbedt_sigla.visible:=false;
       frm_transportador_itl.dbedt_cd_iata.visible:=false;
       frm_transportador_itl.lb_sigla_iata.visible:=false;
       frm_transportador_itl.lb_sigla.visible:=false;
       frm_transportador_itl.pnl_demurrage.visible:=false;
     end;
  frm_transportador_itl.pgtrl_conhecimento.ActivePage :=frm_transportador_itl.ts_lista_conhec;
end;

procedure Tdatm_transportador_itl.qry_notificador_AfterDelete(
  DataSet: TDataSet);
begin
qry_notificador_.ApplyUpdates;
end;

procedure Tdatm_transportador_itl.qry_notificador_AfterPost(
  DataSet: TDataSet);
begin
qry_notificador_.ApplyUpdates;
end;

procedure Tdatm_transportador_itl.qry_navio_AfterDelete(DataSet: TDataSet);
begin
qry_navio_.ApplyUpdates;
end;

procedure Tdatm_transportador_itl.qry_navio_AfterPost(DataSet: TDataSet);
begin
qry_navio_.ApplyUpdates;
end;

procedure Tdatm_transportador_itl.qry_transp_itl_CalcFields(
  DataSet: TDataSet);
begin
    if qry_transp_itl_TP_TRANSPORTADOR.AsString = '0' then
      qry_transp_itl_calc_tp_transportador.AsString:='A';

    if qry_transp_itl_TP_TRANSPORTADOR.AsString = '1' then
      qry_transp_itl_calc_tp_transportador.AsString:='M';

    if qry_transp_itl_TP_TRANSPORTADOR.AsString = '2' then
      qry_transp_itl_calc_tp_transportador.AsString:='T';
end;

end.
