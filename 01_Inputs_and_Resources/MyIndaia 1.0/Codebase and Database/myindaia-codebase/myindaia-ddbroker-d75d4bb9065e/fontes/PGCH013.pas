unit PGCH013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ent_ch_br = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_produto_CD_VIATRANSP: TStringField;
    ds_ch_br: TDataSource;
    tbl_yesno_: TTable;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_CD_SENHA: TStringField;
    qry_usuario_CD_CARGO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_usuario_IN_ATIVO: TStringField;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    qry_banco_NR_BANCO: TStringField;
    qry_banco_LVALOR: TIntegerField;
    qry_banco_CVALOR: TIntegerField;
    qry_banco_LEXTENSO: TIntegerField;
    qry_banco_CEXTENSO: TIntegerField;
    qry_banco_LFAVOR: TIntegerField;
    qry_banco_CFAVOR: TIntegerField;
    qry_banco_LCIDADE: TIntegerField;
    qry_banco_CCIDADE: TIntegerField;
    qry_banco_CDIA: TIntegerField;
    qry_banco_CANO: TIntegerField;
    qry_banco_ANOMASK: TStringField;
    qry_banco_FORMCONT: TBooleanField;
    qry_banco_LEXTENSO2: TIntegerField;
    qry_banco_CEXTENSO2: TIntegerField;
    qry_banco_CMES: TIntegerField;
    qry_banco_LCHEQUE: TIntegerField;
    qry_banco_CCHEQUE: TIntegerField;
    qry_banco_CBANCO: TIntegerField;
    qry_ch_br_: TQuery;
    qry_ch_br_CD_BANCO: TStringField;
    qry_ch_br_NR_CHEQUE: TStringField;
    qry_ch_br_CD_UNID_NEG: TStringField;
    qry_ch_br_CD_USUARIO: TStringField;
    qry_ch_br_CD_PRODUTO: TStringField;
    qry_ch_br_DT_ENTREGA: TDateTimeField;
    qry_ch_br_IN_TRANSFERIDO: TStringField;
    qry_ch_br_IN_BAIXADO: TStringField;
    qry_ch_br_IN_CANCELADO: TStringField;
    qry_favor_: TQuery;
    qry_favor_CD_FAVORECIDO: TStringField;
    qry_favor_NM_FAVORECIDO: TStringField;
    qry_favor_AP_FAVORECIDO: TStringField;
    qry_favor_END_FAVORECIDO: TStringField;
    qry_favor_END_NUMERO: TStringField;
    qry_favor_END_CIDADE: TStringField;
    qry_favor_END_BAIRRO: TStringField;
    qry_favor_END_UF: TStringField;
    qry_favor_END_CEP: TStringField;
    qry_favor_NR_FONE: TStringField;
    qry_favor_NR_FAX: TStringField;
    qry_favor_NM_CONTATO: TStringField;
    qry_favor_TX_CARGO: TStringField;
    qry_favor_TX_DEPARTAMENTO: TStringField;
    qry_favor_CD_TIPO_PESSOA: TStringField;
    qry_favor_CGC_EMPRESA: TStringField;
    qry_favor_CPF_EMPRESA: TStringField;
    qry_favor_IE_EMPRESA: TStringField;
    qry_favor_DT_INCLUSAO: TDateTimeField;
    qry_favor_IN_CONTROLA_IR: TBooleanField;
    qry_favor_IN_ATIVO: TStringField;
    qry_ch_br_look_ap_usuario: TStringField;
    qry_ch_br_look_ap_banco: TStringField;
    qry_ch_br_look_cancelado: TStringField;
    qry_ch_br_look_ap_produto: TStringField;
    qry_ch_br_look_ap_unid_neg: TStringField;
    qry_ch_br_look_ap_favor: TStringField;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_DT_HABILITACAO: TDateTimeField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_ch_br_look_nm_unid_neg: TStringField;
    qry_ch_br_look_nm_produto: TStringField;
    qry_traz_default_look_nm_unid_neg: TStringField;
    qry_traz_default_look_nm_produto: TStringField;
    qry_ch_br_it_: TQuery;
    ds_ch_br_it: TDataSource;
    qry_ch_br_it_CD_BANCO: TStringField;
    qry_ch_br_it_NR_CHEQUE: TStringField;
    qry_ch_br_it_NR_PROCESSO: TStringField;
    qry_ch_br_it_CD_ITEM: TStringField;
    qry_ch_br_it_VL_ITEM: TFloatField;
    qry_ch_br_it_VL_IR: TFloatField;
    qry_ch_br_it_CD_DESPACHANTE: TStringField;
    qry_ch_br_it_VL_ASSIST: TFloatField;
    qry_ch_br_it_VL_BONIFICACAO: TFloatField;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_item_CD_TIPO_ITEM: TStringField;
    qry_item_CD_TIPO_LANC_FAT: TStringField;
    qry_item_IN_ATIVO: TStringField;
    qry_desp_: TQuery;
    qry_desp_CD_DESPACHANTE: TStringField;
    qry_desp_NM_DESPACHANTE: TStringField;
    qry_desp_AP_DESPACHANTE: TStringField;
    qry_desp_VL_MIN_SDA: TFloatField;
    qry_desp_VL_MAX_SDA: TFloatField;
    qry_desp_CD_RISC: TStringField;
    qry_desp_IN_ATIVO: TStringField;
    qry_ch_br_it_look_nm_item: TStringField;
    qry_ch_br_it_look_ap_desp: TStringField;
    qry_ch_br_pesq_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DateTimeField1: TDateTimeField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_NR_ULT_FATURA: TFloatField;
    qry_usuario_habilitacao_NR_ULT_NOTA: TFloatField;
    qry_usuario_habilitacao_NR_ULT_PROCESSO: TFloatField;
    qry_usuario_habilitacao_NR_ULT_PREVISAO: TStringField;
    qry_usuario_habilitacao_TX_NUMERARIO_OBS: TMemoField;
    qry_usuario_habilitacao_TX_NUMERARIO_ASS: TMemoField;
    qry_ch_br_it_pesq_: TQuery;
    qry_ch_br_it_pesq_CD_BANCO: TStringField;
    qry_ch_br_it_pesq_NR_CHEQUE: TStringField;
    qry_ch_br_it_pesq_NR_PROCESSO: TStringField;
    qry_ch_br_it_pesq_CD_ITEM: TStringField;
    qry_ch_br_it_pesq_VL_ITEM: TFloatField;
    qry_ch_br_it_pesq_VL_IR: TFloatField;
    qry_ch_br_it_pesq_CD_DESPACHANTE: TStringField;
    qry_ch_br_it_pesq_VL_ASSIST: TFloatField;
    qry_ch_br_it_pesq_VL_BONIFICACAO: TFloatField;
    qry_ch_br_it_nr_processo_calc: TStringField;
    qry_ch_br_rel_: TQuery;
    qry_ch_br_rel_CD_BANCO: TStringField;
    qry_ch_br_rel_NR_CHEQUE: TStringField;
    qry_ch_br_rel_CD_UNID_NEG: TStringField;
    qry_ch_br_rel_CD_PRODUTO: TStringField;
    qry_ch_br_rel_CD_USUARIO: TStringField;
    qry_ch_br_rel_DT_ENTREGA: TDateTimeField;
    qry_ch_br_rel_IN_CANCELADO: TStringField;
    qry_ch_br_rel_IN_TRANSFERIDO: TStringField;
    qry_ch_br_rel_IN_BAIXADO: TStringField;
    qry_ch_br_rel_look_ap_usuario: TStringField;
    qry_ch_br_rel_look_ap_banco: TStringField;
    qry_ch_br_rel_look_cancelado: TStringField;
    qry_ch_br_rel_look_ap_produto: TStringField;
    qry_ch_br_rel_look_ap_unid_neg: TStringField;
    qry_ch_br_rel_look_ap_favor: TStringField;
    qry_ch_br_rel_look_nm_unid_neg: TStringField;
    qry_ch_br_rel_look_nm_produto: TStringField;
    qry_ch_br_CD_CANCELADOR: TStringField;
    qry_ch_br_DT_CANCELAMENTO: TDateTimeField;
    qry_ch_br_pesq_CD_CANCELADOR: TStringField;
    qry_ch_br_pesq_DT_CANCELAMENTO: TDateTimeField;
    qry_ch_br_rel_CD_CANCELADOR: TStringField;
    qry_ch_br_rel_DT_CANCELAMENTO: TDateTimeField;
    qry_ch_br_CD_FAVORECIDO: TStringField;
    qry_ch_br_rel_CD_FAVORECIDO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_AP_EMPRESA: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    ds_processo: TDataSource;
    ds_ch_br_rel: TDataSource;
    qry_ch_br_look_in_controla_ir: TBooleanField;
    qry_ch_br_DT_BAIXA: TDateTimeField;
    sp_baixar_cheque: TStoredProc;
    qry_banco_CD_ACESSO: TStringField;
    qry_banco_CD_AUX: TStringField;
    qry_ch_br_DT_PAGAMENTO: TDateTimeField;
    qry_caixa_controle_: TQuery;
    ds_caixa_controle: TDataSource;
    qry_caixa_controle_CD_COLIGADA: TStringField;
    qry_caixa_controle_DT_MOVIMENTO: TDateTimeField;
    qry_caixa_controle_CD_USUARIO: TStringField;
    procedure qry_ch_br_it_CalcFields(DataSet: TDataSet);
    procedure qry_ch_br_it_AfterScroll(DataSet: TDataSet);
    procedure qry_ch_br_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ent_ch_br: Tdatm_ent_ch_br;

implementation

{$R *.DFM}

uses PGCH012, PGGP001;

procedure Tdatm_ent_ch_br.qry_ch_br_it_CalcFields(DataSet: TDataSet);
begin
  with datm_ent_ch_br do
  begin
    qry_ch_br_it_nr_processo_calc.AsString := qry_ch_br_it_NR_PROCESSO.AsString;
  end;
end;


procedure Tdatm_ent_ch_br.qry_ch_br_it_AfterScroll(DataSet: TDataSet);
begin
  // Habilita SDA
  with frm_ent_ch_br do
  begin
    if str_cd_sda = qry_ch_br_it_CD_ITEM.AsString then
    begin
      dbedt_cd_desp.Color      := clWindow;
      dbedt_cd_desp.ReadOnly   := False;
      dbedt_cd_desp.TabStop    := True;
      btn_cd_desp.Enabled      := True;
      dbedt_vl_assist.Color    := clWindow;
      dbedt_vl_assist.ReadOnly := False;
      dbedt_vl_assist.TabStop  := True;
    end
    else
    begin
      dbedt_cd_desp.Color      := clMenu;
      dbedt_cd_desp.ReadOnly   := True;
      dbedt_cd_desp.TabStop    := False;
      btn_cd_desp.Enabled      := False;
      dbedt_vl_assist.Color    := clMenu;
      dbedt_vl_assist.ReadOnly := True;
      dbedt_vl_assist.TabStop  := False;
    end;
  end;
end;


procedure Tdatm_ent_ch_br.qry_ch_br_AfterScroll(DataSet: TDataSet);
begin
  // Habilita IR
  if qry_ch_br_look_in_controla_ir.AsBoolean then
  begin
    frm_ent_ch_br.dbedt_vl_ir.Color    := clWindow;
    frm_ent_ch_br.dbedt_vl_ir.ReadOnly := False;
    frm_ent_ch_br.dbedt_vl_ir.TabStop  := True;
  end
  else
  begin
    frm_ent_ch_br.dbedt_vl_ir.Color    := clMenu;
    frm_ent_ch_br.dbedt_vl_ir.ReadOnly := True;
    frm_ent_ch_br.dbedt_vl_ir.TabStop  := False;
  end;
end;


end.
