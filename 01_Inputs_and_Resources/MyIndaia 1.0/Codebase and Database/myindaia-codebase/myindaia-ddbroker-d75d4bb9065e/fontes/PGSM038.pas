unit PGSM038;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_duplica_eventos = class(TDataModule)
    qry_servico_: TQuery;
    sp_duplica_eventos: TStoredProc;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_item_: TQuery;
    sp_duplica_item_area: TStoredProc;
    qry_item_area: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_duplica_eventos: Tdatm_duplica_eventos;

implementation

{$R *.DFM}








end.
