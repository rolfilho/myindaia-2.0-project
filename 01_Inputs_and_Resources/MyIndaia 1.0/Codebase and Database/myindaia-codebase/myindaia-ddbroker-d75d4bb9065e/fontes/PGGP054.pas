(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGGP054.PAS - Data Module - Relatório Comercial - Importação/Exportação

AUTOR: Leandro Stipanich

Data: 28/09/2001

*************************************************************************************************)
unit PGGP054;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_rel_com_imp_exp = class(TDataModule)
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_unidade_: TQuery;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    sp_rel_com_imp_exp: TStoredProc;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_rel_com_imp_exp: Tdatm_rel_com_imp_exp;

implementation

{$R *.DFM}


end.
