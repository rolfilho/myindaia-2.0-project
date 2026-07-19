(*******************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGSM270.PAS - datm_instrucao_embarque

AUTOR: José Roberto

DATA: 10/09/02

Titulo: Itens de Cubagem


********************************************************************************)


unit dEmissaoRemessa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE;

type
  Tdatm_emissao_remessa = class(TDataModule)
    qry_remessa_: TQuery;
    qry_remessa_NR_REMESSA: TStringField;
    qry_remessa_CD_AGENTE: TStringField;
    qry_remessa_CD_MOEDA: TStringField;
    qry_remessa_IN_EMISSAO: TStringField;
    qry_remessa_VL_BANCO: TFloatField;
    qry_remessa_VL_CORRETORA: TFloatField;
    qry_remessa_VL_TOTAL: TFloatField;
    qry_remessa_VL_MOEDA: TFloatField;
    qry_remessa_VL_TOTAL_REAL: TFloatField;
    qry_remessa_DT_REMESSA: TDateTimeField;
    qry_remessa_DT_ENVIO_REMESSA: TDateTimeField;
    qry_remessa_NM_AGENTE: TStringField;
    qry_remessa_AP_MOEDA: TStringField;
    ds_remessa: TDataSource;
    qry_remessa_calc_in_emissao: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_VL_ACCOUNT: TFloatField;
    qry_processo_CD_ORIGEM: TStringField;
    qry_processo_CD_DESTINO: TStringField;
    qry_processo_NM_ORIGEM: TStringField;
    qry_processo_NM_DESTINO: TStringField;
    ds_processo: TDataSource;
    qry_processo_NM_CLIENTE: TStringField;
    UpADte_remessa: TUpdateSQL;
    qry_remessa_NR_CONTRATO_CAMBIO: TStringField;
    qry_remessa_CD_BANCO: TStringField;
    qry_remessa_NM_BANCO: TStringField;
    sp_distribui_remessa_AG: TStoredProc;
    qry_remessa_CD_VIA_TRANSP: TStringField;
    qry_remessa_NM_VIA_TRANSP: TStringField;
    dsRelER: TDataSource;
    qryRelER: TQuery;
    ppRelER: TppBDEPipeline;
    dsRelERTotal: TDataSource;
    qryRelERTotal: TQuery;
    ppRelERTotal: TppBDEPipeline;
    qryRelERTITULO1: TStringField;
    qryRelERNM_UNID_NEG: TStringField;
    qryRelERENDERECO_UNID: TStringField;
    qryRelERTEL_UNID: TStringField;
    qryRelERFAX_UNID: TStringField;
    qryRelERCAMPO1: TStringField;
    qryRelERCAMPO2: TStringField;
    qryRelERCAMPO3: TStringField;
    qryRelERCAMPO4: TStringField;
    qryRelERAP_MOEDA: TStringField;
    qryRelERNOME_AGENTE: TStringField;
    qryRelERNM_BANCO: TStringField;
    qryRelEREND_BANCO: TStringField;
    qryRelEREND_BANCO2: TStringField;
    qryRelERNOME_NAVIO: TStringField;
    qryRelERNR_HOUSE: TStringField;
    qryRelERNR_MASTER: TStringField;
    qryRelERCD_INCOTERM: TStringField;
    qryRelERVALOR_CC: TFloatField;
    qryRelERVALOR_REMESSA: TFloatField;
    qryRelERVALOR_DEDUCAO: TFloatField;
    qryRelERNR_PAGINA: TIntegerField;
    qryRelERNR_LINHA: TIntegerField;
    qryRelERTotalTOTAL_CC: TFloatField;
    qryRelERTotalTOTAL_REMESSA: TFloatField;
    qryRelERTotalTOTAL_DEDUCAO: TFloatField;
    qryRelERNR_CONTA_1: TStringField;
    qryRelERST_ROUTING_INF: TStringField;
    qryRelERST_SWIFT_1: TStringField;
    ppRelERppField24: TppField;
    ppRelERppField25: TppField;
    ppRelERppField26: TppField;
    procedure qry_remessa_CalcFields(DataSet: TDataSet);
    procedure qry_remessa_AfterScroll(DataSet: TDataSet);
    procedure qry_remessa_AfterPost(DataSet: TDataSet);
    procedure qry_remessa_VL_MOEDAChange(Sender: TField);
//S    procedure qry_rel_remessa_CalcFields(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_emissao_remessa: Tdatm_emissao_remessa;

implementation
uses
 GSMLIB,PGGP001,uEmissaoRemessa;
{$R *.DFM}


procedure Tdatm_emissao_remessa.qry_remessa_CalcFields(DataSet: TDataSet);
begin
 if qry_remessa_IN_EMISSAO.AsString = '0' then
    qry_remessa_calc_in_emissao.AsString:='Aberto'
 else qry_remessa_calc_in_emissao.AsString:='Enviado';
end;

procedure Tdatm_emissao_remessa.qry_remessa_AfterScroll(DataSet: TDataSet);
begin
  if qry_remessa_IN_EMISSAO.AsString = '1' then
    begin
     frm_emissao_remessa.dbedt_dt_emissao.visible:=true;
     frm_emissao_remessa.lb_dt_remessa.visible:=true;
     frm_emissao_remessa.dbedt_vl_moeda.ReadOnly:=true;
     frm_emissao_remessa.dbedt_vl_moeda.Color:=clMenu;
     frm_emissao_remessa.dbedt_nr_contrato.ReadOnly:=true;
     frm_emissao_remessa.dbedt_nr_contrato.Color:=clMenu;
    end
  else
    begin
     frm_emissao_remessa.dbedt_dt_emissao.visible:=false;
     frm_emissao_remessa.lb_dt_remessa.visible:=false;
     frm_emissao_remessa.dbedt_vl_moeda.ReadOnly:=false;
     frm_emissao_remessa.dbedt_vl_moeda.Color:=clWindow;
     frm_emissao_remessa.dbedt_nr_contrato.ReadOnly:=false;
     frm_emissao_remessa.dbedt_nr_contrato.Color:=clWindow;
    end;

end;

procedure Tdatm_emissao_remessa.qry_remessa_AfterPost(DataSet: TDataSet);
begin
qry_remessa_.ApplyUpDAtes;
end;

procedure Tdatm_emissao_remessa.qry_remessa_VL_MOEDAChange(Sender: TField);
begin
  qry_remessa_VL_TOTAL_REAL.AsFloat:=ABS(qry_remessa_VL_TOTAL.AsFloat * qry_remessa_VL_MOEDA.Asfloat);
end;

{procedure Tdatm_emissao_remessa.qry_rel_remessa_CalcFields(
  DataSet: TDataSet);
var cont:integer;
  soma:real;
begin

 qry_rel_remessa_calc_nm_moeda.AsString    := qry_remessa_AP_MOEDA.AsString;
 qry_rel_remessa_calc_cd_moeda.AsString    := qry_remessa_CD_MOEDA.AsString;
 qry_rel_remessa_calc_nr_contrato.AsString := qry_remessa_NR_CONTRATO_CAMBIO.AsString;
 qry_rel_remessa_calc_cd_banco.AsString    := qry_remessa_CD_BANCO.AsString;
 qry_rel_remessa_nr_remessa.AsString       := qry_remessa_NR_REMESSA.AsString;
 qry_rel_remessa_calc_nm_agente.AsString   := qry_remessa_NM_AGENTE.AsString;
 cont:=1;
 soma:=0;
 with TQuery.Create(application) do
   begin
    DataBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.VL_ACCOUNT, P.CD_MOEDA_FRETE, ');
    Sql.Add('(SELECT M.AP_MOEDA FROM TMOEDA_BROKER M WHERE M.CD_MOEDA = P.CD_MOEDA_FRETE)AP_MOEDA, ');
    Sql.Add(' (SELECT U.NM_UNID_NEG FROM TUNID_NEG U WHERE U.CD_UNID_NEG = P.CD_UNID_NEG)NM_UNID_NEG, ');
    Sql.Add(' (SELECT cgc = CASE ');
    Sql.Add('               WHEN E.CD_TIPO_PESSOA = "2" THEN E.CPF_EMPRESA ');
    Sql.Add('             ELSE E.CGC_EMPRESA ');
    Sql.Add('         END ');
    Sql.Add('  FROM TEMPRESA_NAC E WHERE E.CD_EMPRESA = P.CD_CLIENTE)CGC_CPF_CLIENTE ');
    Sql.Add(' FROM TREMESSA_PROCESSO R, TPROCESSO P ');
    Sql.Add(' LEFT JOIN THOUSE H ON(H.NR_PROCESSO = P.NR_PROCESSO) ');
    Sql.Add(' WHERE  R.NR_REMESSA = "'+qry_remessa_NR_REMESSA.AsString+'" ');
    Sql.Add(' AND R.NR_PAGINA = "'+qry_rel_remessa_NR_PAGINA.AsString+'" ');
    Sql.Add(' AND R.NR_PROCESSO = P.NR_PROCESSO AND P.VL_ACCOUNT > 0 ');
    Open;
    while not(EOF) do
     begin
      qry_rel_remessa_.FieldByname('calc_processo'+ inttostr(cont)).AsString       := Fields[0].AsString;
      qry_rel_remessa_.FieldByname('calc_vl_account'+ inttostr(cont)).AsFloat      := ABS(Fields[2].AsFloat);
      qry_rel_remessa_.FieldByname('calc_cgc_cfp_cliente'+ inttostr(cont)).AsString:= Fields[6].AsString;
      cont:= cont + 1;
      soma:= soma  + Fields[2].AsFloat;
      if Cont > 15 then
       begin
        qry_rel_remessa_calc_soma_quadro1.AsString:='';
        qry_rel_remessa_calc_soma_quadro2.AsString:=FormatFloat('0.00',soma);
         if Cont > 30 then
          begin
            qry_rel_remessa_calc_soma_quadro1.AsString:='';
            qry_rel_remessa_calc_soma_quadro2.AsString:='';
            qry_rel_remessa_calc_soma_quadro3.AsString:=FormatFloat('0.00',soma);
          end;
       end
      else
       begin
        qry_rel_remessa_calc_soma_quadro2.AsString:='';
        qry_rel_remessa_calc_soma_quadro1.AsString:=FormatFloat('0.00',soma);
       end;
      Next;
     end;
    Free;
   end;
   qry_rel_remessa_calc_vl_tt_remessa.AsString:=FormatFloat('0.00',soma);
end;  }

end.
