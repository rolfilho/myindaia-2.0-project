unit dEmissaoFatura;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE;

type
  Tdatm_emissao_fatura = class(TDataModule)
    qry_emissao_fatura_: TQuery;
    ds_emissao_fatura: TDataSource;
    qry_emissao_fatura_NR_FATURA: TStringField;
    qry_emissao_fatura_VL_FATURA: TFloatField;
    qry_emissao_fatura_DT_FATURA: TDateTimeField;
    qry_emissao_fatura_TP_FATURA: TStringField;
    qry_emissao_fatura_NR_PROCESSO: TStringField;
    qry_emissao_fatura_NM_AGENTE: TStringField;
    qry_emissao_fatura_calc_processo: TStringField;
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
    UpDAte_emis_fatura: TUpdateSQL;
    qry_emissao_fatura_IN_FATURA: TStringField;
    qry_emissao_fatura_VL_PROFIT_AG: TFloatField;
    qry_emissao_fatura_VL_PROFIT_BR: TFloatField;
    qry_emissao_fatura_calc_vl_fatura: TFloatField;
    qry_tp_fatura_: TQuery;
    qry_tp_fatura_CD_FATURA: TStringField;
    qry_tp_fatura_NM_FATURA: TStringField;
    qry_emissao_fatura_Look_tp_fatura: TStringField;
    qry_emissao_fatura_VL_CRE_AGENTE: TFloatField;
    qry_emissao_fatura_VL_DEB_AGENTE: TFloatField;
    qry_emissao_fatura_VL_CRE_BRASIL: TFloatField;
    qry_emissao_fatura_VL_DEB_BRASIL: TFloatField;
    qry_emissao_fatura_VL_AJUSTE: TFloatField;
    qry_emissao_fatura_NM_VIA_TRANSP: TStringField;
    qry_emissao_fatura_AP_ORIGEM: TStringField;
    qry_emissao_fatura_AP_DESTINO: TStringField;
    qry_emissao_fatura_AP_MOEDA: TStringField;
    qry_emissao_fatura_CD_AGENTE: TStringField;
    qry_emissao_fatura_IN_ACCOUNT: TStringField;
    qry_emissao_fatura_VL_ACCOUNT: TFloatField;
    qry_soma_fat_: TQuery;
    ds_soma_fat: TDataSource;
    qry_soma_fat_TOTAL: TFloatField;
    qry_master_: TQuery;
    ds_master: TDataSource;
    qry_master_CD_MASTER: TStringField;
    qry_master_CD_UNID_NEG: TStringField;
    qry_master_CD_PRODUTO: TStringField;
    qry_master_CD_AGENTE: TStringField;
    qry_master_CD_MOEDA: TStringField;
    qry_master_CD_VIA_TRANSP: TStringField;
    qry_master_CD_ORIGEM: TStringField;
    qry_master_CD_DESTINO: TStringField;
    qry_master_NM_AGENTE: TStringField;
    qry_master_IN_ACCOUNT: TStringField;
    qry_master_NM_VIA_TRANSP: TStringField;
    qry_master_AP_ORIGEM: TStringField;
    qry_master_AP_DESTINO: TStringField;
    qry_master_AP_MOEDA: TStringField;
    qry_master_VL_CRE_AGENTE: TFloatField;
    qry_master_VL_DEB_AGENTE: TFloatField;
    qry_master_VL_CRE_BRASIL: TFloatField;
    qry_master_VL_DEB_BRASIL: TFloatField;
    qry_master_VL_AJUSTE: TFloatField;
    qry_master_TP_FATURA: TStringField;
    qry_master_NR_MASTER: TStringField;
    Update_master: TUpdateSQL;
    qry_master_CD_FATURA: TStringField;
    qry_master_NR_FATURA: TStringField;
    qry_master_DT_FATURA: TDateTimeField;
    qry_master_IN_FATURA: TStringField;
    qry_master_VL_ACCOUNT: TFloatField;
    qry_soma_fat_master_: TQuery;
    qry_soma_fat_master_TOTAL: TFloatField;
    ds_soma_fat_master: TDataSource;
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
    ds_rel_imp_fat: TDataSource;
    pp_impressa_fatura: TppBDEPipeline;
    qry_rel_imp_fat_calc_unidade: TStringField;
    pp_impressa_fat_item: TppBDEPipeline;
    qry_rel_imp_fat_item_: TQuery;
    qry_rel_imp_fat_item_CD_MASTER: TStringField;
    qry_rel_imp_fat_item_CODIGO: TStringField;
    qry_rel_imp_fat_item_CD_ITEM: TStringField;
    qry_rel_imp_fat_item_VL_ITEM: TFloatField;
    qry_rel_imp_fat_item_NM_ITEM: TStringField;
    ds_rel_imp_fat_item_: TDataSource;
    qry_rel_imp_fat_NR_MASTER: TStringField;
    qry_rel_imp_fat_NM_AGENTE: TStringField;
    qry_rel_imp_fat_SIGLA_CIA_TRANSP: TStringField;
    qry_rel_imp_fat_calc_profit: TFloatField;
    qry_rel_imp_fat_calc_profit_share: TFloatField;
    qry_rel_imp_fat_VL_ACCOUNT: TFloatField;
    qry_rel_imp_fat_calc_vl_fatura: TFloatField;
    qry_rel_imp_fat_item_calc_tp_fatura: TStringField;
    qry_rel_imp_fat_calc_nm_fatura: TStringField;
    qry_rel_imp_fat_DT_DOCUMENTO: TDateTimeField;
    qry_rel_imp_fat_TP_FATURA: TStringField;
    qry_rel_imp_fat_calc_tp_fatura: TStringField;
    qry_rel_imp_fat_VL_FATURA: TFloatField;
    qry_rel_imp_fat_item_NM_ITEM_INGLES: TStringField;
    qry_reemissao_fatura_: TQuery;
    ds_reemissao: TDataSource;
    qry_reemissao_fatura_CD_MASTER: TStringField;
    qry_reemissao_fatura_CD_UNID_NEG: TStringField;
    qry_reemissao_fatura_CD_PRODUTO: TStringField;
    qry_reemissao_fatura_CD_VIA_TRANSP: TStringField;
    qry_reemissao_fatura_NR_MASTER: TStringField;
    qry_reemissao_fatura_CD_FATURA: TStringField;
    qry_reemissao_fatura_CD_AGENTE: TStringField;
    qry_reemissao_fatura_CD_MOEDA: TStringField;
    qry_reemissao_fatura_CD_ORIGEM: TStringField;
    qry_reemissao_fatura_CD_DESTINO: TStringField;
    qry_reemissao_fatura_NM_AGENTE: TStringField;
    qry_reemissao_fatura_IN_ACCOUNT: TStringField;
    qry_reemissao_fatura_NM_VIA_TRANSP: TStringField;
    qry_reemissao_fatura_AP_ORIGEM: TStringField;
    qry_reemissao_fatura_AP_DESTINO: TStringField;
    qry_reemissao_fatura_AP_MOEDA: TStringField;
    qry_reemissao_fatura_VL_FATURA: TFloatField;
    qry_reemissao_fatura_TP_FATURA: TStringField;
    qry_reemissao_fatura_NR_FATURA: TStringField;
    qry_reemissao_fatura_DT_FATURA: TDateTimeField;
    qry_reemissao_fatura_IN_FATURA: TStringField;
    qry_reemissao_fatura_calc_tp_fatura: TStringField;
    qry_master_TX_OBS: TMemoField;
    qry_rel_imp_fat_TX_OBS: TMemoField;
    procedure qry_emissao_fatura_CalcFields(DataSet: TDataSet);
    procedure qry_emissao_fatura_AfterPost(DataSet: TDataSet);
    procedure qry_emissao_fatura_AfterScroll(DataSet: TDataSet);
    procedure qry_emissao_fatura_BeforePost(DataSet: TDataSet);
    procedure qry_emissao_fatura_TP_FATURAChange(Sender: TField);
    procedure qry_master_TP_FATURAChange(Sender: TField);
    procedure qry_master_AfterScroll(DataSet: TDataSet);
    procedure qry_master_AfterPost(DataSet: TDataSet);
    procedure qry_master_AfterDelete(DataSet: TDataSet);
    procedure qry_master_BeforePost(DataSet: TDataSet);
    procedure qry_rel_imp_fat_CalcFields(DataSet: TDataSet);
    procedure qry_rel_imp_fat_item_CalcFields(DataSet: TDataSet);
    procedure qry_reemissao_fatura_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_emissao_fatura: Tdatm_emissao_fatura;

implementation
uses GSMLIB, PGGP017, PGGP001, uEmissaoFatura;
{$R *.DFM}

procedure Tdatm_emissao_fatura.qry_emissao_fatura_CalcFields(
  DataSet: TDataSet);
begin
 qry_emissao_fatura_calc_processo.AsString:=copy(qry_emissao_fatura_NR_PROCESSO.AsString, 5,10);

 if qry_emissao_fatura_TP_FATURA.AsString ='0' then
  qry_emissao_fatura_calc_vl_fatura.AsFloat := qry_emissao_fatura_VL_CRE_AGENTE.AsFloat;

 if qry_emissao_fatura_TP_FATURA.AsString ='1' then
  qry_emissao_fatura_calc_vl_fatura.AsFloat := qry_emissao_fatura_VL_DEB_AGENTE.AsFloat;

 if qry_emissao_fatura_TP_FATURA.AsString ='2' then
  qry_emissao_fatura_calc_vl_fatura.AsFloat := qry_emissao_fatura_VL_CRE_BRASIL.AsFloat;

 if qry_emissao_fatura_TP_FATURA.AsString = '3' then
  qry_emissao_fatura_calc_vl_fatura.AsFloat := qry_emissao_fatura_VL_DEB_BRASIL.AsFloat;

 if qry_emissao_fatura_TP_FATURA.AsString = '4' then
  qry_emissao_fatura_calc_vl_fatura.AsFloat := qry_emissao_fatura_VL_AJUSTE.AsFloat;

end;

procedure Tdatm_emissao_fatura.qry_emissao_fatura_AfterPost(
  DataSet: TDataSet);
begin
qry_emissao_fatura_.ApplyUpdates;
end;

procedure Tdatm_emissao_fatura.qry_emissao_fatura_AfterScroll(
  DataSet: TDataSet);
begin
frm_emissao_fatura.msk_processo.text := qry_emissao_fatura_calc_processo.AsString;
frm_emissao_fatura.valores_fatura(qry_emissao_fatura_TP_FATURA.AsString, qry_emissao_fatura_IN_ACCOUNT.AsString);
end;

procedure Tdatm_emissao_fatura.qry_emissao_fatura_BeforePost(
  DataSet: TDataSet);
var  FATURA:Tquery;
begin

  if qry_emissao_fatura_.State in [dsInsert] then
   begin
    qry_emissao_fatura_NR_PROCESSO.AsString:=frm_emissao_fatura.msk_unid2.text + frm_emissao_fatura.msk_cd_produto2.text +
                                             frm_emissao_fatura.msk_processo.text ;

    FATURA := TQuery.Create(Application);
    FATURA.DataBaseName:= 'DBBROKER';
    FATURA.Sql.Add(' SELECT ISNULL(MAX(NR_FATURA),"000000") FROM TNUMERO_FATURA');
    FATURA.Open;

    qry_emissao_fatura_NR_FATURA.AsString:= formatfloat('000000',strtofloat(FATURA.Fields[0].AsString) + 1);


    FATURA.Sql.Clear;
    FATURA.Sql.Add(' INSERT INTO TNUMERO_FATURA(NR_FATURA, CD_USUARIO, DT_ABERTURA) ');
    FATURA.Sql.Add('VALUES(:NR_FATURA, :CD_USUARIO, :DT_ABERTURA)');
    FATURA.Params[0].AsString   := qry_emissao_fatura_NR_FATURA.AsString;
    FATURA.Params[1].AsString   := str_cd_usuario;
    FATURA.Params[2].AsDateTime := now();//dt_server;
    FATURA.ExecSql;
    FATURA.Free;
   end;
end;

procedure Tdatm_emissao_fatura.qry_emissao_fatura_TP_FATURAChange(
  Sender: TField);
begin
qry_emissao_fatura_VL_CRE_BRASIL.AsFloat:= 0 ;
qry_emissao_fatura_VL_DEB_BRASIL.AsFloat:= 0 ;
frm_emissao_fatura.valores_fatura(qry_emissao_fatura_TP_FATURA.AsString, qry_emissao_fatura_IN_ACCOUNT.AsString);
end;

procedure Tdatm_emissao_fatura.qry_master_TP_FATURAChange(Sender: TField);
begin
qry_master_VL_CRE_BRASIL.AsFloat:= 0 ;
qry_master_VL_DEB_BRASIL.AsFloat:= 0 ;
frm_emissao_fatura.valores_fatura(qry_master_TP_FATURA.AsString, '');

end;

procedure Tdatm_emissao_fatura.qry_master_AfterScroll(DataSet: TDataSet);
begin
frm_emissao_fatura.valores_fatura(qry_master_TP_FATURA.AsString, '');
frm_emissao_fatura.msk_nr_master.text := qry_master_NR_MASTER.AsString;
end;

procedure Tdatm_emissao_fatura.qry_master_AfterPost(DataSet: TDataSet);
begin
qry_master_.ApplyUpdates;
end;

procedure Tdatm_emissao_fatura.qry_master_AfterDelete(DataSet: TDataSet);
begin
qry_master_.ApplyUpdates;
end;

procedure Tdatm_emissao_fatura.qry_master_BeforePost(DataSet: TDataSet);
var  FATURA:Tquery;
begin
  if qry_master_.State in [dsInsert] then
   begin
    //qry_master_CD_MASTER.AsString:= frm_emissao_fatura.msk_nr_master.TEXT;
    FATURA := TQuery.Create(Application);
    FATURA.DataBaseName:= 'DBBROKER';
    FATURA.Sql.Add(' SELECT ISNULL(MAX(NR_FATURA),"000000") FROM TNUMERO_FATURA');
    FATURA.Open;

    qry_master_NR_FATURA.AsString:= formatfloat('000000',strtofloat(FATURA.Fields[0].AsString) + 1);

    FATURA.Sql.Clear;
    FATURA.Sql.Add(' INSERT INTO TNUMERO_FATURA(NR_FATURA, CD_USUARIO, DT_ABERTURA) ');
    FATURA.Sql.Add('VALUES(:NR_FATURA, :CD_USUARIO, :DT_ABERTURA)');
    FATURA.Params[0].AsString   := qry_master_NR_FATURA.AsString;
    FATURA.Params[1].AsString   := str_cd_usuario;
    FATURA.Params[2].AsDateTime := now();//dt_server;
    FATURA.ExecSql;
    FATURA.Free;

    with TQuery.Create(Application) do
     begin
     DAtabasename:='DBBROKER';
     Sql.Clear;
     Sql.Add('SELECT MAX(CD_FATURA) FROM TMASTER_FATURA_AG WHERE CD_MASTER ="'+qry_master_CD_MASTER.AsString+'" ');
     Open;
     if Fields[0].AsString = '' then
       qry_master_CD_FATURA.AsString:='01'
     else qry_master_CD_FATURA.AsString:=formatfloat('00',strtofloat(Fields[0].AsString)+ 1);
      Free;
    end;

   end;

end;

procedure Tdatm_emissao_fatura.qry_rel_imp_fat_CalcFields(
  DataSet: TDataSet);
begin
  qry_rel_imp_fat_calc_unidade.AsString:= qry_rel_imp_fat_NM_UNID_NEG.AsString +#13#10+
                                  qry_rel_imp_fat_END_UNID_NEG.AsString + ' '+ qry_rel_imp_fat_END_NUMERO.AsString+ ','+
                                  qry_rel_imp_fat_END_BAIRRO.AsString + #13#10+
                                  'BR-'+qry_rel_imp_fat_END_CEP.AsString + ' '+ qry_rel_imp_fat_END_CIDADE.AsString+
                                   qry_rel_imp_fat_END_UF.AsString + ', BRASIL ';

  qry_rel_imp_fat_calc_profit.AsFloat :=  qry_rel_imp_fat_VL_FRETE_VENDA.AsFloat - qry_rel_imp_fat_TT_FRETE_MASTER.AsFloat;
  qry_rel_imp_fat_calc_profit_share.AsFloat := - qry_rel_imp_fat_calc_profit.AsFloat / 2;
  qry_rel_imp_fat_calc_vl_fatura.AsFloat    := - qry_rel_imp_fat_VL_ACCOUNT.AsFloat;

  if qry_rel_imp_fat_TP_FATURA.AsString = '3' then
   qry_rel_imp_fat_calc_nm_fatura.AsString := 'Fatura / Invoice'
  else
   qry_rel_imp_fat_calc_nm_fatura.AsString := 'Credit Note';

  if qry_rel_imp_fat_TP_FATURA.AsString = '3' then
    qry_rel_imp_fat_calc_tp_fatura.AsString := 'To Your Debit'
  else
    qry_rel_imp_fat_calc_tp_fatura.AsString := 'To Your Credit';  


end;

procedure Tdatm_emissao_fatura.qry_rel_imp_fat_item_CalcFields(
  DataSet: TDataSet);
begin
  if qry_rel_imp_fat_TP_FATURA.AsString = '3' then
    qry_rel_imp_fat_item_calc_tp_fatura.AsString := 'To Your Debit'
  else
   qry_rel_imp_fat_item_calc_tp_fatura.AsString := 'To Your Credit';

end;

procedure Tdatm_emissao_fatura.qry_reemissao_fatura_CalcFields(
  DataSet: TDataSet);
begin
 if qry_reemissao_fatura_TP_FATURA.AsString = '0' then
   qry_reemissao_fatura_calc_tp_fatura.AsString:= 'Crédito Agente';

 if qry_reemissao_fatura_TP_FATURA.AsString = '1' then
   qry_reemissao_fatura_calc_tp_fatura.AsString:= 'Débito Agente';

 if qry_reemissao_fatura_TP_FATURA.AsString = '2' then
   qry_reemissao_fatura_calc_tp_fatura.AsString:= 'Crédito Brasil';

 if qry_reemissao_fatura_TP_FATURA.AsString = '3' then
   qry_reemissao_fatura_calc_tp_fatura.AsString:= 'Débito Brasil';

 if qry_reemissao_fatura_TP_FATURA.AsString = '4' then
   qry_reemissao_fatura_calc_tp_fatura.AsString:= 'Ajuste';

end;

end.
