unit dFaturaComplementar;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE;

type
  Tdatm_fat_Itl_complementar = class(TDataModule)
    qry_fatura_compl_: TQuery;
    ds_fatura_compl: TDataSource;
    UpdateSQL1: TUpdateSQL;
    qry_fatura_compl_CD_MASTER: TStringField;
    qry_fatura_compl_CD_UNID_NEG: TStringField;
    qry_fatura_compl_CD_PRODUTO: TStringField;
    qry_fatura_compl_CD_VIA_TRANSP: TStringField;
    qry_fatura_compl_CD_AGENTE: TStringField;
    qry_fatura_compl_CD_ORIGEM: TStringField;
    qry_fatura_compl_CD_DESTINO: TStringField;
    qry_fatura_compl_CD_MOEDA: TStringField;
    qry_fatura_compl_NM_ORIGEM: TStringField;
    qry_fatura_compl_NM_DESTINO: TStringField;
    qry_fatura_compl_AP_MOEDA: TStringField;
    qry_fatura_compl_NM_AGENTE: TStringField;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_NM_PRODUTO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_traz_default_NM_USUARIO: TStringField;
    qry_fatura_compl_NR_MASTER: TStringField;
    qry_fatura_compl_NR_FATURA: TStringField;
    qry_fatura_compl_TP_FATURA: TStringField;
    qry_fatura_compl_IN_FATURA: TStringField;
    qry_fatura_compl_VL_CRE_BRASIL: TFloatField;
    qry_fatura_compl_VL_DEB_BRASIL: TFloatField;
    qry_fatura_compl_VL_CRE_AGENTE: TFloatField;
    qry_fatura_compl_VL_DEB_AGENTE: TFloatField;
    qry_fatura_compl_CD_FATURA: TStringField;
    qry_fatura_compl_IN_COMPLEMENTAR: TStringField;
    qry_fatura_compl_DT_FATURA: TDateTimeField;
    qry_fatura_compl_calc_vl_fatura: TFloatField;
    qry_fatura_compl_calc_tp_fatura: TStringField;
    qry_fatura_item_: TQuery;
    ds_fat_item: TDataSource;
    UpdateSQL2: TUpdateSQL;
    qry_fatura_item_CD_MASTER: TStringField;
    qry_fatura_item_NR_FATURA: TStringField;
    qry_fatura_item_CODIGO: TStringField;
    qry_fatura_item_CD_ITEM: TStringField;
    qry_fatura_item_VL_ITEM: TFloatField;
    qry_fatura_item_NM_ITEM: TStringField;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_fatura_item_Look_nm_item: TStringField;
    qry_fatura_compl_TX_OBS: TMemoField;
    qry_fatura_compl_CD_STATUS: TStringField;
    qry_fatura_compl_DT_CONTABILIZACAO: TDateTimeField;
    sp_calc_fat_master_compl: TStoredProc;
    qry_rel_imp_fat_: TQuery;
    qry_rel_imp_fat_CD_MASTER: TStringField;
    qry_rel_imp_fat_CD_UNID_NEG: TStringField;
    qry_rel_imp_fat_CD_PRODUTO: TStringField;
    qry_rel_imp_fat_CD_VIA_TRANSP: TStringField;
    qry_rel_imp_fat_CD_MOEDA: TStringField;
    qry_rel_imp_fat_NR_FATURA: TStringField;
    qry_rel_imp_fat_TT_FRETE_MASTER: TFloatField;
    qry_rel_imp_fat_DT_EMBARQUE: TDateTimeField;
    qry_rel_imp_fat_NM_UNID_NEG: TStringField;
    qry_rel_imp_fat_END_UNID_NEG: TStringField;
    qry_rel_imp_fat_CGC_UNID_NEG: TStringField;
    qry_rel_imp_fat_END_NUMERO: TStringField;
    qry_rel_imp_fat_END_BAIRRO: TStringField;
    qry_rel_imp_fat_END_CIDADE: TStringField;
    qry_rel_imp_fat_END_UF: TStringField;
    qry_rel_imp_fat_NR_FONE: TStringField;
    qry_rel_imp_fat_END_CEP: TStringField;
    qry_rel_imp_fat_NR_FAX1: TStringField;
    qry_rel_imp_fat_END_AGENTE: TStringField;
    qry_rel_imp_fat_AP_MOEDA: TStringField;
    qry_rel_imp_fat_VL_FRETE_VENDA: TFloatField;
    qry_rel_imp_fat_ORIGEM: TStringField;
    qry_rel_imp_fat_DESTINO: TStringField;
    qry_rel_imp_fat_DT_EMISSAO: TDateTimeField;
    qry_rel_imp_fat_calc_unidade: TStringField;
    qry_rel_imp_fat_NR_MASTER: TStringField;
    qry_rel_imp_fat_NM_AGENTE: TStringField;
    qry_rel_imp_fat_SIGLA_CIA_TRANSP: TStringField;
    qry_rel_imp_fat_calc_profit: TFloatField;
    qry_rel_imp_fat_calc_profit_share: TFloatField;
    qry_rel_imp_fat_VL_ACCOUNT: TFloatField;
    qry_rel_imp_fat_calc_vl_fatura: TFloatField;
    qry_rel_imp_fat_calc_nm_fatura: TStringField;
    qry_rel_imp_fat_DT_DOCUMENTO: TDateTimeField;
    qry_rel_imp_fat_TP_FATURA: TStringField;
    qry_rel_imp_fat_calc_tp_fatura: TStringField;
    qry_rel_imp_fat_VL_FATURA: TFloatField;
    qry_rel_imp_fat_TX_OBS: TMemoField;
    ds_rel_imp_fat: TDataSource;
    pp_impressa_fatura: TppBDEPipeline;
    qry_rel_imp_fat_item_: TQuery;
    qry_rel_imp_fat_item_CD_MASTER: TStringField;
    qry_rel_imp_fat_item_CODIGO: TStringField;
    qry_rel_imp_fat_item_CD_ITEM: TStringField;
    qry_rel_imp_fat_item_VL_ITEM: TFloatField;
    qry_rel_imp_fat_item_NM_ITEM: TStringField;
    qry_rel_imp_fat_item_calc_tp_fatura: TStringField;
    qry_rel_imp_fat_item_NM_ITEM_INGLES: TStringField;
    ds_rel_imp_fat_item_: TDataSource;
    pp_impressa_fat_item: TppBDEPipeline;
    sp_cont_Fat_itl_master_compl: TStoredProc;
    qry_fatura_compl_TP_PRODUTO: TStringField;
    qry_fatura_compl_DT_CHEGADA: TDateTimeField;
    qry_fatura_compl_DT_EMBARQUE: TDateTimeField;
    qry_fatura_compl_DT_EMISSAO_DTA: TDateTimeField;
    qry_fatura_compl_calc_in_imporesso: TStringField;
    procedure qry_fatura_compl_AfterDelete(DataSet: TDataSet);
    procedure qry_fatura_compl_CalcFields(DataSet: TDataSet);
    procedure qry_fatura_compl_BeforePost(DataSet: TDataSet);
    procedure qry_fatura_item_AfterDelete(DataSet: TDataSet);
    procedure qry_fatura_item_NewRecord(DataSet: TDataSet);
    procedure qry_fatura_item_BeforePost(DataSet: TDataSet);
    procedure qry_fatura_compl_AfterScroll(DataSet: TDataSet);
    procedure qry_rel_imp_fat_item_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure atz_som_fatura_item;
    procedure atz_distribui_fat_complementar;
  end;

var
  datm_fat_Itl_complementar: Tdatm_fat_Itl_complementar;

implementation

uses Funcoes, PGGP001, uFaturaComplementar, PGGP017;

{$R *.DFM}

procedure Tdatm_fat_Itl_complementar.qry_fatura_compl_AfterDelete(
  DataSet: TDataSet);
begin
qry_fatura_compl_.ApplyUpdates;
end;

procedure Tdatm_fat_Itl_complementar.qry_fatura_compl_CalcFields(
  DataSet: TDataSet);
begin

 qry_fatura_compl_calc_in_imporesso.AsString := '';

if qry_fatura_compl_TP_FATURA.AsString = '0' then
 begin
  qry_fatura_compl_calc_tp_fatura.AsString := 'Agente/Crédito';
  qry_fatura_compl_calc_vl_fatura.AsFloat  := qry_fatura_compl_VL_CRE_AGENTE.Asfloat;
 end;

if qry_fatura_compl_TP_FATURA.AsString = '1' then
 begin
  qry_fatura_compl_calc_tp_fatura.AsString := 'Agente/Débito';
  qry_fatura_compl_calc_vl_fatura.AsFloat  := qry_fatura_compl_VL_DEB_AGENTE.Asfloat;
 end;

if qry_fatura_compl_TP_FATURA.AsString = '2' then
 begin
  qry_fatura_compl_calc_tp_fatura.AsString := 'Brasil/Crédito';
  qry_fatura_compl_calc_vl_fatura.AsFloat  := qry_fatura_compl_VL_CRE_BRASIL.Asfloat;
  if (qry_fatura_compl_IN_FATURA.AsString = '0') then qry_fatura_compl_calc_in_imporesso.AsString := 'Fatura Impressa';
 end;

if qry_fatura_compl_TP_FATURA.AsString = '3' then
 begin
  qry_fatura_compl_calc_tp_fatura.AsString := 'Brasil/Crédito';
  qry_fatura_compl_calc_vl_fatura.AsFloat  := qry_fatura_compl_VL_DEB_BRASIL.Asfloat;
  if (qry_fatura_compl_IN_FATURA.AsString = '0') then qry_fatura_compl_calc_in_imporesso.AsString := 'Fatura Impressa';
 end;






end;

procedure Tdatm_fat_Itl_complementar.qry_fatura_compl_BeforePost(
  DataSet: TDataSet);
begin
if qry_fatura_compl_TP_FATURA.AsString = '0' then qry_fatura_compl_VL_DEB_AGENTE.Asfloat := 0;
if qry_fatura_compl_TP_FATURA.AsString = '1' then qry_fatura_compl_VL_CRE_AGENTE.Asfloat := 0;

if qry_fatura_compl_.State in [dsInsert] then
begin
 with Tquery.Create(Application) do
 begin
  DataBaseName := 'DBBROKER';
  Sql.Add(' SELECT RIGHT( "00" + CONVERT( varchar, ISNULL (MAX(CD_FATURA)+ 1 , 1 ) ), 2 ) ');
  Sql.Add(' FROM TMASTER_FATURA_AG WHERE CD_MASTER = "'+qry_fatura_compl_CD_MASTER.Asstring+'"');
  Open;
  qry_fatura_compl_CD_FATURA.AsString   := Fields[0].AsString;

  if (qry_fatura_compl_TP_FATURA.AsString = '2') or (qry_fatura_compl_TP_FATURA.AsString = '3') then
  begin
   Sql.Clear;
   Sql.Add(' SELECT ISNULL(MAX(NR_FATURA),"000000") FROM TNUMERO_FATURA');
   Open;
   qry_fatura_compl_NR_FATURA.AsString:= formatfloat('000000',strtofloat(Fields[0].AsString) + 1);
   qry_fatura_compl_DT_FATURA.AsDateTime := dt_server;
   Sql.Clear;
   Sql.Add(' INSERT INTO TNUMERO_FATURA(NR_FATURA, CD_USUARIO, DT_ABERTURA) ');
   Sql.Add(' VALUES(:NR_FATURA, :CD_USUARIO, :DT_ABERTURA)');
   Params[0].AsString   := qry_fatura_compl_NR_FATURA.AsString;
   Params[1].AsString   := str_cd_usuario;
   Params[2].AsDateTime := now();//dt_server;
   ExecSql;
  end;
  Free;
 end;
end;

end;

procedure Tdatm_fat_Itl_complementar.qry_fatura_item_AfterDelete(
  DataSet: TDataSet);
begin
qry_fatura_item_.ApplyUpdates;
atz_som_fatura_item;
end;

procedure Tdatm_fat_Itl_complementar.qry_fatura_item_NewRecord(
  DataSet: TDataSet);
begin

qry_fatura_item_CD_MASTER.AsString := qry_fatura_compl_CD_MASTER.AsString;
qry_fatura_item_NR_FATURA.AsString := qry_fatura_compl_NR_FATURA.AsString;

end;

procedure Tdatm_fat_Itl_complementar.qry_fatura_item_BeforePost(
  DataSet: TDataSet);
begin
if qry_fatura_item_.State in [dsInsert] then
begin
 with Tquery.Create(Application) do
 begin
  DataBaseName := 'DBBROKER';
  Sql.Add(' SELECT RIGHT( "00" + CONVERT( varchar, ISNULL (MAX(CODIGO)+ 1 , 1 ) ), 2 ) ');
  Sql.Add(' FROM TMASTER_FATURA_AG_ITEM WHERE CD_MASTER = "'+qry_fatura_item_CD_MASTER.Asstring+'"');
  Open;
  qry_fatura_item_CODIGO.AsString   := Fields[0].AsString;
  Free;
 end;
end;

end;

procedure Tdatm_fat_Itl_complementar.atz_som_fatura_item;
var
 ITEM:Tquery;
begin
 ITEM := Tquery.Create(Application);
 ITEM.DatabaseName := 'DBBROKER';
 ITEM.Sql.Add(' SELECT SUM(CAST(VL_ITEM AS DECIMAL(15,2))) FROM TMASTER_FATURA_AG_ITEM ');
 ITEM.Sql.Add(' WHERE CD_MASTER = "'+qry_fatura_compl_CD_MASTER.AsString+'"');
 ITEM.Sql.Add('   AND NR_FATURA = "'+qry_fatura_compl_NR_FATURA.AsString+'"');
 ITEM.Open;

 if not (qry_fatura_compl_.State in [dsEdit, dsInsert]) then qry_fatura_compl_.Edit;
 qry_fatura_compl_VL_CRE_AGENTE.Asfloat := 0;
 qry_fatura_compl_VL_DEB_AGENTE.Asfloat := 0;
 qry_fatura_compl_VL_CRE_BRASIL.Asfloat := 0;
 qry_fatura_compl_VL_DEB_BRASIL.Asfloat := 0;


 if qry_fatura_compl_TP_FATURA.AsString = '2' then qry_fatura_compl_VL_CRE_BRASIL.Asfloat := ITEM.Fields[0].AsFloat;
 if qry_fatura_compl_TP_FATURA.AsString = '3' then qry_fatura_compl_VL_DEB_BRASIL.Asfloat := ITEM.Fields[0].AsFloat;

 ITEM.Free;
end;

procedure Tdatm_fat_Itl_complementar.atz_distribui_fat_complementar;

begin
end;

procedure Tdatm_fat_Itl_complementar.qry_fatura_compl_AfterScroll(
  DataSet: TDataSet);
begin
frm_fat_Itl_complementar.habilita_campos(qry_fatura_compl_IN_FATURA.AsString = '0');
end;

procedure Tdatm_fat_Itl_complementar.qry_rel_imp_fat_item_CalcFields(
  DataSet: TDataSet);
begin
  if qry_rel_imp_fat_TP_FATURA.AsString = '3' then
    qry_rel_imp_fat_item_calc_tp_fatura.AsString := 'To Your Debit'
  else
   qry_rel_imp_fat_item_calc_tp_fatura.AsString := 'To Your Credit';

end;

end.


