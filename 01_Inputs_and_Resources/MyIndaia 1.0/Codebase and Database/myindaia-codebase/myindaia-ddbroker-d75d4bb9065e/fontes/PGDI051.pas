(*******************************************************************************
Sistema    : DDBroker - Indaiá Logística
PROGRAMA   : PGDI051 - Data Module de Liberação de DI Valores Altos
AUTOR      :
DATA       : 
Manutenção : 10/02/2005
*******************************************************************************)
unit PGDI051;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_di_libera = class(TDataModule)
    qry_lista_: TQuery;
    ds_lista_: TDataSource;
    qry_lista_NR_PROCESSO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_lista_calc_nr_processo: TStringField;
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
    qry_lista_VL_CIF_DOLAR: TFloatField;
    qry_lista_VL_MIN_DI: TFloatField;
    qry_lista_IN_TIPO_REGISTRO: TIntegerField;
    procedure qry_lista_AfterOpen(DataSet: TDataSet);
    procedure qry_lista_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_di_libera: Tdatm_di_libera;

implementation

uses PGDI050;

{$R *.DFM}

procedure Tdatm_di_libera.qry_lista_AfterOpen(DataSet: TDataSet);
begin
  frm_di_libera.btn_liberar.Enabled := ( qry_lista_.RecordCount > 0 );
  frm_di_libera.mi_liberar.Enabled  := frm_di_libera.btn_liberar.Enabled;
end;

procedure Tdatm_di_libera.qry_lista_CalcFields(DataSet: TDataSet);
begin
  qry_lista_calc_nr_processo.AsString := Copy( qry_lista_NR_PROCESSO.AsString, 5, 14 );
end;

end.
