unit PGPE044;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;                                                                             

type
  Tdatm_exp_bordero = class(TDataModule)
    ds_proc_exp: TDataSource;
    qry_proc_exp_: TQuery;
    qry_emp_nac_: TQuery;
    ds_emp_nac: TDataSource;
    qry_exp_bord_: TQuery;
    ds_exp_bord_: TDataSource;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_processo: TDataSource;
    qry_processo_: TQuery;
    qry_exec_sp_: TQuery;
    ds_exp_bord_item: TDataSource;
    qry_exp_bord_item_: TQuery;
    qry_proc_exp_NR_PROCESSO: TStringField;
    qry_proc_exp_DT_ENVIO: TDateTimeField;
    qry_proc_exp_NR_FATURA: TStringField;
    qry_proc_exp_DT_FATURA: TDateTimeField;
    qry_proc_exp_NR_PROTOCOLO: TStringField;
    qry_exp_bord_NR_PROCESSO: TStringField;
    qry_exp_bord_CD_EXPORTADOR: TStringField;
    qry_exp_bord_DT_FATURA: TDateTimeField;
    qry_exp_bord_DT_ENVIO: TDateTimeField;
    qry_exp_bord_NR_FATURA: TStringField;
    qry_exp_bord_NR_PROTOCOLO: TStringField;
    qry_exp_bord_TX_OBSERVACAO: TMemoField;
    qry_exp_bord_item_NR_PROCESSO: TStringField;
    qry_exp_bord_item_NR_SEQUENCIA: TStringField;
    qry_exp_bord_item_CD_DOCUMENTO: TStringField;
    qry_exp_bord_item_NR_REFERENCIA: TStringField;
    qry_exp_bord_item_QT_ORIGINAIS: TIntegerField;
    qry_exp_bord_item_QT_COPIAS: TIntegerField;
    qry_exp_bord_item_TX_OBSERVACAO: TMemoField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_DT_FATURA: TDateTimeField;
    qry_processo_VL_TOT_MCV: TFloatField;
    qry_tp_documento_: TQuery;
    ds_emp_est_: TDataSource;
    qry_emp_est_: TQuery;
    qry_emp_est_CD_EMPRESA: TStringField;
    qry_emp_est_NM_EMPRESA: TStringField;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    qry_proc_exp_CalcNrProcesso: TStringField;
    qry_processo_NR_FATURA: TStringField;
    qry_processo_CD_EXPORTADOR: TStringField;
    qry_processo_CD_IMPORTADOR: TStringField;
    qry_exp_bord_LookExportador: TStringField;
    qry_exp_bord_LookImportador: TStringField;
    qry_exp_bord_CD_IMPORTADOR: TStringField;
    qry_ult_doc_: TQuery;
    qry_ult_doc_ULTIMO: TStringField;
    qry_tp_documento_CODIGO: TStringField;
    qry_tp_documento_DESCRICAO: TStringField;
    qry_tp_documento_CD_UNID_NEG: TStringField;
    qry_tp_documento_CD_PRODUTO: TStringField;
    qry_exp_bord_item_LookDocumento: TStringField;
    qry_exp_bord_item_NR_FATURA: TStringField;
    procedure qry_proc_exp_CalcFields(DataSet: TDataSet);
    procedure qry_exp_bord_BeforeEdit(DataSet: TDataSet);
    procedure qry_exp_bord_BeforeInsert(DataSet: TDataSet);
    procedure qry_exp_bord_item_BeforeEdit(DataSet: TDataSet);
    procedure qry_exp_bord_item_BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_exp_bordero: Tdatm_exp_bordero;

implementation

uses PGPE043;

{$R *.DFM}





procedure Tdatm_exp_bordero.qry_proc_exp_CalcFields(DataSet: TDataSet);
begin
  if Not qry_proc_exp_NR_PROCESSO.IsNull then
    qry_proc_exp_CalcNrProcesso.AsString := Copy( qry_proc_exp_NR_PROCESSO.AsString, 5, 14 );

end;

procedure Tdatm_exp_bordero.qry_exp_bord_BeforeEdit(DataSet: TDataSet);
begin
  frm_exp_bordero.btn_incluir.Enabled  := False;
  frm_exp_bordero.btn_salvar.Enabled   := True;
  frm_exp_bordero.btn_cancelar.Enabled := True;
  frm_exp_bordero.btn_excluir.Enabled  := False;

  frm_exp_bordero.mi_incluir.Enabled   := False;
  frm_exp_bordero.mi_salvar.Enabled    := True;
  frm_exp_bordero.mi_cancelar.Enabled  := True;
  frm_exp_bordero.mi_excluir.Enabled   := False;

end;

procedure Tdatm_exp_bordero.qry_exp_bord_BeforeInsert(DataSet: TDataSet);
begin
  frm_exp_bordero.btn_incluir.Enabled  := False;
  frm_exp_bordero.btn_salvar.Enabled   := True;
  frm_exp_bordero.btn_cancelar.Enabled := True;
  frm_exp_bordero.btn_excluir.Enabled  := False;

  frm_exp_bordero.mi_incluir.Enabled   := False;
  frm_exp_bordero.mi_salvar.Enabled    := True;
  frm_exp_bordero.mi_cancelar.Enabled  := True;
  frm_exp_bordero.mi_excluir.Enabled   := False;
end;
                  

procedure Tdatm_exp_bordero.qry_exp_bord_item_BeforeEdit(
  DataSet: TDataSet);
begin
  frm_exp_bordero.btn_incluir.Enabled  := False;
  frm_exp_bordero.btn_salvar.Enabled   := True;
  frm_exp_bordero.btn_cancelar.Enabled := True;
  frm_exp_bordero.btn_excluir.Enabled  := False;

  frm_exp_bordero.mi_incluir.Enabled   := False;
  frm_exp_bordero.mi_salvar.Enabled    := True;
  frm_exp_bordero.mi_cancelar.Enabled  := True;
  frm_exp_bordero.mi_excluir.Enabled   := False;
end;

procedure Tdatm_exp_bordero.qry_exp_bord_item_BeforeInsert(
  DataSet: TDataSet);
begin
  frm_exp_bordero.btn_incluir.Enabled  := False;
  frm_exp_bordero.btn_salvar.Enabled   := True;
  frm_exp_bordero.btn_cancelar.Enabled := True;
  frm_exp_bordero.btn_excluir.Enabled  := False;

  frm_exp_bordero.mi_incluir.Enabled   := False;
  frm_exp_bordero.mi_salvar.Enabled    := True;
  frm_exp_bordero.mi_cancelar.Enabled  := True;
  frm_exp_bordero.mi_excluir.Enabled   := False;
end;

end.

