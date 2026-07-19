unit PGSM243;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_cliente_agente = class(TDataModule)
    ds_cliente_ag: TDataSource;
    qry_cliente_ag_: TQuery;
    ds_empresa_nac: TDataSource;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    ds_yesno: TDataSource;
    ds_unid_neg: TDataSource;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_ag: TDataSource;
    qry_ag_: TQuery;
    ds_cliente_ag_dem: TDataSource;
    qry_cliente_ag_dem_: TQuery;
    qry_cliente_ag_CD_CLIENTE: TStringField;
    qry_cliente_ag_CD_UNID_NEG: TStringField;
    qry_cliente_ag_CD_PRODUTO: TStringField;
    qry_cliente_ag_CD_AGENTE: TStringField;
    qry_cliente_ag_NR_DIAS_FREE_TIME: TIntegerField;
    qry_cliente_ag_LookCliente: TStringField;
    qry_cliente_ag_LookUnidNeg: TStringField;
    qry_cliente_ag_LookProduto: TStringField;
    qry_cliente_ag_LookAgente: TStringField;
    qry_ag_CD_AGENTE: TStringField;
    qry_ag_NM_AGENTE: TStringField;
    qry_cliente_ag_dem_CD_UNID_NEG: TStringField;
    qry_cliente_ag_dem_CD_PRODUTO: TStringField;
    qry_cliente_ag_dem_CD_CLIENTE: TStringField;
    qry_cliente_ag_dem_CD_AGENTE: TStringField;
    qry_cliente_ag_dem_NR_DIAS_PERIODO: TIntegerField;
    qry_cliente_ag_dem_VL_DIARIA: TFloatField;
    qry_cliente_ag_dem_CD_MOEDA: TStringField;
    qry_cliente_ag_dem_TP_CNTR: TStringField;
    qry_cliente_ag_dem_LookCliente: TStringField;
    qry_cliente_ag_dem_LookUnidNeg: TStringField;
    qry_cliente_ag_dem_LookProduto: TStringField;
    qry_cliente_ag_dem_LookAgente: TStringField;
    qry_yes_no_: TQuery;
    qry_yes_no_CD_YESNO: TStringField;
    qry_yes_no_TX_YESNO: TStringField;
    qry_cliente_ag_IN_ATIVO: TStringField;
    ds_tp_cntr: TDataSource;
    qry_tp_cntr_: TQuery;
    ds_moeda: TDataSource;
    qry_moeda_: TQuery;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_NM_MOEDA: TStringField;
    qry_cliente_ag_LookAtivo: TStringField;
    qry_cliente_ag_dem_LookTpCntr: TStringField;
    qry_cliente_ag_dem_LookMoeda: TStringField;
    us_cliente_ag: TUpdateSQL;
    us_cliente_ag_dem_: TUpdateSQL;
    qry_cliente_ag_dem_NR_PERIODO: TStringField;
    qry_cliente_ag_dem_IN_ISENTO: TStringField;
    qry_cliente_ag_dem_LookIsento: TStringField;
    qry_cliente_ag_dem_DT_INI_VIG: TDateTimeField;
    qry_cliente_ag_dem_DT_FIM_VIG: TDateTimeField;
    qry_cliente_ag_dem_CD_TRANSPORTADOR: TStringField;
    qry_transp_: TQuery;
    ds_transp_: TDataSource;
    qry_transp_CD_TRANSP_ITL: TStringField;
    qry_transp_NM_TRANSP_ITL: TStringField;
    qry_cliente_ag_CD_TRANSPORTADOR: TStringField;
    qry_cliente_ag_LookTransp: TStringField;
    qry_cliente_ag_dem_LookTransp: TStringField;
    procedure qry_cliente_ag_AfterScroll(DataSet: TDataSet);
    procedure qry_cliente_ag_CalcFields(DataSet: TDataSet);
    procedure qry_cliente_ag_dem_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cliente_agente: Tdatm_cliente_agente;

implementation

uses GSMLIB;

{$R *.DFM}

procedure Tdatm_cliente_agente.qry_cliente_ag_AfterScroll(
  DataSet: TDataSet);
begin
  qry_cliente_ag_dem_.Close;
  qry_cliente_ag_dem_.ParamByName('CD_CLIENTE').AsString  := qry_cliente_ag_CD_CLIENTE.AsString;
  qry_cliente_ag_dem_.ParamByName('CD_UNID_NEG').AsString := qry_cliente_ag_CD_UNID_NEG.AsString;
  qry_cliente_ag_dem_.ParamByName('CD_PRODUTO').AsString  := qry_cliente_ag_CD_PRODUTO.AsString;
  qry_cliente_ag_dem_.ParamByName('CD_AGENTE').AsString   := qry_cliente_ag_CD_AGENTE.AsString;
  qry_cliente_ag_dem_.ParamByName('CD_TRANSPORTADOR').AsString := qry_cliente_ag_CD_TRANSPORTADOR.AsString;
  qry_cliente_ag_dem_.Prepare;
  qry_cliente_ag_dem_.Open;
end;

procedure Tdatm_cliente_agente.qry_cliente_ag_CalcFields(
  DataSet: TDataSet);
begin
  qry_cliente_ag_LookCliente.AsString := Lookup( qry_empresa_nac_, qry_cliente_ag_CD_CLIENTE, 'CD_EMPRESA', 'NM_EMPRESA' );
  qry_cliente_ag_LookUnidNeg.AsString := Lookup( qry_unid_neg_, qry_cliente_ag_CD_UNID_NEG, 'CD_UNID_NEG', 'NM_UNID_NEG' );
  qry_cliente_ag_LookProduto.AsString := Lookup( qry_produto_, qry_cliente_ag_CD_PRODUTO, 'CD_PRODUTO', 'NM_PRODUTO' );
  qry_cliente_ag_LookAgente.AsString  := Lookup( qry_ag_, qry_cliente_ag_CD_AGENTE, 'CD_AGENTE', 'NM_AGENTE' );
  qry_cliente_ag_LookTransp.AsString := Lookup ( qry_transp_, qry_cliente_ag_CD_TRANSPORTADOR, 'CD_TRANSP_ITL', 'NM_TRANSP_ITL');
end;

procedure Tdatm_cliente_agente.qry_cliente_ag_dem_CalcFields(
  DataSet: TDataSet);
begin
  qry_cliente_ag_dem_LookCliente.AsString := Lookup( qry_empresa_nac_, qry_cliente_ag_dem_CD_CLIENTE, 'CD_EMPRESA', 'NM_EMPRESA' );
  qry_cliente_ag_dem_LookUnidNeg.AsString := Lookup( qry_unid_neg_, qry_cliente_ag_dem_CD_UNID_NEG, 'CD_UNID_NEG', 'NM_UNID_NEG' );
  qry_cliente_ag_dem_LookProduto.AsString := Lookup( qry_produto_, qry_cliente_ag_dem_CD_PRODUTO, 'CD_PRODUTO', 'NM_PRODUTO' );
  qry_cliente_ag_dem_LookAgente.AsString  := Lookup( qry_ag_, qry_cliente_ag_dem_CD_AGENTE, 'CD_AGENTE', 'NM_AGENTE' );
  qry_cliente_ag_dem_LookMoeda.AsString   := Lookup( qry_moeda_, qry_cliente_ag_dem_CD_MOEDA, 'CD_MOEDA', 'NM_MOEDA' );
  qry_cliente_ag_dem_LookTransp.AsString  := Lookup( qry_transp_, qry_cliente_ag_dem_CD_TRANSPORTADOR, 'CD_TRANSP_ITL', 'NM_TRANSP_ITL');

end;



end.
