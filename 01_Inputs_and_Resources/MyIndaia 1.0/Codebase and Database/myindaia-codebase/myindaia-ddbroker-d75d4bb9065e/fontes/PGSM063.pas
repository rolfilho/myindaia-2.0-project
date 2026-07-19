unit PGSM063;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_amz = class(TDataModule)
    ds_amz: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_amz_: TQuery;
    qry_ult_amz_: TQuery;
    qry_unid_neg_: TQuery;
    ds_unid_neg: TDataSource;
    qry_amz_NM_ARMAZEM: TStringField;
    qry_amz_NM_SIGLA: TStringField;
    qry_amz_CD_SETOR: TStringField;
    qry_amz_CD_RECINTO: TStringField;
    qry_amz_CD_URF: TStringField;
    qry_amz_CD_UNID_NEG: TStringField;
    qry_amz_IN_ATRACACAO: TStringField;
    qry_amz_IN_DESCARGA: TStringField;
    qry_amz_IN_ESTOCAGEM: TStringField;
    qry_amz_CD_MARGEM: TStringField;
    qry_amz_TP_TAXA: TStringField;
    qry_amz_CD_TAXA: TStringField;
    qry_amz_IN_ATIVO: TStringField;
    qry_amz_look_atracacao: TStringField;
    ds_recinto_setores_importacao: TDataSource;
    qry_recinto_setores_importacao_: TQuery;
    qry_recinto_setores_importacao_Orgao: TStringField;
    qry_recinto_setores_importacao_Recinto: TStringField;
    qry_recinto_setores_importacao_Setor: TStringField;
    qry_recinto_setores_importacao_Nome: TStringField;
    qry_amz_look_descarga: TStringField;
    qry_amz_look_estocagem: TStringField;
    qry_amz_look_ativo: TStringField;
    qry_rec_alfandegado_: TQuery;
    ds_rec_alfandegado: TDataSource;
    qry_urf_: TQuery;
    ds_urf: TDataSource;
    qry_urf_CODIGO: TStringField;
    qry_urf_DESCRICAO: TStringField;
    qry_rec_alfandegado_CODIGO: TStringField;
    qry_rec_alfandegado_DESCRICAO: TStringField;
    qry_rec_alfandegado_COD_ORGAO_REC: TStringField;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_tp_taxa_: TQuery;
    ds_tp_taxa: TDataSource;
    qry_margem_: TQuery;
    ds_margem: TDataSource;
    qry_margem_CD_MARGEM: TStringField;
    qry_margem_NM_MARGEM: TStringField;
    qry_amz_look_margem: TStringField;
    qry_amz_look_tp_taxa: TStringField;
    qry_tp_taxa_CD_TP_TAXA: TStringField;
    qry_tp_taxa_NM_TP_TAXA: TStringField;
    qry_tx_tra_: TQuery;
    qry_tx_armazenagem_: TQuery;
    ds_tx_tra: TDataSource;
    ds_tx_armazenagem: TDataSource;
    qry_tx_armazenagem_CD_TAXA: TStringField;
    qry_tx_armazenagem_NM_DESCRICAO: TStringField;
    qry_tx_armazenagem_VL_CNTR_20_MD_PALLET: TFloatField;
    qry_tx_armazenagem_VL_CNTR_20_MD_OUTROS: TFloatField;
    qry_tx_armazenagem_VL_CNTR_40_MD_PALLET: TFloatField;
    qry_tx_armazenagem_VL_CNTR_40_MD_OUTROS: TFloatField;
    qry_tx_armazenagem_VL_C_SOLTA_MD: TFloatField;
    qry_tx_armazenagem_VL_CNTR_20_ME_PALLET: TFloatField;
    qry_tx_armazenagem_VL_CNTR_20_ME_OUTROS: TFloatField;
    qry_tx_armazenagem_VL_CNTR_40_ME_PALLET: TFloatField;
    qry_tx_armazenagem_VL_CNTR_40_ME_OUTROS: TFloatField;
    qry_tx_armazenagem_VL_C_SOLTA_ME: TFloatField;
    qry_tx_armazenagem_VL_MINIMO: TFloatField;
    qry_tx_tra_CD_TAXA_TRA: TStringField;
    qry_tx_tra_NM_DESCRICAO: TStringField;
    qry_tx_tra_VL_THC_CNTR_20: TFloatField;
    qry_tx_tra_VL_THC_CNTR_40: TFloatField;
    qry_tx_tra_VL_THC_C_SOLTA: TFloatField;
    qry_tx_tra_VL_THC_CNTR_20_RORO: TFloatField;
    qry_tx_tra_VL_THC_CNTR_40_RORO: TFloatField;
    qry_tx_tra_VL_THC_C_SOLTA_RORO: TFloatField;
    qry_tx_tra_VL_THC_MIN: TFloatField;
    qry_tx_tra_VL_CARR_CNTR_20_MM: TFloatField;
    qry_tx_tra_VL_CARR_CNTR_20_MO: TFloatField;
    qry_tx_tra_VL_CARR_CNTR_40_MM: TFloatField;
    qry_tx_tra_VL_CARR_CNTR_40_MO: TFloatField;
    qry_tx_tra_VL_CARR_C_SOLTA_MM: TFloatField;
    qry_tx_tra_VL_CARR_C_SOLTA_MO: TFloatField;
    qry_tx_tra_VL_CARR_MIN: TFloatField;
    qry_tx_tra_PC_ACR_CARR_PERIGO: TFloatField;
    qry_tx_tra_NR_PERIODO_ARM: TIntegerField;
    qry_tx_tra_VL_ARM_CNTR_1P: TFloatField;
    qry_tx_tra_VL_ARM_CNTR_DP: TFloatField;
    qry_tx_tra_VL_ARM_CNTR_20_MIN: TFloatField;
    qry_tx_tra_VL_ARM_CNTR_40_MIN: TFloatField;
    qry_tx_tra_VL_ARM_CNTR_REIMP: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_1P: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_2P: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_3P: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_DP: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_MIN: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_BAGAGEM: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_REIMP: TFloatField;
    qry_tx_tra_PC_ACR_ARM_PERIGO: TFloatField;
    qry_tx_tra_VL_ENERGIA_CNTR_FIXO: TFloatField;
    qry_tx_tra_VL_ENERGIA_CNTR_20: TFloatField;
    qry_tx_tra_VL_ENERGIA_CNTR_40: TFloatField;
    qry_tx_tra_PC_ISS: TFloatField;
    qry_tx_tra_IN_ATIVO: TStringField;
    qry_amz_CD_ARMAZEM: TStringField;
    qry_tx_armazenagem_IN_ATIVO: TStringField;
    qry_amz_look_nm_tx_tra: TStringField;
    qry_amz_look_nm_tx_amg: TStringField;
    qry_ult_amz_ULTIMO: TStringField;
    qry_amz_NM_SIGLA_CONT: TStringField;
    qry_amz_NM_LOCAL_DESP: TStringField;
    qry_amz_CD_UF: TStringField;
    qry_amz_END_ARMAZEM: TStringField;
    qry_amz_NR_TELEFONE: TStringField;
    qry_amz_NR_CONTATO: TStringField;
    qry_amz_NR_FAX: TStringField;
    qry_amz_CD_CIDADE: TStringField;
    qry_amz_NM_CONTATO: TStringField;
    qry_amz_CGC_ARMAZEM: TStringField;
    qry_arm_tabela_: TQuery;
    qry_arm_tabela_CD_ARMAZEM: TStringField;
    qry_arm_tabela_CD_TABELA: TStringField;
    qry_arm_tabela_NM_TABELA: TStringField;
    qry_arm_tabela_IN_PADRAO: TStringField;
    qry_arm_tabela_LookAtivo: TStringField;
    qry_arm_tabela_IN_SABDOM: TStringField;
    qry_arm_tabela_IN_FERIADO: TStringField;
    qry_arm_tabela_IN_ATIVO: TStringField;
    qry_arm_tabela_lookPadrao: TStringField;
    ds_arm_tabela: TDataSource;
    ds_arm_tab_periodo: TDataSource;
    qry_arm_tab_periodo_: TQuery;
    qry_arm_tab_periodo_CD_ARMAZEM: TStringField;
    qry_arm_tab_periodo_CD_TABELA: TStringField;
    qry_arm_tab_periodo_NR_PERIODO: TIntegerField;
    qry_arm_tab_periodo_QT_DIAS: TIntegerField;
    qry_arm_tab_periodo_VL_PERCENTUAL: TFloatField;
    qry_arm_tab_periodo_VL_TX_ADICIONAL: TFloatField;
    qry_ult_arm_tabela_: TQuery;
    qry_ult_arm_tabela_ULTIMO: TStringField;
    qry_padrao_tab_: TQuery;
    qry_padrao_tab_IN_PADRAO: TStringField;
    qry_ult_arm_tab_periodo_: TQuery;
    qry_ult_arm_tab_periodo_ULTIMO: TIntegerField;
    qry_delete_periodos_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    qry_arm_tabela_DT_VIGENCIA_INI: TDateTimeField;
    qry_arm_tabela_DT_VIGENCIA_FIM: TDateTimeField;
    qry_arm_tabela_TP_CNTR: TStringField;
    qry_arm_tabela_VL_MINIMO: TFloatField;
    procedure qry_amz_AfterPost(DataSet: TDataSet);
    procedure qry_amz_BeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_amz: Tdatm_amz;

implementation

uses PGSM064;

{$R *.DFM}


procedure Tdatm_amz.qry_amz_AfterPost(DataSet: TDataSet);
begin
  frm_amz.Btn_Mi( True, False, False, True );
end;

procedure Tdatm_amz.qry_amz_BeforeEdit(DataSet: TDataSet);
begin
  frm_amz.VerificaCampoTaxa;
  frm_amz.Btn_Mi( False, True, True, False );
end;

end.
