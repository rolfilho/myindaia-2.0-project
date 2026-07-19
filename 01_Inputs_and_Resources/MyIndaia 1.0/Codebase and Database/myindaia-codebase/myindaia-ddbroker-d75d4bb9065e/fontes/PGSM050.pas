unit PGSM050;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_modulo = class(TDataModule)
    ds_modulo: TDataSource;
    tbl_yesno_: TTable;
    ds_modulo_rotina: TDataSource;
    ds_yesno: TDataSource;
    qry_modulo_: TQuery;
    qry_modulo_rotina_: TQuery;
    qry_modulo_CD_MODULO: TStringField;
    qry_modulo_NM_MODULO: TStringField;
    qry_modulo_AP_MODULO: TStringField;
    qry_modulo_rotina_CD_MODULO: TStringField;
    qry_modulo_rotina_CD_ROTINA: TStringField;
    qry_modulo_rotina_NM_ROTINA: TStringField;
    qry_modulo_rotina_look_nm_modulo: TStringField;
    qry_ult_modulo_rotina_: TQuery;
    qry_ult_modulo_rotina_ULTIMO: TStringField;
    sp_atz_controle_acesso: TStoredProc;
    qry_modulo_rotina_NM_MENU: TStringField;
    qry_modulo_rotina_NM_FORM: TStringField;
    procedure qry_modulo_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_modulo: Tdatm_modulo;

implementation

{$R *.DFM}

procedure Tdatm_modulo.qry_modulo_AfterScroll(DataSet: TDataSet);
begin
  datm_modulo.qry_modulo_rotina_.Close;
  datm_modulo.qry_modulo_rotina_.ParamByName('CD_MODULO').AsString:=datm_modulo.qry_modulo_.FieldByName('CD_MODULO').AsString;
  datm_modulo.qry_modulo_rotina_.Open;
end;


end.
