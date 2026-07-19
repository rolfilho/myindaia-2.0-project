unit PGSD016;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, RAWPrinter,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_sda_cancel = class(TDataModule)
    ds_processo_sda: TDataSource;
    qry_processo_sda_: TQuery;
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_celula_: TQuery;
    qry_usuario_: TQuery;
    qry_atz_todos_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    qry_processo_sda_NM_SERVICO: TStringField;
    qry_processo_sda_VL_SDA: TFloatField;
    qry_processo_sda_NR_PROCESSO: TStringField;
    qry_processo_sda_CalcSelecao: TStringField;
    qry_processo_sda_AP_EMPRESA: TStringField;
    qry_processo_sda_CalcProcesso: TStringField;
    qry_processo_sda_IN_CANCEL: TStringField;
    qry_processo_sda_CalcImpresso: TStringField;
    qry_processo_sda_CD_STATUS: TStringField;
    procedure qry_processo_sda_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sda_cancel: Tdatm_sda_cancel;

implementation

uses PGSD013;

{$R *.DFM}

procedure Tdatm_sda_cancel.qry_processo_sda_CalcFields(DataSet: TDataSet);
begin
  if qry_processo_sda_IN_CANCEL.AsString = '0' then
    qry_processo_sda_CalcSelecao.AsString := ''
  else
    qry_processo_sda_CalcSelecao.AsString := 'ü';

  if qry_processo_sda_CD_STATUS.AsString = '1' then
    qry_processo_sda_CalcImpresso.AsString := ''
  else
    qry_processo_sda_CalcImpresso.AsString := '2';
end;

end.
