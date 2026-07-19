unit PGSD014;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, RAWPrinter,
  FormsLog, Provider, DBClient; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_sda_emissao = class(TDataModule)
    ds_processo_sda: TDataSource;
    qry_processo_sda_: TQuery;
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_celula_: TQuery;
    qry_usuario_: TQuery;
    qry_atz_todos_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    qry_desp_: TQuery;
    qry_desp_CD_DESPACHANTE: TStringField;
    ds_desp: TDataSource;
    qry_mod_sda_: TQuery;
    qry_mod_sda_CD_MOD_SDA: TStringField;
    qry_mod_sda_NM_MOD_SDA: TStringField;
    ds_mod_sda: TDataSource;
    qry_desp_NM_DESPACHANTE: TStringField;
    qry_desp_NR_REGISTRO: TStringField;
    qry_processo_sda_IN_EMITE: TStringField;
    qry_processo_sda_NM_SERVICO: TStringField;
    qry_processo_sda_VL_BASE_CALCULO: TFloatField;
    qry_processo_sda_VL_SDA: TFloatField;
    qry_processo_sda_NR_PROCESSO: TStringField;
    qry_processo_sda_AP_EMPRESA: TStringField;
    qry_processo_sda_CalcProcesso: TStringField;
    qry_desp_CD_MOD_SDA: TStringField;
    qry_ajuste_impressao_: TQuery;
    qry_ajuste_impressao_CD_DOCUMENTO: TStringField;
    qry_ajuste_impressao_L_NR_DOCUMENTO: TStringField;
    qry_ajuste_impressao_C_NR_DOCUMENTO: TStringField;
    qry_ajuste_impressao_C_NR_OPERACAO: TStringField;
    qry_ajuste_impressao_L_NM_IMP_EXP: TStringField;
    qry_ajuste_impressao_C_NM_IMP_EXP: TStringField;
    qry_ajuste_impressao_L_NM_DESP: TStringField;
    qry_ajuste_impressao_C_NM_DESP: TStringField;
    qry_ajuste_impressao_C_NR_CPF: TStringField;
    qry_ajuste_impressao_L_VL_SDA: TStringField;
    qry_ajuste_impressao_C_VL_SDA: TStringField;
    qry_ajuste_impressao_C_DT_EMISSAO: TStringField;
    qry_ajuste_impressao_L_VL_TAXA: TStringField;
    qry_ajuste_impressao_C_VL_TAXA: TStringField;
    qry_ajuste_impressao_L_VL_TOTAL: TStringField;
    qry_ajuste_impressao_C_VL_TOTAL: TStringField;
    qry_ajuste_impressao_L_NR_PROCESSO: TStringField;
    qry_ajuste_impressao_C_NR_PROCESSO: TStringField;
    qry_ajuste_impressao_L_NR_CONHECIMENTO: TStringField;
    qry_ajuste_impressao_C_NR_CONHECIMENTO: TStringField;
    qry_ajuste_impressao_L_URF_DESPACHO: TStringField;
    qry_ajuste_impressao_C_URF_DESPACHO: TStringField;
    qry_ajuste_impressao_C_OPER_IMP: TStringField;
    qry_ajuste_impressao_C_OPER_EXP: TStringField;
    qry_ajuste_impressao_CD_UNID_NEG: TStringField;
    qry_ajuste_impressao_L_OPER_IMP: TStringField;
    qry_ajuste_impressao_L_OPER_EXP: TStringField;
    qry_ajuste_impressao_L_NR_CPF: TStringField;
    qry_ajuste_impressao_L_VEIC: TStringField;
    qry_ajuste_impressao_L_DT_ENT: TStringField;
    qry_ajuste_impressao_L_REF: TStringField;
    qry_ajuste_impressao_L_MASTER: TStringField;
    qry_ajuste_impressao_L_VL_CIF: TStringField;
    qry_ajuste_impressao_C_REF: TStringField;
    qry_ajuste_impressao_TP_DOCUMENTO: TStringField;
    qry_ajuste_impressao_C_NM_COMPL_SDA: TStringField;
    qry_ajuste_impressao_C_VL_CIF: TStringField;
    qry_ajuste_impressao_C_CNPJ: TStringField;
    qry_ajuste_impressao_L_OBS: TStringField;
    qry_ajuste_impressao_C_OBS: TStringField;
    qry_ajuste_impressao_L_NM_COMPL_SDA: TStringField;
    qry_ajuste_impressao_NR_LINHA_GUIA: TStringField;
    qry_ajuste_impressao_L_CNPJ: TStringField;
    qry_ajuste_impressao_L_DT_EMISSAO: TStringField;
    qry_consiste_sda_: TQuery;
    qry_ref_cli_: TQuery;
    qry_ref_cli_CD_REFERENCIA: TStringField;
    qry_di_: TQuery;
    qry_di_NR_PROCESSO: TStringField;
    qry_di_CD_IMPORTADOR: TStringField;
    qry_di_NR_DECLARACAO_IMP: TStringField;
    qry_di_DT_REGISTRO_DI: TStringField;
    qry_di_DT_CHEGADA_CARGA: TStringField;
    qry_exp_proc_: TQuery;
    qry_exp_proc_NR_PROCESSO: TStringField;
    qry_exp_proc_NR_SD: TStringField;
    qry_exp_proc_CD_INCOTERM: TStringField;
    qry_exp_proc_VL_TOT_MCV: TFloatField;
    qry_param_: TQuery;
    qry_param_VL_TX_CONTR_SOCIAL_SDA: TFloatField;
    qry_dados_sda_: TQuery;
    qry_dados_sda_NR_PROCESSO: TStringField;
    qry_dados_sda_CD_UNID_NEG: TStringField;
    qry_dados_sda_CD_PRODUTO: TStringField;
    qry_dados_sda_CD_CLIENTE: TStringField;
    qry_dados_sda_NR_VIAGEM: TStringField;
    qry_dados_sda_CD_TIPO_PESSOA: TStringField;
    qry_dados_sda_IN_COMP_SDA: TStringField;
    qry_dados_sda_CD_VIA_TRANSPORTE: TStringField;
    qry_dados_sda_NM_EMBARCACAO: TStringField;
    qry_dados_sda_NR_VOO: TStringField;
    rp_sda: TRAWPrinter;
    qry_dados_sda_NM_EMPRESA: TStringField;
    qry_processo_sda_VL_CONTR_ASSIST: TFloatField;
    qry_processo_sda_VL_COMPL: TFloatField;
    qry_dados_sda_NR_CONHECIMENTO: TStringField;
    qry_di_urf_: TQuery;
    qry_di_urf_CD_URF_DESPACHO: TStringField;
    qry_di_urf_DESCRICAO: TStringField;
    qry_exp_urf_: TQuery;
    qry_exp_urf_CD_URF_DESPACHO: TStringField;
    qry_exp_urf_DESCRICAO: TStringField;
    qry_dados_sda_VL_CIF_MN: TFloatField;
    qry_dados_sda_NR_CONHECIMENTO_MASTER: TStringField;
    qry_dados_sda_CGC_EMPRESA: TStringField;
    qry_dados_sda_CPF_EMPRESA: TStringField;
    qry_desp_CPF_DESPACHANTE: TStringField;
    qry_ajuste_impressao_L_NR_CONTA_CORRENTE: TStringField;
    qry_ajuste_impressao_C_NR_CONTA_CORRENTE: TStringField;
    qry_desp_NR_CONTA_CORRENTE: TStringField;
    qry_desp_NR_DIGITO_CONTA_CORRENTE: TStringField;
    qry_desp_CalcNrContaCorrente: TStringField;
    qry_ajuste_impressao_C_CD_DESP_SDA: TStringField;
    qry_desp_CD_DESP_SDA: TStringField;
    qry_processo_sda_SOMA: TFloatField;
    qry_processo_sda_LOCAL: TStringField;
    qry_dados_sda_END_EMPRESA: TStringField;
    qry_dados_sda_END_CIDADE: TStringField;
    qry_dados_sda_END_BAIRRO: TStringField;
    qry_dados_sda_END_CEP: TStringField;
    qry_dados_sda_END_UF: TStringField;
    cds_Processo_sda_: TClientDataSet;
    dsp_processo_sda: TDataSetProvider;
    cds_Processo_sda_NR_PROCESSO: TStringField;
    cds_Processo_sda_IN_EMITE: TStringField;
    cds_Processo_sda_AP_EMPRESA: TStringField;
    cds_Processo_sda_NM_SERVICO: TStringField;
    cds_Processo_sda_VL_BASE_CALCULO: TFloatField;
    cds_Processo_sda_VL_SDA: TFloatField;
    cds_Processo_sda_VL_CONTR_ASSIST: TFloatField;
    cds_Processo_sda_VL_COMPL: TFloatField;
    cds_Processo_sda_CalcProcesso: TStringField;
    cds_Processo_sda_SOMA: TFloatField;
    cds_Processo_sda_LOCAL: TStringField;
    cds_Processo_sda_CalcSelecao: TStringField;
    qry_processo_sda_CD_USUARIO_EMITE: TStringField;
    cds_Processo_sda_CD_USUARIO_EMITE: TStringField;
    cds_Processo_sda_IN_EMITINDO: TStringField;
    qry_processo_sda_IN_EMITINDO: TStringField;
    qry_processo_sda_DT_DISTRIBUICAO: TStringField;
    cds_Processo_sda_DT_DISTRIBUICAO: TStringField;
    procedure qry_desp_CalcFields(DataSet: TDataSet);
    procedure cds_Processo_sda_CalcFields(DataSet: TDataSet);
    procedure qry_desp_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sda_emissao: Tdatm_sda_emissao;

implementation

uses PGSD013;

{$R *.DFM}

procedure Tdatm_sda_emissao.qry_desp_CalcFields(DataSet: TDataSet);
begin
  if Trim( qry_desp_NR_DIGITO_CONTA_CORRENTE.AsString ) = '' then
    qry_desp_CalcNrContaCorrente.AsString := Trim( qry_desp_NR_CONTA_CORRENTE.AsString )
  else
    qry_desp_CalcNrContaCorrente.AsString := Trim( qry_desp_NR_CONTA_CORRENTE.AsString ) + '-' + Trim( qry_desp_NR_DIGITO_CONTA_CORRENTE.AsString );
end;

procedure Tdatm_sda_emissao.cds_Processo_sda_CalcFields(DataSet: TDataSet);
begin
  if cds_processo_sda_IN_EMITE.AsString = '0' then
    cds_processo_sda_CalcSelecao.AsString := ''
  else
    if cds_Processo_sda_IN_EMITINDO.AsString = '1' then
    begin
      cds_processo_sda_CalcSelecao.AsString := 'ü'
    end
    else
      cds_processo_sda_CalcSelecao.AsString := 'üü'
end;

procedure Tdatm_sda_emissao.qry_desp_AfterScroll(DataSet: TDataSet);
begin
  with frm_sda_emissao do
  begin
    dblkpcbox_mod_sda.KeyValue := qry_desp_CD_MOD_SDA.Value;

    cds_processo_sda_.Close;
    cds_processo_sda_.Params.ParamByName('CD_UNID_NEG').AsString    := msk_cd_unid_neg.Text;
    cds_processo_sda_.Params.ParamByName('CD_PRODUTO').AsString     := msk_cd_produto.Text;
    cds_processo_sda_.Params.ParamByName('CD_CELULA').AsString      := msk_cd_celula.Text;
    cds_processo_sda_.Params.ParamByName('CD_DESPACHANTE').AsString := qry_desp_CD_DESPACHANTE.AsString;
    cds_processo_sda_.Params.ParamByName('DT_INICIAL_DISTRIBUICAO').AsDate  := msk_dt_inicial_base.Date;
    cds_processo_sda_.Params.ParamByName('DT_FINAL_DISTRIBUICAO').AsDate  := msk_dt_final_base.Date;
    cds_processo_sda_.Open;
  end;
end;

end.
