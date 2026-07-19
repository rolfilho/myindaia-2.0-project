unit frm_conhec_house;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, Db, DBTables, ppVar, ppCtrls,
  ppDB, ppDBPipe, ppDBBDE, ppBands, ppMemo, ppStrtch, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, ppEndUsr, ppTypes, Menus, Funcoes,
  PGGP017;

type
  Tfrm_emissao_house = class(TForm)
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    lb_conhecimento: TLabel;
    btn_imprimir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_design: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    Emisso1: TMenuItem;
    mi_Designe: TMenuItem;
    Sair1: TMenuItem;
    mi_Cancelar: TMenuItem;
    pp_conhecimento: TppReport;
    ppDesigner: TppDesigner;
    ppBDEPipeline1: TppBDEPipeline;
    ScrollBox1: TScrollBox;
    Panel6: TPanel;
    Label6: TLabel;
    dmemo_emissor: TDBMemo;
    Panel7: TPanel;
    Label7: TLabel;
    DBMemo8: TDBMemo;
    Panel8: TPanel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Panel9: TPanel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Panel10: TPanel;
    Label10: TLabel;
    dbedt_rota: TDBEdit;
    Panel11: TPanel;
    Label11: TLabel;
    Panel12: TPanel;
    Label12: TLabel;
    Panel13: TPanel;
    Panel14: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit18: TDBEdit;
    Panel15: TPanel;
    Label16: TLabel;
    DBEdit19: TDBEdit;
    Panel16: TPanel;
    Label29: TLabel;
    DBEdit24: TDBEdit;
    Panel17: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit20: TDBEdit;
    Panel18: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit21: TDBEdit;
    Panel19: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit22: TDBEdit;
    Panel20: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit23: TDBEdit;
    Panel21: TPanel;
    Label30: TLabel;
    DBText1: TDBText;
    Panel22: TPanel;
    Label31: TLabel;
    Panel24: TPanel;
    Label33: TLabel;
    dbedt_dvcarriage: TDBEdit;
    Panel25: TPanel;
    Label34: TLabel;
    dbedt_dvcustoms: TDBEdit;
    Panel26: TPanel;
    Label35: TLabel;
    dbedt_destination: TDBEdit;
    Panel27: TPanel;
    Label36: TLabel;
    DBEdit26: TDBEdit;
    Panel28: TPanel;
    Label37: TLabel;
    DBEdit27: TDBEdit;
    Panel29: TPanel;
    Label38: TLabel;
    dbedt_insurance: TDBEdit;
    Panel30: TPanel;
    Panel31: TPanel;
    Label39: TLabel;
    DBMemo5: TDBMemo;
    Panel32: TPanel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    DBEdit28: TDBEdit;
    Panel33: TPanel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    DBEdit29: TDBEdit;
    Panel34: TPanel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit30: TDBEdit;
    Panel35: TPanel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    DBEdit32: TDBEdit;
    Panel36: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    DBEdit31: TDBEdit;
    Panel37: TPanel;
    Label63: TLabel;
    SpeedButton2: TSpeedButton;
    dbmemo_nature: TDBMemo;
    Panel38: TPanel;
    Label61: TLabel;
    Label71: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    dbedt_frete_pp: TDBEdit;
    dbedt_frete_cc: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    dbedt_collect_cia: TDBEdit;
    dbedt_prepaid_cia: TDBEdit;
    dbedt_collect_ag: TDBEdit;
    dbedt_prepaid_ag: TDBEdit;
    Panel39: TPanel;
    Label60: TLabel;
    Label62: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Panel40: TPanel;
    Label64: TLabel;
    DBMemo7: TDBMemo;
    Panel41: TPanel;
    Label2: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    DBText9: TDBText;
    Panel42: TPanel;
    Label65: TLabel;
    DBText2: TDBText;
    Panel43: TPanel;
    Label66: TLabel;
    DBText7: TDBText;
    Panel23: TPanel;
    Label32: TLabel;
    Panel44: TPanel;
    Label67: TLabel;
    DBText3: TDBText;
    Panel45: TPanel;
    Label68: TLabel;
    DBText8: TDBText;
    Panel46: TPanel;
    Label72: TLabel;
    DBMemo6: TDBMemo;
    Panel5: TPanel;
    Panel4: TPanel;
    Label5: TLabel;
    dbmemo_consigne: TDBMemo;
    Panel2: TPanel;
    Label3: TLabel;
    dbmemo_shipper: TDBMemo;
    Panel3: TPanel;
    Label4: TLabel;
    dbmemo_issued: TDBMemo;
    Panel53: TPanel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    rdgrp_class_rate: TRadioGroup;
    Label76: TLabel;
    DBEdit2: TDBEdit;
    qry_conhecimento: TQuery;
    ds_conhec: TDataSource;
    qry_conhecimentoNR_PROCESSO: TStringField;
    qry_conhecimentoEND_CONSIGNE: TStringField;
    qry_conhecimentoEND_ISSUED: TStringField;
    qry_conhecimentoEND_AGENT: TStringField;
    qry_conhecimentoACCOUNT_INFO: TStringField;
    qry_conhecimentoNR_IATA_CODE: TStringField;
    qry_conhecimentoNR_ACCOUNT: TStringField;
    qry_conhecimentoTYPE_SERVICE: TStringField;
    qry_conhecimentoROTA: TStringField;
    qry_conhecimentoSTR_TO1: TStringField;
    qry_conhecimentoSTR_TO2: TStringField;
    qry_conhecimentoSTR_TO3: TStringField;
    qry_conhecimentoCARRIER: TStringField;
    qry_conhecimentoMOEDA: TStringField;
    qry_conhecimentoTP_FRETE: TStringField;
    qry_conhecimentoFRETE_CONF_PP: TStringField;
    qry_conhecimentoFRETE_CONF_CC: TStringField;
    qry_conhecimentoTP_OTHER_PP: TStringField;
    qry_conhecimentoTP_OTHER_CC: TStringField;
    qry_conhecimentoDVCARRIAGE: TStringField;
    qry_conhecimentoDVCUSTOMS: TStringField;
    qry_conhecimentoDESTINATION: TStringField;
    qry_conhecimentoDATA1: TStringField;
    qry_conhecimentoDATA2: TStringField;
    qry_conhecimentoST_INSURANCE: TStringField;
    qry_conhecimentoQTDE: TFloatField;
    qry_conhecimentoGROSS_WEIGHT: TFloatField;
    qry_conhecimentoCHARG_WEIGHT: TFloatField;
    qry_conhecimentoCLASS_RATE: TStringField;
    qry_conhecimentoVL_FRETE: TFloatField;
    qry_conhecimentoVL_TAR_FRETE: TFloatField;
    qry_conhecimentoVL_FRETE_CC: TFloatField;
    qry_conhecimentoVL_FRETE_PP: TFloatField;
    qry_conhecimentoVL_CARRIER_PP: TFloatField;
    qry_conhecimentoVL_CARRIER_CC: TFloatField;
    qry_conhecimentoVL_AGENTE_PP: TFloatField;
    qry_conhecimentoVL_AGENTE_CC: TFloatField;
    qry_conhecimentoVL_TOT_PP: TFloatField;
    qry_conhecimentoVL_TOT_CC: TFloatField;
    qry_conhecimentoHAND_INF: TStringField;
    qry_conhecimentoNATURE_GOOD: TStringField;
    qry_conhecimentoOTHER_CHARG: TStringField;
    qry_conhecimentoTX_DOC_EMISSA: TMemoField;
    qry_conhecimentoFOR_AGENT_AUT: TStringField;
    qry_conhecimentoFOR_AGENT: TStringField;
    qry_conhecimentoAS_AGENT: TStringField;
    qry_conhecimentoDT_EMISSAO: TDateTimeField;
    qry_conhecimentoIN_CARTA_CRED: TStringField;
    qry_conhecimentoCD_USUARIO_ALT: TStringField;
    qry_conhecimentoIN_IMPRESSAO: TStringField;
    qry_conhecimentoNR_MASTER: TStringField;
    qry_conhecimentoNR_HOUSE: TStringField;
    sp_emissao_conhecimento_: TStoredProc;
    UpdateSQL1: TUpdateSQL;
    qry_conhecimentoEND_SHIPPER: TStringField;
    DBRadioGroup1: TDBRadioGroup;
    btn_carta_cred: TSpeedButton;
    qry_conhecimentocalc_nm_usuario: TStringField;
    lb_carta_credito: TLabel;
    dbedt_ag_autorizado: TDBEdit;
    dbedt_for_agent: TDBEdit;
    dbedt_as_agent: TDBEdit;
    qry_conhecimentoNM_AS_AGREED: TStringField;
    DBText4: TDBText;
    qry_conhecimentocalc_cidade: TStringField;
    qry_conhecimentocalc_nr_account_cliente: TStringField;
    qry_conhecimentocalc_nr_account_emp_est: TStringField;
    qry_conhecimentoORIGEM: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure DBMemo5Change(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_designClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qry_conhecimentoAfterPost(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure qry_conhecimentoCalcFields(DataSet: TDataSet);
    procedure btn_carta_credClick(Sender: TObject);
    procedure carta_credito;
  private
    { Private declarations }
    str_documento:String[40];
  public
    { Public declarations }
    st_nr_processo, str_end_cidade, tp_processo: String;
    st_cd_cliente, st_cd_emp_est, str_nr_account_cli, str_nr_account_est:string;
  end;

var
  frm_emissao_house: Tfrm_emissao_house;

implementation

uses PGGP001, GSMLIB;

{$R *.DFM}

procedure Tfrm_emissao_house.FormShow(Sender: TObject);
begin
if tp_processo = '1' then
  begin
   lb_conhecimento.CAption := 'HAWB';
   str_documento           := '\Conhecimento_Hawb.rtm'
  end
else
 begin
   lb_conhecimento.CAption := 'AWB';
   str_documento           := '\Conhecimento_Awb.rtm';
 end;

sp_emissao_conhecimento_.UnPrepare;
sp_emissao_conhecimento_.ParamByName('@nr_processo').AsString := st_nr_processo;
sp_emissao_conhecimento_.ExecProc;
sp_emissao_conhecimento_.UnPrepare;

with Tquery.Create(Application) do
 begin
  DAtabasename := 'DBBROKER';
  Sql.Add('SELECT CD_UNID_NEG, END_CIDADE FROM TUNID_NEG WHERE CD_UNID_NEG = "'+copy(st_nr_processo,1,2)+'"');
  Open;
  str_end_cidade := Fields[1].AsString;

  Sql.Clear;
  Sql.Add('SELECT CD_EMPRESA, NR_ACCOUNT FROM TEMPRESA_NAC WHERE CD_EMPRESA = "'+st_cd_cliente+'"');
  Open;
  str_nr_account_cli:= Fields[1].AsString;

  Sql.Clear;
  Sql.Add('SELECT CD_EMPRESA, NR_ACCOUNT FROM TEMPRESA_EST WHERE CD_EMPRESA = "'+st_cd_emp_est+'"');
  Open;
  str_nr_account_est:= Fields[1].AsString;
  Free;
 end;

qry_conhecimento.Close;
qry_conhecimento.ParamByName('NR_PROCESSO').AsString:=st_nr_processo;
qry_conhecimento.Prepare;
qry_conhecimento.Open;

carta_credito;


end;

procedure Tfrm_emissao_house.btn_sairClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_emissao_house.DBMemo5Change(Sender: TObject);
begin
  if qry_conhecimento.State in [dsEdit] then
    begin
     btn_salvar.Enabled:=true;
     btn_cancelar.Enabled:=true;
     mi_salvar.Enabled:=true;
     mi_Cancelar.Enabled:=true;
    end;
end;

procedure Tfrm_emissao_house.btn_salvarClick(Sender: TObject);
begin
  if qry_conhecimento.State in [dsEdit] then
    begin
      qry_conhecimento.Post;
      btn_salvar.Enabled:=false;
      btn_cancelar.Enabled:=false;
      mi_salvar.Enabled:=false;
      mi_Cancelar.Enabled:=false;
    end;
end;

procedure Tfrm_emissao_house.btn_cancelarClick(Sender: TObject);
begin
   if qry_conhecimento.State in [dsEdit] then
    begin
     qry_conhecimento.Cancel;
     btn_salvar.Enabled:=false;
     btn_cancelar.Enabled:=false;
     mi_salvar.Enabled:=false;
     mi_Cancelar.Enabled:=false;
    end;
end;

procedure Tfrm_emissao_house.btn_designClick(Sender: TObject);
begin
   ppDesigner.Report.Template.FileName := cDir_RPT + str_documento;
   ppDesigner.Report.Template.LoadFromFile;
   ppDesigner.Report.DeviceType := 'Screen';
   ppDesigner.ShowModal;
end;

procedure Tfrm_emissao_house.btn_imprimirClick(Sender: TObject);
begin

if dbedt_dvcarriage.text = '' then
 begin
  Boxmensagem('DVCarriage deve ser preenchido',2);
  dbedt_dvcarriage.Setfocus;
  Exit;
 end;

if dbedt_dvcustoms.text = '' then
 begin
  Boxmensagem('DVCustoms deve ser preenchido',2);
  dbedt_dvcustoms.Setfocus;
  Exit;
 end;

 if dbedt_insurance.text = '' then
 begin
  Boxmensagem('Amount of Insurance deve ser preenchido',2);
  dbedt_insurance.Setfocus;
  Exit;
 end;


 pp_conhecimento.Reset;
 pp_conhecimento.Template.FileName := cDir_RPT + str_documento;
 pp_conhecimento.Template.LoadFromFile;
 pp_conhecimento.Template.FileName := cDir_RPT + str_documento;
 pp_conhecimento.Print;
end;

procedure Tfrm_emissao_house.FormCreate(Sender: TObject);
begin
if str_cd_cargo = '001' then
 begin
   btn_design.Visible:=true;
   mi_Designe.Visible:=true;
 end;
end;

procedure Tfrm_emissao_house.qry_conhecimentoAfterPost(DataSet: TDataSet);
begin
qry_conhecimento.ApplyUpdates;
end;

procedure Tfrm_emissao_house.Button1Click(Sender: TObject);
begin
qry_conhecimento.post;
end;

procedure Tfrm_emissao_house.qry_conhecimentoCalcFields(DataSet: TDataSet);
begin
qry_conhecimentocalc_nm_usuario.asString := str_nm_usuario;

qry_conhecimentocalc_cidade.AsString     :=  str_end_cidade;

qry_conhecimentocalc_nr_account_emp_est.AsString := str_nr_account_est;
qry_conhecimentocalc_nr_account_cliente.AsString := str_nr_account_cli;

end;

procedure Tfrm_emissao_house.btn_carta_credClick(Sender: TObject);
begin

if qry_conhecimentoIN_CARTA_CRED.AsString  = '0' then
 begin
  if not (qry_conhecimento.State in [dsEdit]) then
      qry_conhecimento.Edit;
  qry_conhecimentoIN_CARTA_CRED.AsString  := '1';
  qry_conhecimentoCD_USUARIO_ALT.AsString := str_cd_usuario;
  qry_conhecimento.Post;
 end
else
 begin
  with TQuery.Create(Application) do
   begin
    DataBaseName := 'DBBROKER';
    Sql.Add('DELETE FROM TEMISSAO_CONHECIMENTO WHERE NR_PROCESSO = "'+st_nr_processo+'"');
    ExecSql;
    Free;
   end;
  sp_emissao_conhecimento_.UnPrepare;
  sp_emissao_conhecimento_.ParamByName('@nr_processo').AsString := st_nr_processo;
  sp_emissao_conhecimento_.ExecProc;
  sp_emissao_conhecimento_.UnPrepare;

  qry_conhecimento.Close;
  qry_conhecimento.ParamByName('NR_PROCESSO').AsString:=st_nr_processo;
  qry_conhecimento.Prepare;
  qry_conhecimento.Open;
 end;
  carta_credito;
end;

procedure Tfrm_emissao_house.carta_credito;
begin
 dbmemo_shipper.ReadOnly       := (qry_conhecimentoIN_CARTA_CRED.AsString = '0');
 dbmemo_issued.ReadOnly        := (qry_conhecimentoIN_CARTA_CRED.AsString = '0');
 dbmemo_consigne.ReadOnly      := (qry_conhecimentoIN_CARTA_CRED.AsString = '0');
 dmemo_emissor.ReadOnly        := (qry_conhecimentoIN_CARTA_CRED.AsString = '0');
 dbedt_rota.ReadOnly           := (qry_conhecimentoIN_CARTA_CRED.AsString = '0');
 dbedt_as_agent.ReadOnly       := (qry_conhecimentoIN_CARTA_CRED.AsString = '0');
 dbedt_for_agent.ReadOnly      := (qry_conhecimentoIN_CARTA_CRED.AsString = '0');
 dbedt_ag_autorizado.ReadOnly  := (qry_conhecimentoIN_CARTA_CRED.AsString = '0');
 dbedt_destination.ReadOnly    := (qry_conhecimentoIN_CARTA_CRED.AsString = '0');
 lb_carta_credito.Visible      := (qry_conhecimentoIN_CARTA_CRED.AsString = '1');

 if qry_conhecimentoIN_CARTA_CRED.AsString = '1' then
 begin
 dbmemo_shipper.Color          := clInfoBk;
 dbmemo_issued.Color           := clInfoBk;
 dbmemo_consigne.Color         := clInfoBk;
 dmemo_emissor.Color           := clInfoBk;
 dbedt_rota.Color              := clInfoBk;
 dbedt_as_agent.Color          := clInfoBk;
 dbedt_ag_autorizado.Color     := clInfoBk;
 dbedt_for_agent.Color         := clInfoBk;
 dbedt_destination.Color       := clInfoBk;
 btn_carta_cred.Hint           := 'Conhecimento Original';
 end
 else
 begin
 dbmemo_shipper.Color          := clSilver;
 dbmemo_issued.Color           := clSilver;
 dbmemo_consigne.Color         := clSilver;
 dmemo_emissor.Color           := clSilver;
 dbedt_rota.Color              := clSilver;
 dbedt_as_agent.Color          := clSilver;
 dbedt_ag_autorizado.Color     := clSilver;
 dbedt_for_agent.Color         := clSilver;
 dbedt_destination.Color       := clSilver;
 btn_carta_cred.Hint           := 'Carta de Crédito';
 end;
end;

end.
