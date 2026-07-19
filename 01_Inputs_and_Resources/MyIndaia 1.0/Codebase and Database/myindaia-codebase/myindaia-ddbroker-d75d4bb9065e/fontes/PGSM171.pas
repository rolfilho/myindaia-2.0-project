unit PGSM171;

interface
                                                                           
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Funcoes;

type
  Tdatm_ct_gerencial = class(TDataModule)
    ds_ct_gerencial: TDataSource;
    qry_ct_gerencial_: TQuery;
    qry_ct_gerencial_CD_CT_GERENCIAL: TStringField;
    qry_ct_gerencial_NM_CT_GERENCIAL: TStringField;
    ds_rateios: TDataSource;
    qry_rateios: TQuery;
    qry_ult_rateios: TQuery;
    qry_ult_rateiosULTIMO: TStringField;
    qry_rateiosCD_RATEIO: TStringField;
    qry_rateiosNM_RATEIO: TStringField;
    dts_rateio_contas: TDataSource;
    qry_rateio_contas: TQuery;
    qry_rateio_contasCD_RATEIO: TStringField;
    qry_rateio_contasPERC: TFloatField;
    qry_rateio_contasCD_CT_CUSTO: TStringField;
    sqlAux: TQuery;
    qry_rateiosIN_ATIVO: TStringField;
    qry_rateioscalcAtivo: TStringField;
    procedure qry_rateiosAfterOpen(DataSet: TDataSet);
    procedure qry_rateio_contasAfterInsert(DataSet: TDataSet);
    procedure qry_rateiosAfterScroll(DataSet: TDataSet);
    procedure qry_rateio_contasPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure qry_rateiosCalcFields(DataSet: TDataSet);
    procedure qry_rateiosAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ct_gerencial: Tdatm_ct_gerencial;

implementation

uses PGSM170;

{$R *.DFM}

procedure Tdatm_ct_gerencial.qry_rateiosAfterOpen(DataSet: TDataSet);
begin
  qry_rateio_Contas.Open;
end;

procedure Tdatm_ct_gerencial.qry_rateio_contasAfterInsert(
  DataSet: TDataSet);
begin
  qry_rateio_ContasCD_RATEIO.AsString := qry_rateiosCD_RATEIO.AsString;
end;

procedure Tdatm_ct_gerencial.qry_rateiosAfterScroll(DataSet: TDataSet);
begin
  frm_ct_gerencial.MontaTreeView;
  frm_ct_gerencial.lblAtivo.Visible := qry_rateiosIN_ATIVO.AsString = '1';  //ativo
  frm_ct_gerencial.bevelAtivo.Visible := qry_rateiosIN_ATIVO.AsString = '1';  //ativo
end;

procedure Tdatm_ct_gerencial.qry_rateio_contasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);       
begin
  TrataErro(E);
  Action := daAbort;
end;

procedure Tdatm_ct_gerencial.qry_rateiosCalcFields(DataSet: TDataSet);
begin
  qry_rateioscalcAtivo.AsString := IIF(qry_rateiosIN_ATIVO.AsString = '1','Sim','Não');
end;

procedure Tdatm_ct_gerencial.qry_rateiosAfterClose(DataSet: TDataSet);
begin
  qry_rateio_contas.Close;
end;

end.



//Rodrigo Capra - 02/01/2008







