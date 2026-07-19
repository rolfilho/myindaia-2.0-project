(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGSM235.PAS - Data Module Cadastro de Departamentos

AUTOR: Leandro Stipanich

DATA: 08/10/2001

Manutenção: Leandro Stipanich

Data: 08/10/2001

************************************************************************************************)
unit PGSM235;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_depto = class(TDataModule)
    qry_depto_: TQuery;
    ds_depto: TDataSource;
    qry_ult_depto_: TQuery;
    qry_ult_depto_ULTIMO: TStringField;
    qry_depto_CD_DEPTO: TStringField;
    qry_depto_NM_DEPTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_depto: Tdatm_depto;

implementation

{$R *.DFM}

end.
