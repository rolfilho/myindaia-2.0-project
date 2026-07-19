(*************************************************************************************************

Sistema: DDBroker - Indaiá Logística

PROGRAMA: PGSM247.PAS - datm_atualiza_basf

AUTOR:

DATA:  24/10/2002

Manutenção:

*************************************************************************************************)
unit PGSM247;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_atualiza_ncm = class(TDataModule)
    ds_atualiza_ncm: TDataSource;
    qry_atualiza_ncm_: TQuery;
    qry_atualiza_ncm_CD_NCM_SH: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_atualiza_ncm: Tdatm_atualiza_ncm;

implementation

{$R *.DFM}

end.
