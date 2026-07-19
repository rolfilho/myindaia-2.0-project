unit PGSM095;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_emp_est = class(TDataModule)
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    ds_yesno: TDataSource;
    qry_emp_est_: TQuery;
    ds_emp_est: TDataSource;
    qry_ult_emp_est_: TQuery;
    qry_emp_est_CD_EMPRESA: TStringField;
    qry_emp_est_NM_EMPRESA: TStringField;
    qry_emp_est_AP_EMPRESA: TStringField;
    qry_emp_est_END_NUMERO: TStringField;
    qry_emp_est_END_CIDADE: TStringField;
    qry_emp_est_END_ESTADO: TStringField;
    qry_emp_est_CD_PAIS: TStringField;
    qry_emp_est_NR_TELEFONE: TStringField;
    qry_emp_est_NR_FAX: TStringField;
    qry_emp_est_DT_INCLUSAO: TDateTimeField;
    qry_emp_est_IN_ATIVO: TStringField;
    qry_pais_: TQuery;
    ds_pais: TDataSource;
    qry_pais_CODIGO: TStringField;
    qry_pais_DESCRICAO: TStringField;
    qry_ult_emp_est_ULTIMO: TStringField;
    qry_emp_est_look_pais: TStringField;
    qry_emp_est_look_ativo: TStringField;
    qry_emp_est_IN_AGENTE: TBooleanField;
    qry_emp_est_IN_BANCO: TBooleanField;
    qry_emp_est_IN_IMPORTADOR: TBooleanField;
    qry_emp_est_IN_SEGURADORA: TBooleanField;
    qry_emp_est_TX_OBS_AGENTE: TMemoField;
    qry_emp_est_TX_OBS_BANCO: TMemoField;
    qry_emp_est_TX_OBS_IMP: TMemoField;
    qry_emp_est_TX_OBS_SEG: TMemoField;
    qry_emp_est_IN_EXPORTADOR: TBooleanField;
    qry_emp_est_NR_CLIENTE: TStringField;
    qry_lista_: TQuery;
    ds_lista: TDataSource;
    qry_lista_CD_EMPRESA: TStringField;
    qry_lista_NM_EMPRESA: TStringField;
    qry_lista_AP_EMPRESA: TStringField;
    qry_lista_IN_ATIVO: TStringField;
    qry_lista_Look_Ativo: TStringField;
    qry_lista_IN_IMPORTADOR: TBooleanField;
    qry_lista_IN_AGENTE: TBooleanField;
    qry_lista_IN_BANCO: TBooleanField;
    qry_emp_est_NM_CONTATO: TStringField;
    qry_emp_est_END_EMPRESA: TStringField;
    qry_emp_est_END_COMPL: TStringField;
    qry_emp_est_IN_COMPRADOR: TBooleanField;
    qryEmpEstGrupo: TQuery;
    dsEmpEstGrupo: TDataSource;
    qryEmpEstGrupoCD_EMPRESA: TStringField;
    qryEmpEstGrupoCD_GRUPO: TStringField;
    qryEmpEstGrupocalcNmGrupo: TStringField;
    qry_emp_est_NR_RUC: TStringField;
    sqlAux: TQuery;
    qry_emp_est_NR_NIT: TStringField;
    qry_emp_est_NR_CUIT: TStringField;
    qry_emp_est_IN_DECLARACAO_DETENTOR: TStringField;
    qry_lista_NR_CLIENTE: TStringField;
    dsFiespImportador: TDataSource;
    updFiespImportador: TUpdateSQL;
    updFiespInterveniente: TUpdateSQL;
    qryFiespInterveniente: TQuery;
    dsFiespInterveniente: TDataSource;
    qryFiespIntervenienteID: TAutoIncField;
    qryFiespIntervenienteCD_EMPRESA_EST: TStringField;
    qryFiespIntervenienteCD_EMPRESA_NAC: TStringField;
    qryFiespIntervenienteFIESP_ID: TIntegerField;
    qryFiespImportador: TQuery;
    qryFiespImportadorID: TAutoIncField;
    qryFiespImportadorCD_EMPRESA_EST: TStringField;
    qryFiespImportadorCD_EMPRESA_NAC: TStringField;
    qryFiespImportadorFIESP_ID: TIntegerField;
    qryEmrpesaNac: TQuery;
    dsEmpresaNac: TDataSource;
    qryFiespImportadornm_emprsa: TStringField;
    qryFiespIntervenientenm_empresa: TStringField;
    qryClientesRaizCNPJ: TQuery;
    updClientesRaizCNPJ: TUpdateSQL;
    dsClientesRaizCNPJ: TDataSource;
    qryClientesRaizCNPJCD_EMPRESA_EST: TStringField;
    qryClientesRaizCNPJRAIZ_CNPJ: TStringField;
    qryClientesRaizCNPJCD_OPE_ESTRANGEIRO: TStringField;
    qryClientesRaizCNPJNR_VERSAO_OPE_ESTRANGEIRO: TStringField;
    qryClientesRaizCNPJDESCRICAO: TStringField;
    procedure qry_emp_est_AfterPost(DataSet: TDataSet);
    procedure qry_emp_est_CD_PAISSetText(Sender: TField;
      const Text: String);
    procedure qryEmpEstGrupoCD_GRUPOSetText(Sender: TField;
      const Text: String);
    procedure qryEmpEstGrupoBeforePost(DataSet: TDataSet);
    procedure qryEmpEstGrupoAfterPost(DataSet: TDataSet);
    procedure qryEmpEstGrupoCalcFields(DataSet: TDataSet);
    procedure qryEmpEstGrupoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryFiespImportador1AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_emp_est: Tdatm_emp_est;

implementation

uses GSMLIB, ConsOnLineEx;

{$R *.DFM}


procedure Tdatm_emp_est.qry_emp_est_AfterPost(DataSet: TDataSet);
var Codigo : String;
begin
  Codigo := qry_emp_est_CD_EMPRESA.asString;
  qry_emp_est_.Close;
  qry_emp_est_.Open;
  qry_emp_est_.Locate('CD_EMPRESA',Codigo,[]);
end;

procedure Tdatm_emp_est.qry_emp_est_CD_PAISSetText(Sender: TField;
  const Text: String);
begin
  Sender.Value := FStrZero( Text, 3 );
end;


procedure Tdatm_emp_est.qryEmpEstGrupoCD_GRUPOSetText(Sender: TField;
  const Text: String);
begin
  if Text = ConsultaLookUP('TGRUPO','CD_GRUPO',Text,'CD_GRUPO') then
    Sender.AsString := Text
  else begin
    ShowMessage('Grupo inexistente ou inválido!');
    Sender.Clear;
  end;
end;

procedure Tdatm_emp_est.qryEmpEstGrupoBeforePost(DataSet: TDataSet);
begin
  if qryEmpEstGrupoCD_GRUPO.AsString <> '' then
    qryEmpEstGrupoCD_EMPRESA.AsString := qry_emp_est_CD_EMPRESA.AsString
  else if qryEmpEstGrupo.State = dsInsert then
    qryEmpEstGrupo.Cancel
  else if qryEmpEstGrupo.State = dsEdit then
    qryEmpEstGrupo.Delete;
end;

procedure Tdatm_emp_est.qryEmpEstGrupoAfterPost(DataSet: TDataSet);
var
  Codigo : String;
begin
  if qry_emp_est_.State in [dsEdit,dsBrowse] then
  begin
    Codigo := qry_emp_est_CD_EMPRESA.asString;          
    qry_emp_est_.Close;
    qry_emp_est_.Open;
    qry_emp_est_.Locate('CD_EMPRESA',Codigo,[]);
  end;
  qryEmpEstGrupo.Close;
  qryEmpEstGrupo.Open;
end;

procedure Tdatm_emp_est.qryEmpEstGrupoCalcFields(DataSet: TDataSet);
begin
  qryEmpEstGrupo.FieldByName('calcNmGrupo').AsString := ConsultaLookup('TGRUPO','CD_GRUPO',qryEmpEstGrupo.FieldByName('CD_GRUPO').AsString,'NM_GRUPO');
end;

procedure Tdatm_emp_est.qryEmpEstGrupoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
end;

procedure Tdatm_emp_est.qryFiespImportador1AfterPost(DataSet: TDataSet);
begin
  qryFiespImportador.ApplyUpdates;
end;

end.
