(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGSM233.PAS - Data Module Cadastro de Indicado Por

AUTOR: Leandro Stipanich

DATA: 08/10/2001

Manutenção: Leandro Stipanich

Data: 08/10/2001

*************************************************************************************************)
unit PGSM233;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cliente_indicado = class(TDataModule)
    qry_indicado_: TQuery;
    ds_indicado: TDataSource;
    qry_indicado_CD_CLIENTE_INDICADO: TStringField;
    qry_indicado_NM_CLIENTE_INDICADO: TStringField;
    qry_indicado_NM_EMAIL: TStringField;
    qry_indicado_CD_DEPTO: TStringField;
    qry_indicado_CD_CARGO: TStringField;
    qry_lista_: TQuery;
    qry_lista_CD_CLIENTE_INDICADO: TStringField;
    qry_lista_NM_CLIENTE_INDICADO: TStringField;
    qry_lista_NM_EMAIL: TStringField;
    ds_lista: TDataSource;
    qry_depto_: TQuery;
    qry_cargo_: TQuery;
    qry_depto_CD_DEPTO: TStringField;
    qry_depto_NM_DEPTO: TStringField;
    qry_cargo_CD_DEPTO_CARGO: TStringField;
    qry_cargo_NM_DEPTO_CARGO: TStringField;
    qry_indicado_LookDepto: TStringField;
    qry_indicado_LookCargo: TStringField;
    qry_ult_indicado_: TQuery;
    qry_ult_indicado_ULTIMO: TStringField;
    procedure qry_lista_BeforeClose(DataSet: TDataSet);
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cliente_indicado: Tdatm_cliente_indicado;

implementation

uses PGGP017;

{$R *.DFM}

procedure Tdatm_cliente_indicado.qry_lista_BeforeClose(DataSet: TDataSet);
begin
  qry_indicado_.Close;
  qry_indicado_.UnPrepare;
end;

procedure Tdatm_cliente_indicado.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_indicado_.Close;
  qry_indicado_.UnPrepare;
  qry_indicado_.Prepare;
  qry_indicado_.Open;
end;

end.
