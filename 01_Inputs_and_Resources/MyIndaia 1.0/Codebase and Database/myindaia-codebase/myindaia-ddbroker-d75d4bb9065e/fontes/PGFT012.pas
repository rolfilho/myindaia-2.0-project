unit PGFT012;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cli_mes_ano = class(TDataModule)
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cli_mes_ano: Tdatm_cli_mes_ano;

implementation

{$R *.DFM}



end.
