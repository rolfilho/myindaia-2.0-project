(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGSM237.PAS - Data Module Cadastro de Cargos

AUTOR: Leandro Stipanich

DATA: 08/10/2001

Manutenção: Leandro Stipanich

Data: 08/10/2001

************************************************************************************************)
unit PGSM237;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_depto_cargo = class(TDataModule)
    qry_cargo_: TQuery;
    qry_ult_cargo_: TQuery;
    ds_cargo: TDataSource;
    qry_cargo_CD_DEPTO_CARGO: TStringField;
    qry_cargo_NM_DEPTO_CARGO: TStringField;
    qry_ult_cargo_ULTIMO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_depto_cargo: Tdatm_depto_cargo;

implementation

{$R *.DFM}

end.
