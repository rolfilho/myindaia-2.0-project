unit dAccount;

interface

uses
  Windows, Variants, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables, Math, Inifiles,
  ADODB;

type
  Tdatm_account = class(TDataModule)
    qry_processo_: TQuery;
    ds_processo: TDataSource;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_AGENTE: TStringField;
    qry_processo_NM_CLIENTE: TStringField;
    qry_processo_NM_AGENTE: TStringField;
    qry_processo_NR_HOUSE: TStringField;
    qry_processo_NR_MASTER: TStringField;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_NM_PRODUTO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_traz_default_NM_USUARIO: TStringField;
    qry_pesquisa_: TQuery;
    qry_processo_calc_processo: TStringField;
    qry_processo_VL_PROFIT_HOUSE: TFloatField;
    qry_processo_VL_DIVISAO: TFloatField;
    qry_processo_VL_DESP_BRASIL: TFloatField;
    qry_processo_VL_DESP_MASTER: TFloatField;
    qry_processo_VL_DESP_AG: TFloatField;
    qry_processo_VL_PROFIT_BRASIL: TFloatField;
    qry_processo_VL_PROFIT_AGENTE: TFloatField;
    UpDate_Proc: TUpdateSQL;
    qry_processo_IN_ACCOUNT: TStringField;
    qry_fatura_ag_: TQuery;
    qry_fatura_ag_NR_PROCESSO: TStringField;
    qry_fatura_ag_NR_FATURA: TStringField;
    qry_fatura_ag_TP_FATURA: TStringField;
    qry_fatura_ag_IN_FATURA: TStringField;
    qry_fatura_ag_DT_FATURA: TDateTimeField;
    qry_fatura_ag_VL_FATURA: TFloatField;
    ds_fatura_ag: TDataSource;
    UpDAte_fat_ag: TUpdateSQL;
    qry_processo_calc_status: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_RESTRICAO: TStringField;
    qry_processo_CD_ORIGEM: TStringField;
    qry_processo_CD_DESTINO: TStringField;
    qry_processo_CD_MOEDA_FRETE: TStringField;
    qry_processo_AP_MOEDA: TStringField;
    qry_processo_NM_ORIGEM: TStringField;
    qry_processo_NM_DESTINO: TStringField;
    qry_processo_IN_SELECIONADO: TStringField;
    qry_processo_VL_ACCOUNT: TFloatField;
    qry_processo_CD_MASTER: TStringField;
    qry_tp_fatura_: TQuery;
    qry_tp_fatura_CD_FATURA: TStringField;
    qry_tp_fatura_NM_FATURA: TStringField;
    qry_fatura_ag_Look_tp_fatura: TStringField;
    qry_processo_calc_recebido: TStringField;
    qry_processo_DT_RECEBIMENTO: TDateTimeField;
    qry_fatura_ag_VL_CRE_AGENTE: TFloatField;
    qry_fatura_ag_VL_DEB_AGENTE: TFloatField;
    qry_fatura_ag_VL_CRE_BRASIL: TFloatField;
    qry_fatura_ag_VL_DEB_BRASIL: TFloatField;
    qry_fatura_ag_VL_AJUSTE: TFloatField;
    qry_fatura_ag_calc_vl_fatura: TFloatField;
    qry_processo_CD_VIA_TRANSPORTE: TStringField;
    qry_master_: TQuery;
    qry_master_CD_MASTER: TStringField;
    qry_master_CD_UNID_NEG: TStringField;
    qry_master_CD_PRODUTO: TStringField;
    qry_master_CD_VIA_TRANSP: TStringField;
    qry_master_NR_MASTER: TStringField;
    qry_master_CD_AGENTE: TStringField;
    qry_master_CD_ORIGEM: TStringField;
    qry_master_CD_DESTINO: TStringField;
    qry_master_NM_TRANSPORTADOR: TStringField;
    qry_master_NM_ORIGEM: TStringField;
    qry_master_NM_DESTINO: TStringField;
    qry_master_NM_VIA_TRANSP: TStringField;
    qry_master_NM_AGENTE: TStringField;
    ds_master: TDataSource;
    qry_master_CD_MOEDA: TStringField;
    qry_master_AP_MOEDA: TStringField;
    qry_master_COD_TRANSPORTADOR: TStringField;
    qry_master_fatura_ag_: TQuery;
    qry_master_fatura_ag_CD_MASTER: TStringField;
    qry_master_fatura_ag_CD_FATURA: TStringField;
    qry_master_fatura_ag_NR_FATURA: TStringField;
    qry_master_fatura_ag_TP_FATURA: TStringField;
    qry_master_fatura_ag_IN_FATURA: TStringField;
    qry_master_fatura_ag_DT_FATURA: TDateTimeField;
    qry_master_fatura_ag_VL_FATURA: TFloatField;
    qry_master_fatura_ag_VL_CRE_AGENTE: TFloatField;
    qry_master_fatura_ag_VL_DEB_AGENTE: TFloatField;
    qry_master_fatura_ag_VL_CRE_BRASIL: TFloatField;
    qry_master_fatura_ag_VL_DEB_BRASIL: TFloatField;
    qry_master_fatura_ag_VL_AJUSTE: TFloatField;
    qry_master_fatura_ag_CD_VIA_TRANSP: TStringField;
    qry_master_fatura_ag_CD_MOEDA: TStringField;
    qry_master_fatura_ag_CD_AGENTE: TStringField;
    ds_master_fat_ag: TDataSource;
    qry_master_fatura_ag_Look_tp_fatura: TStringField;
    qry_master_fatura_ag_calc_vl_fatura: TFloatField;
    qry_master_VL_ACCOUNT: TFloatField;
    sp_calculo_fatura_master: TStoredProc;
    Update_Master: TUpdateSQL;
    qry_master_IN_ACCOUNT: TStringField;
    sp_aprova_fat_master: TStoredProc;
    UpdateMaster_fat: TUpdateSQL;
    qry_master_calc_status: TStringField;
    sp_contabiliza_Fat_itl_master1: TADOStoredProc;
    qry_fatura_itl_: TQuery;
    qry_master_TP_PRODUTO: TStringField;
    sp_contabiliza_fat: TStoredProc;
    qry_master_DT_CHEGADA: TDateTimeField;
    qry_master_DT_EMISSAO_DTA: TDateTimeField;
    qry_master_DT_EMBARQUE: TDateTimeField;
    qry_master_fatura_ag_CD_STATUS: TStringField;
    qry_master_fatura_ag_CD_USUARIO_CANC: TStringField;
    qry_master_fatura_ag_DT_CANCELADO: TDateTimeField;
    qry_master_fatura_ag_DT_CONTABILIZACAO: TDateTimeField;
    sp_contabiliza_Fat_itl_master: TStoredProc;
    procedure qry_processo_CalcFields(DataSet: TDataSet);
    procedure qry_processo_AfterScroll(DataSet: TDataSet);
    procedure qry_processo_AfterPost(DataSet: TDataSet);
    procedure qry_fatura_ag_AfterPost(DataSet: TDataSet);
    procedure qry_fatura_ag_AfterDelete(DataSet: TDataSet);
    procedure qry_fatura_ag_BeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qry_fatura_ag_VL_FATURAChange(Sender: TField);
    procedure qry_fatura_ag_AfterScroll(DataSet: TDataSet);
    procedure qry_fatura_ag_CalcFields(DataSet: TDataSet);
    procedure qry_master_AfterScroll(DataSet: TDataSet);
    procedure qry_master_fatura_ag_AfterScroll(DataSet: TDataSet);
    procedure qry_master_fatura_ag_TP_FATURAChange(Sender: TField);
    procedure qry_master_fatura_ag_BeforePost(DataSet: TDataSet);
    procedure qry_master_fatura_ag_CalcFields(DataSet: TDataSet);
    procedure qry_master_AfterPost(DataSet: TDataSet);
    procedure qry_master_fatura_ag_AfterDelete(DataSet: TDataSet);
    procedure qry_master_fatura_ag_AfterPost(DataSet: TDataSet);
    procedure qry_master_CalcFields(DataSet: TDataSet);
  private

  public
    vl_fatura :real;
    nr_fatura :string;
    procedure exec_sp_conta_fat_itl(master, nr_docto :String; Dt_fat :Tdatetime);
  end;

var
  datm_account :Tdatm_account;
  ctrl_acesso  :Boolean;//variave que controla as rotinas Changes dos campos

implementation

uses GSMLIB, uAccount, PGGP017, PGGP001;

{$R *.DFM}

procedure Tdatm_account.qry_processo_CalcFields(DataSet: TDataSet);
begin
  qry_processo_calc_processo.AsString := copy(qry_processo_NR_PROCESSO.AsString,5,10);
  if qry_processo_IN_ACCOUNT.AsString = '1' then
    qry_processo_calc_status.AsString := 'Aberto';
  if qry_processo_IN_ACCOUNT.AsString = '3' then
    qry_processo_calc_status.AsString := 'OutStading';
  if qry_processo_IN_ACCOUNT.AsString = '4' then
    qry_processo_calc_status.AsString := 'Aprovado';
  if (qry_processo_IN_ACCOUNT.AsString = '7') or (qry_processo_IN_ACCOUNT.AsString = '6')then
    qry_processo_calc_status.AsString := 'Bloqueado';
  if qry_processo_IN_ACCOUNT.AsString = '8' then
    qry_processo_calc_status.AsString := 'P/Master';
  if (qry_processo_DT_RECEBIMENTO.AsString = '') then
    qry_processo_calc_recebido.AsString := 'Não Recebido'
  else
    qry_processo_calc_recebido.AsString := qry_processo_DT_RECEBIMENTO.AsString;
end;

procedure Tdatm_account.qry_processo_AfterScroll(DataSet: TDataSet);
begin
  if qry_processo_VL_ACCOUNT.AsFloat < 0 then
    frm_account.dbedt_vl_account.Font.Color := clRed
  else
    frm_account.dbedt_vl_account.Font.Color := ClBlack;
end;

procedure Tdatm_account.qry_processo_AfterPost(DataSet: TDataSet);
begin
  qry_processo_.ApplyUpdates;
end;

procedure Tdatm_account.qry_fatura_ag_AfterPost(DataSet: TDataSet);
begin
  qry_fatura_ag_.ApplyUpdates;
end;

procedure Tdatm_account.qry_fatura_ag_AfterDelete(DataSet: TDataSet);
begin
  qry_fatura_ag_.ApplyUpdates;
end;

procedure Tdatm_account.qry_fatura_ag_BeforePost(DataSet: TDataSet);
begin
  if qry_fatura_ag_.State in [dsInsert] then
  begin
    qry_fatura_ag_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
    qry_fatura_ag_IN_FATURA.AsString:='0';
  end;
end;

procedure Tdatm_account.DataModuleCreate(Sender: TObject);
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName := datm_main.db_broker.DatabaseName;
    Sql.Clear;
    Sql.Add('SELECT VL_FATURA FROM TPARAMETROs');
    Open;
    vl_fatura := Fields[0].AsFloat;
  end;
end;

procedure Tdatm_account.qry_fatura_ag_VL_FATURAChange(Sender: TField);
begin
  qry_fatura_ag_VL_CRE_AGENTE.Asfloat := 0 ;
  qry_fatura_ag_VL_DEB_AGENTE.Asfloat := 0 ;
  qry_fatura_ag_VL_CRE_BRASIL.Asfloat := 0 ;
  qry_fatura_ag_VL_DEB_BRASIL.Asfloat := 0 ;
  qry_fatura_ag_VL_AJUSTE.Asfloat     := 0 ;
  if (qry_fatura_ag_TP_FATURA.AsString = '4') then
  begin
    if (qry_fatura_ag_VL_FATURA.AsFloat > vl_fatura) or (qry_fatura_ag_VL_FATURA.AsFloat < - vl_fatura) then
    begin
      qry_fatura_ag_.Cancel;
      BoxMensagem('O valor da Fatura para AJUSTE só pode estar dentro do intervalo ' +#13#10+
                  ' configurado no Sistema. No caso +/- '+ formatfloat('0.00',vl_fatura)+'!',2);

    end;
  end;
end;

procedure Tdatm_account.qry_fatura_ag_AfterScroll(DataSet: TDataSet);
begin
  frm_account.valores_fatura(qry_fatura_ag_TP_FATURA.AsString);
end;

procedure Tdatm_account.qry_fatura_ag_CalcFields(DataSet: TDataSet);
begin
  if qry_fatura_ag_TP_FATURA.AsString = '0' then
    qry_fatura_ag_calc_vl_fatura.AsFloat := qry_fatura_ag_VL_CRE_AGENTE.AsFloat;
  if qry_fatura_ag_TP_FATURA.AsString = '1' then
    qry_fatura_ag_calc_vl_fatura.AsFloat := qry_fatura_ag_VL_DEB_AGENTE.AsFloat;
  if qry_fatura_ag_TP_FATURA.AsString = '2' then
    qry_fatura_ag_calc_vl_fatura.AsFloat := qry_fatura_ag_VL_CRE_BRASIL.AsFloat;
  if qry_fatura_ag_TP_FATURA.AsString = '3' then
    qry_fatura_ag_calc_vl_fatura.AsFloat := qry_fatura_ag_VL_DEB_BRASIL.AsFloat;
  if qry_fatura_ag_TP_FATURA.AsString = '4' then
    qry_fatura_ag_calc_vl_fatura.AsFloat := qry_fatura_ag_VL_AJUSTE.AsFloat;
end;

procedure Tdatm_account.qry_master_AfterScroll(DataSet: TDataSet);
begin
  frm_account.pgctrl_proc.ActivePage := frm_account.ts_lista_proc;
  if qry_master_IN_ACCOUNT.AsString = '6' then
    ds_master_fat_ag.AutoEdit := false
  else
    ds_master_fat_ag.AutoEdit := true;
end;

procedure Tdatm_account.qry_master_fatura_ag_AfterScroll(DataSet: TDataSet);
begin
  frm_account.valores_fatura(qry_master_fatura_ag_TP_FATURA.AsString);
  ds_master_fat_ag.AutoEdit := not((qry_master_IN_ACCOUNT.AsString = '2') or (not(qry_master_fatura_ag_DT_CONTABILIZACAO.IsNull) and (in_integracao_contabil = '1')));
  frm_account.lb_Contabililzada.Visible := (not(qry_master_fatura_ag_DT_CONTABILIZACAO.IsNull) and (in_integracao_contabil = '1'));
end;

procedure Tdatm_account.qry_master_fatura_ag_TP_FATURAChange(Sender: TField);
begin
  qry_master_fatura_ag_VL_CRE_AGENTE.Asfloat := 0 ;
  qry_master_fatura_ag_VL_DEB_AGENTE.Asfloat := 0 ;
  qry_master_fatura_ag_VL_CRE_BRASIL.Asfloat := 0 ;
  qry_master_fatura_ag_VL_DEB_BRASIL.Asfloat := 0 ;
  qry_master_fatura_ag_VL_AJUSTE.Asfloat     := 0 ;
end;

procedure Tdatm_account.qry_master_fatura_ag_BeforePost(DataSet: TDataSet);
begin
  if qry_master_fatura_ag_.State in [dsInsert] then
  begin
    with TQuery.Create(Application) do
    begin
      DAtabasename:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT MAX(CD_FATURA) FROM TMASTER_FATURA_AG WHERE CD_MASTER ="'+qry_master_CD_MASTER.AsString+'" ');
      Open;
      if Fields[0].AsString = '' then
      qry_master_fatura_ag_CD_FATURA.AsString := '01'
      else
        qry_master_fatura_ag_CD_FATURA.AsString := formatfloat('00',strtofloat(Fields[0].AsString)+ 1);
    end;
    qry_master_fatura_ag_CD_MASTER.AsString := qry_master_CD_MASTER.AsString;
    qry_master_fatura_ag_IN_FATURA.AsString := '0';
  end;
end;

procedure Tdatm_account.qry_master_fatura_ag_CalcFields(DataSet: TDataSet);
begin
  if qry_master_fatura_ag_TP_FATURA.AsString = '0' then
    qry_master_fatura_ag_calc_vl_fatura.AsFloat := qry_master_fatura_ag_VL_CRE_AGENTE.AsFloat;
  if qry_master_fatura_ag_TP_FATURA.AsString = '1' then
    qry_master_fatura_ag_calc_vl_fatura.AsFloat := qry_master_fatura_ag_VL_DEB_AGENTE.AsFloat;
  if qry_master_fatura_ag_TP_FATURA.AsString = '2' then
    qry_master_fatura_ag_calc_vl_fatura.AsFloat := qry_master_fatura_ag_VL_CRE_BRASIL.AsFloat;
  if qry_master_fatura_ag_TP_FATURA.AsString = '3' then
    qry_master_fatura_ag_calc_vl_fatura.AsFloat := qry_master_fatura_ag_VL_DEB_BRASIL.AsFloat;
  if qry_master_fatura_ag_TP_FATURA.AsString = '4' then
    qry_master_fatura_ag_calc_vl_fatura.AsFloat := qry_master_fatura_ag_VL_AJUSTE.AsFloat;
end;

procedure Tdatm_account.qry_master_AfterPost(DataSet: TDataSet);
begin
  qry_master_.ApplyUpdates;
end;

procedure Tdatm_account.qry_master_fatura_ag_AfterDelete(DataSet: TDataSet);
begin
  qry_master_fatura_ag_.ApplyUpdates;
end;

procedure Tdatm_account.qry_master_fatura_ag_AfterPost(DataSet: TDataSet);
begin
  qry_master_fatura_ag_.ApplyUpdates;
end;

procedure Tdatm_account.qry_master_CalcFields(DataSet: TDataSet);
begin
  if qry_master_IN_ACCOUNT.AsString = '2' then
    qry_master_calc_status.AsString := 'Enviado p/Remessa';
  if qry_master_IN_ACCOUNT.AsString = '4' then
    qry_master_calc_status.AsString := 'Aprovado';
  if qry_master_IN_ACCOUNT.AsString = '1' then
    qry_master_calc_status.AsString := 'Aberto';
  if qry_master_IN_ACCOUNT.AsString = '6' then
    qry_master_calc_status.AsString := 'Pend. Liberador';
  if qry_master_IN_ACCOUNT.AsString = '3' then
    qry_master_calc_status.AsString := 'OutStanding'
end;

procedure Tdatm_account.exec_sp_conta_fat_itl(master, nr_docto: String; Dt_fat: Tdatetime);
var
  IniFile: Tinifile;
  path, vConnectionString: String;
  in_processo:String[1];
begin
{  path := ExtractFilePath(Application.ExeName);
  IniFile := TIniFile.Create( path + 'RM.INI');
  vConnectionString := IniFile.ReadString('CONNECTION', 'STRING', 'ERROR');
  IniFile.Free;
  sp_contabiliza_Fat_itl_master.ConnectionString := vConnectionString;
  sp_contabiliza_Fat_itl_master.Parameters.ParamByName('@cd_master').VAlue    := master;
  sp_contabiliza_Fat_itl_master.Parameters.ParamByName('@dt_aprovacao').VAlue := Dt_fat;
  sp_contabiliza_Fat_itl_master.Parameters.ParamByName('@nr_docto').VAlue     := nr_docto;
  sp_contabiliza_Fat_itl_master.ExecProc;
  sp_contabiliza_Fat_itl_master.close; }
  sp_contabiliza_Fat_itl_master.ParamByName('@cd_master').VAlue    := master;
  sp_contabiliza_Fat_itl_master.ParamByName('@dt_aprovacao').VAlue := Dt_fat;
  sp_contabiliza_Fat_itl_master.ParamByName('@nr_docto').VAlue     := nr_docto;
  sp_contabiliza_Fat_itl_master.ExecProc;
  sp_contabiliza_Fat_itl_master.close;
end;
end.
