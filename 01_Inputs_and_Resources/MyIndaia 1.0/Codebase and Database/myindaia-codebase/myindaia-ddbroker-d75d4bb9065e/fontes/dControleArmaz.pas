unit dControleArmaz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_controle_armazenagem = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_armazem_: TQuery;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_arm_vencido_: TQuery;
    qry_armazem_CD_ARMAZEM: TStringField;
    qry_armazem_NM_ARMAZEM: TStringField;
    qry_arm_vencido_NR_PROCESSO: TStringField;
    qry_arm_vencido_NR_PERIODO: TIntegerField;
    ds_arm_vencido: TDataSource;
    qry_arm_vencido_NrCalcProcesso: TStringField;
    qry_arm_vencido_CD_ARMAZEM_DESCARGA: TStringField;
    qry_arm_vencido_CD_TABELA: TStringField;
    qry_arm_tabela_: TQuery;
    qry_arm_tabela_CD_ARMAZEM: TStringField;
    qry_arm_tabela_CD_TABELA: TStringField;
    qry_arm_tabela_NM_TABELA: TStringField;
    qry_arm_tabela_IN_PADRAO: TStringField;
    qry_arm_tabela_IN_SABDOM: TStringField;
    qry_arm_tabela_IN_FERIADO: TStringField;
    qry_arm_tabela_IN_ATIVO: TStringField;
    qry_arm_tab_periodo_: TQuery;
    qry_arm_tab_periodo_CD_ARMAZEM: TStringField;
    qry_arm_tab_periodo_CD_TABELA: TStringField;
    qry_arm_tab_periodo_NR_PERIODO: TIntegerField;
    qry_arm_tab_periodo_QT_DIAS: TIntegerField;
    qry_arm_tab_periodo_VL_PERCENTUAL: TFloatField;
    qry_arm_tab_periodo_VL_TX_ADICIONAL: TFloatField;
    qry_arm_vencido_DT_VENCTO: TDateTimeField;
    qry_feriado_: TQuery;
    qry_feriado_DT_FERIADO: TDateTimeField;
    qry_feriado_NM_FERIADO: TStringField;
    qry_armazem_processo_: TQuery;
    qry_armazem_processo_NR_PROCESSO: TStringField;
    qry_armazem_processo_NR_PERIODO: TIntegerField;
    qry_armazem_processo_DT_VENCTO: TDateTimeField;
    qry_armazem_processo_DT_PAGTO: TDateTimeField;
    qry_armazem_processo_CD_TABELA: TStringField;
    qry_armazem_processo_IN_PRORROG: TStringField;
    qry_arm_vencido_LookArmazem: TStringField;
    qry_arm_vencido_CD_EMPRESA: TStringField;
    qry_arm_vencido_NM_EMPRESA: TStringField;
    qry_armazem_processo_CD_ARMAZEM: TStringField;
    procedure qry_arm_vencido_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_controle_armazenagem: Tdatm_controle_armazenagem;

implementation

{$R *.DFM}




procedure Tdatm_controle_armazenagem.qry_arm_vencido_CalcFields(
  DataSet: TDataSet);
begin
   qry_arm_vencido_NrCalcProcesso.AsString := Copy (qry_arm_vencido_NR_PROCESSO.AsString, 5 ,14);
end;



end.
