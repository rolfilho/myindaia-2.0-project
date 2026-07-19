unit PGSM005;
                            
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pesq_log = class(TDataModule)
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_tabela_: TQuery;
    qry_tabela_CD_TABELA: TStringField;
    qry_tabela_NM_TABELA: TStringField;
    qry_modulo_: TQuery;
    qry_modulo_CD_MODULO: TStringField;
    qry_modulo_NM_MODULO: TStringField;
    qry_rotina_: TQuery;
    qry_rotina_CD_MODULO: TStringField;
    qry_rotina_CD_ROTINA: TStringField;
    qry_rotina_NM_ROTINA: TStringField;
    qry_mov_log_: TQuery;
    qry_mov_log_CD_MOVIMENTO: TStringField;
    qry_mov_log_NM_MOVIMENTO: TStringField;
    ds_log: TDataSource;
    qry_usuario_AP_USUARIO: TStringField;
    qry_modulo_AP_MODULO: TStringField;
    qry_log_: TQuery;
    qry_log_NR_SEQUENCIA: TAutoIncField;
    qry_log_CD_USUARIO: TStringField;
    qry_log_CD_TABELA: TStringField;
    qry_log_CD_MOVIMENTO: TStringField;
    qry_log_CD_MODULO: TStringField;
    qry_log_CD_ROTINA: TStringField;
    qry_log_CD_CHAVE: TStringField;
    qry_log_DT_MOVIMENTO: TDateTimeField;
    qry_log_LookUsuario: TStringField;
    qry_log_LookTabela: TStringField;
    qry_log_LookMovimento: TStringField;
    qry_log_LookModulo: TStringField;
    qry_log_LookRotina: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pesq_log: Tdatm_pesq_log;

implementation

{$R *.DFM}

end.
