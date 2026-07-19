unit dAg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables;

type
  Tdatm_ag = class(TDataModule)
    ds_ag: TDataSource;
    qry_ag_: TQuery;
    qry_ult_ag_: TQuery;
    qry_ult_ag_ULTIMO: TStringField;
    qry_ag_CD_AGENTE: TStringField;
    qry_ag_NM_AGENTE: TStringField;
    qry_ag_IN_ATIVO: TStringField;
    ds_ag_tx: TDataSource;
    qry_ag_tx_: TQuery;
    qry_ag_tx_CD_TAXA: TStringField;
    qry_ag_tx_NM_TAXA: TStringField;
    qry_ag_tx_VL_CPTZ_CNTR_20: TFloatField;
    qry_ag_tx_VL_CPTZ_CNTR_40: TFloatField;
    qry_ag_tx_VL_CPTZ_C_SOLTA: TFloatField;
    qry_ag_tx_VL_CPTZ_MINIMA: TFloatField;
    qry_ag_tx_VL_LIBERACAO_BL: TFloatField;
    qry_ag_tx_IN_ATIVO: TStringField;
    qry_ag_NR_CGC_AGENTE: TStringField;
    upd_qry_ag_: TUpdateSQL;
    qry_ag_NM_AGENTE_REDUZIDO: TStringField;
    qry_ag_NR_SIGLA: TStringField;
    qry_ag_DS_ENDERECO: TStringField;
    qry_ag_NR_ZIP_CODE: TStringField;
    qry_ag_NM_PAIS: TStringField;
    qry_ag_NR_FONE: TStringField;
    qry_ag_NR_FAX: TStringField;
    qry_ag_DS_HOMEPAGE: TStringField;
    qry_ag_NM_BANCO_INTERN: TStringField;
    qry_ag_DS_TIPO_AGENTE: TStringField;
    qry_local_embarque_: TQuery;
    qry_local_embarque_CODIGO: TStringField;
    qry_local_embarque_DESCRICAO: TStringField;
    qry_ag_CD_CIDADE: TStringField;
    qry_pais_: TQuery;
    qry_bco_: TQuery;
    qry_bco_CD_BCO: TStringField;
    qry_bco_NM_BCO: TStringField;
    qry_agente_taxa_: TQuery;
    qry_agente_taxa_CD_TAXA: TStringField;
    qry_agente_taxa_NM_TAXA: TStringField;
    qry_ag_CD_BCO: TStringField;
    qry_ag_look_nm_bco: TStringField;
    ds_contato: TDataSource;
    qry_contato_: TQuery;
    upd_contato: TUpdateSQL;
    qry_contato_CD_CONTATO: TStringField;
    qry_contato_NM_CONTATO: TStringField;
    qry_contato_NR_FONE_CONTATO: TStringField;
    qry_contato_DS_EMAIL_CONTATO: TStringField;
    qry_contato_DS_CARGO_CONTATO: TStringField;
    qry_contato_DS_DEPTO_CONTATO: TStringField;
    qry_ult_contato_: TQuery;
    qry_ult_contato_ULTIMO: TStringField;
    qry_ag_calc_Ativo: TStringField;
    qry_contato_CD_AGENTE: TStringField;
    qry_pesquisa_: TQuery;
    qry_pais_CD_PAIS: TStringField;
    qry_pais_NM_PAIS: TStringField;
    qry_ag_NR_IATA: TStringField;
    qry_ag_CD_SIGLA: TStringField;
    qry_ag_calc_nacionalidade: TStringField;
    qry_ag_TP_AG: TStringField;
    qry_ag_DS_PROFIT: TStringField;
    qry_ag_END_UF: TStringField;
    qry_ag_CD_MOEDA_CONTA_1: TStringField;
    qry_ag_CD_MOEDA_CONTA_2: TStringField;
    qry_ag_NR_CONTA_1: TStringField;
    qry_ag_NR_CONTA_2: TStringField;
    qry_ag_ST_ROUTING_INF: TStringField;
    qry_ag_MOEDA_CONTA_1: TStringField;
    qry_ag_MOEDA_CONTA_2: TStringField;
    qry_ag_NM_BCO_ITL: TStringField;
    qry_ag_TX_OBX: TStringField;
    qry_ag_DESCRICAO: TStringField;
    qry_ag_NR_CONTA_4: TStringField;
    qry_ag_CD_MOEDA_CONTA_3: TStringField;
    qry_ag_CD_MOEDA_CONTA_4: TStringField;
    qry_ag_NR_CONTA_3: TStringField;
    qry_ag_ST_ROUTING_INF_2: TStringField;
    qry_ag_CD_BCO_2: TStringField;
    qry_ag_NM_BCO_ITL_2: TStringField;
    qry_ag_MOEDA_CONTA_3: TStringField;
    qry_ag_MOEDA_CONTA_4: TStringField;
    qry_ag_NR_PRAZO_PAGTO: TStringField;
    qry_ag_CD_PAIS: TStringField;
    qry_ag_ST_SWIFT_1: TStringField;
    qry_ag_ST_SWIFT_2: TStringField;
    qry_ag_DS_SCAC_CODE: TStringField;
    procedure qry_ag_AfterDelete(DataSet: TDataSet);
    procedure qry_ag_AfterPost(DataSet: TDataSet);
    procedure qry_contato_AfterDelete(DataSet: TDataSet);
    procedure qry_contato_AfterPost(DataSet: TDataSet);
    procedure qry_contato_NewRecord(DataSet: TDataSet);
    procedure qry_ag_CalcFields(DataSet: TDataSet);
    procedure qry_ag_AfterScroll(DataSet: TDataSet);
    procedure qry_contato_BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ag: Tdatm_ag;

implementation

uses uAg, PGGP017;

{$R *.DFM}



procedure Tdatm_ag.qry_ag_AfterDelete(DataSet: TDataSet);
begin
  qry_ag_.ApplyUpdates;  //by Paulo - 07/05/2002
end;

procedure Tdatm_ag.qry_ag_AfterPost(DataSet: TDataSet);
begin
  qry_ag_.ApplyUpdates;  //by Paulo - 07/05/2002
end;

procedure Tdatm_ag.qry_contato_AfterDelete(DataSet: TDataSet);
begin
  qry_contato_.ApplyUpdates;
end;

procedure Tdatm_ag.qry_contato_AfterPost(DataSet: TDataSet);
begin
  qry_contato_.ApplyUpdates;
end;

procedure Tdatm_ag.qry_contato_NewRecord(DataSet: TDataSet);
begin
  qry_contato_.FieldByName('CD_AGENTE').AsString := qry_ag_CD_AGENTE.Value;
end;

procedure Tdatm_ag.qry_ag_CalcFields(DataSet: TDataSet);
begin
 if (qry_ag_IN_ATIVO.Value = '1') then
      qry_ag_Calc_Ativo.Value:='Sim'
 else
    qry_ag_Calc_Ativo.Value:='Não';

 if (qry_ag_DS_TIPO_AGENTE.Value = '1') then
      qry_ag_calc_nacionalidade.Value:= 'Internacional';

 if (qry_ag_DS_TIPO_AGENTE.Value = '0') then
    qry_ag_calc_nacionalidade.Value:='Nacional';


end;

procedure Tdatm_ag.qry_ag_AfterScroll(DataSet: TDataSet);
begin
  if qry_ag_CD_AGENTE.AsString = '0000' then
    ds_ag.AutoEdit:=false
  else ds_ag.AutoEdit:=frm_ag.st_modificar;

end;

procedure Tdatm_ag.qry_contato_BeforePost(DataSet: TDataSet);
var Aux :TQuery;
begin
  if qry_contato_CD_CONTATO.IsNull then
  begin
    Aux := Tquery.Create(self);
    with Aux do
    begin
      DatabaseName := datm_Main.db_broker.DatabaseName;
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT ISNULL(MAX(CD_CONTATO),0)+1 COD_CONTATO FROM TCONTATO_AG';
      Prepare;
      Open;
      qry_contato_CD_CONTATO.Value := FieldValues['COD_CONTATO'];
      Free;
    end;
  end;
end;

end.
