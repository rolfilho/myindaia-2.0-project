unit PGSM219;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_sel_mercadoria = class(TDataModule)
    qry_mercadoria_: TQuery;
    sp_rel_po_saldo_mercadoria: TStoredProc;
    qry_limpa_: TQuery;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_mercadoria: Tdatm_sel_mercadoria;

implementation

{$R *.DFM}




end.
