unit dAgendaComercial;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE;

type
  Tdatm_agenda_comercial = class(TDataModule)
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_pesquisa_: TQuery;
    qry_agenda_comercial_: TQuery;
    ds_agenda_comercial: TDataSource;
    qry_agenda_comercial_CD_AGENDA: TIntegerField;
    qry_agenda_comercial_CD_VENDEDOR: TStringField;
    qry_agenda_comercial_IN_PERIODO: TStringField;
    qry_agenda_comercial_DT_AGENDA: TDateTimeField;
    qry_agenda_comercial_HR_AGENDA: TDateTimeField;
    qry_agenda_comercial_IN_CANCELADO: TStringField;
    qry_agenda_semanal_: TQuery;
    ds_agenda_semanal: TDataSource;
    qry_agenda_semanal_CD_VENDEDOR: TStringField;
    qry_agenda_semanal_IN_PERIODO: TStringField;
    qry_agenda_semanal_DT_AGENDA: TDateTimeField;
    qry_agenda_semanal_NR_PROC_COMERC: TStringField;
    qry_agenda_semanal_OBS_AGENDA: TMemoField;
    qry_agenda_comercial_NR_PROC_COMERC: TStringField;
    qry_agenda_mensal_: TQuery;
    ds_agenda_mensal: TDataSource;
    qry_agenda_mensal_IN_PERIODO: TStringField;
    qry_agenda_mensal_DT_AGENDA: TDateTimeField;
    qry_agenda_mensal_NR_PROC_COMERC: TStringField;
    qry_proc_historico_: TQuery;
    qry_proc_historico_CD_HIST_PROC_COMERC: TIntegerField;
    qry_proc_historico_NR_PROC_COMERC: TStringField;
    qry_proc_historico_DT_HISTORICO: TDateTimeField;
    qry_proc_historico_HR_HISTORICO: TDateTimeField;
    qry_proc_historico_NM_HISTORICO: TStringField;
    qry_proc_historico_NM_CONTATO: TStringField;
    qry_proc_historico_TX_OBS_HISTORICO: TMemoField;
    qry_ult_agenda_comercial: TQuery;
    qry_ult_agenda_comercialULTIMO: TIntegerField;
    qry_agenda_comercial_TP_AGENDA: TStringField;
    qry_agenda_comercial_NM_CONTATO: TStringField;
    qry_agenda_diaria_: TQuery;
    ds_agenda_diaria: TDataSource;
    qry_agenda_diaria_DT_AGENDA: TDateTimeField;
    qry_agenda_diaria_TP_AGENDA: TStringField;
    qry_agenda_diaria_IN_PERIODO: TStringField;
    UpDate_agenda_comercial: TUpdateSQL;
    qry_agenda_diaria_NR_PROC_COMERC: TStringField;
    qry_Up_proc_comerc_hist_: TQuery;
    qry_agenda_comercial_NM_VENDEDOR: TStringField;
    qry_agenda_diaria_HR_AGENDA: TDateTimeField;
    qry_agenda_semanal_HR_AGENDA: TDateTimeField;
    qry_agenda_comercial_calc_periodo: TStringField;
    qry_agenda_comercial_calc_tp_agenda: TStringField;
    qry_agenda_semanal_TP_AGENDA: TStringField;
    qry_agenda_semanal_calc_sem_tp_agenda: TStringField;
    qry_agenda_semanal_calc_sem_periodo: TStringField;
    qry_agenda_mensal_TP_AGENDA: TStringField;
    qry_agenda_mensal_calc_mens_periodo: TStringField;
    qry_agenda_mensal_calc_mens_tp_agenda: TStringField;
    qry_agenda_diaria_calc_diar_tp_agenda: TStringField;
    qry_agenda_diaria_calc_diar_periodo: TStringField;
    qry_agenda_comercial_calc_cancelado: TStringField;
    qry_agenda_: TQuery;
    qry_agenda_CD_AGENDA: TIntegerField;
    qry_agenda_CD_VENDEDOR: TStringField;
    qry_agenda_IN_PERIODO: TStringField;
    qry_agenda_DT_AGENDA: TDateTimeField;
    qry_agenda_NR_PROC_COMERC: TStringField;
    qry_agenda_IN_CANCELADO: TStringField;
    qry_agenda_OBS_AGENDA: TMemoField;
    qry_agenda_TP_AGENDA: TStringField;
    qry_agenda_NM_CONTATO: TStringField;
    qry_agenda_HR_AGENDA: TDateTimeField;
    qry_agenda_comercial_CD_EMPRESA: TStringField;
    qry_agenda_comercial_NM_EMPRESA: TStringField;
    qry_agenda_mensal_CD_EMPRESA: TStringField;
    qry_agenda_mensal_NM_EMPRESA: TStringField;
    qry_agenda_semanal_CD_EMPRESA: TStringField;
    qry_agenda_semanal_NM_EMPRESA: TStringField;
    qry_agenda_diaria_CD_EMPRESA: TStringField;
    qry_agenda_diaria_NM_EMPRESA: TStringField;
    qry_agenda_comercial_OBS_AGENDA: TMemoField;
    pp_diario: TppBDEPipeline;
    pp_semanal: TppBDEPipeline;
    pp_mensal: TppBDEPipeline;
    qry_agenda_diaria_END_EMPRESA: TStringField;
    qry_agenda_diaria_END_NUMERO: TStringField;
    qry_agenda_diaria_END_CIDADE: TStringField;
    qry_agenda_diaria_END_BAIRRO: TStringField;
    qry_agenda_diaria_END_COMPL: TStringField;
    qry_agenda_diaria_END_UF: TStringField;
    qry_agenda_diaria_END_CEP: TStringField;
    qry_agenda_diaria_CGC_EMPRESA: TStringField;
    qry_agenda_diaria_CPF_EMPRESA: TStringField;
    qry_agenda_diaria_IE_EMPRESA: TStringField;
    qry_agenda_diaria_NR_TELEFONE: TStringField;
    qry_agenda_diaria_NR_FAX: TStringField;
    qry_agenda_diaria_OBS_AGENDA: TMemoField;
    qry_agenda_diaria_CD_VENDEDOR: TStringField;
    qry_agenda_diaria_NM_VENDEDOR: TStringField;
    qry_agenda_diaria_calc_descricao_tp_agenda: TStringField;
    qry_agenda_semanal_END_EMPRESA: TStringField;
    qry_agenda_semanal_END_NUMERO: TStringField;
    qry_agenda_semanal_END_CIDADE: TStringField;
    qry_agenda_semanal_END_BAIRRO: TStringField;
    qry_agenda_semanal_END_COMPL: TStringField;
    qry_agenda_semanal_END_UF: TStringField;
    qry_agenda_semanal_END_CEP: TStringField;
    qry_agenda_semanal_CGC_EMPRESA: TStringField;
    qry_agenda_semanal_CPF_EMPRESA: TStringField;
    qry_agenda_semanal_IE_EMPRESA: TStringField;
    qry_agenda_semanal_NR_TELEFONE: TStringField;
    qry_agenda_semanal_NR_FAX: TStringField;
    qry_agenda_semanal_NM_VENDEDOR: TStringField;
    qry_agenda_semanal_calc_descricao_tp_agenda: TStringField;
    qry_agenda_mensal_HR_AGENDA: TDateTimeField;
    qry_agenda_mensal_END_EMPRESA: TStringField;
    qry_agenda_mensal_END_NUMERO: TStringField;
    qry_agenda_mensal_END_CIDADE: TStringField;
    qry_agenda_mensal_END_BAIRRO: TStringField;
    qry_agenda_mensal_END_COMPL: TStringField;
    qry_agenda_mensal_END_UF: TStringField;
    qry_agenda_mensal_END_CEP: TStringField;
    qry_agenda_mensal_CGC_EMPRESA: TStringField;
    qry_agenda_mensal_CPF_EMPRESA: TStringField;
    qry_agenda_mensal_IE_EMPRESA: TStringField;
    qry_agenda_mensal_NR_TELEFONE: TStringField;
    qry_agenda_mensal_NR_FAX: TStringField;
    qry_agenda_mensal_OBS_AGENDA: TMemoField;
    qry_agenda_mensal_CD_VENDEDOR: TStringField;
    qry_agenda_mensal_NM_VENDEDOR: TStringField;
    qry_agenda_mensal_calc_descricao_tp_agenda: TStringField;
    qry_agenda_semanal_NM_CONTATO: TStringField;
    qry_agenda_diaria_NM_CONTATO: TStringField;
    qry_agenda_mensal_NM_CONTATO: TStringField;
    qry_agenda_comercial_IN_PARTICULAR: TStringField;
    qry_agenda_diaria_IN_PARTICULAR: TStringField;
    qry_agenda_mensal_IN_PARTICULAR: TStringField;
    qry_agenda_semanal_IN_PARTICULAR: TStringField;
    procedure qry_agenda_comercial_HR_AGENDAChange(Sender: TField);
    procedure qry_agenda_comercial_AfterPost(DataSet: TDataSet);
    procedure qry_agenda_comercial_BeforePost(DataSet: TDataSet);
    procedure qry_agenda_comercial_CalcFields(DataSet: TDataSet);
    procedure qry_agenda_semanal_CalcFields(DataSet: TDataSet);
    procedure qry_agenda_mensal_CalcFields(DataSet: TDataSet);
    procedure qry_agenda_diaria_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_agenda_comercial: Tdatm_agenda_comercial;

implementation

uses GSMLIB, uAgendaComercial;

{$R *.DFM}

procedure Tdatm_agenda_comercial.qry_agenda_comercial_HR_AGENDAChange(
  Sender: TField);
var hora1, hora2:integer;
    minuto1:integer;
begin
 try
    hora1:=strtoint(copy(qry_agenda_comercial_HR_AGENDA.AsString,12,2));
 except
    hora1:=strtoint(copy(qry_agenda_comercial_HR_AGENDA.AsString,12,1));
  end;  
  if (hora1 >= 18)  or (hora1 < 08) or (( hora1 >= 12)and (hora1 < 14)) then
    begin
     Boxmensagem('Hora fora dos intervalos de trabalho!',2);
     exit;
    end;
    if hora1 in[8,9] then
      qry_agenda_comercial_IN_PERIODO.AsString:='1';

    if hora1 in[10,11] then
      qry_agenda_comercial_IN_PERIODO.AsString:='2';

    if hora1 in[14,15] then
      qry_agenda_comercial_IN_PERIODO.AsString:='3';

   if hora1 in[16,17] then
      qry_agenda_comercial_IN_PERIODO.AsString:='4';



end;

procedure Tdatm_agenda_comercial.qry_agenda_comercial_AfterPost(
  DataSet: TDataSet);
begin
qry_agenda_comercial_.ApplyUpDates;


end;

procedure Tdatm_agenda_comercial.qry_agenda_comercial_BeforePost(
  DataSet: TDataSet);
begin
 if qry_agenda_comercial_.State in[dsInsert] then
 begin
    qry_ult_agenda_comercial.Close;
    qry_ult_agenda_comercial.Open;
    qry_agenda_comercial_CD_AGENDA.AsInteger:=qry_ult_agenda_comercialULTIMO.AsInteger + 1;
    qry_agenda_comercial_IN_CANCELADO.AsString:='0';

     
   qry_pesquisa_.Active:=false;
   qry_pesquisa_.Sql.Clear;
   qry_pesquisa_.Sql.Add('SELECT MAX(CD_HIST_PROC_COMERC) FROM TPROC_COMERC_HISTORICO WHERE NR_PROC_COMERC ="'+qry_agenda_comercial_NR_PROC_COMERC.AsString+'"');
   qry_pesquisa_.Active:=true;
   qry_Up_proc_comerc_hist_.Close;
   if qry_pesquisa_.Fields[0].IsNull then
      qry_Up_proc_comerc_hist_.ParamByName('CD_HIST_PROC_COMERC').AsInteger:=1
    else
      qry_Up_proc_comerc_hist_.ParamByName('CD_HIST_PROC_COMERC').AsInteger:= 1 + qry_pesquisa_.Fields[0].AsInteger;

     qry_Up_proc_comerc_hist_.ParamByName('CD_AGENDA').AsInteger:=qry_agenda_comercial_CD_AGENDA.AsInteger;
     qry_Up_proc_comerc_hist_.ParamByName('IN_PERIODO').AsString:=qry_agenda_comercial_IN_PERIODO.AsString;
     qry_Up_proc_comerc_hist_.ParamByName('DT_HISTORICO').AsDatetime:=qry_agenda_comercial_DT_AGENDA.AsDatetime;
     qry_Up_proc_comerc_hist_.ParamByName('HR_HISTORICO').AsDatetime:=qry_agenda_comercial_HR_AGENDA.AsDatetime;
     qry_Up_proc_comerc_hist_.ParamByName('NR_PROC_COMERC').AsString:=qry_agenda_comercial_NR_PROC_COMERC.AsString;
     qry_Up_proc_comerc_hist_.ParamByName('TX_OBS_HISTORICO').AsString:=qry_agenda_comercial_OBS_AGENDA.AsString;
     qry_Up_proc_comerc_hist_.ParamByName('NM_CONTATO').AsString:=qry_agenda_comercial_NM_CONTATO.AsString;
      qry_Up_proc_comerc_hist_.ParamByName('NM_HISTORICO').AsString:='0';
     qry_Up_proc_comerc_hist_.ExecSql;
  end;
 if qry_agenda_comercial_.State in[dsedit] then
 begin
   with TQuery.Create(Application)do
    begin
     DataBaseName:='DBBROKER';
     Sql.Clear;
     Sql.Add('UPDATE TPROC_COMERC_HISTORICO SET IN_PERIODO=:IN_PERIODO, DT_HISTORICO=:DT_HISTORICO, ');
     Sql.Add(' HR_HISTORICO=:HR_HISTORICO, TX_OBS_HISTORICO=:TX_OBS_HISTORICO,  NM_CONTATO=:NM_CONTATO, ');
     Sql.Add(' NM_HISTORICO=:NM_HISTORICO WHERE CD_AGENDA=:CD_AGENDA AND NR_PROC_COMERC=:NR_PROC_COMERC');
     Params[0].AsString:=qry_agenda_comercial_IN_PERIODO.AsString;
     Params[1].AsDatetime:=qry_agenda_comercial_DT_AGENDA.AsDatetime;
     Params[2].AsDatetime:=qry_agenda_comercial_HR_AGENDA.AsDatetime;
     Params[3].AsString:= qry_agenda_comercial_OBS_AGENDA.AsString + 'Agendamento de Visita "CANCELADA"';
     Params[4].AsString:=qry_agenda_comercial_NM_CONTATO.AsString;
     Params[5].AsString:='0';
     Params[6].AsInteger:=qry_agenda_comercial_CD_AGENDA.AsInteger;
     Params[7].AsString:=qry_agenda_comercial_NR_PROC_COMERC.AsString;
     ExecSql;
     Free;
    end;
 end;


end;

procedure Tdatm_agenda_comercial.qry_agenda_comercial_CalcFields(
  DataSet: TDataSet);
begin
   if qry_agenda_comercial_IN_PERIODO.AsString='1' then
   qry_agenda_comercial_calc_periodo.AsString:='8:00 às 10:00';

  if qry_agenda_comercial_IN_PERIODO.AsString='2' then
  qry_agenda_comercial_calc_periodo.AsString:='10:00 às 12:00';

  if qry_agenda_comercial_IN_PERIODO.AsString='3' then
  qry_agenda_comercial_calc_periodo.AsString:='14:00 ás 16:00';

  if qry_agenda_comercial_IN_PERIODO.AsString='4' then
  qry_agenda_comercial_calc_periodo.AsString:='16:00 às 18:00';

  if qry_agenda_comercial_IN_CANCELADO.AsString='0' then   //ativo
    qry_agenda_comercial_calc_cancelado.AsString:='Ativo';

  if qry_agenda_comercial_IN_CANCELADO.AsString='1' then   //cancelado
    qry_agenda_comercial_calc_cancelado.AsString:='Cancelado';

 if qry_agenda_comercial_TP_AGENDA.AsString = '0' then
      qry_agenda_comercial_calc_tp_agenda.AsString:='Visita';
 if qry_agenda_comercial_TP_AGENDA.AsString = '1' then
      qry_agenda_comercial_calc_tp_agenda.AsString:='Telefone';
 if qry_agenda_comercial_TP_AGENDA.AsString = '2' then
      qry_agenda_comercial_calc_tp_agenda.AsString:='E-mail';
 if qry_agenda_comercial_TP_AGENDA.AsString = '3' then
      qry_agenda_comercial_calc_tp_agenda.AsString:='Fax';
 if qry_agenda_comercial_TP_AGENDA.AsString = '4' then
      qry_agenda_comercial_calc_tp_agenda.AsString:='Postagem';


end;

procedure Tdatm_agenda_comercial.qry_agenda_semanal_CalcFields(
  DataSet: TDataSet);
begin
   if qry_agenda_semanal_IN_PERIODO.AsString='1' then
   qry_agenda_semanal_calc_sem_periodo.AsString:='8:00 às 10:00';

  if qry_agenda_semanal_IN_PERIODO.AsString='2' then
  qry_agenda_semanal_calc_sem_periodo.AsString:='10:00 às 12:00';

  if qry_agenda_semanal_IN_PERIODO.AsString='3' then
  qry_agenda_semanal_calc_sem_periodo.AsString:='14:00 ás 16:00';

  if qry_agenda_semanal_IN_PERIODO.AsString='4' then
  qry_agenda_semanal_calc_sem_periodo.AsString:='16:00 às 18:00';

  if qry_agenda_semanal_IN_PARTICULAR.AsString='1' then   //particular
    begin
     qry_agenda_semanal_calc_sem_tp_agenda.AsString:='Particular';
     qry_agenda_semanal_calc_descricao_tp_agenda.AsString:= '';
     end;

  if qry_agenda_semanal_IN_PARTICULAR.AsString='0' then   //profissional
   begin
     qry_agenda_semanal_calc_sem_tp_agenda.AsString:='Profissional';
     qry_agenda_semanal_calc_descricao_tp_agenda.AsString:= 'Cliente: '+ qry_agenda_semanal_NM_EMPRESA.AsString +#13+
       'Endereço: ' +qry_agenda_semanal_END_EMPRESA.AsString +', '+ qry_agenda_semanal_END_NUMERO.AsString + '  -  '+
       qry_agenda_semanal_END_COMPL.AsString +#13+  qry_agenda_semanal_END_BAIRRO.AsString + '  -  '+
       qry_agenda_semanal_END_CIDADE.AsString + ' '+ qry_agenda_semanal_END_UF.AsString + #13+
       'Cep:  '+ qry_agenda_semanal_END_CEP.AsString +#13+
       'Fone: '+ qry_agenda_semanal_NR_TELEFONE.AsString +#13+
       'Fax:  '+ qry_agenda_semanal_NR_FAX.AsString;
   end;

end;

procedure Tdatm_agenda_comercial.qry_agenda_mensal_CalcFields(
  DataSet: TDataSet);
begin
if qry_agenda_mensal_IN_PERIODO.AsString='1' then
   qry_agenda_mensal_calc_mens_periodo.AsString:='8:00 às 10:00';

  if qry_agenda_mensal_IN_PERIODO.AsString='2' then
  qry_agenda_mensal_calc_mens_periodo.AsString:='10:00 às 12:00';

  if qry_agenda_mensal_IN_PERIODO.AsString='3' then
  qry_agenda_mensal_calc_mens_periodo.AsString:='14:00 ás 16:00';

  if qry_agenda_mensal_IN_PERIODO.AsString='4' then
  qry_agenda_mensal_calc_mens_periodo.AsString:='16:00 às 18:00';

  if qry_agenda_mensal_IN_PARTICULAR.AsString='1' then   //particular
   begin
     qry_agenda_mensal_calc_mens_tp_agenda.AsString:='Particular';
     qry_agenda_mensal_calc_descricao_tp_agenda.AsString:= '';
   end;

  if qry_agenda_mensal_IN_PARTICULAR.AsString='0' then   //profissional
   begin
     qry_agenda_mensal_calc_mens_tp_agenda.AsString:='Profissional';
      qry_agenda_mensal_calc_descricao_tp_agenda.AsString:= 'Cliente: '+ qry_agenda_mensal_NM_EMPRESA.AsString +#13+
       'Endereço: ' +qry_agenda_mensal_END_EMPRESA.AsString +', '+ qry_agenda_mensal_END_NUMERO.AsString + '  -  '+
       qry_agenda_mensal_END_COMPL.AsString +#13+  qry_agenda_mensal_END_BAIRRO.AsString + '  -  '+
       qry_agenda_mensal_END_CIDADE.AsString + ' '+ qry_agenda_mensal_END_UF.AsString + #13+
       'Cep:  '+ qry_agenda_mensal_END_CEP.AsString +#13+
       'Fone: '+ qry_agenda_mensal_NR_TELEFONE.AsString +#13+
       'Fax:  '+ qry_agenda_mensal_NR_FAX.AsString;
  end;

end;

procedure Tdatm_agenda_comercial.qry_agenda_diaria_CalcFields(
  DataSet: TDataSet);
begin
if qry_agenda_diaria_IN_PERIODO.AsString='1' then
   qry_agenda_diaria_calc_diar_periodo.AsString:='8:00 às 10:00';

  if qry_agenda_diaria_IN_PERIODO.AsString='2' then
  qry_agenda_diaria_calc_diar_periodo.AsString:='10:00 às 12:00';

  if qry_agenda_diaria_IN_PERIODO.AsString='3' then
  qry_agenda_diaria_calc_diar_periodo.AsString:='14:00 ás 16:00';

  if qry_agenda_diaria_IN_PERIODO.AsString='4' then
  qry_agenda_diaria_calc_diar_periodo.AsString:='16:00 às 18:00';

  if qry_agenda_diaria_IN_PARTICULAR.AsString='1' then   //particular
   begin
     qry_agenda_diaria_calc_diar_tp_agenda.AsString:='Particular';
     qry_agenda_diaria_calc_descricao_tp_agenda.AsString:= 'Período: '+ qry_agenda_diaria_calc_diar_periodo.AsString;



   end;
   if qry_agenda_diaria_IN_PARTICULAR.AsString='0' then   //profissional
    begin
     qry_agenda_diaria_calc_diar_tp_agenda.AsString:='Profissional';
     qry_agenda_diaria_calc_descricao_tp_agenda.AsString:= 'Cliente: '+ qry_agenda_diaria_NM_EMPRESA.AsString +
       '   Horário: '+qry_agenda_diaria_calc_diar_periodo.AsString+ #13+
       'Endereço: ' +qry_agenda_diaria_END_EMPRESA.AsString +', '+ qry_agenda_diaria_END_NUMERO.AsString + '  -  '+
       qry_agenda_diaria_END_COMPL.AsString +#13+  qry_agenda_diaria_END_BAIRRO.AsString + '  -  '+
       qry_agenda_diaria_END_CIDADE.AsString + ' '+ qry_agenda_diaria_END_UF.AsString + #13+
       'Cep:  '+ qry_agenda_diaria_END_CEP.AsString +#13+
       'Fone: '+ qry_agenda_diaria_NR_TELEFONE.AsString +#13+
       'Fax:  '+ qry_agenda_diaria_NR_FAX.AsString;

    end;

  



end;

end.
