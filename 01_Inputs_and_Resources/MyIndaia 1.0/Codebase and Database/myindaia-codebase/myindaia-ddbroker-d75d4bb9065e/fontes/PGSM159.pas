unit PGSM159;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_acesso_scx = class(TDataModule)
    ds_acesso_scx: TDataSource;
    qry_acesso_scx_: TQuery;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_acesso_scx_CD_ACESSO: TStringField;
    qry_acesso_scx_NM_USUARIO: TStringField;
    qry_acesso_scx_CD_SENHA_SCX: TStringField;
    qry_acesso_scx_CPF_USUARIO: TStringField;
    qry_acesso_scx_CPF_REPRES: TStringField;
    qry_acesso_scx_IN_ATIVO: TStringField;
    qry_acesso_scx_CNPJ_REPRES: TStringField;
    qry_acesso_scx_LookAtivo: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_acesso_scx: Tdatm_acesso_scx;

implementation



{$R *.DFM}


end.
