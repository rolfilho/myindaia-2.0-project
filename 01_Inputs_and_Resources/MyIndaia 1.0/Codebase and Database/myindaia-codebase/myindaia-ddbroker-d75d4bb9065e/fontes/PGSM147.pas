unit PGSM147;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_log_erro_calculo = class(TDataModule)
    qry_log_erro_calculo_: TQuery;
    ds_log_erro_calculo: TDataSource;
    qry_log_erro_calculo_CD_USUARIO: TStringField;
    qry_log_erro_calculo_NM_STORED_PROCEDURE: TStringField;
    qry_log_erro_calculo_CD_ERRO: TSmallintField;
    qry_log_erro_calculo_NM_MENSAGEM: TStringField;
    qry_log_erro_calculo_CD_ITEM: TStringField;
    qry_log_erro_calculo_NM_ITEM: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_log_erro_calculo: Tdatm_log_erro_calculo;

implementation

{$R *.DFM}



end.
