unit uEmissaoBL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, DBTables, Db, ppBands,
  ppCache, ppClass, ppDB, ppDBPipe, ppDBBDE, ppEndUsr, ppComm, ppRelatv,
  ppProd, ppReport, RxDBComb, Funcoes;

type
  Tfrm_emissao_bl = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btn_imprimir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_design: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    DBEdit1: TDBEdit;
    ScrollBox1: TScrollBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    Panel4: TPanel;
    Label4: TLabel;
    Panel5: TPanel;
    Label5: TLabel;
    Panel6: TPanel;
    Label6: TLabel;
    Panel7: TPanel;
    Label7: TLabel;
    Panel8: TPanel;
    Label8: TLabel;
    Panel9: TPanel;
    Label9: TLabel;
    rdgrp_original: TRadioGroup;
    Panel10: TPanel;
    Label11: TLabel;
    Panel11: TPanel;
    Label12: TLabel;
    Panel12: TPanel;
    Label13: TLabel;
    Panel13: TPanel;
    Label14: TLabel;
    Panel14: TPanel;
    Label15: TLabel;
    Panel16: TPanel;
    Label17: TLabel;
    Panel17: TPanel;
    Label18: TLabel;
    Panel18: TPanel;
    Label19: TLabel;
    Panel19: TPanel;
    Label20: TLabel;
    Panel20: TPanel;
    Label21: TLabel;
    Panel21: TPanel;
    Label22: TLabel;
    Panel22: TPanel;
    Label2: TLabel;
    Label23: TLabel;
    Panel23: TPanel;
    Label24: TLabel;
    Panel24: TPanel;
    Label25: TLabel;
    Panel25: TPanel;
    Label26: TLabel;
    Panel26: TPanel;
    Label27: TLabel;
    Panel27: TPanel;
    Label28: TLabel;
    dbmemo_shipper: TDBMemo;
    dbmemo_consigne: TDBMemo;
    dbmemo_delivery: TDBMemo;
    dbmemo_notify: TDBMemo;
    dbmemo_consignor: TDBMemo;
    DBMemo7: TDBMemo;
    DBMemo9: TDBMemo;
    DBText1: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBMemo6: TDBMemo;
    dbmemo_desc: TDBMemo;
    DBText7: TDBText;
    DBText8: TDBText;
    DBMemo10: TDBMemo;
    DBMemo11: TDBMemo;
    DBMemo12: TDBMemo;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    pp_conhecimento: TppReport;
    ppDesigne: TppDesigner;
    pp_emissao_bl: TppBDEPipeline;
    Panel28: TPanel;
    Label29: TLabel;
    Panel15: TPanel;
    lb_original: TLabel;
    lb_not_neg: TLabel;
    dbrgrp_st_insurance: TDBCheckBox;
    DBText13: TDBText;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    qry_texto_bl_: TQuery;
    qry_texto_bl_CHAVE: TStringField;
    qry_texto_bl_COUNTER: TIntegerField;
    qry_texto_bl_CAMPO_TEXTO: TMemoField;
    ds_texto_bl: TDataSource;
    pp_texto_bl: TppBDEPipeline;
    sp_texto_bl: TStoredProc;
    qry_emissao_bl: TQuery;
    qry_emissao_blNR_PROCESSO: TStringField;
    qry_emissao_blEND_SHIPPER: TStringField;
    qry_emissao_blEND_CONSIGNED: TStringField;
    qry_emissao_blEND_NOTIFY: TStringField;
    qry_emissao_blEND_CONSIGNOR: TStringField;
    qry_emissao_blNUMBER_ORIGINAL: TStringField;
    qry_emissao_blFREIGHT_PAY: TStringField;
    qry_emissao_blVESSEL: TStringField;
    qry_emissao_blNR_VIAGEM: TStringField;
    qry_emissao_blPORT_LOAD: TStringField;
    qry_emissao_blPORT_RECEPT: TStringField;
    qry_emissao_blPORT_DISCHARGE: TStringField;
    qry_emissao_blPORT_DELYVERY: TStringField;
    qry_emissao_blSTR_MARKS: TStringField;
    qry_emissao_blNUMBER_PACKAGE: TStringField;
    qry_emissao_blDESCRIPTION_GOODS: TMemoField;
    qry_emissao_blGROSS_WEIGHT: TFloatField;
    qry_emissao_blCUBAGEM: TFloatField;
    qry_emissao_blFREIGHT_CHARGES: TStringField;
    qry_emissao_blCURRENCY: TStringField;
    qry_emissao_blSTR_PREPAID: TStringField;
    qry_emissao_blSTR_COLLECT: TStringField;
    qry_emissao_blFREIGHT_AMOUNT: TStringField;
    qry_emissao_blPLACE: TStringField;
    qry_emissao_blDT_ISSUE: TDateTimeField;
    qry_emissao_blEND_AG_DELIVERY: TStringField;
    qry_emissao_blNR_MASTER: TStringField;
    qry_emissao_blNR_HOUSE: TStringField;
    qry_emissao_blIN_CARTA_CRED: TStringField;
    qry_emissao_blCD_USUARIO_ALT: TStringField;
    ds_emissao: TDataSource;
    sp_emissao_bl: TStoredProc;
    lb_as_agreed: TLabel;
    lb_carta_credito: TLabel;
    dbedt_number_original: TDBEdit;
    qry_emissao_blcalc_nm_usuario: TStringField;
    UpdateSQL1: TUpdateSQL;
    dbedt_port_load: TDBEdit;
    dbedt_port_receipt: TDBEdit;
    dbedt_port_discharge: TDBEdit;
    dbedt_port_delivery: TDBEdit;
    btn_carta_cred: TSpeedButton;
    qry_emissao_blcalc_tp_documento: TStringField;
    sp_emissao_draft: TStoredProc;
    procedure FormShow(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure rdgrp_originalClick(Sender: TObject);
    procedure DBMemo6Change(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_designClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure sp_atz_texto;
    procedure dbmemo_descChange(Sender: TObject);
    procedure qry_emissao_blCalcFields(DataSet: TDataSet);
    procedure qry_emissao_blAfterPost(DataSet: TDataSet);
    procedure carta_credito;
    procedure btn_carta_credClick(Sender: TObject);
    procedure dbedt_number_originalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nr_processo:String[18];
    in_draft, chage_texto : Boolean;
    vl_frete_total:real;
  end;

var
  frm_emissao_bl: Tfrm_emissao_bl;

implementation

uses PGGP001, GSMLIB, PGGP017;

{$R *.DFM}

procedure Tfrm_emissao_bl.FormShow(Sender: TObject);
begin
if in_draft then
begin
 CloseStoredProc( sp_emissao_draft );
 sp_emissao_draft.ParamByName('@cd_master').AsString   := nr_processo;
 ExecStoredProc(sp_emissao_draft);
 CloseStoredProc( sp_emissao_draft );

 qry_emissao_bl.Close;
 qry_emissao_bl.ParamByName('NR_PROCESSO').AsString:=nr_processo;
 qry_emissao_bl.Prepare;
 qry_emissao_bl.Open;

 btn_carta_cred.Visible := false;

end
else
begin
 CloseStoredProc( sp_emissao_bl );
 sp_emissao_bl.ParamByName('@nr_processo').AsString   := nr_processo;
 ExecStoredProc(sp_emissao_bl);
 CloseStoredProc( sp_emissao_bl );

 qry_emissao_bl.Close;
 qry_emissao_bl.ParamByName('NR_PROCESSO').AsString:=nr_processo;
 qry_emissao_bl.Prepare;
 qry_emissao_bl.Open;

 carta_credito;
end;

{qry_emissao_bl_.Close;
qry_emissao_bl_.ParamByName('NR_PROCESSO').AsString:=nr_processo;
qry_emissao_bl_.Prepare;
qry_emissao_bl_.Open;}

end;

procedure Tfrm_emissao_bl.btn_sairClick(Sender: TObject);
begin
qry_emissao_bl.close;
close;
end;

procedure Tfrm_emissao_bl.rdgrp_originalClick(Sender: TObject);
begin


if rdgrp_original.ItemIndex = 1 then
 begin
  lb_original.Caption:='COPY';
  lb_not_neg.Visible:=true;
 end
 else
 begin
  lb_original.Caption:='ORIGINAL';
  lb_not_neg.Visible:=false;
 end;
end;

procedure Tfrm_emissao_bl.DBMemo6Change(Sender: TObject);
begin
if qry_emissao_bl.State in [dsEdit] then
  begin
   btn_salvar.Enabled   := true;
   btn_cancelar.Enabled := true;
   btn_imprimir.Enabled := false;
   btn_design.Enabled   := false;
  end;
end;

procedure Tfrm_emissao_bl.btn_salvarClick(Sender: TObject);
begin
   if qry_emissao_bl.State in [dsEdit] then
    begin
      vl_frete_total := 0 ;
      qry_emissao_bl.Post;
      btn_salvar.Enabled   :=false;
      btn_cancelar.Enabled :=false;
      btn_imprimir.Enabled := true;
      btn_design.Enabled   := true;
      if chage_texto then
         sp_atz_texto;
    end;



end;

procedure Tfrm_emissao_bl.btn_designClick(Sender: TObject);
begin
   qry_emissao_bl.Close;
   qry_emissao_bl.ParamByName('NR_PROCESSO').AsString:=nr_processo;
   qry_emissao_bl.Prepare;
   qry_emissao_bl.Open;

   qry_texto_bl_.Close;
   qry_texto_bl_.Prepare;
   qry_texto_bl_.Open;
   ppDesigne.Report.Template.FileName :=cDir_RPT +  '\Conhecimento_BL.rtm';
   ppDesigne.Report.Template.LoadFromFile;
   ppDesigne.Report.DeviceType := 'Screen';
   ppDesigne.ShowModal;

end;

procedure Tfrm_emissao_bl.btn_imprimirClick(Sender: TObject);
var
 str_cd_master, str_cd_agente, str_nm_agente:String;
 str_cd_moeda:String[3];
begin

 qry_emissao_bl.Close;
 qry_emissao_bl.ParamByName('NR_PROCESSO').AsString:=nr_processo;
 qry_emissao_bl.Prepare;
 qry_emissao_bl.Open;

 qry_texto_bl_.Close;
 qry_texto_bl_.Prepare;
 qry_texto_bl_.Open;

 pp_conhecimento.Reset;
 pp_conhecimento.Template.FileName := cDir_RPT + '\Conhecimento_BL.rtm';
 pp_conhecimento.Template.LoadFromFile;
 pp_conhecimento.Template.FileName := cDir_RPT + '\Conhecimento_BL.rtm';
 pp_conhecimento.Print;
 if (in_integracao_contabil = '1')then // and (qry_emissao_bl_NR_CONTA_CONTABIL.AsString= '') then
   begin
   with TQuery.Create(Application) do
    begin
     DataBaseName:= 'DBBROKER';
     Sql.Add('SELECT CD_MASTER FROM THOUSE WHERE NR_PROCESSO = "'+nr_processo+'"');
     Open;
     str_cd_master := Fields[0].AsString;

     Sql.Clear;
     Sql.Add(' SELECT P.NR_PROCESSO, A.CD_AGENTE, A.NM_AGENTE, P.CD_MOEDA_FRETE FROM TPROCESSO P, TAGENTE A ');
     Sql.Add(' WHERE P.NR_PROCESSO = "'+nr_processo+'" AND P.CD_AGENTE = A.CD_AGENTE');
     Open;
     str_cd_agente:= Fields[1].AsString;
     str_nm_agente:= Fields[2].AsString;
     str_cd_moeda := Fields[3].AsString;
     Free;
    end;

    try
    datm_main.db_broker.StartTransaction;
   //BUSCA CONTA CONTABIL PARA agente
//    executa_proc_rm(str_cd_agente, str_nm_agente, str_cd_moeda, 5);
   //BUSCA CONTA CONTABIL PARA MASTER
//    executa_proc_rm(str_cd_master,
//            'Proc. '+Copy(str_cd_master,1,6 )+ '-' +
//                     Copy(str_cd_master,7,8 ), '', 3);

    datm_main.db_broker.Commit;
    except
     on E: Exception do
      begin
       if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
       TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_emissao_bl.FormCreate(Sender: TObject);
begin
if str_cd_cargo = '001' then
 begin
  btn_design.Visible:=true;
 end;
 chage_texto    := false;
 in_draft       := false;
 vl_frete_total := 0;
end;

procedure Tfrm_emissao_bl.btn_cancelarClick(Sender: TObject);
begin
  if qry_emissao_bl.State in [dsEdit] then
      qry_emissao_bl.Cancel;
  btn_salvar.Enabled   :=false;
  btn_cancelar.Enabled :=false;
  btn_imprimir.Enabled := true;
  btn_design.Enabled   := true;
end;

procedure Tfrm_emissao_bl.sp_atz_texto;
var i, linha, counter:integer;
    memo_aux : AnsiString;
begin
 linha   := 1;
 counter := 1;
 memo_aux := '';
 With TQuery.Create(Application)do
  begin
   DataBaseName := 'DBBROKER';
   Sql.Clear;
   Sql.Add('DELETE FROM TEMISSAO_BL_DOC WHERE CHAVE = "'+nr_processo+'"');
   ExecSql;
   Free;
  end;
 for i:= 0 to dbmemo_desc.Lines.Count do
    begin
      memo_aux := memo_aux + dbmemo_desc.Lines.Strings[I] + #13#10;
      if (linha = 10) then
       begin
        CloseStoredProc( sp_texto_bl );
        sp_texto_bl.ParamByName('@chave').AsString   := nr_processo;
        sp_texto_bl.ParamByName('@counter').AsInteger:= Counter;
        sp_texto_bl.ParamByName('@Texto').AsMemo     := memo_aux;
        ExecStoredProc(sp_texto_bl);
        CloseStoredProc( sp_texto_bl );
        memo_aux := '';
        linha   := 0;
        counter := counter + 1;
       end;
      linha := linha + 1;
    end;

   if (memo_aux <> '') then
    begin
     CloseStoredProc( sp_texto_bl );
     sp_texto_bl.ParamByName('@chave').AsString   := nr_processo;
     sp_texto_bl.ParamByName('@counter').AsInteger:= Counter;
     sp_texto_bl.ParamByName('@Texto').AsMemo     := memo_aux;
     ExecStoredProc(sp_texto_bl);
     CloseStoredProc( sp_texto_bl );
    end;
  chage_texto := false;
end;

procedure Tfrm_emissao_bl.dbmemo_descChange(Sender: TObject);
begin
if qry_emissao_bl.State in [dsEdit] then
  begin
   btn_salvar.Enabled   := true;
   btn_cancelar.Enabled := true;
   btn_imprimir.Enabled := false;
   btn_design.Enabled   := false;
   chage_texto          := true;
  end;


end;

procedure Tfrm_emissao_bl.qry_emissao_blCalcFields(DataSet: TDataSet);
begin
qry_emissao_blcalc_nm_usuario.AsString := str_nm_usuario;

 if rdgrp_original.ItemIndex = 0 then
   qry_emissao_blcalc_tp_documento.AsString:= 'Original'
 else qry_emissao_blcalc_tp_documento.AsString:= 'COPY'+#13#10+ 'NOT NEGOTIABLE';

end;

procedure Tfrm_emissao_bl.qry_emissao_blAfterPost(DataSet: TDataSet);
begin
qry_emissao_bl.ApplyUpdates;
end;

procedure Tfrm_emissao_bl.carta_credito;
begin

dbmemo_shipper.ReadOnly       := (qry_emissao_blIN_CARTA_CRED.AsString  = '0');
dbmemo_notify.ReadOnly        := (qry_emissao_blIN_CARTA_CRED.AsString  = '0');
dbmemo_consignor.ReadOnly     := (qry_emissao_blIN_CARTA_CRED.AsString  = '0');
dbmemo_consigne.ReadOnly      := (qry_emissao_blIN_CARTA_CRED.AsString  = '0');
dbmemo_delivery.ReadOnly      := (qry_emissao_blIN_CARTA_CRED.AsString  = '0');
dbedt_port_delivery.ReadOnly  := (qry_emissao_blIN_CARTA_CRED.AsString  = '0');
dbedt_port_receipt.ReadOnly   := (qry_emissao_blIN_CARTA_CRED.AsString  = '0');
dbedt_port_load.ReadOnly      := (qry_emissao_blIN_CARTA_CRED.AsString  = '0');
dbedt_port_discharge.ReadOnly := (qry_emissao_blIN_CARTA_CRED.AsString  = '0');
lb_carta_credito.Visible      := (qry_emissao_blIN_CARTA_CRED.AsString  = '1');
lb_as_agreed.Visible          := (qry_emissao_blFREIGHT_AMOUNT.AsString = 'AS PER AGREEMENT');

if  (qry_emissao_blIN_CARTA_CRED.AsString = '0') then
 begin
  dbmemo_shipper.Color       := clSilver;
  dbmemo_notify.Color        := clSilver;
  dbmemo_consignor.Color     := clSilver;
  dbmemo_consigne.Color      := clSilver;
  dbmemo_delivery.Color      := clSilver;
  dbedt_port_delivery.Color  := clSilver;
  dbedt_port_receipt.Color   := clSilver;
  dbedt_port_load.Color      := clSilver;
  dbedt_port_discharge.Color := clSilver;
  btn_carta_cred.Hint        := 'Carta de Crédito';
 end
else
 begin
  dbmemo_shipper.Color       := clInfoBk;
  dbmemo_notify.Color        := clInfoBk;
  dbmemo_consignor.Color     := clInfoBk;
  dbmemo_consigne.Color      := clInfoBk;
  dbmemo_delivery.Color      := clInfoBk;
  dbedt_port_delivery.Color  := clInfoBk;
  dbedt_port_receipt.Color   := clInfoBk;
  dbedt_port_load.Color      := clInfoBk;
  dbedt_port_discharge.Color := clInfoBk;
   btn_carta_cred.Hint       :=  'Conhecimento Original';
 end;
end;

procedure Tfrm_emissao_bl.btn_carta_credClick(Sender: TObject);
begin
if qry_emissao_blIN_CARTA_CRED.AsString  = '0' then
 begin
  if not (qry_emissao_bl.State in [dsEdit]) then
      qry_emissao_bl.Edit;
  qry_emissao_blIN_CARTA_CRED.AsString  := '1';
  qry_emissao_blCD_USUARIO_ALT.AsString := str_cd_usuario;
  qry_emissao_bl.Post;
 end
else
 begin
  with TQuery.Create(Application) do
   begin
    DataBaseName := 'DBBROKER';
    Sql.Add('DELETE FROM TEMISSAO_BL WHERE NR_PROCESSO = "'+nr_processo+'"');
    ExecSql;
    Free;
   end;
  sp_emissao_bl.UnPrepare;
  sp_emissao_bl.ParamByName('@nr_processo').AsString := nr_processo;
  sp_emissao_bl.ExecProc;
  sp_emissao_bl.UnPrepare;

  qry_emissao_bl.Close;
  qry_emissao_bl.ParamByName('NR_PROCESSO').AsString:=nr_processo;
  qry_emissao_bl.Prepare;
  qry_emissao_bl.Open;
 end;
  carta_credito;
end;

procedure Tfrm_emissao_bl.dbedt_number_originalExit(Sender: TObject);
var aux: integer;
begin
 if not(qry_emissao_bl.State in [dsEdit]) then exit;
 try
  aux := strtoint(dbedt_number_original.text);
  except
   begin
   Boxmensagem('Valor Inválido',2);
   dbedt_number_original.setFocus;
   end; 
 end;

end;

end.
