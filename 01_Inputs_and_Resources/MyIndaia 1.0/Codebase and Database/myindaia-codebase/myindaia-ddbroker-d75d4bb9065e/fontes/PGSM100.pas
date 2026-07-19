unit PGSM100;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_senha = class(TDataModule)
    qry_direitos_: TQuery;
    qry_usuario_: TQuery;
    qry_habilitacao_: TQuery;
    ds_usuario: TDataSource;
    ds_habilitacao: TDataSource;
    qry_habilitacao_CD_UNID_NEG: TStringField;
    qry_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_CD_SENHA: TStringField;
    qry_usuario_CD_CARGO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_usuario_IN_ATIVO: TStringField;
    qry_direitos_CD_CARGO: TStringField;
    qry_direitos_CD_MODULO: TStringField;
    qry_direitos_CD_ROTINA: TStringField;
    qry_direitos_IN_ACESSO: TBooleanField;
    qry_direitos_IN_INCLUIR: TBooleanField;
    qry_direitos_IN_MODIFICAR: TBooleanField;
    qry_direitos_IN_EXCLUIR: TBooleanField;
    qry_habilitacao_AP_UNID_NEG: TStringField;
    qry_habilitacao_AP_PRODUTO: TStringField;
    sp_password: TStoredProc;
    sp_verifica_login: TStoredProc;
    qry_direitos_po_: TQuery;
    qry_direitos_po_CD_CARGO: TStringField;
    qry_direitos_po_CD_MODULO: TStringField;
    qry_direitos_po_CD_ROTINA: TStringField;
    qry_direitos_po_IN_ACESSO: TBooleanField;
    qry_direitos_po_IN_INCLUIR: TBooleanField;
    qry_direitos_po_IN_MODIFICAR: TBooleanField;
    qry_direitos_po_IN_EXCLUIR: TBooleanField;
    qry_direitos_pe_: TQuery;
    qry_direitos_pe_CD_CARGO: TStringField;
    qry_direitos_pe_CD_MODULO: TStringField;
    qry_direitos_pe_CD_ROTINA: TStringField;
    qry_direitos_pe_IN_ACESSO: TBooleanField;
    qry_direitos_pe_IN_INCLUIR: TBooleanField;
    qry_direitos_pe_IN_MODIFICAR: TBooleanField;
    qry_direitos_pe_IN_EXCLUIR: TBooleanField;
    qry_usuario_IN_AVISO_PO: TStringField;
    qry_direitos_NM_MENU: TStringField;
    qry_usuario_EXPIROU: TIntegerField;
    qry_usuario_QT_SENHA_ERRADA_PARAM: TIntegerField;
    qry_usuario_QT_SENHA_INCORRETA: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_senha: Tdatm_senha;

implementation

uses PGSM020;

{$R *.DFM}




end.
