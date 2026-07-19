unit dLibAccount;
(*******************************************************************************
SISTEMA: Broker - Cargo
PROGRAMA: PGSM250.PAS - datm_cia_transp
AUTOR: Paulo do Amaral Costa
DATA: 24/06/2002
MANUTENÇÃO:
DATA: 24/06/2002 - ADBC-0007 - Ecotrans
********************************************************************************)
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_lib_account = class(TDataModule)
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_AGENTE: TStringField;
    qry_processo_NM_CLIENTE: TStringField;
    qry_processo_NM_AGENTE: TStringField;
    qry_processo_IN_ACCOUNT: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_RESTRICAO: TStringField;
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
    qry_processo_calc_processo: TStringField;
    ds_processo: TDataSource;
    Update_processo: TUpdateSQL;
    qry_processo_calc_motivo: TStringField;
    qry_processo_CD_MASTER: TStringField;
    qry_processo_NR_MASTER: TStringField;
    qry_processo_NR_HOUSE: TStringField;
    qry_processo_VL_ACCOUNT: TFloatField;
    qry_processo_CD_VIA_TRANSPORTE: TStringField;
    qry_processo_CD_MOEDA_FRETE: TStringField;
    procedure qry_processo_CalcFields(DataSet: TDataSet);
    procedure qry_processo_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_lib_account: Tdatm_lib_account;
implementation

{$R *.DFM}


procedure Tdatm_lib_account.qry_processo_CalcFields(DataSet: TDataSet);
begin
qry_processo_calc_processo.AsString:=copy(qry_processo_NR_PROCESSO.AsString, 5, 10);
  if qry_processo_IN_ACCOUNT.AsString = '6' then
          qry_processo_calc_motivo.AsString:='Não Recebido';

  if qry_processo_IN_ACCOUNT.AsString = '7' then
          qry_processo_calc_motivo.AsString:='Operacional';
end;

procedure Tdatm_lib_account.qry_processo_AfterPost(DataSet: TDataSet);
begin
qry_processo_.ApplyUpdates;

end;

end.
