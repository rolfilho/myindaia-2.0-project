unit PGSM045;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Funcoes, PGGP017;

type
  Tdatm_celula = class(TDataModule)
    ds_celula: TDataSource;
    qry_celula_: TQuery;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    qry_ult_celula_: TQuery;
    qry_celula_IN_ATIVO: TStringField;
    qry_celula_LookAtivo: TStringField;
    qry_celula_CD_CELULA: TStringField;
    qry_celula_NM_CELULA: TStringField;
    qry_celula_CD_ANALISTA: TStringField;
    qry_celula_LookAnalista: TStringField;
    qry_usuario_: TQuery;
    qry_ult_celula_ULTIMO: TStringField;
    procedure qry_celula_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_celula: Tdatm_celula;

implementation

uses GSMLIB, PGGP001, PGSM044;

{$R *.DFM}

procedure Tdatm_celula.qry_celula_CalcFields(DataSet: TDataSet);
begin
  {Analista}
  qry_usuario_.Close;
  qry_usuario_.ParamByName('CD_ANALISTA').AsString := qry_celula_CD_ANALISTA.AsString;
  qry_usuario_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
  qry_usuario_.ParamByName('CD_CARGO').AsString    := str_cd_cargo;
  qry_usuario_.Prepare;
  qry_usuario_.Open;
  if Not qry_usuario_.EOF then
     qry_celula_LookAnalista.AsString := qry_usuario_.FieldByName('NM_USUARIO').AsString
  else
     qry_celula_LookAnalista.AsString := '';
end;


end.
