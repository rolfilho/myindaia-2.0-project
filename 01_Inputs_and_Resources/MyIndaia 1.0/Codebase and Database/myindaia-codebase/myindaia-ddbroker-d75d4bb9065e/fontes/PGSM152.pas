unit PGSM152;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_feriado = class(TDataModule)
    qry_feriado_: TQuery;
    ds_feriado: TDataSource;
    qry_feriado_DT_FERIADO: TDateTimeField;
    qry_feriado_NM_FERIADO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_feriado: Tdatm_feriado;

implementation

{$R *.DFM}

end.
