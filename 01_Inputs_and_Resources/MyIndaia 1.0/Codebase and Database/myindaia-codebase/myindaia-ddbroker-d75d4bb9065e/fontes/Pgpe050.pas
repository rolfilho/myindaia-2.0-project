(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGPE050.PAS - Data Module Relatório de DDE - Vencimento

AUTOR: Leandro Stipanich

DATA: dd/mm/yyyy

Manutenção:

*************************************************************************************************)
unit PGPE050;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_rel_dde_vencto = class(TDataModule)
    qry_unidade_: TQuery;
    qry_grupo_: TQuery;
    qry_cliente_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    sp_vencto_dde: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_rel_dde_vencto: Tdatm_rel_dde_vencto;

implementation

{$R *.DFM}

end.
