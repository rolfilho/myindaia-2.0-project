unit PGSM031;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables ;

type
  Tdatm_duplica_param_cli = class(TDataModule)
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    sp_duplica_param_cli: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_duplica_param_cli: Tdatm_duplica_param_cli;

implementation

{$R *.DFM}








end.
