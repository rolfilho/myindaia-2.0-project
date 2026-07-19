unit PGSD012;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_sda_distr = class(TDataModule)
    ds_processo_sda: TDataSource;
    qry_processo_sda_: TQuery;
    qry_processo_sda_NR_PROCESSO: TStringField;
    qry_processo_sda_CD_SERVICO: TStringField;
    qry_processo_sda_CD_CLIENTE: TStringField;
    sp_distribui_sda: TStoredProc;
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_verifica_sda_hab_: TQuery;
    qry_verifica_sda_hab_CD_TAB_SDA: TStringField;
    qry_processo_sda_CD_UNID_NEG: TStringField;
    qry_processo_sda_CD_PRODUTO: TStringField;
    qry_verifica_sda_serv_: TQuery;
    qry_verifica_sda_serv_CD_TAB_SDA: TStringField;
    qry_verifica_sda_hab_TP_TAB_SDA: TStringField;
    qry_celula_: TQuery;
    qry_usuario_: TQuery;
    qry_processo_sda_NM_SERVICO: TStringField;
    qry_processo_sda_CD_STATUS: TStringField;
    qry_processo_sda_CalcSelecao: TStringField;
    qry_processo_sda_IN_DISTR: TStringField;
    qry_processo_sda_AP_EMPRESA: TStringField;
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
    qry_processo_sda_CalcProcesso: TStringField;
    procedure qry_processo_sda_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sda_distr: Tdatm_sda_distr;

implementation

{$R *.DFM}


procedure Tdatm_sda_distr.qry_processo_sda_CalcFields(
  DataSet: TDataSet);
begin
  if qry_processo_sda_IN_DISTR.AsString = '0' then
    qry_processo_sda_CalcSelecao.AsString := ''
  else
    qry_processo_sda_CalcSelecao.AsString := 'ü'
end;

end.
