(*************************************************************************************************
SISTEMA: MyIndaiá - Indaiá Logística
PROGRAMA: PGSM105.PAS - Data Module Cadastro de Unidades de Negócio
DATA: dd/mm/yyyy
Manutenção:
Data:
*************************************************************************************************)

unit PGSM105;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_unidade = class(TDataModule)
    ds_unid_neg: TDataSource;
    tbl_yesno_: TTable;
    ds_unid_neg_produto: TDataSource;
    ds_yesno: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_ult_unid_neg_: TQuery;
    qry_ult_unid_neg_ULTIMO: TStringField;
    qry_unid_neg_look_ativo: TStringField;
    sp_ativar_desativar_unidade: TStoredProc;
    qry_unid_neg_produto_: TQuery;
    qry_unid_neg_produto_look_ativo: TStringField;
    qry_produto_: TQuery;
    qry_unid_neg_produto_CD_UNID_NEG: TStringField;
    qry_unid_neg_produto_CD_PRODUTO: TStringField;
    qry_unid_neg_produto_IN_ATIVO: TStringField;
    qry_unid_neg_produto_NR_ULT_FATURA: TFloatField;
    qry_unid_neg_produto_NR_ULT_NOTA: TFloatField;
    qry_unid_neg_produto_NR_ULT_PROCESSO: TFloatField;
    qry_unid_neg_produto_NR_ULT_PREVISAO: TStringField;
    qry_unid_neg_produto_TX_NUMERARIO_OBS: TMemoField;
    qry_unid_neg_produto_TX_NUMERARIO_ASS: TMemoField;
    qry_unid_neg_produto_look_nm_produto: TStringField;
    qry_unid_neg_produto_look_ap_produto: TStringField;
    ds_produto: TDataSource;
    qry_unid_neg_produto_look_nm_unid_neg: TStringField;
    qry_usuario_habilitacao_produto_: TQuery;
    ds_usuario_habilitacao_produto: TDataSource;
    qry_usuario_habilitacao_unidade_: TQuery;
    ds_usuario_habilitacao_unidade: TDataSource;
    qry_usuario_habilitacao_produto_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_produto_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_produto_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_produto_NR_ULT_FATURA: TFloatField;
    qry_usuario_habilitacao_produto_NR_ULT_NOTA: TFloatField;
    qry_usuario_habilitacao_produto_NR_ULT_PROCESSO: TFloatField;
    qry_usuario_habilitacao_produto_NR_ULT_PREVISAO: TStringField;
    qry_usuario_habilitacao_produto_TX_NUMERARIO_OBS: TMemoField;
    qry_usuario_habilitacao_produto_TX_NUMERARIO_ASS: TMemoField;
    qry_usuario_habilitacao_produto_look_ativo: TStringField;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_produto_CD_VIATRANSP: TStringField;
    qry_usuario_habilitacao_unidade_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_unidade_NM_UNID_NEG: TStringField;
    qry_usuario_habilitacao_unidade_AP_UNID_NEG: TStringField;
    qry_usuario_habilitacao_unidade_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_produto_look_nm_produto: TStringField;
    qry_usuario_habilitacao_produto_look_ap_produto: TStringField;
    qry_usuario_habilitacao_unidade_look_ativo: TStringField;
    qry_unid_neg_CGC_UNID_NEG: TStringField;
    qry_unid_neg_CD_FILIAL: TStringField;
    qry_unid_neg_END_UNID_NEG: TStringField;
    qry_unid_neg_END_NUMERO: TStringField;
    qry_unid_neg_END_BAIRRO: TStringField;
    qry_unid_neg_END_CIDADE: TStringField;
    qry_unid_neg_END_UF: TStringField;
    qry_unid_neg_IE_UNID_NEG: TStringField;
    qry_unid_neg_NR_FONE: TStringField;
    qry_unid_neg_END_CEP: TStringField;
    qry_unid_neg_NR_FAX1: TStringField;
    qry_unid_neg_NR_FAX2: TStringField;
    qry_unid_neg_NM_SLOGAN: TStringField;
    qry_unid_neg_NR_NOTA_FATURA: TStringField;
    qry_unid_neg_NM_EMAIL: TStringField;
    qry_unid_neg_PATH_RELATORIOS: TStringField;
    qry_unid_neg_PATH_SISCOMEX: TStringField;
    qry_unid_neg_PATH_REI: TStringField;
    qry_unid_neg_NM_DIRETOR: TStringField;
    qry_unid_neg_NR_CPF_DIRETOR: TStringField;
    qry_unid_neg_NM_CONTADOR: TStringField;
    qry_unid_neg_NR_CRC_CONTADOR: TStringField;
    qry_unid_neg_NM_PROCURADOR: TStringField;
    qry_unid_neg_NR_CPF_PROCURADOR: TStringField;
    qry_pais_: TQuery;
    qry_unid_neg_CD_PAIS: TStringField;
    qry_pais_CODIGO: TStringField;
    qry_pais_DESCRICAO: TStringField;
    qry_unid_neg_Look_Pais: TStringField;
    qry_unid_neg_VL_ALIQ_ISS: TFloatField;
    qry_unid_neg_IM_UNID_NEG: TStringField;
    qry_unid_neg_NR_PROC_NF_PREF: TStringField;
    qry_unid_neg_NR_LIVRO: TStringField;
    qry_unid_neg_NM_SIGLA: TStringField;
    qry_unid_neg_CD_BANCO_CONCILIACAO: TStringField;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_unid_neg_LookBanco: TStringField;
    qry_unid_neg_CD_CT_CUSTO: TStringField;
    ds_cd_custo: TDataSource;
    qry_custo: TQuery;
    qry_unid_neg_LookCusto: TStringField;
    procedure qry_usuario_habilitacao_unidade_AfterScroll(
      DataSet: TDataSet);
  private
    // Private declarations 
  public
    // Public declarations 
  end;

var
  datm_unidade: Tdatm_unidade;

implementation

{$R *.DFM}

procedure Tdatm_unidade.qry_usuario_habilitacao_unidade_AfterScroll(DataSet: TDataSet);
begin
  qry_unid_neg_.Close;
  qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := qry_usuario_habilitacao_unidade_CD_UNID_NEG.AsString;
  qry_unid_neg_.Prepare;
  qry_unid_neg_.Open;
end;

end.
