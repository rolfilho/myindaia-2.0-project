(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGSM108.PAS - DataModule Cadastro de Empresa Nacional
Manutenção:
Data: 14/09/2001 - AM 0032/01 - Apresentação do CNPJ nos Browser e identificação do registro existente
*************************************************************************************************)
unit PGSM108;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Funcoes, PGGP017;

type
  Tdatm_cliente = class(TDataModule)
    ds_cliente_habilitacao: TDataSource;                        
    ds_unid_neg: TDataSource;                                    
    ds_produto: TDataSource;
    ds_yesno: TDataSource;
    ds_empresa_nac: TDataSource;
    ds_tipo_pessoa: TDataSource;
    ds_sda: TDataSource;
    ds_banco: TDataSource;
    ds_grupo: TDataSource;
    ds_num_usd: TDataSource;
    ds_responsavel: TDataSource;

    qry_cliente_habilitacao_: TQuery;
    qry_cliente_habilitacao_CD_CLIENTE: TStringField;
    qry_cliente_habilitacao_CD_UNID_NEG: TStringField;
    qry_cliente_habilitacao_CD_PRODUTO: TStringField;
    qry_cliente_habilitacao_IN_ATIVO: TStringField;
    qry_cliente_habilitacao_CD_TAB_SDA: TStringField;
    qry_cliente_habilitacao_LookCliente: TStringField;
    qry_cliente_habilitacao_LookUnidNeg: TStringField;
    qry_cliente_habilitacao_LookProduto: TStringField;
    qry_cliente_habilitacao_LookAtivo: TStringField;
    qry_cliente_habilitacao_LookSDA: TStringField;
    qry_cliente_habilitacao_TX_NUMERARIO_OBS: TMemoField;
    qry_cliente_habilitacao_DT_CAPTACAO: TDateTimeField;
    qry_cliente_habilitacao_CD_FOLLOW_UP: TStringField;
    qry_cliente_habilitacao_look_nm_mod_follow_up: TStringField;
    qry_cliente_habilitacao_CD_NUMERARIO: TStringField;
    qry_cliente_habilitacao_look_numerario: TStringField;
    qry_cliente_habilitacao_CD_TP_FOLLOW_UP: TStringField;
    qry_cliente_habilitacao_look_nm_tp_follow_up: TStringField;
    qry_cliente_habilitacao_look_in_mod_follow_up: TStringField;
    qry_cliente_habilitacao_IN_SD_FAT_ZERO: TStringField;
    qry_cliente_habilitacao_IN_SD_NOTA_ZERO: TStringField;
    qry_cliente_habilitacao_look_numerario_usd: TStringField;
    qry_cliente_habilitacao_IN_COBRAR_CPMF: TStringField;
    qry_cliente_habilitacao_CD_RESPONSAVEL: TStringField;
    qry_cliente_habilitacao_IN_BOLETO: TStringField;
    qry_cliente_habilitacao_NR_DIAS_VENCTO_FATURA: TIntegerField;
    qry_cliente_habilitacao_DT_VALID_CRED_RF: TDateTimeField;

    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;

    qry_ult_emp_: TQuery;
    qry_ult_emp_ULTIMO: TStringField;

    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    qry_empresa_nac_AP_EMPRESA: TStringField;
    qry_empresa_nac_END_EMPRESA: TStringField;
    qry_empresa_nac_END_NUMERO: TStringField;
    qry_empresa_nac_END_CIDADE: TStringField;
    qry_empresa_nac_END_BAIRRO: TStringField;
    qry_empresa_nac_END_UF: TStringField;
    qry_empresa_nac_END_CEP: TStringField;
    qry_empresa_nac_CD_TIPO_PESSOA: TStringField;
    qry_empresa_nac_CGC_EMPRESA: TStringField;
    qry_empresa_nac_CPF_EMPRESA: TStringField;
    qry_empresa_nac_IE_EMPRESA: TStringField;
    qry_empresa_nac_DT_INCLUSAO: TDateTimeField;
    qry_empresa_nac_IN_FATURAMENTO: TStringField;
    qry_empresa_nac_IN_ATIVO: TStringField;
    qry_empresa_nac_IN_RESTRICAO: TStringField;
    qry_empresa_nac_IN_EVENTUAL: TStringField;
    qry_empresa_nac_CD_TIPO_REF: TStringField;
    qry_empresa_nac_IN_CLIENTE: TBooleanField;
    qry_empresa_nac_IN_IMPORTADOR: TBooleanField;
    qry_empresa_nac_IN_EXPORTADOR: TBooleanField;
    qry_empresa_nac_IN_OUTROS: TBooleanField;
    qry_empresa_nac_CD_GRUPO: TStringField;
    qry_empresa_nac_IN_REPRESENTANTE: TBooleanField;
    qry_empresa_nac_LookAtivo: TStringField;
    qry_empresa_nac_LookEventual: TStringField;
    NR_CAE: TStringField;
    qry_empresa_nac_LookTipoRef: TStringField;
    qry_empresa_nac_LookINCliente: TStringField;
    qry_empresa_nac_LookINImportador: TStringField;
    qry_empresa_nac_LookINExportador: TStringField;
    qry_empresa_nac_LookINRepresentante: TStringField;
    qry_empresa_nac_LookINOutros: TStringField;
    qry_empresa_nac_NM_INDICADO_POR: TStringField;
    qry_empresa_nac_TX_OBS: TMemoField;
    qry_empresa_nac_CD_PAIS_IMPORTADOR: TStringField;
    qry_empresa_nac_CD_ATIV_ECONOMICA: TStringField;
    qry_empresa_nac_IN_SEGURADORA: TBooleanField;
    qry_empresa_nac_CD_ACESSO: TStringField;
    qry_empresa_nac_CD_AUX: TStringField;
    qry_empresa_nac_OUTRO_DOC: TStringField;

    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;

    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;

    qry_sda_: TQuery;
    qry_sda_CD_SDA: TStringField;
    qry_sda_TX_DESCRICAO: TStringField;

    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;

    qry_usuario_hab_: TQuery;

    qry_cli_DI_: TQuery;

    qry_cli_processo_: TQuery;

    qry_ct_contabilRM_: TQuery;

    qry_mod_follow_up: TQuery;
    qry_mod_follow_upCD_FOLLOW_UP: TStringField;
    qry_mod_follow_upNM_FOLLOW_UP: TStringField;

    qry_mod_numerario: TQuery;
    qry_mod_numerarioCD_NUMERARIO: TStringField;
    qry_mod_numerarioNM_NUMERARIO: TStringField;

    qry_num_usd_: TQuery;
    qry_num_usd_CD_CLIENTE: TStringField;
    qry_num_usd_CD_UNID_NEG: TStringField;
    qry_num_usd_CD_PRODUTO: TStringField;
    qry_num_usd_CD_ITEM: TStringField;

    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;

    qry_num_usd_LookItem: TStringField;
    qry_num_usd_Look_solic_num: TStringField;
    qry_num_usd_Look_ativo: TStringField;

    qry_ativ_economica_: TQuery;
    qry_ativ_economica_CODIGO: TStringField;
    qry_ativ_economica_DESCRICAO: TStringField;

    qry_pais_: TQuery;
    qry_pais_CODIGO: TStringField;
    qry_pais_DESCRICAO: TStringField;

    qry_responsavel_: TQuery;
    qry_responsavel_CD_RESPONSAVEL: TStringField;
    qry_responsavel_NM_RESPONSAVEL: TStringField;

    qry_yesno_: TQuery;
    qry_yesno_CD_YESNO: TStringField;
    qry_yesno_TX_YESNO: TStringField;
    qry_yesno_IN_YESNO: TBooleanField;

    qry_tipo_ref_: TQuery;
    qry_tipo_ref_CD_TIPO_REF: TStringField;
    qry_tipo_ref_NM_TIPO_REF: TStringField;

    qry_param_: TQuery;

    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;

    qry_ct_contabil_: TQuery;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;

    qry_tipo_pessoa_: TQuery;
    qry_tipo_pessoa_CD_TIPO_PESSOA: TStringField;
    qry_tipo_pessoa_NM_TIPO_PESSOA: TStringField;

    qry_tp_followup_: TQuery;
    qry_tp_followup_CD_TP_FOLLOW_UP: TStringField;
    qry_tp_followup_NM_TP_FOLLOW_UP: TStringField;
    qry_tp_followup_IN_MOD_FOLLOW_UP: TStringField;

    sp_excluir_cli_habilitacao_: TStoredProc;
    sp_excluir_cli_contatos_: TStoredProc;
    sp_excluir_cli_soli_num_: TStoredProc;
    qry_mod_numerarioIN_USD: TStringField;
    qry_item_IN_SOLIC_NUM: TStringField;
    qry_item_IN_ATIVO: TStringField;
    qry_empresa_nac_NR_CAE: TStringField;
    qry_cliente_habilitacao_IN_COMP_SDA: TStringField;
    qry_cliente_habilitacao_LookCompSDA: TStringField;
    qry_empresa_nac_CD_MOEDA_JUROS: TStringField;
    qry_moeda_: TQuery;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_NM_MOEDA: TStringField;
    qry_ir_fat_: TQuery;
    qry_ir_fat_CD_IR_FAT: TStringField;
    qry_ir_fat_NM_IR_FAT: TStringField;
    qry_cliente_habilitacao_CD_IR_FAT: TStringField;
    qry_cliente_habilitacao_IN_DIVERSOS: TStringField;
    qry_cliente_habilitacao_IN_QUADRO_TOTAL_FAT: TStringField;
    ds_ir_fat: TDataSource;
    qry_cliente_habilitacao_IN_CC_NUM: TStringField;
    qry_cliente_habilitacao_IN_OBS_UNICA: TStringField;
    qry_empresa_nac_NR_TELEFONE: TStringField;
    qry_empresa_nac_NR_FAX: TStringField;
    qry_cliente_habilitacao_IN_OBS_POR_DATA: TStringField;
    qry_empresa_nac_IN_LIBERA_DI: TStringField;
    qry_empresa_nac_LookLiberaDI: TStringField;
    qry_cliente_habilitacao_IN_DIA_UTIL_EMISSAO_FAT: TStringField;
    qry_param_CD_SISTEMA_CONTABIL: TStringField;
    qry_cliente_cnpj_: TQuery;
    qry_cliente_cpf_: TQuery;
    qry_cliente_cpf_TOT_CPF: TIntegerField;
    qry_cliente_habilitacao_TP_PORTADOR: TStringField;
    qry_cliente_habilitacao_CD_BANCO_PORTADOR: TStringField;
    qry_cliente_habilitacao_LookBancoPortador: TStringField;
    qry_cliente_habilitacao_IN_CPMF_SALDO_CREDOR: TStringField;
    qry_tot_proc_: TQuery;
    qry_tot_proc_TOT_PROC: TIntegerField;
    qry_cliente_habilitacao_IN_CALCULA_IRRF_VL_MIN: TStringField;
    qry_tp_tab_sda_: TQuery;
    qry_tp_tab_sda_CD_TP_TAB_SDA: TStringField;
    qry_tp_tab_sda_NM_TP_TAB_SDA: TStringField;
    qry_cliente_habilitacao_TP_TAB_SDA: TStringField;
    qry_cliente_habilitacao_Look_Tab_SDA: TStringField;
    qry_cliente_cnpj_CD_EMPRESA: TStringField;
    qry_cliente_habilitacao_IN_NOTA_LIQ: TStringField;
    qry_cliente_habilitacao_IN_FAT_REC: TStringField;
    qry_upd_cliente_servico_: TQuery;
    qry_empresa_nac_CD_INDICADO_POR: TStringField;
    qry_cliente_indicado_: TQuery;
    qry_cliente_indicado_CD_CLIENTE_INDICADO: TStringField;
    qry_cliente_indicado_NM_CLIENTE_INDICADO: TStringField;
    qry_empresa_nac_PATH_LOGO: TStringField;
    qry_cliente_habilitacao_IN_EXP_NF: TStringField;
    qry_cliente_habilitacao_NR_CONTRATO_SEGURO: TStringField;
    qry_cliente_habilitacao_IN_COBRAR_ISS: TStringField;
    qry_cliente_habilitacao_NR_ALT_LINHA_FAT_EXP: TIntegerField;
    qry_cliente_habilitacao_IN_CPMF_TOTAL: TStringField;
    qry_empresa_nac_LookINComprador: TStringField;
    qry_empresa_nac_IN_COMPRADOR: TBooleanField;
    qry_cliente_habilitacao_NR_PROT_MERCANTE: TStringField;
    qry_cliente_habilitacao_VL_MIN_DI: TFloatField;
    qry_cliente_habilitacao_IN_FAT_SEM_DESP: TStringField;
    qry_cliente_habilitacao_IN_NUM_FAT_EXP_AUT: TStringField;
    qry_cliente_habilitacao_LookNumFatExpAut: TStringField;
    qry_cliente_habilitacao_IN_TX_SCX_ICMS: TStringField;
    qry_empresa_nac_IM_EMPRESA: TStringField;
    qry_empresa_nac_TP_DEM_EMAIL: TStringField;
    qry_tp_dem_email_: TQuery;
    qry_tp_dem_email_TP_DEM_EMAIL: TStringField;
    qry_tp_dem_email_NM_TP_DEM_EMAIL: TStringField;
    qry_empresa_nac_LookTpDemEmail: TStringField;
    qry_cliente_habilitacao_IN_COBRAR_COFINS: TStringField;
    qry_cliente_rg_: TQuery;
    qry_cliente_rg_CD_EMPRESA: TStringField;
    qry_empresa_nac_NR_RG: TStringField;
    qry_cliente_habilitacao_VL_ALIQ_COFINS_CLIENTE: TFloatField;
    qry_cliente_habilitacao_CD_RET_FAT: TStringField;
    ds_ret_fat: TDataSource;
    qry_ret_fat_: TQuery;
    qry_ret_fat_CD_RET_FAT: TStringField;
    qry_ret_fat_NM_RET_FAT: TStringField;
    qry_empresa_nac_TP_RECOLHE_MP164: TStringField;
    qry_empresa_nac_PROTECAO_MOEDA: TFloatField;
    qry_empresa_nac_NR_ACCOUNT: TStringField;
    qry_empresa_nac_IN_COMERCIAL: TBooleanField;
    upd_empresa_nac: TUpdateSQL;
    qry_cliente_habilitacao_IN_ND: TStringField;
    qry_cliente_habilitacao_IN_AVISO_RETENCAO: TStringField;
    qry_cliente_habilitacao_IN_REMESSA: TStringField;
    qry_empresa_nac_CD_ACESSO_PIS: TStringField;
    qry_empresa_nac_CD_AUX_PIS: TStringField;
    qry_ct_contabil_unica_pis_: TQuery;
    qry_empresa_nac_IN_REF_ACEITA_BARRA: TStringField;
    qry_cliente_habilitacao_IN_REF_ACEITA_BARRA: TStringField;
    qry_cliente_habilitacao_NR_TAMANHO_REF: TIntegerField;
    qry_empresa_nac_IN_CAT63: TStringField;
    qry_cliente_habilitacao_IN_BORDERO: TStringField;
    qry_cliente_habilitacao_IN_ENVIA_PDF: TStringField;
    qry_cliente_habilitacao_IN_DOCTO_SOLIC: TStringField;
    qry_cliente_habilitacao_IN_AUTO_MERC_FABR: TStringField;
    qry_cliente_habilitacao_DT_VALID_ANVISA: TDateTimeField;
    qry_empresa_nac_CD_TOTAL_NF_DDNOTA: TStringField;
    qry_empresa_nac_IN_CONFERE_NF: TStringField;
    qry_empresa_nac_IN_PRENCHE_FATURA: TStringField;
    qry_Estados: TQuery;
    dts_Estados: TDataSource;
    qry_empresa_nac_IN_VERIF_ICMS_TRANSM: TStringField;
    qry_empresa_nac_IN_REGIME_ESP: TStringField;
    qry_empresa_nac_CD_CT_CONTABIL: TStringField;
    qry_empresa_nac_CD_CT_CONTABIL_PIS: TStringField;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qry_empresa_nac_CD_FUND_LEGAL_ICMS: TStringField;
    qry_cliente_habilitacao_IN_TP_RETENCAO_IR: TStringField;
    qry_cliente_habilitacao_IN_TP_RETENCAO_COFINS: TStringField;
    qry_despachante_cliente: TQuery;
    qry_despachante_clienteCD_EMPRESA: TStringField;
    qry_despachante_clienteCD_DESPACHANTE: TStringField;
    qry_despachante_clienteTIPO: TStringField;
    ds_despachante_cliente: TDataSource;
    qry_despachantes: TQuery;
    qry_despachantesCD_DESPACHANTE: TStringField;
    qry_despachantesNM_DESPACHANTE: TStringField;
    qry_despachante_clienteNM_DESPACHANTE: TStringField;
    upd_despachante_cliente: TUpdateSQL;
    qry_empresa_nac_IN_COTACAO: TStringField;
    qry_cliente_habilitacao_NR_DIA_VENCTO: TStringField;
    qry_cliente_habilitacao_NR_DIA_VENCTO_BASE: TStringField;
    qry_cliente_habilitacao_CD_ATENDENTE: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_cliente_habilitacao_NM_EMAILS: TStringField;
    qry_empresa_nac_IN_ENVIA_BOLETO_DDA: TStringField;
    qry_empresa_nac_IN_MARINHA_MERCANTE_ICMS: TStringField;
    qry_cliente_habilitacao_DT_RADAR: TDateTimeField;
    qry_cliente_habilitacao_DT_REAJUSTE_IMP: TDateTimeField;
    qry_cliente_habilitacao_DT_REAJUSTE_EXP: TDateTimeField;
    qry_empresa_nac_END_ID_LOCALIDADE: TIntegerField;
    qry_empresa_nac_COD_INTERNO: TStringField;
    qry_empresa_nac_ID_REPRESENTANTE: TStringField;
    qry_empresa_nac_ID_REPRESENTADA: TStringField;
    qry_cliente_habilitacao_NM_EMAIL_EMPRESA: TStringField;
    qry_cliente_habilitacao_DS_CONTA_DHL: TStringField;
    qry_empresa_nac_CD_TIPO_BASE_SEGURO_DI: TStringField;
    qry_empresa_nac_PC_SEGURO_MLE_DI: TFloatField;
    qry_empresa_nac_DS_LICENCA_SANITARIA: TStringField;
    qry_empresa_nac_TX_DADOS_BANCARIOS_FATCOM: TStringField;
    qry_empresa_nac_FIESP_ID_END: TIntegerField;
    qry_cliente_habilitacao_DT_PROCURACAO_RECEBIDA: TDateTimeField;
    procedure qry_empresa_nac_AfterScroll(DataSet: TDataSet);
    procedure qry_cliente_habilitacao_AfterScroll(DataSet: TDataSet);
    procedure qry_empresa_nac_CD_CT_CONTABILChange(Sender: TField);
    procedure qry_empresa_nac_BeforePost(DataSet: TDataSet);
    procedure qry_cliente_habilitacao_CD_PRODUTOChange(Sender: TField);
    procedure qry_empresa_nac_AfterDelete(DataSet: TDataSet);
    procedure qry_empresa_nac_AfterPost(DataSet: TDataSet);
    procedure qry_empresa_nac_CD_CT_CONTABIL_PISChange(Sender: TField);
    procedure qry_cliente_habilitacao_IN_TX_SCX_ICMSChange(Sender: TField);
    procedure qry_cliente_habilitacao_DT_VALID_ANVISASetText(
      Sender: TField; const Text: String);
    procedure qry_empresa_nac_AfterInsert(DataSet: TDataSet);
    procedure qry_despachante_clienteNewRecord(DataSet: TDataSet);
    procedure aplicar(DataSet: TDataSet);
    procedure qry_despachante_clienteBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterScrollTEmpresaNac;
  end;

var
  datm_cliente: Tdatm_cliente;

implementation

uses PGGP001, PGSM024, GSMLIB;

{$R *.DFM}

procedure Tdatm_cliente.qry_empresa_nac_AfterScroll(DataSet: TDataSet);
begin
  AfterScrollTEmpresaNac;
end;

procedure Tdatm_cliente.AfterScrollTEmpresaNac;
begin
  if not (frm_cliente.pgctrl_cliente.ActivePageIndex = 0 ) then    //ts_lista
  begin
    with qry_cliente_habilitacao_,
         frm_cliente.dbedt_cd_ct_contabil do
    begin

      if Not (qry_empresa_nac_.State in [dsInsert] ) then
      begin
        qry_cliente_habilitacao_.DisableControls;
        Close;
        qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString := qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;
        Prepare;
        Open;
        qry_cliente_habilitacao_.EnableControls;
      end;

      if qry_empresa_nac_CD_TIPO_PESSOA.Value = '2' then
      begin
        frm_cliente.lbl_cnpj_empresa.Caption   := 'R.G.';
        frm_cliente.dbedt_cnpj_empresa.Visible := False;
        // frm_cliente.dbedt_nr_rg.Visible := True;
        // frm_cliente.dbedt_nr_rg.Top := frm_cliente.dbedt_cnpj_empresa.Top;
      end
      else
      begin
        frm_cliente.lbl_cnpj_empresa.Caption   := 'C.N.P.J';
        frm_cliente.dbedt_cnpj_empresa.Visible := True;
        // frm_cliente.dbedt_nr_rg.Visible := False;
      end;

      if ( qry_empresa_nac_.FieldByName('IN_CLIENTE').AsBoolean ) or
         ( qry_empresa_nac_.FieldByName('IN_REPRESENTANTE').AsBoolean )then
      begin
        Color    := clWindow;
        ReadOnly := False;
        TabStop  := True;
      end
      else
      begin
        Color    := clMenu;
        ReadOnly := True;
        TabStop  := False;
       (* if qry_empresa_nac_.FieldByName('CD_CT_CONTABIL').AsString <> '' then
          begin
            if Not ( qry_empresa_nac_.State in [dsEdit, dsInsert] ) then qry_empresa_nac_.Edit;
            qry_empresa_nac_.FieldByName('CD_CT_CONTABIL').AsString := '';
            qry_empresa_nac_.Post;
          end;
          if qry_empresa_nac_.FieldByName('CD_CT_CONTABIL_PIS').AsString <> '' then
          begin
            if Not ( qry_empresa_nac_.State in [dsEdit, dsInsert] ) then qry_empresa_nac_.Edit;
            qry_empresa_nac_.FieldByName('CD_CT_CONTABIL_PIS').AsString := '';
            qry_empresa_nac_.Post;
          end;*)
      end;
    end;
  end;
end;

procedure Tdatm_cliente.qry_cliente_habilitacao_AfterScroll(DataSet: TDataSet);
begin
  with frm_cliente do
  begin
    //  Verificar se o usuário tem acesso a Unidade x Produto
    qry_usuario_hab_.Close;
    qry_usuario_hab_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_hab_.ParamByName('CD_UNID_NEG').AsString := dbedt_cd_unid_neg.Text;
    qry_usuario_hab_.ParamByName('CD_PRODUTO').AsString  := dbedt_cd_produto.Text;
    qry_usuario_hab_.Open;

    if qry_usuario_hab_.FieldByName('OK').AsInteger <= 0 then // NÃO TEM ACESSO
    begin
      pnl_habilitacao.Enabled        := False;
      btn_contato.Enabled            := False;
      btn_CPMF.Enabled               := False;
      btn_servico.Enabled            := False;
      btn_transp.Enabled             := False;
      btn_agente.Enabled             := False;
      btn_cc_propria.Enabled         := False;
      btn_documentos.Enabled         := False;
      btn_conta_contabil.Enabled     := False;
      btn_acesso_externo.enabled     := False;
      Exit;
    end
    else
    begin
      pnl_habilitacao.Enabled := True;
    end;

    if qry_cliente_habilitacao_.RecordCount > 0 then
    begin
      btn_contato.Enabled            := True;
      btn_CPMF.Enabled               := True;
      btn_servico.Enabled            := True;
      btn_transp.Enabled             := True;
      btn_agente.Enabled             := True;
      btn_cc_propria.Enabled         := True;
      btn_documentos.Enabled         := True;
      btn_conta_contabil.Enabled     := True;
      btn_acesso_externo.enabled     := True;
    end
    else
    begin
      btn_contato.Enabled            := False;
      btn_CPMF.Enabled               := False;
      btn_servico.Enabled            := False;
      btn_transp.Enabled             := False;
      btn_agente.Enabled             := False;
      btn_cc_propria.Enabled         := False;
      btn_documentos.Enabled         := False;
      btn_conta_contabil.Enabled     := False;
      btn_acesso_externo.enabled     := False;
    end;

    if ( qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '01' ) or
       ( qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '02' ) then
    begin
      lbl_tp_follow_up.Visible       := True;
      dbedt_cd_tp_follow_up.Visible  := True;
      dbedt_nm_tp_follow_up.Visible  := True;
      btn_tp_followup.Visible        := True;
      lbl_mod_followup.Visible       := True;
      dbedt_cd_mod_follow_up.Visible := True;
      dbedt_nm_mod_follow_up.Visible := True;
      btn_cd_follow_up.Visible       := True;
    end
    else
    begin
      lbl_tp_follow_up.Visible       := False;
      dbedt_cd_tp_follow_up.Visible  := False;
      dbedt_nm_tp_follow_up.Visible  := False;
      btn_tp_followup.Visible        := False;
      lbl_mod_followup.Visible       := False;
      dbedt_cd_mod_follow_up.Visible := False;
      dbedt_nm_mod_follow_up.Visible := False;
      btn_cd_follow_up.Visible       := False;
    end;
    if qry_cliente_habilitacao_look_numerario_usd.AsString = '1' then
    begin
      ts_num_usd.TabVisible := True;
    end
    else
    begin
      ts_num_usd.TabVisible := False;
    end;
    if qry_cliente_habilitacao_.FieldByName('IN_COBRAR_CPMF').AsString = '1' then
    begin
      btn_CPMF.Enabled := True;
    end
    else
    begin
      btn_CPMF.Enabled := False;
    end;

    if qry_cliente_habilitacao_TP_TAB_SDA.AsString = '1' then
    begin
      dbedt_cd_tab_sda.Color    := clMenu;
      dbedt_cd_tab_sda.TabStop  := False;
      dbedt_cd_tab_sda.ReadOnly := True;
    end
    else
    begin
      dbedt_cd_tab_sda.Color    := clWindow;
      dbedt_cd_tab_sda.TabStop  := True;
      dbedt_cd_tab_sda.ReadOnly := False;
    end;

    lbl_in_exp_nf.Visible             := ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '01' ) or
                                         ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '02' ) or
                                         ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '03' );
    dblckpbox_in_exp_nf.Visible       := ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '01' ) or
                                         ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '02' ) or
                                         ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '03' );

    if qry_cliente_habilitacao_CD_PRODUTO.AsString = '02' then
      lbl_in_exp_nf.Caption := 'Nome do Importador na Nota Fiscal'
    else
      lbl_in_exp_nf.Caption := 'Nome do Exportador na Nota Fiscal';

    // Nº Fatura Comercial Automático
    lbl_num_fat_exp_aut.Visible       := ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '02' ) or
                                         ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '10' );
    dblckpbox_num_fat_exp_aut.Visible := ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '02' ) or
                                         ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '10' );
  end;
end;

procedure Tdatm_cliente.qry_empresa_nac_CD_CT_CONTABILChange(Sender: TField);
begin
{  if ( frm_cliente.dbedt_cd_ct_contabil.Visible ) and ( qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString <> '0' ) then // ContMaster/SI
  begin
    qry_empresa_nac_CD_ACESSO.AsString  := qry_empresa_nac_LookAcesso.AsString;
    qry_empresa_nac_CD_AUX.AsString     := qry_empresa_nac_LookAux.AsString;
  end;
  }
end;

procedure Tdatm_cliente.qry_empresa_nac_BeforePost(DataSet: TDataSet);
begin
  if qry_empresa_nac_.State in [dsInsert] then
     qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString := UltCod( qry_ult_emp_, qry_ult_emp_ULTIMO );

  { Quando for somente cotação não deverá ser feita a consistencia - by carlos 03/12/2009}
  if frm_cliente.dbchkbox_in_cotacao.Checked then
  begin
     frm_cliente.consistecotacao:=false;

     if frm_cliente.dbchkbox_in_cliente.Checked then
        frm_cliente.consistecotacao:=true;
     if frm_cliente.dbchkbox_in_importador.Checked then
        frm_cliente.consistecotacao:=true;
     if frm_cliente.dbchkbox_in_exportador.Checked then
        frm_cliente.consistecotacao:=true;
     if frm_cliente.dbchkbox_in_representante.Checked then
        frm_cliente.consistecotacao:=true;
     if frm_cliente.dbchkbox_in_seguradora.Checked then
        frm_cliente.consistecotacao:=true;
     if frm_cliente.dbchkbox_in_comprador.Checked then
        frm_cliente.consistecotacao:=true;
     if frm_cliente.dbchkbox_in_outros.Checked then
        frm_cliente.consistecotacao:=true;
  end;

end;

procedure Tdatm_cliente.qry_cliente_habilitacao_CD_PRODUTOChange(
  Sender: TField);
begin
  with frm_cliente do
  begin
    lbl_num_fat_exp_aut.Visible       := ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '02' ) or
                                         ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '10' );
    dblckpbox_num_fat_exp_aut.Visible := ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '02' ) or
                                         ( qry_cliente_habilitacao_CD_PRODUTO.AsString = '10' );
  end;
end;

procedure Tdatm_cliente.qry_empresa_nac_AfterDelete(DataSet: TDataSet);
begin
  qry_empresa_nac_.ApplyUpdates;
end;

procedure Tdatm_cliente.qry_empresa_nac_AfterPost(DataSet: TDataSet);
begin
  qry_empresa_nac_.ApplyUpdates;

  frm_cliente.consistecotacao := True;
end;

procedure Tdatm_cliente.qry_empresa_nac_CD_CT_CONTABIL_PISChange(
  Sender: TField);
begin
{  if ( frm_cliente.dbedt_cd_ct_contabil_pis.Visible ) and ( qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString <> '0' ) then // ContMaster/SI
  begin
    qry_empresa_nac_CD_ACESSO_PIS.AsString  := qry_empresa_nac_LookAcessoPis.AsString;
    qry_empresa_nac_CD_AUX_PIS.AsString     := qry_empresa_nac_LookAuxPis.AsString;
  end;
  }
end;

procedure Tdatm_cliente.qry_cliente_habilitacao_IN_TX_SCX_ICMSChange(
  Sender: TField);
begin
  if Sender.AsString = '0' then
    if Application.MessageBox(Pchar('Esta Opção lança valor de Taxa Siscomex na base de cálculo do ICMS.' + #13#10 +
                                    'O padrão definido é "Sim". Tem certeza que deseja alterar?'), 'Taxa Siscomex no ICMS', MB_YESNO + MB_ICONQUESTION) = mrNo then
      Sender.AsString := '1';
end;

procedure Tdatm_cliente.qry_cliente_habilitacao_DT_VALID_ANVISASetText(
  Sender: TField; const Text: String);
begin
  try
    Sender.AsDateTime := StrToDate(Text);
  except
    if Text <> '  /  /    ' then
      ShowMessage('Data Inválida!');
    Sender.Clear;
  end;
end;

procedure Tdatm_cliente.qry_empresa_nac_AfterInsert(DataSet: TDataSet);
begin
  qry_empresa_nac_IN_VERIF_ICMS_TRANSM.AsString := '1'; // Alterado para 1 para confrontar ICMS da mercadoria na transmissão da DI - Michel - 27/10/2011
  qry_empresa_nac_IN_REGIME_ESP.AsString        := '0';
end;

procedure Tdatm_cliente.qry_despachante_clienteNewRecord(
  DataSet: TDataSet);
begin
  qry_despachante_clienteCD_EMPRESA.AsString := qry_empresa_nac_CD_EMPRESA.AsString;
end;

procedure Tdatm_cliente.aplicar(
  DataSet: TDataSet);
begin
  qry_despachante_cliente.ApplyUpdates;
end;

procedure Tdatm_cliente.qry_despachante_clienteBeforePost(
  DataSet: TDataSet);
var
vJaExiste:Boolean;
begin
  if qry_despachante_clienteCD_DESPACHANTE.IsNull then begin
     ShowMessage('Despachante Inválido!!!!');
     abort;
  end;
  if qry_despachante_clienteTIPO.IsNull then begin
     ShowMessage('Tipo de Acesso Invalido!!!!');
     abort;
  end;

  //verifica se já existe
  with TQuery.Create(nil) do begin
     Databasename := 'DBBROKER';
     SQL.Clear;
     SQL.Add(' select count(*) from TDESPACHANTE_CLIENTE  ');
     SQL.Add(' where CD_EMPRESA = :CD_EMPRESA             ');
     SQL.Add(' and   CD_DESPACHANTE = :CD_DESPACHANTE     ');
     SQL.Add(' and   TIPO = :TIPO                         ');

     ParamByName('CD_EMPRESA').AsString     := qry_despachante_clienteCD_EMPRESA.AsString;
     ParamByName('CD_DESPACHANTE').AsString := qry_despachante_clienteCD_DESPACHANTE.AsString;
     ParamByName('TIPO').AsString           := qry_despachante_clienteTIPO.AsString;
     Open;
     vJaExiste:=(Fields[0].asInteger>0);
     Close;
     FREE;
  end;
  if vJaExiste then begin
     ShowMessage('Despachante e Tipo já cadastrado!!!!');
     abort;
  end;


end;

end.

