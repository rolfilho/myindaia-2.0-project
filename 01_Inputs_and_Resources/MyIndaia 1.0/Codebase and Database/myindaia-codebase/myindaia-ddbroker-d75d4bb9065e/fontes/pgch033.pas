unit PGCH033;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_sel_cli_periodo = class(TDataModule)
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    sp_proc_pag_desemb: TStoredProc;
    qry_apaga_dados: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    sp_processos_abertos_fat: TStoredProc;
    qry_limpa_proc_abfat_: TQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    sp_proc_pag_des_li: TStoredProc;
    qry_unidade_: TQuery;
    qry_produto_: TQuery;
    qry_unidade_NM_UNID_NEG: TStringField;
    ds_tp_canal_: TDataSource;
    qry_tp_canal_: TQuery;
    qry_tp_canal_CD_CANAL: TStringField;
    qry_tp_canal_NM_CANAL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_cli_periodo: Tdatm_sel_cli_periodo;

implementation

{$R *.DFM}




end.
