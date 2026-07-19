unit dNotificador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_notificador = class(TDataModule)
    qry_notificador_: TQuery;
    ds_notificador: TDataSource;
    qry_ult_notificador_: TQuery;
    UpDAte_Notificador: TUpdateSQL;
    qry_notificador_CD_NOTIFICADOR: TStringField;
    qry_notificador_NM_NOTIFICADOR: TStringField;
    qry_notificador_END_NOTIFICADOR: TStringField;
    qry_notificador_END_NUMERO: TStringField;
    qry_notificador_CD_CIDADE: TStringField;
    qry_notificador_CD_PAIS: TStringField;
    qry_notificador_END_FONE: TStringField;
    qry_notificador_END_FAX: TStringField;
    qry_notificador_NM_CONTATO: TStringField;
    qry_notificador_END_EMAIL: TStringField;
    qry_ult_notificador_ULTIMO: TStringField;
    qry_notificador_END_COMPL: TStringField;
    qry_notificador_IN_ATIVO: TStringField;
    qry_pesquisa_: TQuery;
    qry_notificador_NM_CIDADE: TStringField;
    qry_notificador_NM_PAIS: TStringField;
    qry_armador_: TQuery;
    qry_armador_CD_ARMADOR: TStringField;
    qry_armador_NM_ARMADOR: TStringField;
    ds_armador: TDataSource;
    UpDate_Armador: TUpdateSQL;
    qry_armador_CD_NOTIFICADOR: TStringField;
    qry_notificador_CGC_NOTIFICADOR: TStringField;
    procedure qry_notificador_AfterDelete(DataSet: TDataSet);
    procedure qry_notificador_AfterPost(DataSet: TDataSet);
    procedure qry_notificador_BeforePost(DataSet: TDataSet);
    procedure qry_armador_AfterDelete(DataSet: TDataSet);
    procedure qry_armador_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_notificador: Tdatm_notificador;

implementation

uses GSMLIB;

{$R *.DFM}

procedure Tdatm_notificador.qry_notificador_AfterDelete(DataSet: TDataSet);
begin
qry_notificador_.ApplyUpdates;
end;

procedure Tdatm_notificador.qry_notificador_AfterPost(DataSet: TDataSet);
begin
qry_notificador_.ApplyUpdates;
end;

procedure Tdatm_notificador.qry_notificador_BeforePost(DataSet: TDataSet);
begin
  if qry_notificador_.State in [dsInsert] then
     qry_notificador_CD_NOTIFICADOR.AsString:=UltCod(qry_ult_notificador_, qry_ult_notificador_ULTIMO);
end;

procedure Tdatm_notificador.qry_armador_AfterDelete(DataSet: TDataSet);
begin
qry_armador_.ApplyUpDAtes;
end;

procedure Tdatm_notificador.qry_armador_AfterPost(DataSet: TDataSet);
begin
qry_armador_.ApplyUpDAtes;
end;

end.
