
unit dGerarConsolidada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_gerar_consolidada = class(TDataModule)
    qry_lista_proc_: TQuery;
    qry_lista_proc_NR_PROCESSO: TStringField;
    qry_lista_proc_CD_CLIENTE: TStringField;
    qry_lista_proc_CD_EMP_EST: TStringField;
    qry_lista_proc_NM_CLIENTE: TStringField;
    qry_lista_proc_NM_IMP: TStringField;
    qry_lista_proc_calc_processo: TStringField;
    qry_lista_proc_IN_SELECIONADO: TStringField;
    ds_lista_proc: TDataSource;
    ds_proc_conhec: TDataSource;
    qry_proc_conhec_: TQuery;
    qry_proc_conhec_NR_PROCESSO: TStringField;
    qry_proc_conhec_CD_CLIENTE: TStringField;
    qry_proc_conhec_CD_EMP_EST: TStringField;
    qry_proc_conhec_NR_HOUSE: TStringField;
    qry_proc_conhec_NM_CLIENTE: TStringField;
    qry_proc_conhec_NM_IMP: TStringField;
    qry_proc_conhec_calc_processo: TStringField;
    UpDate_proc_lista: TUpdateSQL;
    qry_lista_proc_TP_ESTUFAGEM: TStringField;
    qry_lista_proc_calc_estufagem: TStringField;
    qry_lista_proc_NR_PROPOSTA: TStringField;
    qry_lista_proc_CD_PRODUTO: TStringField;
    qry_lista_proc_CD_SERVICO: TStringField;
    qry_lista_proc_CD_TAB_FRETE_VENDA: TStringField;
    qry_lista_proc_CHARGEABLE: TFloatField;
    qry_lista_proc_QTD_VOLUME: TFloatField;
    qry_lista_proc_VL_PESO_BRUTO: TFloatField;
    qry_lista_proc_CD_INCOTERM: TStringField;
    qry_lista_proc_IN_PEDIDO: TStringField;
    procedure qry_lista_proc_CalcFields(DataSet: TDataSet);
    procedure qry_proc_conhec_CalcFields(DataSet: TDataSet);
    procedure qry_lista_proc_AfterDelete(DataSet: TDataSet);
    procedure qry_lista_proc_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_gerar_consolidada: Tdatm_gerar_consolidada;

implementation

uses uGerarConsolidada;

{$R *.DFM}

procedure Tdatm_gerar_consolidada.qry_lista_proc_CalcFields(
  DataSet: TDataSet);
begin
qry_lista_proc_calc_processo.AsString:=copy(qry_lista_proc_NR_PROCESSO.AsString,5,10);

  if qry_lista_proc_TP_ESTUFAGEM.AsString = '0' then
    qry_lista_proc_calc_estufagem.AsString:='LCL';
  if qry_lista_proc_TP_ESTUFAGEM.AsString = '1' then
    qry_lista_proc_calc_estufagem.AsString:='FCL';
  if qry_lista_proc_TP_ESTUFAGEM.AsString = '2' then
    qry_lista_proc_calc_estufagem.AsString:='BB';
end;

procedure Tdatm_gerar_consolidada.qry_proc_conhec_CalcFields(
  DataSet: TDataSet);
begin
qry_proc_conhec_calc_processo.AsString:=copy(qry_proc_conhec_NR_PROCESSO.AsString,5,10);
end;

procedure Tdatm_gerar_consolidada.qry_lista_proc_AfterDelete(
  DataSet: TDataSet);
begin
qry_lista_proc_.ApplyUpdates;
end;

procedure Tdatm_gerar_consolidada.qry_lista_proc_AfterPost(
  DataSet: TDataSet);
begin
qry_lista_proc_.ApplyUpdates;
end;

end.
