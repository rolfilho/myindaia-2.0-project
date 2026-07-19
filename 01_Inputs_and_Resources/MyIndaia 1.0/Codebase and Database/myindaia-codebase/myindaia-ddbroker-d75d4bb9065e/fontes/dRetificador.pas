unit dRetificador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants, Db, DBTables, Math, ConsOnlineEx;

type
  Tdatm_retifica = class(TDataModule)
    qry_pesquisa_: TQuery;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_NM_PRODUTO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_traz_default_NM_USUARIO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_processo_NM_CLIENTE: TStringField;
    qry_processo_VL_PESO_BRUTO: TFloatField;
    qry_processo_CHARGEABLE: TFloatField;
    qry_processo_VL_TARIFA_FRETE: TFloatField;
    qry_processo_VL_FRETE: TFloatField;
    qry_processo_VL_OTHER_CHARGE: TFloatField;
    qry_processo_VL_HOUSE: TFloatField;
    ds_processo: TDataSource;
    qry_vl_brasil_: TQuery;
    qry_vl_other_: TQuery;
    ds_vl_brasil: TDataSource;
    ds_vl_other: TDataSource;
    qry_vl_other_CD_ITEM: TStringField;
    qry_vl_other_TP_BASE_CALCULO: TStringField;
    qry_vl_other_VL_VENDA: TFloatField;
    qry_vl_other_VL_BASE_CLI: TFloatField;
    qry_vl_other_NM_ITEM: TStringField;
    qry_vl_other_NM_TP_CALC: TStringField;
    Update_other: TUpdateSQL;
    qry_vl_other_NR_PROCESSO: TStringField;
    qry_vl_other_CD_DESP: TStringField;
    qry_vl_brasil_NR_PROCESSO: TStringField;
    qry_vl_brasil_CD_DESP: TStringField;
    qry_vl_brasil_CD_ITEM: TStringField;
    qry_vl_brasil_NM_ITEM: TStringField;
    qry_vl_brasil_TP_BASE_CALCULO: TStringField;
    qry_vl_brasil_IN_REPASSA: TStringField;
    qry_vl_brasil_VL_COMPRA_AG: TFloatField;
    qry_vl_brasil_IN_PROFIT: TStringField;
    qry_vl_brasil_VL_VENDA: TFloatField;
    qry_vl_brasil_VL_BASE_CLI: TFloatField;
    qry_vl_brasil_CD_MOEDA_VENDA: TStringField;
    qry_vl_brasil_VL_CUSTO_EST: TFloatField;
    qry_vl_brasil_AP_MOEDA: TStringField;
    qry_vl_brasil_NM_TP_CALC: TStringField;
    qry_vl_brasil_calc_profit: TStringField;
    qry_vl_brasil_calc_repassa: TStringField;
    qry_despesa_house_: TQuery;
    Update_vl_brasil: TUpdateSQL;
    ds_despesa_house: TDataSource;
    UpDate_despesa_house: TUpdateSQL;
    qry_despesa_house_NR_PROCESSO: TStringField;
    qry_despesa_house_CD_DESP: TStringField;
    qry_despesa_house_CD_ITEM: TStringField;
    qry_despesa_house_TP_BASE_CALCULO: TStringField;
    qry_despesa_house_CD_MOEDA: TStringField;
    qry_despesa_house_VL_COMPRA_AG: TFloatField;
    qry_despesa_house_VL_BASE_AG: TFloatField;
    qry_despesa_house_NM_TP_CALC: TStringField;
    qry_despesa_house_NM_ITEM: TStringField;
    qry_despesa_house_AP_MOEDA: TStringField;
    qry_processo_CUBAGEM: TFloatField;
    qry_processo_VL_TT_VENDA: TFloatField;
    qry_processo_CD_VIA_TRANSPORTE: TStringField;
    UpDAte_processo: TUpdateSQL;
    qry_processo_carga_: TQuery;
    ds_processo_carga: TDataSource;
    qry_processo_carga_NR_PROCESSO: TStringField;
    qry_processo_carga_CD_CARGA: TStringField;
    qry_processo_carga_QTDE: TFloatField;
    qry_processo_carga_VL_COMPR: TFloatField;
    qry_processo_carga_VL_LARG: TFloatField;
    qry_processo_carga_CD_VIA_TRANSP: TStringField;
    qry_processo_carga_TP_ESTUFAGEM: TStringField;
    qry_processo_carga_VL_ALT: TFloatField;
    qry_processo_carga_PESO_TON: TFloatField;
    qry_processo_carga_CUBAGEM_VENDA: TFloatField;
    qry_processo_carga_PESO_VOLUMETRICO: TFloatField;
    qry_processo_carga_TP_EMBALAGEM: TStringField;
    qry_processo_carga_NM_EMBALAGEM: TStringField;
    qry_processo_cntr_: TQuery;
    ds_proc_cntr: TDataSource;
    qry_processo_cntr_NR_PROCESSO: TStringField;
    qry_processo_cntr_NR_CNTR: TStringField;
    qry_processo_cntr_CODIGO: TStringField;
    qry_processo_cntr_TP_CNTR: TStringField;
    qry_processo_cntr_NR_LACRE: TStringField;
    qry_processo_cntr_VL_VENDA: TFloatField;
    qry_processo_cntr_VL_PESO_TON: TFloatField;
    qry_processo_cntr_TP_FRETE: TStringField;
    UpDAte_proc_cntr: TUpdateSQL;
    qry_processo_TP_ESTUFAGEM: TStringField;
    Update_proc_carga: TUpdateSQL;
    qry_processo_QTD_VOLUME: TFloatField;
    qry_processo_cntr_NM_CNTR: TStringField;
    qry_processo_AP_MOEDA: TStringField;
    qry_vl_other_NR_NOTICACAO: TStringField;
    qry_processo_TP_SERVICO: TStringField;
    qry_processo_IN_PEDIDO: TStringField;
    qry_processo_CD_MOEDA_FRETE: TStringField;
    qry_processo_CD_ORIGEM: TStringField;
    qry_processo_NM_ORIGEM: TStringField;
    qry_processo_CD_DESTINO: TStringField;
    qry_processo_NM_DESTINO: TStringField;
    qry_processo_CD_AGENTE: TStringField;
    qry_processo_NM_AGENTE: TStringField;
    qry_processo_CD_CIA_TRANSP: TStringField;
    qry_processo_NM_CIA: TStringField;
    qry_processo_CD_ARMADOR: TStringField;
    qry_processo_NM_ARMADOR: TStringField;
    qry_processo_TP_PROCESSO: TStringField;
    qry_proc_relacionados_: TQuery;
    ds_proc_relacionados: TDataSource;
    qry_proc_relacionados_CD_MASTER: TStringField;
    qry_proc_relacionados_NR_MASTER: TStringField;
    qry_proc_relacionados_CD_HOUSE: TStringField;
    qry_proc_relacionados_NR_HOUSE: TStringField;
    qry_proc_relacionados_NR_PROCESSO: TStringField;
    qry_proc_relacionados_NM_CLIENTE: TStringField;
    qry_house_: TQuery;
    qry_house_CD_MASTER: TStringField;
    qry_house_NR_MASTER: TStringField;
    qry_house_CD_HOUSE: TStringField;
    qry_house_NR_HOUSE: TStringField;
    qry_house_NR_PROCESSO: TStringField;
    ds_house: TDataSource;
    qry_processo_cntr_VL_CUBAGEM: TFloatField;
    qry_proc_relacionados_calc_processo: TStringField;
    qry_processo_TP_PRODUTO: TStringField;
    qry_processo_CD_LOCAL_CONSOLIDACAO: TStringField;
    qry_processo_NM_CONSOLIDACAO: TStringField;
    qry_processo_carga_calcEMBALAGEM: TStringField;
    qry_vl_other_calcItem: TStringField;
    qry_vl_brasil_calcItem: TStringField;
    qry_vl_brasil_calcMoeda: TStringField;
    qry_despesa_house_calcItem: TStringField;
    qry_despesa_house_calcMoeda: TStringField;
    procedure qry_vl_other_AfterPost(DataSet: TDataSet);
    procedure qry_vl_other_NewRecord(DataSet: TDataSet);
    procedure qry_vl_brasil_CalcFields(DataSet: TDataSet);
    procedure qry_vl_brasil_NewRecord(DataSet: TDataSet);
    procedure qry_vl_brasil_AfterPost(DataSet: TDataSet);
    procedure qry_despesa_house_AfterPost(DataSet: TDataSet);
    procedure qry_despesa_house_NewRecord(DataSet: TDataSet);
    procedure qry_vl_brasil_VL_BASE_CLIChange(Sender: TField);
    procedure qry_vl_other_VL_BASE_CLIChange(Sender: TField);
    procedure qry_despesa_house_VL_BASE_AGChange(Sender: TField);
    procedure qry_processo_CHARGEABLEChange(Sender: TField);
    procedure qry_processo_VL_FRETEChange(Sender: TField);
    procedure calc_total_other;
    procedure qry_processo_AfterPost(DataSet: TDataSet);
    procedure qry_processo_cntr_AfterPost(DataSet: TDataSet);
    procedure qry_processo_carga_AfterPost(DataSet: TDataSet);
    procedure qry_processo_carga_NewRecord(DataSet: TDataSet);
    procedure calc_total_carga_lcl;
    procedure calc_total_carga_Fcl;
    procedure qry_proc_relacionados_CalcFields(DataSet: TDataSet);
    procedure qry_processo_CD_CIA_TRANSPChange(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure qry_processo_AfterOpen(DataSet: TDataSet);
    procedure qry_processo_AfterCancel(DataSet: TDataSet);
    procedure qry_processo_carga_BeforePost(DataSet: TDataSet);
    procedure qry_processo_carga_CalcFields(DataSet: TDataSet);
    procedure qry_vl_other_BeforePost(DataSet: TDataSet);
    procedure qry_vl_other_CalcFields(DataSet: TDataSet);
    procedure qry_vl_brasil_BeforePost(DataSet: TDataSet);
    procedure qry_despesa_house_BeforePost(DataSet: TDataSet);
    procedure qry_despesa_house_CalcFields(DataSet: TDataSet);


  private
    { Private declarations }
    vPreencheu1, vPreencheu2, vPreencheu3, vPreencheu4: Boolean;
  public
    { Public declarations }
    in_change_cia    :Boolean;
    function calc_tp_base(const tp_base:String; vl_base:real):real;
    Function verifica_qtde_conhecimento(const cia: String):Boolean;
    procedure in_account;
    procedure atz_dados;
    Function alt_conhecimento_cia: String;
  end;

var
  datm_retifica: Tdatm_retifica;

implementation

uses GSMLIB, PGGP017, PGGP001, Funcoes;

{$R *.DFM}

procedure Tdatm_retifica.qry_vl_other_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu2 then
    qry_vl_other_.ApplyUpdates
  else
    ShowMessage('Os dados são inconsistentes. Operação Cancelada!');

  calc_total_other;
  qry_vl_other_.Close;
  qry_vl_other_.ParamByName('NR_PROCESSO').AsString:=datm_retifica.qry_processo_NR_PROCESSO.AsString;
  qry_vl_other_.Prepare;
  qry_vl_other_.Open;
  qry_vl_other_.Last;
end;

procedure Tdatm_retifica.qry_vl_other_NewRecord(DataSet: TDataSet);
begin
qry_vl_other_.Cancel;
end;

procedure Tdatm_retifica.qry_vl_brasil_CalcFields(DataSet: TDataSet);
begin
  if qry_vl_brasil_IN_PROFIT.AsString = '0' then
    qry_vl_brasil_calc_profit.AsString:='Não';

  if qry_vl_brasil_IN_PROFIT.AsString = '1' then
    qry_vl_brasil_calc_profit.AsString:='Sim';


  if qry_vl_brasil_IN_REPASSA.AsString = '5' then
     qry_vl_brasil_calc_repassa.AsString:='Agente';
  if qry_vl_brasil_IN_REPASSA.AsString = '6' then
     qry_vl_brasil_calc_repassa.AsString:='Cliente';
  if qry_vl_brasil_IN_REPASSA.AsString = '9' then
     qry_vl_brasil_calc_repassa.AsString:='Não Cobrar';

  qry_vl_brasil_calcItem.AsString := ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM (NOLOCK) WHERE CD_ITEM = "' + qry_vl_brasil_CD_ITEM.AsString + '" ' +
                                                          ' AND TP_ITEM = "1" ', 'NM_ITEM');
  qry_vl_brasil_calcMoeda.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', qry_vl_brasil_CD_MOEDA_VENDA.AsString, 'NM_MOEDA');



end;

procedure Tdatm_retifica.qry_vl_brasil_NewRecord(DataSet: TDataSet);
begin
qry_vl_brasil_.CAncel;
end;

procedure Tdatm_retifica.qry_vl_brasil_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu3 then
    qry_vl_brasil_.ApplyUpdates
  else
    ShowMessage('Os dados são inconsistentes. Operação Cancelada!');
  qry_vl_brasil_.Close;
  qry_vl_brasil_.ParamByName('NR_PROCESSO').AsString:=datm_retifica.qry_processo_NR_PROCESSO.AsString;
  qry_vl_brasil_.Prepare;
  qry_vl_brasil_.Open;
  qry_vl_brasil_.Last;

end;

procedure Tdatm_retifica.qry_despesa_house_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu4 then
    qry_despesa_house_.ApplyUpdates
  else
    ShowMessage('Os dados são inconsistentes. Operação Cancelada!');

  qry_despesa_house_.Close;
  qry_despesa_house_.ParamByName('NR_PROCESSO').AsString:=datm_retifica.qry_processo_NR_PROCESSO.AsString;
  qry_despesa_house_.Prepare;
  qry_despesa_house_.Open;
  qry_despesa_house_.Last;
end;

procedure Tdatm_retifica.qry_despesa_house_NewRecord(DataSet: TDataSet);
begin
qry_despesa_house_.Cancel;
end;

function Tdatm_retifica.calc_tp_base(const tp_base: String; vl_base: real): real;
begin
  if tp_base = '01' then
  begin
    calc_tp_base:=(qry_processo_VL_FRETE.AsFloat * vl_base)/100;
  end;
  if tp_base = '02' then
  begin
   calc_tp_base:=(qry_processo_VL_HOUSE.AsFloat * vl_base)/100;
  end;
  if tp_base = '03' then
  begin
    calc_tp_base := vl_base;
  end;
 {if tp_base = '04' then  //
  begin
     valor :=(datm_calc_profit.qry_master_CHARG_MASTER.AsFloat * vl_base);
     calc_tp_base:=valor;
  end;}
  if tp_base = '05' then
  begin
     calc_tp_base :=(qry_processo_CHARGEABLE.AsFloat * vl_base);
  end;
  if tp_base = '06' then
  begin
     calc_tp_base:=(qry_processo_CUBAGEM.AsFloat * vl_base);
  end;
  if tp_base = '07' then
  begin
     calc_tp_base:=(qry_processo_VL_PESO_BRUTO.AsFloat)/1000 * vl_base;
  end;
  if (tp_base = '10') and (qry_processo_TP_ESTUFAGEM.AsString = '1')then   // POR CNTR
  begin
    calc_tp_base:= qry_processo_QTD_VOLUME.AsFloat * vl_base;
  end;
  if (tp_base = '11')and (qry_processo_TP_ESTUFAGEM.AsString = '1') then   // POR CNTR 20
  begin
  With Tquery.Create(Application) do
          begin
           DataBaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add('SELECT ISNULL(COUNT(TP.NR_PROCESSO),0) FROM TPROCESSO_CNTR TP ');
           Sql.Add(' WHERE TP.NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+'"');
           Sql.Add('AND TP.TP_CNTR IN(SELECT TC.TP_CNTR FROM TTP_CNTR TC WHERE TC.TP_PESO = "1")');
           Open;
           calc_tp_base := vl_base * Fields[0].AsFloat;
           Free;
          end;
  end;
  if (tp_base = '12')and (qry_processo_TP_ESTUFAGEM.AsString = '1') then   //POR CNTR 40
  begin
    With Tquery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT ISNULL(COUNT(TP.NR_PROCESSO),0) FROM TPROCESSO_CNTR TP ');
      Sql.Add(' WHERE TP.NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+'"');
      Sql.Add('AND TP.TP_CNTR IN(SELECT TC.TP_CNTR FROM TTP_CNTR TC WHERE TC.TP_PESO = "2")');
      Open;
      calc_tp_base := vl_base * Fields[0].AsFloat;
      Free;
    end;
  end;
  if tp_base = '16' then
  begin
     calc_tp_base:=(qry_processo_VL_PESO_BRUTO.AsFloat)* vl_base;
  end;


end;

procedure Tdatm_retifica.qry_vl_brasil_VL_BASE_CLIChange(Sender: TField);
begin
qry_vl_brasil_VL_VENDA.AsFloat:= calc_tp_base(qry_vl_brasil_TP_BASE_CALCULO.AsString,
                                                 qry_vl_brasil_VL_BASE_CLI.AsFloat);
end;

procedure Tdatm_retifica.qry_vl_other_VL_BASE_CLIChange(Sender: TField);
begin
qry_vl_other_VL_VENDA.AsFloat:= calc_tp_base(qry_vl_other_TP_BASE_CALCULO.AsString,
                                                 qry_vl_other_VL_BASE_CLI.AsFloat);
end;

procedure Tdatm_retifica.qry_despesa_house_VL_BASE_AGChange(
  Sender: TField);
begin
qry_despesa_house_VL_COMPRA_AG.AsFloat:= calc_tp_base(qry_despesa_house_TP_BASE_CALCULO.AsString,
                                                 qry_despesa_house_VL_BASE_AG.AsFloat);
end;

procedure Tdatm_retifica.qry_processo_CHARGEABLEChange(Sender: TField);
begin
  if (qry_processo_CD_VIA_TRANSPORTE.AsString = '04') or
    ((qry_processo_CD_VIA_TRANSPORTE.AsString = '01') and (qry_processo_TP_ESTUFAGEM.AsString = '0')) then
       qry_processo_VL_FRETE.AsFloat:= qry_processo_VL_TARIFA_FRETE.AsFloat  * qry_processo_CHARGEABLE.AsFloat;
end;

procedure Tdatm_retifica.qry_processo_VL_FRETEChange(Sender: TField);
begin
// if qry_processo_CD_VIA_TRANSPORTE.AsString = '04' then
//  begin
    qry_processo_VL_HOUSE.AsFloat:= qry_processo_VL_FRETE.AsFloat  + qry_processo_VL_OTHER_CHARGE.AsFloat;
    qry_processo_VL_TT_VENDA.AsFloat:=qry_processo_VL_HOUSE.AsFloat;
//  end;
end;

procedure Tdatm_retifica.calc_total_other;
var
 BookMark:TBookMark;
 vl_other:real;
begin
  vl_other:=0;

  BookMark:=qry_vl_other_.GetBookmark;
   qry_vl_other_.DisableControls;
   qry_vl_other_.First;
   while not (qry_vl_other_.EOF) do
    begin
      vl_other:= vl_other + qry_vl_other_VL_VENDA.AsFloat;
      qry_vl_other_.Next;
    end;
   qry_vl_other_.GotoBookmark(BookMark);
   qry_vl_other_.FreeBookmark(BookMark);
   qry_vl_other_.EnableControls;

   if not (qry_processo_.State in[dsEdit]) then
    begin
     qry_processo_.Edit;
     qry_processo_VL_OTHER_CHARGE.AsFloat:=vl_other;
     datm_main.db_broker.StartTransaction;
     qry_processo_.Post;
     in_account;
     datm_main.db_broker.Commit;
    end
   else
    begin
     qry_processo_VL_OTHER_CHARGE.AsFloat:=vl_other;
    end;
end;

procedure Tdatm_retifica.qry_processo_AfterPost(DataSet: TDataSet);
begin
qry_processo_.ApplyUpDates;
end;

procedure Tdatm_retifica.qry_processo_cntr_AfterPost(DataSet: TDataSet);
begin
qry_processo_cntr_.ApplyUpdates;

end;

procedure Tdatm_retifica.qry_processo_carga_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu1 then
    qry_processo_carga_.ApplYUpdates
  else
    ShowMessage('Os dados são inconsistentes. Operação Cancelada!');

  calc_total_carga_lcl;
  qry_processo_carga_.Close;
  qry_processo_carga_.ParamByName('NR_PROCESSO').AsString:=datm_retifica.qry_processo_NR_PROCESSO.AsString;
  qry_processo_carga_.Prepare;
  qry_processo_carga_.Open;
  qry_processo_carga_.Last;
end;

procedure Tdatm_retifica.qry_processo_carga_NewRecord(DataSet: TDataSet);
begin
// KL - RETIRAR!!
// qry_processo_carga_.Cancel;
end;

procedure Tdatm_retifica.calc_total_carga_lcl;
var
 BookMark:TBookMark;
 vl_qtde,vl_cubagem,vl_ton:real;
begin
  vl_qtde:=0; vl_cubagem:=0;vl_ton:=0;

  BookMark:=qry_processo_carga_.GetBookmark;
   qry_processo_carga_.DisableControls;
   qry_processo_carga_.First;
   while not (qry_processo_carga_.EOF) do
    begin
    vl_qtde:=vl_qtde + qry_processo_carga_QTDE.AsFloat;
    vl_ton:=vl_ton + qry_processo_carga_PESO_TON.AsFloat;
    vl_cubagem:=vl_cubagem + qry_processo_carga_PESO_VOLUMETRICO.AsFloat;
    qry_processo_carga_.Next;
    end;
   qry_processo_carga_.GotoBookmark(BookMark);
   qry_processo_carga_.FreeBookmark(BookMark);
   qry_processo_carga_.EnableControls;

   if not (qry_processo_.State in[dsEdit]) then
    begin
     qry_processo_.Edit;
     qry_processo_QTD_VOLUME.AsFloat:=vl_qtde;
     qry_processo_VL_PESO_BRUTO.AsFloat:=vl_ton;
     qry_processo_CUBAGEM.AsFloat:=vl_cubagem;
     qry_processo_CHARGEABLE.AsFloat:=max(vl_ton,vl_cubagem);
     datm_main.db_broker.StartTransaction;
     qry_processo_.Post;
     in_account;
     datm_main.db_broker.Commit;
    end
   else
    begin
     qry_processo_QTD_VOLUME.AsFloat:=vl_qtde;
     qry_processo_VL_PESO_BRUTO.AsFloat:=vl_ton;
     qry_processo_CUBAGEM.AsFloat:=vl_cubagem;
     qry_processo_CHARGEABLE.AsFloat:=max(vl_ton,vl_cubagem);
    end;
end;

procedure Tdatm_retifica.calc_total_carga_Fcl;
 var
  BookMark:TBookMark;
  vl_qtde,vl_venda,vl_ton, vl_cubagem :real;
begin
   vl_qtde:=0; vl_venda:=0;vl_ton:=0; vl_cubagem:=0;

   BookMark:=qry_processo_cntr_.GetBookmark;
   qry_processo_cntr_.DisableControls;
   qry_processo_cntr_.First;
   while not (qry_processo_cntr_.EOF) do
    begin

    vl_qtde   := vl_qtde + 1;
    vl_ton    := vl_ton + qry_processo_cntr_VL_PESO_TON.AsFloat;
    vl_venda  := vl_venda + qry_processo_cntr_VL_VENDA.AsFloat;
    vl_cubagem:= vl_cubagem + qry_processo_cntr_VL_CUBAGEM.AsFloat;

    qry_processo_cntr_.Next;
    end;
    qry_processo_cntr_.GotoBookmark(BookMark);
    qry_processo_cntr_.FreeBookmark(BookMark);
    qry_processo_cntr_.EnableControls;

    if not (qry_processo_.State in[dsEdit]) then
    begin
     qry_processo_.Edit;
     qry_processo_QTD_VOLUME.AsFloat    := vl_qtde;
     qry_processo_VL_PESO_BRUTO.AsFloat := vl_ton;
     qry_processo_VL_FRETE.AsFloat      := vl_venda;
     qry_processo_CUBAGEM.AsFloat       := vl_cubagem;

     datm_main.db_broker.StartTransaction;
     qry_processo_.Post;
     in_account;
     datm_main.db_broker.Commit;
    end
    else
    begin
     qry_processo_QTD_VOLUME.AsFloat    := vl_qtde;
     qry_processo_VL_PESO_BRUTO.AsFloat := vl_ton;
     qry_processo_VL_FRETE.AsFloat      := vl_venda;
    end;
end;

procedure Tdatm_retifica.in_account;
begin
  With TQuery.Create(Application) do
   begin
     DataBaseName:='DBBROKER';
     Sql.Clear;
     Sql.Add(' UPDATE TMASTER SET IN_CALC_PROFIT = "0" ');
     Sql.Add(' WHERE CD_MASTER IN (SELECT TH.CD_MASTER FROM THOUSE TH ');
     Sql.Add(' WHERE TH.NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+'")');
     ExecSql;
     Free;
   end;
end;

procedure Tdatm_retifica.atz_dados;
var DADOS:TQuery;
    alt_conhec:String;
begin
 if (in_change_cia)  and (qry_processo_TP_PRODUTO.AsString = '02') then
    alt_conhec := alt_conhecimento_cia;

 DADOS := TQuery.Create(Application);
 DADOS.DatabaseName := 'DBBROKER';
 DADOS.Sql.Clear;
 DADOS.Sql.Add('UPDATE TMASTER SET ');
 DADOS.Sql.Add(' CD_ORIGEM     = :CD_ORIGEM, ');
 DADOS.Sql.Add(' CD_DESTINO    = :CD_DESTINO, ');
 DADOS.Sql.Add(' CD_CIA_TRANSP = :CD_CIA_TRANSP, ');
 DADOS.Sql.Add(' CD_AGENTE     = :CD_AGENTE,');
 DADOS.Sql.Add(' CD_ARMADOR    = :CD_ARMADOR, ');
 DADOS.Sql.Add(' CD_MOEDA      = :CD_MOEDA ');

 if (in_change_cia)  and (qry_processo_TP_PRODUTO.AsString = '02') then
 DADOS.Sql.Add(' , NR_MASTER   = :NR_MASTER ');

 DADOS.Sql.Add(' FROM TPROCESSO P, TMASTER M, THOUSE H ');
 DADOS.Sql.Add(' WHERE P.NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+'" ');
 DADOS.Sql.Add(' AND P.NR_PROCESSO = H.NR_PROCESSO ');
 DADOS.Sql.Add(' AND H.CD_MASTER = M.CD_MASTER ');

 if qry_processo_TP_PRODUTO.AsString = '01' then
   DADOS.Params[0].AsString := qry_processo_CD_LOCAL_CONSOLIDACAO.AsString
 else
   DADOS.Params[0].AsString := qry_processo_CD_ORIGEM.AsString;

 DADOS.Params[1].AsString := qry_processo_CD_DESTINO.AsString;
 DADOS.Params[2].AsString := qry_processo_CD_CIA_TRANSP.AsString;
 DADOS.Params[3].AsString := qry_processo_CD_AGENTE.AsString;
 DADOS.Params[4].AsString := qry_processo_CD_ARMADOR.AsString;
 DADOS.Params[5].AsString := qry_processo_CD_MOEDA_FRETE.AsString;

 if (in_change_cia)  and (qry_processo_TP_PRODUTO.AsString = '02') then
   DADOS.Params[6].AsString := alt_conhec;
 DADOS.ExecSql;

 if (in_change_cia)  and (qry_processo_TP_PRODUTO.AsString = '02') then
  begin
    DADOS.Sql.Clear;
    DADOS.Sql.Add('UPDATE THOUSE SET  ');
    DADOS.Sql.Add(' NR_MASTER       = :NR_MASTER ');
    DADOS.Sql.Add(' WHERE CD_MASTER = :CD_MASTER ');
    DADOS.Params[0].AsString := alt_conhec;
    DADOS.Params[1].AsString := qry_house_CD_MASTER.AsString;
    DADOS.ExecSql;
  end;                        

 DADOS.Sql.Clear;
 DADOS.Sql.Add('UPDATE TPROCESSO SET  ');
 DADOS.Sql.Add(' CD_LOCAL_CONSOLIDACAO  = P.CD_LOCAL_CONSOLIDACAO, ');
 DADOS.Sql.Add(' CD_ORIGEM       =  P.CD_ORIGEM, ');
 DADOS.Sql.Add(' CD_DESTINO      = P.CD_DESTINO, ');
 DADOS.Sql.Add(' CD_CIA_TRANSP   = P.CD_CIA_TRANSP, ');
 DADOS.Sql.Add(' CD_AGENTE       = P.CD_AGENTE,');
 DADOS.Sql.Add(' CD_ARMADOR      = P.CD_ARMADOR, ');
 DADOS.Sql.Add(' CD_MOEDA_FRETE  = P.CD_MOEDA_FRETE ');
 DADOS.Sql.Add(' FROM  TPROCESSO P, THOUSE H, THOUSE H2 ');
 DADOS.Sql.Add(' WHERE P.NR_PROCESSO = :NR_PROCESSO ');
 DADOS.Sql.Add(' AND P.NR_PROCESSO = H.NR_PROCESSO ');
 DADOS.Sql.Add(' AND H.CD_MASTER = H2.CD_MASTER ');
 DADOS.Params[0].AsString := qry_processo_NR_PROCESSO.AsString;
 DADOS.ExecSql;
 DADOS.Free;

 in_change_cia := false;

 qry_house_.Close;
 qry_house_.ParamByName('NR_PROCESSO').AsString:=datm_retifica.qry_processo_NR_PROCESSO.AsString;
 qry_house_.Prepare;
 qry_house_.Open;

 qry_proc_relacionados_.close;
 qry_proc_relacionados_.ParamByname('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
 qry_proc_relacionados_.Prepare;
 qry_proc_relacionados_.Open;


end;

procedure Tdatm_retifica.qry_proc_relacionados_CalcFields(DataSet: TDataSet);
begin
  qry_proc_relacionados_calc_processo.AsString := copy(qry_proc_relacionados_NR_PROCESSO.AsString, 5, 10);
end;

Function Tdatm_retifica.alt_conhecimento_cia:String;
var cd_serie, nr_conhecimento:string;
  qry:TQuery;
begin
 qry := TQuery.Create(Application);
 qry.Databasename:='DBBROKER';
 qry.Sql.Clear;
 qry.Sql.Add(' SELECT  MIN(TS.CD_SERIE) FROM TCIA_SERIE TS ');
 qry.Sql.Add(' WHERE (SELECT COUNT(TC.NR_CONHECIMENTO) ');
 qry.Sql.Add('FROM TCIA_CONHECIMENTOS TC WHERE TC.CODIGO = TS.CODIGO AND');
 qry.Sql.Add(' TC.CD_SERIE = TS.CD_SERIE AND TC.IN_DISPONIVEL ="1") > 0 AND CODIGO="'+qry_processo_CD_CIA_TRANSP.Asstring+'"');
 qry.Open;

 cd_serie:= qry.Fields[0].AsString;

 qry.Close;
 qry.Sql.Clear;
 qry.Sql.Add('SELECT MIN(NR_CONHECIMENTO) FROM TCIA_CONHECIMENTOS');
 qry.Sql.Add(' WHERE CD_SERIE = "'+cd_serie+'" AND CODIGO = "'+qry_processo_CD_CIA_TRANSP.Asstring+'" AND IN_DISPONIVEL = "1"');
 qry.Open;

 nr_conhecimento := qry.Fields[0].AsString;

 qry.Close;
 qry.Sql.Clear;
 qry.Sql.Add(' UPDATE TCIA_CONHECIMENTOS SET IN_DISPONIVEL = "0", CD_USUARIO_RETIRADA ="'+str_cd_usuario+'",');
 qry.Sql.Add(' DT_RETIRADA = CONVERT(DATETIME,:DT_RETIRADA,103) WHERE CD_SERIE = "'+cd_serie+'" ');
 qry.Sql.Add(' AND CODIGO = "'+qry_processo_CD_CIA_TRANSP.Asstring+'"');
 qry.Sql.Add(' AND NR_CONHECIMENTO = "'+nr_conhecimento+'"');
 qry.Params[0].AsString:=datetimetostr(dt_server);
 qry.ExecSql;

 qry.Close;
 qry.Sql.Clear;
 qry.Sql.Add(' UPDATE TCIA_CONHECIMENTOS ');
 qry.Sql.Add(' SET IN_DISPONIVEL   = "1" ');
 qry.Sql.Add(' FROM TMASTER M, TCIA_CONHECIMENTOS C ');
 qry.Sql.Add(' WHERE M.CD_MASTER   = "'+qry_house_CD_MASTER.Asstring+'"');
 qry.Sql.Add(' AND M.CD_CIA_TRANSP = C.CODIGO ');
 qry.Sql.Add(' AND M.NR_MASTER     = C.NR_CONHECIMENTO ');
 qry.ExecSql;

 qry.Free;

 alt_conhecimento_cia := nr_conhecimento;


end;

Function Tdatm_retifica.verifica_qtde_conhecimento(const cia: String):Boolean;
var qry:TQuery;
begin
 qry := TQuery.Create(application);
 qry.DataBaseName:= 'DBBROKER';
 qry.Sql.Add(' SELECT COUNT(*) FROM TCIA_CONHECIMENTOS ');
 qry.Sql.Add(' WHERE CODIGO = "'+cia+'" AND IN_DISPONIVEL = "1" ');
 qry.Open;

 case qry.Fields[0].AsInteger of
      0 : BoxMensagem('Não existem Conhecimento para esta Cia. Por fvor insera Conhecimentos.',3);
  1..10 : BoxMensagem('Atenção! Existe mais '+inttostr(qry.Fields[0].AsInteger)+' Conhecimentos.',3);
  end;
 verifica_qtde_conhecimento := (qry.Fields[0].AsInteger > 0 );
 qry.Free;


end;

procedure Tdatm_retifica.qry_processo_CD_CIA_TRANSPChange(Sender: TField);
begin
  in_change_cia := (qry_processo_TP_PRODUTO.AsString = '02') and(qry_processo_TP_SERVICO.AsString = '1') and
                   (qry_processo_CD_VIA_TRANSPORTE.AsString = '04');
end;

procedure Tdatm_retifica.DataModuleCreate(Sender: TObject);
begin
in_change_cia := false;
end;

procedure Tdatm_retifica.qry_processo_AfterOpen(DataSet: TDataSet);
begin
in_change_cia := false;
end;

procedure Tdatm_retifica.qry_processo_AfterCancel(DataSet: TDataSet);
begin
in_change_cia := false;
end;

procedure Tdatm_retifica.qry_processo_carga_BeforePost(DataSet: TDataSet);
begin
  vPreencheu1 := (ConsultaLookUPSQL('SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = "'+ DataSet.FieldByName('TP_EMBALAGEM').AsString +'"', 'NM_EMBALAGEM_S') <> '');
end;

procedure Tdatm_retifica.qry_processo_carga_CalcFields(DataSet: TDataSet);
begin
  qry_processo_carga_calcEMBALAGEM.AsString := ConsultaLookUPSQL('SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = "'+ qry_processo_carga_TP_EMBALAGEM.AsString +'"', 'NM_EMBALAGEM_S')
end;

procedure Tdatm_retifica.qry_vl_other_BeforePost(DataSet: TDataSet);
begin
  vPreencheu2 := (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM = "1"', 'NM_ITEM') <> '');
end;

procedure Tdatm_retifica.qry_vl_other_CalcFields(DataSet: TDataSet);
begin
  qry_vl_other_calcItem.AsString := ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM (NOLOCK) WHERE CD_ITEM = "' + qry_vl_other_CD_ITEM.AsString + '" ' +
                                                          ' AND TP_ITEM = "1" ', 'NM_ITEM');

end;

procedure Tdatm_retifica.qry_vl_brasil_BeforePost(DataSet: TDataSet);
begin
  vPreencheu3 := (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM = "1" ', 'NM_ITEM') <> '') and
                 (ConsultaLookUPSQL('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+ DataSet.FieldByName('CD_MOEDA_VENDA').AsString +'"' , 'NM_MOEDA') <> '');

end;

procedure Tdatm_retifica.qry_despesa_house_BeforePost(DataSet: TDataSet);
begin
  vPreencheu4 := (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM = "1" ', 'NM_ITEM') <> '') and
                 (ConsultaLookUPSQL('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+ DataSet.FieldByName('CD_MOEDA').AsString +'"' , 'NM_MOEDA') <> '') ;

end;

procedure Tdatm_retifica.qry_despesa_house_CalcFields(DataSet: TDataSet);
begin
  qry_despesa_house_calcItem.AsString   := ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM (NOLOCK) WHERE CD_ITEM = "' + qry_despesa_house_CD_ITEM.AsString + '" ' + ' AND TP_ITEM = "1" ', 'NM_ITEM');
  qry_despesa_house_calcMoeda.AsString  := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', qry_despesa_house_CD_MOEDA.AsString, 'NM_MOEDA');
end;

end.
