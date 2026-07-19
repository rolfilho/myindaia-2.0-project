unit PGGP034;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_acordo_normas = class(TDataModule)
    qry_acordo_normas_: TQuery;
    ds_acordo_normas: TDataSource;
    qry_acordo_normas_CD_ACORDO: TStringField;
    qry_acordo_normas_CD_NORMA: TStringField;
    qry_acordo_normas_NM_DESCRICAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_acordo_normas: Tdatm_acordo_normas;

implementation

{$R *.DFM}
uses PGGP015;

end.
