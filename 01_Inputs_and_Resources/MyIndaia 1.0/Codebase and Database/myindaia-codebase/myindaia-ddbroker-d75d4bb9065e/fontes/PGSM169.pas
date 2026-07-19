unit PGSM169;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Grids, Db, DBGrids, ComCtrls, Menus, DBCtrls, Buttons,
  ExtCtrls, DBTables;

type
  Tdatm_ct_contabil = class(TDataModule)
    ds_ct_contabil: TDataSource;
    qry_ct_contabil_: TQuery;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    ds_ct_contabil_gerencial: TDataSource;
    qry_ct_contabil_gerencial_: TQuery;
    ds_ct_gerencial: TDataSource;
    qry_ct_gerencial_: TQuery;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_IN_DISTRIBUI: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_GRAU: TStringField;
    qry_ct_contabil_CD_IDENTIFICADOR: TStringField;
    qry_ct_contabil_LookDistribui: TStringField;
    qry_ct_gerencial_CD_CT_GERENCIAL: TStringField;
    qry_ct_gerencial_NM_CT_GERENCIAL: TStringField;
    qry_ct_contabil_gerencial_CD_CT_GERENCIAL: TStringField;
    qry_ct_contabil_gerencial_LookCtContabil: TStringField;
    ds_tp_indicador: TDataSource;
    qry_tp_indicador_: TQuery;
    qry_tp_indicador_TP_INDICADOR: TStringField;
    qry_tp_indicador_NM_INDICADOR: TStringField;
    qry_ct_contabil_LookIndicador: TStringField;
    sp_exclui_conta_contabil: TStoredProc;
    qry_acesso_aux_: TQuery;
    qry_acesso_aux_TOT: TIntegerField;
    qry_arv_: TQuery;
    qry_arv_NM_CT_CONTABIL: TStringField;
    qry_graus_: TQuery;
    qry_graus_NR_GRAUS: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    qry_ct_pai_: TQuery;
    qry_ct_pai_CD_GRAU: TStringField;
    qry_arv_CalcCtContabilPai: TStringField;
    qry_arv_CalcCtContabil: TStringField;
    qry_ct_contabil_gerencial_LookCtGerencial: TStringField;
    qry_ct_contabil_gerencial_VL_PORCENTAGEM: TFloatField;
    qry_soma_ct_gerencial_: TQuery;
    qry_soma_ct_gerencial_SOMA: TFloatField;
    qry_ct_contabil_IN_EMBARQUE: TStringField;
    qry_ct_contabil_IN_CONTABILIZA: TStringField;
    ds_meses: TDataSource;
    qry_meses_: TQuery;
    qry_meses_CD_MES: TStringField;
    qry_meses_NM_MES: TStringField;
    qry_ct_contabil_gerencial_CD_ANO: TStringField;
    qry_ct_contabil_gerencial_CD_MES: TStringField;
    qry_ct_contabil_gerencial_LookMes: TStringField;
    qry_por_mes_ano_: TQuery;
    qry_por_mes_ano_PERIODO: TStringField;
    qry_ct_contabil_IN_REEMBOLSO: TStringField;
    qry_ct_contabil_LookReembolso: TStringField;
    sp_si_digito: TStoredProc;
    qry_ct_contabil_CD_RATEIO: TStringField;
    qry_arv_CD_CT_CONTABIL: TStringField;
    qry_arv_CD_CT_CONTABIL_PAI: TStringField;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_gerencial_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_CT_CONTABIL_PAI: TStringField;
    qry_ct_contabil_CD_CT_CONTABIL_FLUXO: TStringField;
    qry_ct_contabil_ANO_CONTA: TStringField;
    qry_ct_contabil_IN_FLUXO_CAIXA_BANCO: TStringField;
    qry_ct_contabil_IN_FLUXO_CAIXA_FLUXO: TStringField;
    qry_contabil_novo: TQuery;
    qry_contabil_novoTX_OLD: TStringField;
    qry_contabil_novoTX_NEW: TStringField;
    ds_contabil_novo: TDataSource;
    procedure qry_ct_contabil_AfterScroll(DataSet: TDataSet);
    procedure qry_ct_contabil_gerencial_AfterDelete(DataSet: TDataSet);
    procedure qry_arv_CalcFields(DataSet: TDataSet);
    procedure qry_ct_contabil_BeforePost(DataSet: TDataSet);
    procedure qry_ct_contabil_AfterInsert(DataSet: TDataSet);
    procedure qry_ct_contabil_BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Nr_Ordem : Integer;
    { Public declarations }
  end;

var
  datm_ct_contabil: Tdatm_ct_contabil;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGSM168, DateUtils;

procedure Tdatm_ct_contabil.qry_ct_contabil_AfterScroll(DataSet: TDataSet);
begin
  with qry_ct_contabil_gerencial_ do
  begin
    Close;
    ParamByName('CD_CT_CONTABIL').AsString := qry_ct_contabil_CD_CT_CONTABIL.AsString;
    Prepare;
    Open;
  end;
end;

procedure Tdatm_ct_contabil.qry_ct_contabil_gerencial_AfterDelete(DataSet: TDataSet);
begin
  with frm_ct_contabil do
  begin
    if ( pgctrl_ct_contabil.ActivePage = ts_dados_basicos ) or
       ( pgctrl_ct_contabil.ActivePage = ts_lista ) then
    begin
      dbnvg.DataSource := ds_ct_contabil;
    end
    else
    begin
      dbnvg.DataSource := ds_ct_contabil_gerencial;
    end;
  end;
end;

procedure Tdatm_ct_contabil.qry_arv_CalcFields(DataSet: TDataSet);
begin
//Não existirá mais a máscara - Rodrigo Capra
{  qry_arv_CalcCtContabil.AsString    := Copy( qry_arv_CD_CT_CONTABIL.AsString, 1, 3 ) + '.'+
                                        Copy( qry_arv_CD_CT_CONTABIL.AsString, 4, 2 ) + '.'+
                                        Copy( qry_arv_CD_CT_CONTABIL.AsString, 6, 5 );
   qry_arv_CalcCtContabilPai.AsString := Copy( qry_arv_CD_CT_CONTABIL_PAI.AsString, 1, 3 ) + '.'+
                                        Copy( qry_arv_CD_CT_CONTABIL_PAI.AsString, 4, 2 ) + '.'+
                                        Copy( qry_arv_CD_CT_CONTABIL_PAI.AsString, 6, 5 );}

  qry_arv_CalcCtContabil.AsString    := qry_arv_CD_CT_CONTABIL.AsString;
  qry_arv_CalcCtContabilPai.AsString := qry_arv_CD_CT_CONTABIL_PAI.AsString;

end;

procedure Tdatm_ct_contabil.qry_ct_contabil_BeforePost(DataSet: TDataSet);
begin
//22/01/2008   -   Foi aumentado o tamanho do campo e agora não precisa mais do dígito verificador - Rodrigo

  // Coloca o dígito correto na conta contábil
{  if ( qry_ct_contabil_.State in [dsInsert] ) then
  begin
    CloseStoredProc( sp_si_digito );
    sp_si_digito.ParamByName('@CD_CT_CONTABIL').AsString := frm_ct_contabil.dbedt_cd_ct_contabil.Text;
    ExecStoredProc( sp_si_digito );
    qry_ct_contabil_CD_CT_CONTABIL.AsString :=  Copy( frm_ct_contabil.dbedt_cd_ct_contabil.Text, 1, 9 ) + IntToStr(sp_si_digito.ParamByName('@DIGITO').AsInteger);
    Application.ProcessMessages;
    CloseStoredProc( sp_si_digito );
  end;}
end;

procedure Tdatm_ct_contabil.qry_ct_contabil_AfterInsert(DataSet: TDataSet);
begin
  qry_ct_contabil_ANO_CONTA.AsString := IntToStr(YearOf(now));
end;

procedure Tdatm_ct_contabil.qry_ct_contabil_BeforeOpen(DataSet: TDataSet);
begin
  qry_ct_contabil_.ParamByName('ANO_CONTA').AsInteger := YearOf(dt_server);
end;

end.
