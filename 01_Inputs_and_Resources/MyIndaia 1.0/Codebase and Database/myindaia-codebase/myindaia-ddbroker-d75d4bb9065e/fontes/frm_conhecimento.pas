unit frm_conhecimento;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, Db, DBTables, ppVar, ppCtrls,
  ppDB, ppDBPipe, ppDBBDE, ppBands, ppMemo, ppStrtch, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, ppEndUsr, ppTypes, Menus, Funcoes;

type
  Tfrm_emissao_conhec = class(TForm)
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    btn_imprimir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_design: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    ScrollBox1: TScrollBox;
    Panel2: TPanel;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    Panel3: TPanel;
    Label4: TLabel;
    DBMemo2: TDBMemo;
    Panel4: TPanel;
    Label5: TLabel;
    DBMemo3: TDBMemo;
    Panel5: TPanel;
    Panel6: TPanel;
    Label6: TLabel;
    DBMemo4: TDBMemo;
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
    DBEdit5: TDBEdit;
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
    DBEdit25: TDBEdit;
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
    Panel37: TPanel;
    Label63: TLabel;
    SpeedButton2: TSpeedButton;
    dbmemo_nature: TDBMemo;
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
    qry_conhecimento_: TQuery;
    qry_conhecimento_CD_MASTER: TStringField;
    qry_conhecimento_CD_PRODUTO: TStringField;
    qry_conhecimento_CD_VIA_TRANSP: TStringField;
    qry_conhecimento_NR_MASTER: TStringField;
    qry_conhecimento_CD_AGENTE: TStringField;
    qry_conhecimento_CD_MOEDA: TStringField;
    qry_conhecimento_CD_CIA_TRANSP: TStringField;
    qry_conhecimento_CD_ORIGEM: TStringField;
    qry_conhecimento_NR_VOO: TStringField;
    qry_conhecimento_CD_DESTINO: TStringField;
    qry_conhecimento_ESCALA1: TStringField;
    qry_conhecimento_ESCALA2: TStringField;
    qry_conhecimento_TP_FRETE_MASTER: TStringField;
    qry_conhecimento_VOL_MASTER: TFloatField;
    qry_conhecimento_GROSS_MASTER: TFloatField;
    qry_conhecimento_CHARG_MASTER: TFloatField;
    qry_conhecimento_TARIFA_CUSTO: TFloatField;
    qry_conhecimento_CD_UNID_NEG: TStringField;
    qry_conhecimento_DT_PREV_SAIDA: TDateTimeField;
    qry_conhecimento_calc_voo_data: TStringField;
    qry_conhecimento_calc_tp_master: TStringField;
    qry_conhecimento_calc_tp_other_cc: TStringField;
    qry_conhecimento_calc_tp_other_pp: TStringField;
    qry_conhecimento_calc_tp_frete: TStringField;
    qry_conhecimento_NM_UNID_NEG: TStringField;
    qry_conhecimento_CGC_UNID_NEG: TStringField;
    qry_conhecimento_END_UNID_NEG: TStringField;
    qry_conhecimento_END_NUMERO: TStringField;
    qry_conhecimento_END_COMPL: TStringField;
    qry_conhecimento_END_CIDADE: TStringField;
    qry_conhecimento_END_UF: TStringField;
    qry_conhecimento_NM_PAIS_ING: TStringField;
    qry_conhecimento_DS_ENDERECO: TStringField;
    qry_conhecimento_DESCRICAO: TStringField;
    qry_conhecimento_END_CIA_TRANSP: TStringField;
    qry_conhecimento_APELIDO: TStringField;
    qry_conhecimento_NM_CID_CIA: TStringField;
    qry_conhecimento_NM_PAIS_CIA: TStringField;
    qry_conhecimento_CD_SIGLA: TStringField;
    qry_conhecimento_CD_SIGLA_1: TStringField;
    qry_conhecimento_CD_SIGLA_2: TStringField;
    qry_conhecimento_CD_SIGLA_3: TStringField;
    qry_conhecimento_calc_end_shipper: TStringField;
    qry_conhecimento_calc_end_agente: TStringField;
    qry_conhecimento_calc_end_emissor: TStringField;
    qry_conhecimento_calc_rota: TStringField;
    qry_conhecimento_NM_PORTO: TStringField;
    qry_conhecimento_calc_tt_frete_master: TFloatField;
    qry_conhecimento_AP_MOEDA: TStringField;
    qry_conhecimento_calc_item: TStringField;
    qry_conhecimento_calc_account_inf: TStringField;
    qry_conhecimento_calc_pp_agente: TFloatField;
    qry_conhecimento_calc_cc_agente: TFloatField;
    qry_conhecimento_calc_st_insurance: TStringField;
    qry_conhecimento_calc_vl_carriage: TStringField;
    qry_conhecimento_calc_vl_customs: TStringField;
    qry_conhecimento_calc_end_cia: TStringField;
    qry_conhecimento_ST_INSURANCE: TStringField;
    qry_conhecimento_VL_CARRIAGE: TStringField;
    qry_conhecimento_VL_CUSTOMS: TStringField;
    qry_conhecimento_TX_OBS: TStringField;
    qry_conhecimento_TX_HAND_INFORM: TStringField;
    qry_conhecimento_CD_IATA: TStringField;
    qry_conhecimento_DT_EMBARQUE: TDateTimeField;
    qry_conhecimento_calc_escala1: TStringField;
    qry_conhecimento_calc_escala2: TStringField;
    qry_conhecimento_calc_escala3: TStringField;
    qry_conhecimento_calc_frete_confir_cc: TStringField;
    qry_conhecimento_calc_frete_confir_pp: TStringField;
    qry_conhecimento_calc_due_carrier_cc: TFloatField;
    qry_conhecimento_calc_due_carrier_pp: TFloatField;
    ds_conhecimento: TDataSource;
    font_meno: TFontDialog;
    UpDateMas: TUpdateSQL;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_Cancelar: TMenuItem;
    Emisso1: TMenuItem;
    mi_Designe: TMenuItem;
    Sair1: TMenuItem;
    pp_conhecimento: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDesigner: TppDesigner;
    ppBDEPipeline1: TppBDEPipeline;
    Panel35: TPanel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Panel36: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    DBEdit31: TDBEdit;
    Panel38: TPanel;
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
    DBText4: TDBText;
    DBText5: TDBText;
    Label69: TLabel;
    Label70: TLabel;
    DBText6: TDBText;
    DBText9: TDBText;
    Panel46: TPanel;
    Label72: TLabel;
    DBMemo6: TDBMemo;
    Panel47: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    Panel48: TPanel;
    Label57: TLabel;
    Panel49: TPanel;
    Label58: TLabel;
    Panel50: TPanel;
    Label61: TLabel;
    Panel51: TPanel;
    Label71: TLabel;
    Panel52: TPanel;
    Label59: TLabel;
    Bevel1: TBevel;
    qry_conhecimento_TX_DOC_EMISSA: TMemoField;
    qry_conhecimento_calc_master_cc: TStringField;
    qry_conhecimento_calc_master_pp: TStringField;
    qry_conhecimento_calc_tt_frete_pp: TStringField;
    qry_conhecimento_calc_tt_frete_cc: TStringField;
    qry_conhecimento_NM_ORIGEM: TStringField;
    Panel53: TPanel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    rdgrp_class_rate: TRadioGroup;
    qry_conhecimento_calc_class_rate: TStringField;
    qry_conhecimento_calc_nm_usuario: TStringField;
    qry_conhecimento_ACCOUNT_TRANSP: TStringField;
    qry_conhecimento_TARIFA_AUX: TFloatField;
    DBEdit2: TDBEdit;
    qry_conhecimento_END_COMPL_CIA_TRANSP: TStringField;
    qry_conhecimento_DT_EMISSAO_DTA: TDateTimeField;
    DBEdit6: TDBEdit;
    qry_conhecimento_NM_AGENTE: TStringField;
    qry_conhecimento_calc_voo_data2: TStringField;
    qry_conhecimento_DT_PREV_ESCALA1: TDateTimeField;
    qry_conhecimento_ESCALA1_NR_VOO: TStringField;
    DBEdit7: TDBEdit;
    Label76: TLabel;
    qry_conhecimento_TYPE_SERVICE: TStringField;
    qry_conhecimento_SIGLA_CIA_TRANSP: TStringField;
    qry_conhecimento_NR_CONTA_CONTABIL: TStringField;
    qry_conhecimento_calc_tt_reais: TFloatField;
    qry_conhecimento_IN_PER_AGREEMENT: TStringField;
    qry_conhecimento_calc_in_per_agreement: TStringField;
    DBText10: TDBText;
    procedure FormShow(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure qry_conhecimento_CalcFields(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure qry_conhecimento_AfterPost(DataSet: TDataSet);
    procedure DBMemo5Change(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    function st_volumes:String;
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_designClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    st_cd_master, st_cd_unidade, st_cd_produto:string;
  end;

var
  frm_emissao_conhec: Tfrm_emissao_conhec;

implementation

uses PGGP001, GSMLIB, PGGP017;

{$R *.DFM}

procedure Tfrm_emissao_conhec.FormShow(Sender: TObject);
begin
with Tquery.Create(Application) do
 begin

  DAtaBaseName:='DBBROKER';
  Sql.Add(' SELECT CD_MASTER, CD_UNID_NEG, CD_PRODUTO, CD_VIA_TRANSP, TX_OBS FROM TMASTER');
  Sql.Add(' WHERE CD_MASTER = "'+st_cd_master+'" AND CD_UNID_NEG = "'+st_cd_unidade+'" ');
  Sql.Add(' AND CD_PRODUTO = "'+st_cd_produto+'" AND CD_VIA_TRANSP = "04"' );
  Open;
  if Fields[4].AsString = '' then
    begin
      Sql.Clear;
      Sql.Add('UPDATE TMASTER SET TX_OBS=:TX_OBS ');
      Sql.Add(' WHERE CD_MASTER = "'+st_cd_master+'" AND CD_UNID_NEG = "'+st_cd_unidade+'" ');
      Sql.Add(' AND CD_PRODUTO = "'+st_cd_produto+'" AND CD_VIA_TRANSP = "04"' );
      Params[0].AsString:= st_volumes;
      ExecSql;
    end;
  Free;
 end;
qry_conhecimento_.Close;
qry_conhecimento_.ParamByName('CD_MASTER').AsString:=st_cd_master;
qry_conhecimento_.ParamByName('CD_UNID_NEG').AsString:=st_cd_unidade;
qry_conhecimento_.ParamByName('CD_PRODUTO').AsString:=st_cd_produto;
qry_conhecimento_.Prepare;
qry_conhecimento_.Open;
end;

procedure Tfrm_emissao_conhec.btn_sairClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_emissao_conhec.qry_conhecimento_CalcFields(
  DataSet: TDataSet);
  var cgc_unid:String[35];
  vl_moeda :real;
begin
qry_conhecimento_calc_nm_usuario.asString:= str_nm_usuario;

 if qry_conhecimento_END_UF.AsString ='SP' then
        cgc_unid:= 'CNPJ ' + copy(qry_conhecimento_CGC_UNID_NEG.AsString,1,2)+'.'+
                    copy(qry_conhecimento_CGC_UNID_NEG.AsString,3,3)+'.'+
                      copy(qry_conhecimento_CGC_UNID_NEG.AsString,6,3)+'/'+
                        copy(qry_conhecimento_CGC_UNID_NEG.AsString,9,4)+'-'+
                          copy(qry_conhecimento_CGC_UNID_NEG.AsString,13,2)
  else  cgc_unid:= 'CNPJ ' + qry_conhecimento_CGC_UNID_NEG.AsString;

 qry_conhecimento_calc_end_shipper.AsString:=cgc_unid +#13#10+
                      qry_conhecimento_NM_UNID_NEG.AsString+ #13#10+
                      qry_conhecimento_END_UNID_NEG.AsString+', '+qry_conhecimento_END_NUMERO.AsString+
                      qry_conhecimento_END_COMPL.AsString+#13#10+
                      qry_conhecimento_END_CIDADE.AsString+', '+qry_conhecimento_END_UF.AsString+ ' '+
                      qry_conhecimento_NM_PAIS_ING.AsString;

 qry_conhecimento_calc_end_agente.AsString:=qry_conhecimento_DS_ENDERECO.AsString;

 qry_conhecimento_calc_end_cia.AsString:= qry_conhecimento_DESCRICAO.AsString+#13#10+
                               qry_conhecimento_END_CIA_TRANSP.AsString+ #13#10+
                               qry_conhecimento_NM_CID_CIA.AsString+ ' ' +
                               qry_conhecimento_NM_PAIS_CIA.AsString;

 qry_conhecimento_calc_end_emissor.AsString:= cgc_unid +#13#10+
                      qry_conhecimento_NM_UNID_NEG.AsString+ #13#10+
                      qry_conhecimento_END_UNID_NEG.AsString+', '+qry_conhecimento_END_NUMERO.AsString+
                      qry_conhecimento_END_COMPL.AsString+#13#10+
                      qry_conhecimento_END_CIDADE.AsString+', '+qry_conhecimento_END_UF.AsString+ ' '+
                      qry_conhecimento_NM_PAIS_ING.AsString;

 qry_conhecimento_calc_voo_data.AsString:= qry_conhecimento_NR_VOO.AsString + '/'+
                  copy(qry_conhecimento_DT_EMBARQUE.AsString, 1,2);

 qry_conhecimento_calc_voo_data2.AsString:= qry_conhecimento_ESCALA1_NR_VOO.AsString + '/'+
                  copy(qry_conhecimento_DT_PREV_ESCALA1.AsString, 1,2);

 if trim(qry_conhecimento_calc_voo_data2.AsString) = '/' then
    qry_conhecimento_calc_voo_data2.AsString := '';

 qry_conhecimento_calc_rota.AsString:=qry_conhecimento_NM_ORIGEM.AsString;
 if qry_conhecimento_ESCALA1.AsString <>'' then
        qry_conhecimento_calc_rota.AsString:=qry_conhecimento_calc_rota.AsString+ '/'+qry_conhecimento_CD_SIGLA_2.AsString;
 if qry_conhecimento_ESCALA2.AsString <>'' then
        qry_conhecimento_calc_rota.AsString:=qry_conhecimento_calc_rota.AsString+ '/'+qry_conhecimento_CD_SIGLA_3.AsString;

 qry_conhecimento_calc_rota.AsString:=qry_conhecimento_calc_rota.AsString +'/'+qry_conhecimento_CD_SIGLA_1.AsString;

 if rdgrp_class_rate.ItemIndex = 0 then
    qry_conhecimento_calc_class_rate.AsString:= 'A'
 else
    qry_conhecimento_calc_class_rate.AsString:= 'N';

 if qry_conhecimento_CD_SIGLA_2.AsString <> ''then
   begin
     qry_conhecimento_calc_escala1.AsString:=qry_conhecimento_CD_SIGLA_2.AsString;
     if qry_conhecimento_CD_SIGLA_3.AsString <>'' then
       begin
         qry_conhecimento_calc_escala2.AsString:=qry_conhecimento_CD_SIGLA_3.AsString;//escala 2
         qry_conhecimento_calc_escala3.AsString:=qry_conhecimento_CD_SIGLA_1.AsString;//destino
       end
      else qry_conhecimento_calc_escala2.AsString:=qry_conhecimento_CD_SIGLA_1.AsString;//destino
   end
 else
   begin
    if qry_conhecimento_CD_SIGLA_3.AsString <>'' then
      begin
         qry_conhecimento_calc_escala1.AsString:=qry_conhecimento_CD_SIGLA_3.AsString;//escala 2
         qry_conhecimento_calc_escala2.AsString:=qry_conhecimento_CD_SIGLA_1.AsString;//destino
      end
      else qry_conhecimento_calc_escala1.AsString:=qry_conhecimento_CD_SIGLA_1.AsString;//destino
   end;

 qry_conhecimento_calc_tt_frete_master.AsFloat:= qry_conhecimento_TARIFA_AUX.Asfloat * qry_conhecimento_CHARG_MASTER.Asfloat;

 if qry_conhecimento_TP_FRETE_MASTER.AsString = '0' then
   begin
    qry_conhecimento_calc_tp_frete.AsString:='CC';
    if qry_conhecimento_calc_tt_frete_master.AsFloat > 0 then
    qry_conhecimento_calc_tt_frete_cc.AsString:=formatfloat('0.00',qry_conhecimento_calc_tt_frete_master.AsFloat);
    qry_conhecimento_calc_frete_confir_cc.AsString:='CC';
    qry_conhecimento_calc_frete_confir_pp.AsString:=' ';
     qry_conhecimento_calc_tp_other_cc.AsString:='CC';
    qry_conhecimento_calc_tp_other_pp.AsString:='';

    end;
 if qry_conhecimento_TP_FRETE_MASTER.AsString = '1' then
    begin
    qry_conhecimento_calc_tp_frete.AsString:='PP';
    if qry_conhecimento_calc_tt_frete_master.AsFloat > 0 then
       qry_conhecimento_calc_tt_frete_pp.AsString:=formatfloat('0.00',qry_conhecimento_calc_tt_frete_master.AsFloat);
    qry_conhecimento_calc_frete_confir_cc.AsString:=' ';
    qry_conhecimento_calc_frete_confir_pp.AsString:='PP';
     qry_conhecimento_calc_tp_other_cc.AsString:='';
    qry_conhecimento_calc_tp_other_pp.AsString:='PP';
    end;
 if qry_conhecimento_IN_PER_AGREEMENT.AsString <> '1' then
 begin
 with TQuery.Create(Application) do
   begin
   DatabaseName:='DBBROKER';
   Sql.Clear;
   Sql.Add('SELECT (SELECT TI.CD_IATA FROM TITEM TI WHERE TI.CD_ITEM = TM.CD_ITEM)NM_ITEM, VL_COMPRA_AG, ');
   Sql.Add(' CD_FRETE, TP_DUE FROM TMASTER_DESPESAS TM  WHERE TM.CD_MASTER = "'+st_cd_master+'"');
   Sql.Add('  AND TP_DUE IN ("A", "C") ');
   Open;
   while not(Eof)do
     begin
       if (Fields[2].AsString='0') and (Fields[3].AsString = 'A') then //collect
         begin
           qry_conhecimento_calc_item.AsString:=qry_conhecimento_calc_item.AsString + Fields[0].AsString +' A  '+
           Formatfloat('0.00',Fields[1].AsFloat);
           qry_conhecimento_calc_cc_agente.AsFloat:=qry_conhecimento_calc_cc_agente.asFloat+ Fields[1].AsFloat;
           qry_conhecimento_calc_tp_other_cc.AsString:='CC';
         end;

       if (Fields[2].AsString='0') and (Fields[3].AsString = 'C') then //collect
         begin
           qry_conhecimento_calc_item.AsString:=qry_conhecimento_calc_item.AsString + Fields[0].AsString +' C  '+
           Formatfloat('0.00',Fields[1].AsFloat);
           qry_conhecimento_calc_due_carrier_cc.AsFloat:=qry_conhecimento_calc_due_carrier_cc.asFloat+ Fields[1].AsFloat;
           qry_conhecimento_calc_tp_other_cc.AsString:='CC';
         end;

       if (Fields[2].AsString='1') and (Fields[3].AsString = 'C') then    //prepaid
          begin
          qry_conhecimento_calc_item.AsString:=qry_conhecimento_calc_item.AsString + Fields[0].AsString +' C  '+
          Formatfloat('0.00',Fields[1].AsFloat);
          qry_conhecimento_calc_due_carrier_pp.AsFloat:=qry_conhecimento_calc_due_carrier_pp.asFloat+ Fields[1].AsFloat;
          qry_conhecimento_calc_tp_other_pp.AsString:='PP';
          end;

      if (Fields[2].AsString='1') and (Fields[3].AsString = 'A') then    //prepaid
          begin
          qry_conhecimento_calc_item.AsString:=qry_conhecimento_calc_item.AsString + Fields[0].AsString +' A  '+
          Formatfloat('0.00',Fields[1].AsFloat);
          qry_conhecimento_calc_pp_agente.AsFloat:=qry_conhecimento_calc_pp_agente.asFloat+ Fields[1].AsFloat;
          qry_conhecimento_calc_tp_other_pp.AsString:='PP';
          end;

      qry_conhecimento_calc_item.AsString:=qry_conhecimento_calc_item.AsString +#13#10;
      Next;
     end;


    Close;
       Sql.Clear;
       Sql.Add(' SELECT ISNULL(VL_TAXA,0) FROM TTAXA_IATA WHERE CD_MOEDA="'+qry_conhecimento_CD_MOEDA.AsString+'"');
       Sql.Add(' AND DT_INICIO = CONVERT(DATETIME, "'+qry_conhecimento_DT_EMISSAO_DTA.AsString+'",103)  ');
       Open;
       qry_conhecimento_calc_account_inf.AsString:='EXRATE '+ qry_conhecimento_AP_MOEDA.AsString+
                         ' 1.0000=BRL. '+Formatfloat('0.0000',Fields[0].AsFloat);
       vl_moeda := Fields[0].AsFloat;
       if qry_conhecimento_TP_FRETE_MASTER.AsString='0' then
           qry_conhecimento_calc_account_inf.AsString:=qry_conhecimento_calc_account_inf.AsString + #13#10+'FREIGHT COLLECT';

       if qry_conhecimento_TP_FRETE_MASTER.AsString='1' then
           qry_conhecimento_calc_account_inf.AsString:=qry_conhecimento_calc_account_inf.AsString + #13#10+'FREIGHT PREPAID';

       Free;
   end;
  end;

  if qry_conhecimento_ST_INSURANCE.AsString = '' then
    qry_conhecimento_calc_st_insurance.AsString:='NIL'
  else qry_conhecimento_calc_st_insurance.AsString:=qry_conhecimento_ST_INSURANCE.AsString;

  IF qry_conhecimento_calc_pp_agente.AsFloat + qry_conhecimento_calc_due_carrier_pp.AsFloat > 0 THEN
    qry_conhecimento_calc_master_pp.AsString:= formatfloat('0.00',qry_conhecimento_calc_pp_agente.AsFloat + qry_conhecimento_calc_due_carrier_pp.AsFloat)
  else  qry_conhecimento_calc_master_pp.AsString:= '0';

  IF qry_conhecimento_calc_cc_agente.AsFloat + qry_conhecimento_calc_due_carrier_cc.AsFloat > 0 THEN
    qry_conhecimento_calc_master_cc.AsString:= formatfloat('0.00',qry_conhecimento_calc_cc_agente.AsFloat + qry_conhecimento_calc_due_carrier_cc.AsFloat)
   else qry_conhecimento_calc_master_cc.AsString:= '0';

  if qry_conhecimento_calc_tt_frete_pp.AsString <> '' then
   begin
     qry_conhecimento_calc_master_pp.AsString:= formatfloat('0.00',qry_conhecimento_calc_master_pp.Asfloat  + strtofloat(qry_conhecimento_calc_tt_frete_pp.AsString));
     qry_conhecimento_calc_tt_reais.Asfloat  := vl_moeda * strtofloat(qry_conhecimento_calc_master_pp.AsString);
   end;

  if qry_conhecimento_calc_tt_frete_cc.AsString<> '' then
     qry_conhecimento_calc_master_cc.AsString:= formatfloat('0.00',qry_conhecimento_calc_master_cc.Asfloat + strtofloat(qry_conhecimento_calc_tt_frete_cc.AsString));

  if qry_conhecimento_calc_master_cc.AsString = '0' then qry_conhecimento_calc_master_cc.AsString:= ' ';
  if qry_conhecimento_calc_master_pp.AsString = '0' then qry_conhecimento_calc_master_pp.AsString:= ' ';

  if qry_conhecimento_in_per_agreement.AsString = '1' then
  qry_conhecimento_calc_in_per_agreement.AsString := 'AS PER AGREEMENT';

end;

procedure Tfrm_emissao_conhec.SpeedButton2Click(Sender: TObject);
begin
font_meno.Execute;

dbmemo_nature.Font.Color:=font_meno.Font.Color;
dbmemo_nature.Font.Size :=font_meno.Font.Size;


end;

procedure Tfrm_emissao_conhec.qry_conhecimento_AfterPost(
  DataSet: TDataSet);
begin
qry_conhecimento_.ApplyUpdates;
end;

procedure Tfrm_emissao_conhec.DBMemo5Change(Sender: TObject);
begin
  if qry_conhecimento_.State in [dsEdit] then
    begin
     btn_salvar.Enabled:=true;
     btn_cancelar.Enabled:=true;
     mi_salvar.Enabled:=true;
     mi_Cancelar.Enabled:=true;
    end;
end;

procedure Tfrm_emissao_conhec.btn_salvarClick(Sender: TObject);
begin
  if qry_conhecimento_.State in [dsEdit] then
    begin
      qry_conhecimento_.Post;
      btn_salvar.Enabled:=false;
      btn_cancelar.Enabled:=false;
      mi_salvar.Enabled:=false;
      mi_Cancelar.Enabled:=false;
    end;
end;

function Tfrm_emissao_conhec.st_volumes: String;
var texto_houses, texto_dimensao:String;
  HOUSES, DIMENSAO:TQuery;
begin
 texto_houses:= ' CONSOLIDATED CARGO AS '+ #13#10+
         ' PER ATTACHED MANIFEST'+#13#10;

 HOUSES:= TQuery.Create(Application);
 HOUSES.DataBaseName:='DBBROKER';
 HOUSES.sql.Add(' SELECT CD_MASTER, CD_HOUSE, NR_PROCESSO, NR_HOUSE FROM THOUSE');
 HOUSES.sql.Add('  WHERE CD_MASTER = "'+st_cd_master+'"');
 HOUSES.Open;

 texto_houses := texto_houses + ' HAWB:  ';

 DIMENSAO:= TQuery.Create(Application);
 DIMENSAO.DataBaseName:='DBBROKER';

 while NOT(HOUSES.EOF) do
  begin
   texto_houses := texto_houses + HOUSES.Fields[3].AsString + #13#10;

   DIMENSAO.Sql.Clear;
   DIMENSAO.sql.Add(' SELECT NR_PROCESSO, CD_CARGA, QTDE, VL_COMPR, VL_LARG, ');
   DIMENSAO.sql.Add(' VL_ALT FROM TINSTRUCAO_CARGA  ');
   DIMENSAO.sql.Add('  WHERE NR_PROCESSO = "'+HOUSES.Fields[2].AsString+'"');
   DIMENSAO.Open;
   texto_dimensao := ' DIMS: ';
   while not(DIMENSAO.EOf) do
    begin
      texto_dimensao:= texto_dimensao + floattostr(DIMENSAO.Fields[3].AsFloat * 100) + ' X '+
                                        floattostr(DIMENSAO.Fields[4].AsFloat * 100) + ' X '+
                                        floattostr(DIMENSAO.Fields[5].AsFloat * 100) + ' ';

      texto_dimensao:= texto_dimensao + 'CM('+ floattostr(DIMENSAO.Fields[2].AsFloat)+ ')';

     DIMENSAO.Next;
    end;
   HOUSES.Next;
  end;

  st_volumes:= texto_houses + texto_dimensao;
end;

procedure Tfrm_emissao_conhec.btn_cancelarClick(Sender: TObject);
begin
   if qry_conhecimento_.State in [dsEdit] then
    begin
     qry_conhecimento_.Cancel;
     btn_salvar.Enabled:=false;
     btn_cancelar.Enabled:=false;
     mi_salvar.Enabled:=false;
     mi_Cancelar.Enabled:=false;
    end;
end;

procedure Tfrm_emissao_conhec.btn_designClick(Sender: TObject);
begin
   {ppReport.Template.FileName := cDir_RPT + ReportFileName;
   ppReport.Template.LoadFromFile;
   ppReport.DeviceType := 'Screen';
   ppDesigner.ShowModal;}
   ppDesigner.Report.Template.FileName :=cDir_RPT +  '\Conhecimento_Mawb.rtm';
   ppDesigner.Report.Template.LoadFromFile;
   ppDesigner.Report.DeviceType := 'Screen';
   ppDesigner.ShowModal;


end;

procedure Tfrm_emissao_conhec.btn_imprimirClick(Sender: TObject);
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
 pp_conhecimento.Template.FileName := cDir_RPT + '\Conhecimento_Mawb.rtm';
 pp_conhecimento.Template.LoadFromFile;
 pp_conhecimento.Template.FileName := cDir_RPT + '\Conhecimento_Mawb.rtm';
 pp_conhecimento.Print;

 if (in_integracao_contabil = '1')and (qry_conhecimento_NR_CONTA_CONTABIL.AsString = '') then
   begin
    try
    datm_main.db_broker.StartTransaction;
   //BUSCA CONTA CONTABIL PARA agente
//    executa_proc_rm(qry_conhecimento_CD_AGENTE.AsString, qry_conhecimento_NM_AGENTE.AsString, qry_conhecimento_CD_MOEDA.AsString, 5);
   //BUSCA CONTA CONTABIL PARA MASTER
//    executa_proc_rm(qry_conhecimento_CD_MASTER.AsString,
//            'Proc. '+Copy(qry_conhecimento_CD_MASTER.AsString,1,6 )+ '-' +
//                     Copy(qry_conhecimento_CD_MASTER.AsString,7,8 ), '', 3);

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

procedure Tfrm_emissao_conhec.FormCreate(Sender: TObject);
begin
if str_cd_cargo = '001' then
 begin
  btn_design.Visible:=true;
   mi_Designe.Visible:=true;
 end;
end;

end.
