unit PGSM207;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Funcoes, PGGP017;

type
  Tdatm_manut_rel_fin = class(TDataModule)
    ds_rel_fin_controle: TDataSource;
    qry_rel_fin_controle_: TQuery;
    qry_rel_fin_controle_lista_: TQuery;
    ds_rel_fin_controle_lista: TDataSource;
    qry_rel_fin_controle_NR_RELATORIO: TStringField;
    qry_rel_fin_controle_DT_EMISSAO: TDateTimeField;
    qry_rel_fin_controle_CD_GRUPO: TStringField;
    qry_rel_fin_controle_CD_CLIENTE: TStringField;
    qry_rel_fin_controle_NR_ANO: TStringField;
    qry_rel_fin_controle_lista_CD_GRUPO: TStringField;
    qry_rel_fin_controle_lista_NM_GRUPO: TStringField;
    qry_rel_fin_controle_lista_CD_CLIENTE: TStringField;
    qry_rel_fin_controle_lista_NM_EMPRESA: TStringField;
    qry_rel_fin_controle_lista_NR_RELATORIO: TStringField;
    qry_rel_fin_controle_lista_NR_ANO: TStringField;
    qry_rel_fin_controle_lista_DT_EMISSAO: TDateTimeField;
    qry_grupo_: TQuery;
    qry_cliente_: TQuery;
    qry_rel_fin_controle_LookGrupo: TStringField;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_rel_fin_controle_LookCliente: TStringField;
    qry_ult_relat_grupo_: TQuery;
    qry_ult_relat_cli_: TQuery;
    qry_rel_fin_controle_lista_CD_UNID_NEG: TStringField;
    qry_rel_fin_controle_CD_UNID_NEG: TStringField;
    qry_rel_fin_controle_VL_REEMBOLSO: TFloatField;
    qry_rel_fin_controle_VL_JUROS: TFloatField;
    qry_rel_fin_controle_VL_CPMF: TFloatField;
    qry_rel_fin_controle_lista_AP_UNID_NEG: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_rel_fin_controle_LookUnidNeg: TStringField;
    qry_rel_fin_controle_CD_PRODUTO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_rel_fin_controle_lista_AP_PRODUTO: TStringField;
    qry_rel_fin_controle_lista_CD_PRODUTO: TStringField;
    qry_rel_fin_controle_LookProduto: TStringField;
    procedure qry_rel_fin_controle_AfterScroll(DataSet: TDataSet);
    procedure qry_rel_fin_controle_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_manut_rel_fin: Tdatm_manut_rel_fin;

implementation

uses PGSM206, PGGP001;

{$R *.DFM}

procedure Tdatm_manut_rel_fin.qry_rel_fin_controle_AfterScroll(
  DataSet: TDataSet);
begin
  with frm_manut_rel_fin do
  begin
    if dbedt_cd_grupo.Text = '' then
    begin
      dbedt_cd_grupo.Color   := clMenu;
      dbedt_cd_grupo.Enabled := False;
      dbedt_cd_grupo.TabStop := False;
      btn_co_grupo.Enabled   := False;
    end;

    if dbedt_cd_cliente.Text = '' then
    begin
      dbedt_cd_cliente.Color   := clMenu;
      dbedt_cd_cliente.Enabled := False;
      dbedt_cd_cliente.TabStop := False;
      btn_co_cliente.Enabled   := False;
    end;
  end;
end;

procedure Tdatm_manut_rel_fin.qry_rel_fin_controle_CalcFields(
  DataSet: TDataSet);
begin
  // Unidade
  qry_unid_neg_.Close;
  qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := qry_rel_fin_controle_CD_UNID_NEG.AsString;
  qry_unid_neg_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
  qry_unid_neg_.Prepare;
  qry_unid_neg_.Open;
  qry_rel_fin_controle_LookUnidNeg.AsString := qry_unid_neg_NM_UNID_NEG.AsString;
  qry_unid_neg_.Close;

  // Produto
  qry_produto_.Close;
  qry_produto_.ParamByName('CD_UNID_NEG').AsString := qry_rel_fin_controle_CD_UNID_NEG.AsString;
  qry_produto_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
  qry_produto_.ParamByName('CD_PRODUTO').AsString  := qry_rel_fin_controle_CD_PRODUTO.AsString;
  qry_produto_.Prepare;
  qry_produto_.Open;
  qry_rel_fin_controle_LookProduto.AsString := qry_produto_NM_PRODUTO.AsString;
  qry_produto_.Close;
end;

end.
