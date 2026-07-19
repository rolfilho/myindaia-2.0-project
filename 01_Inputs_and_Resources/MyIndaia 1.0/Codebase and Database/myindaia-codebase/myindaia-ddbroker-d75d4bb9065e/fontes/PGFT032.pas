unit PGFT032;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_previsao_custo = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_processo_: TQuery;
    ds_processo: TDataSource;
    qry_previsao_custo_: TQuery;
    ds_previsao_custo: TDataSource;
    qry_item_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField7: TStringField;
    sp_atz_prev_custo: TStoredProc;
    StringField8: TStringField;
    StringField9: TStringField;
    qry_previsao_custo_NR_PROCESSO: TStringField;
    qry_previsao_custo_CD_ITEM: TStringField;
    qry_previsao_custo_VL_CALCULADO: TFloatField;
    qry_previsao_custo_VL_INFORMADO: TFloatField;
    qry_previsao_custo_DT_LANCAMENTO: TDateTimeField;
    qry_previsao_custo_VL_TAXA: TFloatField;
    qry_previsao_custo_IN_TRANSF: TStringField;
    qry_previsao_custo_look_nm_item: TStringField;
    qry_processo_Calc_Nr_Processo: TStringField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_previsao_custo_NR_SEQUENCIA: TAutoIncField;
    qry_apaga_: TQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    qry_taxa_cambio_: TQuery;
    qry_taxa_cambio_TX_CAMBIO: TFloatField;
    qry_di_: TQuery;
    qry_di_TOTAL: TIntegerField;
    procedure qry_processo_CalcFields(DataSet: TDataSet);
    procedure qry_previsao_custo_AfterOpen(DataSet: TDataSet);
    procedure qry_previsao_custo_AfterPost(DataSet: TDataSet);
    procedure qry_previsao_custo_AfterDelete(DataSet: TDataSet);
    procedure qry_previsao_custo_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_previsao_custo: Tdatm_previsao_custo;

implementation

{$R *.DFM}


uses PGFT031;

procedure Tdatm_previsao_custo.qry_processo_CalcFields(DataSet: TDataSet);
begin
  if Not qry_processo_NR_PROCESSO.IsNull then
  begin
    qry_processo_Calc_Nr_Processo.AsString := Copy(qry_processo_NR_PROCESSO.AsString,5,14);
      //Copy( qry_processo_NR_PROCESSO.AsString, 5, 2 ) + '/' +
      //Copy( qry_processo_NR_PROCESSO.AsString, 7, 4 ) + '-' +
      //Copy( qry_processo_NR_PROCESSO.AsString,11, 1 );
  end
end;



procedure Tdatm_previsao_custo.qry_previsao_custo_AfterOpen(
  DataSet: TDataSet);
begin
  if qry_previsao_custo_.RecordCount > 0 then
  begin
    frm_previsao_custo.mi_excluir.Enabled := True;
    frm_previsao_custo.btn_excluir.Enabled := True;
  end
  else
  begin
    frm_previsao_custo.mi_excluir.Enabled := False;
    frm_previsao_custo.btn_excluir.Enabled := False;
  end;
end;

procedure Tdatm_previsao_custo.qry_previsao_custo_AfterPost(
  DataSet: TDataSet);
begin
  if qry_previsao_custo_.RecordCount > 0 then
  begin
    frm_previsao_custo.mi_excluir.Enabled := True;
    frm_previsao_custo.btn_excluir.Enabled := True;
  end
  else
  begin
    frm_previsao_custo.mi_excluir.Enabled := False;
    frm_previsao_custo.btn_excluir.Enabled := False;
  end;
end;

procedure Tdatm_previsao_custo.qry_previsao_custo_AfterDelete(
  DataSet: TDataSet);
begin
  if qry_previsao_custo_.RecordCount > 0 then
  begin
    frm_previsao_custo.mi_excluir.Enabled := True;
    frm_previsao_custo.btn_excluir.Enabled := True;
  end
  else
  begin
    frm_previsao_custo.mi_excluir.Enabled := False;
    frm_previsao_custo.btn_excluir.Enabled := False;
  end;
end;

procedure Tdatm_previsao_custo.qry_previsao_custo_AfterScroll(
  DataSet: TDataSet);
begin
  if qry_previsao_custo_IN_TRANSF.AsString = '1' then
  begin
    ds_previsao_custo.AutoEdit := False;
    frm_previsao_custo.mi_excluir.Enabled := False;
    frm_previsao_custo.btn_excluir.Enabled := False;
  end
  else
  begin
    ds_previsao_custo.AutoEdit := True;
    frm_previsao_custo.mi_excluir.Enabled := True;
    frm_previsao_custo.btn_excluir.Enabled := True;
  end
end;

end.
