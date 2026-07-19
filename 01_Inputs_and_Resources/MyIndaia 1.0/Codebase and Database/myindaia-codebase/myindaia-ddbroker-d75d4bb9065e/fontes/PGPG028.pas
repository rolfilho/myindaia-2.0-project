unit PGPG028;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_sel_pagtos = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_param_: TQuery;
    qry_param_CD_ITEM_COMISSAO: TStringField;
    qry_param_CD_ITEM_EXPED: TStringField;
    qry_favorecido_: TQuery;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    qry_apaga_dados: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    qry_item_: TQuery;
    sp_rel_pagto: TStoredProc;
    qry_grupo_item_: TQuery;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_pagtos: Tdatm_sel_pagtos;

implementation

{$R *.DFM}









end.
