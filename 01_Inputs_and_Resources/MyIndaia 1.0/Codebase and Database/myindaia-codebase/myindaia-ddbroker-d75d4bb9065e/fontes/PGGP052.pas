(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGGP052.PAS - datm_ajuste_impressao_boleto

AUTOR: Leandro Stipanich

DATA: 05/10/2001

Manutenção: Leandro Stipanich

*************************************************************************************************)

unit PGGP052;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ajuste_impressao_boleto = class(TDataModule)
    qry_ajuste_impressao_: TQuery;
    qry_unidade_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_NM_UNID_NEG: TStringField;
    ds_ajuste_impressao: TDataSource;
    qry_lista_: TQuery;
    ds_lista: TDataSource;
    qry_lista_CD_UNID_NEG: TStringField;
    qry_lista_NM_UNID_NEG: TStringField;
    qry_lista_NR_BANCO: TStringField;
    qry_lista_NM_BCO: TStringField;
    qry_ajuste_impressao_CD_UNID_NEG: TStringField;
    qry_ajuste_impressao_NR_BANCO: TStringField;
    qry_ajuste_impressao_L_LOCAL_PAGTO: TStringField;
    qry_ajuste_impressao_C_LOCAL_PAGTO: TStringField;
    qry_ajuste_impressao_C_DT_VENCTO: TStringField;
    qry_ajuste_impressao_L_DT_DOCTO: TStringField;
    qry_ajuste_impressao_C_DT_DOCTO: TStringField;
    qry_ajuste_impressao_C_NR_DOCTO: TStringField;
    qry_ajuste_impressao_L_VL_DOCTO: TStringField;
    qry_ajuste_impressao_C_VL_DOCTO: TStringField;
    qry_ajuste_impressao_L_TX_INSTR: TStringField;
    qry_ajuste_impressao_C_TX_INSTR: TStringField;
    qry_ajuste_impressao_L_NR_FATURA: TStringField;
    qry_ajuste_impressao_C_NR_FATURA: TStringField;
    qry_ajuste_impressao_L_SACADO: TStringField;
    qry_ajuste_impressao_C_SACADO: TStringField;
    qry_bco_: TQuery;
    qry_bco_CD_BCO: TStringField;
    qry_bco_NM_BCO: TStringField;
    qry_ajuste_impressao_LookUnidNeg: TStringField;
    qry_ajuste_impressao_LookBanco: TStringField;
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ajuste_impressao_boleto: Tdatm_ajuste_impressao_boleto;

implementation

{$R *.DFM}

procedure Tdatm_ajuste_impressao_boleto.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_ajuste_impressao_.Close;
  qry_ajuste_impressao_.ParamByName('CD_UNID_NEG').AsString := qry_lista_CD_UNID_NEG.AsString;
  qry_ajuste_impressao_.ParamByName('NR_BANCO').AsString    := qry_lista_NR_BANCO.AsString;
  qry_ajuste_impressao_.Prepare;
  qry_ajuste_impressao_.Open;
end;

end.
