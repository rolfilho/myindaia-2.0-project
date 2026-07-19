unit PGPE052;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_exp_carta_cred = class(TDataModule)
    ds_lista: TDataSource;
    qry_lista_: TQuery;
    qry_exp_carta_cred_: TQuery;
    ds_exp_carta_cred: TDataSource;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_processo: TDataSource;
    qry_processo_: TQuery;
    qry_processo_DT_FATURA: TDateTimeField;
    qry_processo_CD_TERMO_PAGTO: TStringField;
    qry_processo_VL_TOT_MCV: TFloatField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_EXPORTADOR: TStringField;
    qry_processo_NR_FATURA: TStringField;
    qry_processo_STR_DT_FATURA: TStringField;
    qry_lista_CD_EXPORTADOR: TStringField;
    qry_lista_NM_EXPORTADOR: TStringField;
    qry_lista_CD_IMPORTADOR: TStringField;
    qry_lista_NM_IMPORTADOR: TStringField;
    us_exp_carta_cred: TUpdateSQL;
    qry_lista_CalcNrProcesso: TStringField;
    qry_lista_NR_PROCESSO: TStringField;
    sp_exp_carta_cred: TStoredProc;
    procedure qry_exp_carta_cred_BeforeEdit(DataSet: TDataSet);
    procedure qry_exp_carta_cred_BeforeInsert(DataSet: TDataSet);
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_exp_carta_cred: Tdatm_exp_carta_cred;

implementation

uses PGPE051;

{$R *.DFM}

procedure Tdatm_exp_carta_cred.qry_exp_carta_cred_BeforeEdit(DataSet: TDataSet);
begin
  with frm_exp_carta_cred do
  begin
    btn_incluir.Enabled  := False;
    btn_salvar.Enabled   := True;
    btn_cancelar.Enabled := True;
    btn_excluir.Enabled  := False;

    mi_incluir.Enabled   := False;
    mi_salvar.Enabled    := True;
    mi_cancelar.Enabled  := True;
    mi_excluir.Enabled   := False;
  end;
end;

procedure Tdatm_exp_carta_cred.qry_exp_carta_cred_BeforeInsert(DataSet: TDataSet);
begin
  with frm_exp_carta_cred do
  begin
    btn_incluir.Enabled  := False;
    btn_salvar.Enabled   := True;
    btn_cancelar.Enabled := True;
    btn_excluir.Enabled  := False;

    mi_incluir.Enabled   := False;
    mi_salvar.Enabled    := True;
    mi_cancelar.Enabled  := True;
    mi_excluir.Enabled   := False;
  end;
end;

procedure Tdatm_exp_carta_cred.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_exp_carta_cred_.Close;
  qry_exp_carta_cred_.Prepare;
  qry_exp_carta_cred_.Open;
end;

end.
