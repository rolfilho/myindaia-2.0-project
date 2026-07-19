(*******************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGSM260.PAS - datm_grupo_portos

AUTOR: Ricardo Giacomi Lopes

DATA: 27/06/2002

Manutenção: Ricardo Giacomi Lopes

Data: 28/06/2002 - XXXXXXXX - Cadastro de Portos

********************************************************************************)

unit dGrupoPortos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBTables, Db;

type
  Tdatm_grupo_portos = class(TDataModule)
    qry_grupo_portos_: TQuery;
    ds_grupo_portos: TDataSource;
    upd_grupo_portos: TUpdateSQL;
    qry_grupo_portos_CD_GRUPO_PORTO: TStringField;
    qry_grupo_portos_NM_GRUPO_PORTO: TStringField;
    qry_ult_grupo_portos_: TQuery;
    qry_ult_grupo_portos_ULTIMO: TStringField;
    procedure qry_grupo_portos_AfterDelete(DataSet: TDataSet);
    procedure qry_grupo_portos_AfterPost(DataSet: TDataSet);
    procedure qry_grupo_portos_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_grupo_portos: Tdatm_grupo_portos;

implementation

{$R *.DFM}

procedure Tdatm_grupo_portos.qry_grupo_portos_AfterDelete(
  DataSet: TDataSet);
begin
  qry_grupo_portos_.ApplyUpdates;
end;

procedure Tdatm_grupo_portos.qry_grupo_portos_AfterPost(DataSet: TDataSet);
begin
  qry_grupo_portos_.ApplyUpdates;
end;

procedure Tdatm_grupo_portos.qry_grupo_portos_AfterScroll(
  DataSet: TDataSet);
begin
//??  qry_porto_vl_mov_.Close;
//??  qry_porto_vl_mov_.ParambyName('CD_PORTO').asstring:= qry_porto_CD_PORTO.asstring;
//??  qry_porto_vl_mov_.Prepare;
//??  qry_porto_vl_mov_.Open;

end;

end.
