{ Data module Licença Importação
  Autor: Edvaldo de Andrade }
  
unit PGLI008;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_trans_LI = class(TDataModule)
    REGIMP: TDatabase;
    qry_li_scx_: TQuery;
    tbl_Numerador_LI_: TTable;
    qry_li_itens_scx_: TQuery;
    qry_dest_NCM_: TQuery;
    qry_proc_anuentes_scx_: TQuery;
    RS_Diag_LI: TQuery;
    TABSISCO: TDatabase;
    RS_TB: TQuery;
    qry_li_: TQuery;
    qry_li_itens_: TQuery;
    ds_li_lista: TDataSource;
    qry_li_lista_: TQuery;
    qry_emp_nac_: TQuery;
    qry_emp_est_: TQuery;
    qry_unid_med_broker_: TQuery;
    qry_proc_anuentes_: TQuery;
    qry_ag_secex_: TQuery;
    qry_li_lista_CalcNrProcesso: TFloatField;
    qry_li_lista_DT_PROCESSO_LI: TDateTimeField;
    qry_li_lista_NR_REGISTRO_LI: TStringField;
    qry_li_lista_DT_REGISTRO_LI: TDateTimeField;
    qry_li_lista_NR_PROCESSO: TStringField;
    qry_li_lista_NM_EMPRESA: TStringField;
    procedure qry_li_lista_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_trans_LI: Tdatm_trans_LI;

implementation

{$R *.DFM}

procedure Tdatm_trans_LI.qry_li_lista_CalcFields(DataSet: TDataSet);
begin
  qry_li_lista_CalcNrProcesso.AsString := Copy( qry_li_lista_.FieldByName('NR_PROCESSO').AsString, 4, 14 );
end;

end.
