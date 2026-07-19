unit PGNM024;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_libera_sol_aberto = class(TDataModule)
    qry_lista_: TQuery;
    ds_lista_: TDataSource;
    qry_lista_NR_PROCESSO: TStringField;
    qry_lista_VL_SOLICITADO: TFloatField;
    qry_lista_VL_RECEBIDO: TFloatField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_lista_calc_nr_processo: TStringField;
    qry_lista_calc_diferenca: TFloatField;
    qry_libera_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField3: TFloatField;
    qry_lista_CD_UNID_NEG: TStringField;
    qry_lista_CD_PRODUTO: TStringField;
    qry_lista_NM_SERVICO: TStringField;
    procedure qry_lista_AfterOpen(DataSet: TDataSet);
    procedure qry_lista_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_libera_sol_aberto: Tdatm_libera_sol_aberto;

implementation

uses PGNM023;

{$R *.DFM}

procedure Tdatm_libera_sol_aberto.qry_lista_AfterOpen(DataSet: TDataSet);
begin
  frm_libera_sol_aberto.btn_liberar.Enabled := ( qry_lista_.RecordCount > 0 );
  frm_libera_sol_aberto.mi_liberar.Enabled  := frm_libera_sol_aberto.btn_liberar.Enabled;
end;

procedure Tdatm_libera_sol_aberto.qry_lista_CalcFields(DataSet: TDataSet);
begin
  qry_lista_calc_nr_processo.AsString := Copy( qry_lista_NR_PROCESSO.AsString, 5, 14 );
  qry_lista_calc_diferenca.AsFloat    := qry_lista_VL_RECEBIDO.AsFloat - qry_lista_VL_SOLICITADO.AsFloat;
end;

end.
