(*******************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGSM243.PAS - datm_portos

AUTOR: Ricardo Giacomi Lopes

DATA: 05/06/2002

Manutenção: Ricardo Giacomi Lopes

Data: 05/06/2002 - ADBC-0006 - Cadastro de Porto / Aeroporto

********************************************************************************)

unit dPortos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables;


type
  Tdatm_portos = class(TDataModule)
    ds_porto: TDataSource;
    qry_porto_: TQuery;
    qry_local_embarque_: TQuery;
    qry_pais_BROKER: TQuery;
    qry_porto_grupo_: TQuery;
    qry_ult_registro_: TQuery;
    qry_ult_registro_ULTIMO: TStringField;
    upd_porto_: TUpdateSQL;
    qry_porto_grupo_CD_GRUPO_PORTO: TStringField;
    qry_porto_grupo_NM_GRUPO_PORTO: TStringField;
    qry_pais_BROKERCD_PAIS: TStringField;
    qry_pais_BROKERNM_PAIS: TStringField;
    qry_pais_BROKERNM_PAIS_PORT: TStringField;
    qry_pais_BROKERNM_PAIS_ING: TStringField;
    qry_pais_BROKERNM_PAIS_ESP: TStringField;
    qry_pais_BROKERCD_SCX_EXP: TStringField;
    qry_pais_BROKERNM_SIGLA_CRT: TStringField;
    qry_local_embarque_CODIGO: TStringField;
    qry_local_embarque_DESCRICAO: TStringField;
    qry_local_embarque_CD_UNID_NEG_LOCAL: TStringField;
    qry_local_embarque_CD_UF: TStringField;
    qry_porto_CD_PORTO: TStringField;
    qry_porto_CD_SIGLA: TStringField;
    qry_porto_NM_PORTO: TStringField;
    qry_porto_CD_CIDADE: TStringField;
    qry_porto_CD_URF: TStringField;
    qry_porto_CD_GRUPO_PORTO: TStringField;
    qry_porto_look_nm_grupo_porto: TStringField;
    ds_Pais_Broker: TDataSource;
    qry_porto_dbedt_look_nm_cidade: TStringField;
    qry_porto_ook_nm_pais: TStringField;
    qry_urf: TQuery;
    qry_porto_nome_urf: TStringField;
    qry_local_embarque_CD_PAIS: TStringField;
    qry_porto_TP_PORTO: TStringField;
    qry_porto_CD_SIGLA_CIDADE: TStringField;
    qry_porto_CD_PAIS: TStringField;
    procedure qry_porto_AfterDelete(DataSet: TDataSet);
    procedure qry_porto_AfterPost(DataSet: TDataSet);
    procedure qry_porto_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_portos: Tdatm_portos;
  str_cd_ultimo : string;

implementation

uses uPortos, GSMLIB;

{$R *.DFM}

procedure Tdatm_portos.qry_porto_AfterDelete(DataSet: TDataSet);
begin
  qry_porto_.ApplyUpdates;
end;

procedure Tdatm_portos.qry_porto_AfterPost(DataSet: TDataSet);
begin
  qry_porto_.ApplyUpdates;
end;

procedure Tdatm_portos.qry_porto_AfterScroll(DataSet: TDataSet);
begin
 if qry_porto_TP_PORTO.AsString = '0' then
   begin
    frm_portos.dbedt_sigla_aeroporto.Visible:=true;
    frm_portos.lb_sigla_aero.Visible        :=true;
  end;
 if qry_porto_TP_PORTO.AsString = '1' then
  begin
    frm_portos.dbedt_sigla_aeroporto.Visible:=false;
    frm_portos.lb_sigla_aero.Visible        :=false;
  end;

end;

end.
