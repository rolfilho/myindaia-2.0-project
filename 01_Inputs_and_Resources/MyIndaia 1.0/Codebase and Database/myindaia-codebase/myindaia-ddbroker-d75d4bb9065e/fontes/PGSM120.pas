unit PGSM120;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, DBClient;

type
  Tdatm_grupo = class(TDataModule)
    ds_grupo_: TDataSource;
    qry_grupo_: TQuery;
    ds_yesno: TDataSource;
    qry_ult_grupo_: TQuery;
    qry_ult_grupo_ULTIMO: TStringField;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    qry_grupo_LookAtivo: TStringField;
    qry_yes_no_: TQuery;
    qry_yes_no_CD_YESNO: TStringField;
    qry_yes_no_TX_YESNO: TStringField;
    qry_grupo_CNPJ_GRUPO: TStringField;
    qry_grupo_IN_RATEIO: TStringField;
    qry_grupo_CD_LAYOUT_BORDERO: TIntegerField;
    qry_grupo_NM_LAYOUT: TStringField;
    qry_grupo_IN_OBRIGAR_INVOICE: TStringField;
    qry_grupo_IN_MARINHA_MERCANTE_ICMS: TStringField;
    qry_grupo_IN_CONFERE_REFERENCIA: TStringField;
    qry_grupo_IN_EXIBE_PEDIDO_SITE: TStringField;
    dtsGrupoItem: TDataSource;
    QryGrupoItem: TQuery;
    QryGrupoItemCD_GRUPO: TStringField;
    QryGrupoItemCD_ITEM: TStringField;
    UpdGrupoItem: TUpdateSQL;
    QryGrupoItemNM_ITEM: TStringField;
    qry_grupo_NR_REL_FAT_CONSOLIDADO: TStringField;
    qry_grupo_TP_PEDIDO_BUSCA: TStringField;
    dsTpReferencia: TDataSource;
    qryTpReferencia: TQuery;
    qryTpReferenciaCD_REFERENCIA: TStringField;
    qryTpReferenciaNM_REFERENCIA: TStringField;
    qry_grupo_IN_EMAIL_CRIACAO: TStringField;
    qry_grupo_EMAIL_CRIACAO: TStringField;
    qry_grupo_IN_EMAIL_AUTORIZACAO: TStringField;
    qry_grupo_EMAIL_AUTORIZACAO: TStringField;
    qry_grupo_IN_EMAIL_PRE_AUTORIZACAO: TStringField;
    qry_grupo_EMAIL_PRE_AUTORIZACAO: TStringField;
    qry_grupo_IN_INTEGRA_FORNECIMENTO: TStringField;
    qry_grupo_IN_INTEGRA_PACKING_LIST: TStringField;
    qry_grupo_IN_MODO_SIMPLES: TStringField;
    qry_grupo_IN_RAP_SEQUENCIAL: TStringField;
    qry_grupo_IN_ENVIA_ARQUIVOS: TStringField;
    qry_grupo_IN_MOSTRA_FATURADOS: TStringField;
    qry_grupo_IN_DIVIDE_EMBARCADOS: TStringField;
    qry_grupo_IN_MOSTRA_FOLLOWUP: TStringField;
    qry_grupo_IN_CONFERENCIA: TStringField;
    qry_grupo_IN_ALERTA_E01_NAO_GENERICO: TStringField;
    qry_grupo_IN_PREENCHE_EVENTO_387_COM_021: TStringField;
    qry_grupo_IN_RATEIA_PEDIDO: TStringField;
    qry_grupo_banco: TQuery;
    up_grupo_banco: TUpdateSQL;
    ds_grupo_banco: TDataSource;
    qry_grupo_bancoCD_BANCO_ADIANTAMENTO: TIntegerField;
    qry_grupo_bancoCD_BANCO_ICMS: TIntegerField;
    qry_grupo_bancoCD_BANCTO_PAGTO_DESPESAS_INDAIA: TIntegerField;
    qry_grupo_bancoCD_BANCTO_PAGTO_DESPESAS_CLIENTE: TIntegerField;
    qry_grupo_bancoCD_BANCO_PAGTO_IMPOSTOS: TIntegerField;
    qry_grupo_bancoCD_GRUPO: TStringField;
    qry_grupo_bancoCD_CLIENTE: TIntegerField;
    qry_grupo_bancoCD_UNID_NEG: TIntegerField;
    qry_grupo_bancoCD_PRODUTO: TIntegerField;
    qry_grupo_bancoCD_SERVICO: TIntegerField;
    qry_grupo_IN_ENVIA_COMO_TI: TStringField;
    qry_grupo_NM_EMAIL_CONTATO_DAILY: TStringField;
    qry_grupo_bancoCD_AREA: TStringField;
    qry_grupo_IN_DESBLOQUEIA_DRAFT: TStringField;
    qry_grupo_TP_PEDIDO_BUSCA_IMP: TStringField;
    qry_relatorios_mail_aut_: TQuery;
    qry_relatorios_mail_aut_CD_RELATORIO: TStringField;
    qry_relatorios_mail_aut_TX_RELATORIO: TStringField;
    qry_relatorios_mail_aut_TX_MODELO: TStringField;
    qry_relatorios_mail_aut_CD_TIPO_RELATORIO: TStringField;
    qry_relatorios_mail_aut_IN_ATIVO: TStringField;
    qry_relatorios_mail_aut_calc_ATIVO: TStringField;
    qry_relatorios_mail_aut_IN_FIMDESEMANA: TStringField;
    qry_relatorios_mail_aut_TX_CONFIGURACAO: TMemoField;
    qry_relatorios_mail_aut_TP_IDIOMA: TStringField;
    qry_relatorios_mail_aut_CD_VIA_TRANSPORTE: TStringField;
    ds_relatorios_mail_aut: TDataSource;
    qry_relatorios_mail_aut_usuarios_: TQuery;
    qry_relatorios_mail_aut_usuarios_CD_RELATORIO: TStringField;
    qry_relatorios_mail_aut_usuarios_CD_USUARIO: TStringField;
    qry_relatorios_mail_aut_usuarios_TX_HORARIOS_ENVIO: TStringField;
    qry_relatorios_mail_aut_usuarios_calc_NM_USUARIO: TStringField;
    ds_relatorios_mail_aut_usuarios: TDataSource;
    upd_relatorios_mail_aut_: TUpdateSQL;
    qry_produto: TQuery;
    dsProduto: TDataSource;
    qry_produtoCD_PRODUTO: TStringField;
    qry_produtoNM_PRODUTO: TStringField;
    sp_cria_alerta_grupo: TStoredProc;
    qry_relatorios_mail_aut_GRUPO: TStringField;
    qry_relatorios_mail_aut_EVENTO: TStringField;
    qry_grupo_TX_LUCRO_ESTIMADO: TFloatField;
    qry_grupo_bancoICMS_ATE: TFloatField;
    qryFatores: TQuery;
    updFatores: TUpdateSQL;
    dsFatores: TDataSource;
    qryFatoresCampos: TQuery;
    updFatoresCampos: TUpdateSQL;
    dsFatoresCampos: TDataSource;
    qryFatoresEventos: TQuery;
    updFatoresEventos: TUpdateSQL;
    dsFatoresEventos: TDataSource;
    qryFatoresCD_FATOR: TAutoIncField;
    qryFatoresNM_FATOR: TStringField;
    qryFatoresDS_FATOR: TStringField;
    qryFatoresCD_UNID_NEG: TStringField;
    qryFatoresCD_PRODUTO: TStringField;
    qryFatoresIN_OPCIONAL: TStringField;
    qryFatoresCD_GRUPO: TStringField;
    qryFatoresNM_CAMPO_PROCESSO: TStringField;
    qryFatoresNM_TABELA: TStringField;
    qryFatoresNM_CAMPO_CHAVE_TABELA: TStringField;
    qryFatoresNM_CAMPO_RETORNO_TABELA: TStringField;
    qryFatoresCD_COMPARADOR: TStringField;
    qryFatoresNM_SQL: TStringField;
    qryFatoresNM_RETORNO: TStringField;
    qryFatoresNM_TABELA_TRIGGER: TStringField;
    qryFatoresNM_CAMPOS_CHAVE_TRIGGER: TStringField;
    qryFatoresCamposCD_FATOR: TIntegerField;
    qryFatoresCamposNM_CAMPO_PROCESSO: TStringField;
    qryFatoresCamposNM_FATOR_CAMPO: TStringField;
    qryFatoresCamposNM_LOOKUP_TABELA: TStringField;
    qryFatoresCamposNM_LOOKUP_SQL: TStringField;
    qryFatoresCamposNM_LOOKUP_CAMPO_CHAVE: TStringField;
    qryFatoresCamposNM_LOOKUP_CAMPO_RETORNO: TStringField;
    qryFatoresEventosCD_FATOR: TIntegerField;
    qryFatoresEventosCD_EVENTO: TStringField;
    qryFatoresEventosCD_EVENTO_ANTERIOR: TStringField;
    qryFatoresEventosCD_EVENTO_BASE: TStringField;
    qryFatoresEventosPZ_EVENTO_BASE: TIntegerField;
    qryFatoresEventosNR_PRIORIDADE: TIntegerField;
    qryFatoresEventosIN_ALTERAR: TStringField;
    qryFatoresEventosIN_EXCLUIR: TStringField;
    qryComparadores: TQuery;
    qryComparadoresCD_COMPARADOR: TStringField;
    qryComparadoresNM_COMPARADOR: TStringField;
    dsComparadores: TDataSource;
    qryProdutosFatores: TQuery;
    qryProdutosFatoresCD_PRODUTO: TStringField;
    qryProdutosFatoresNM_PRODUTO: TStringField;
    qryGruposFatores: TQuery;
    qryGruposFatoresCD_GRUPO: TStringField;
    qryGruposFatoresNM_GRUPO: TStringField;
    qryFatoresNM_PRODUTO: TStringField;
    qryFatoresNM_GRUPO: TStringField;
    qryEventos: TQuery;
    qryEventosCD_EVENTO: TStringField;
    qryEventosNM_EVENTO: TStringField;
    qryEventosAP_EVENTO: TStringField;
    qryFatoresEventosNM_EVENTO: TStringField;
    qryFatoresEventosNM_EVENTO_ANTERIOR: TStringField;
    qryFatoresEventosNM_EVENTO_BASE: TStringField;
    qry_grupo_DT_NOVO_FOLLOWUP_IMP: TDateTimeField;
    qry_grupo_DT_NOVO_FOLLOWUP_EXP: TDateTimeField;
    qry_grupo_NM_EMAIL_CONTATO_FOLLOWUP: TStringField;
    qry_grupo_IN_PENDENCIAS: TStringField;
    qry_grupo_IN_EXTRATO_AVERBADO_RESUMIDO: TBooleanField;
    UpdGrupo: TUpdateSQL;
    qry_grupo_CD_CC_CONTAS_RECEBER_REDUZIDA: TStringField;
    qry_grupo_ANDAMENTO_REDUZIDA: TStringField;
    qry_grupo_FATURAR_REDUZIDA: TStringField;
    qry_grupo_bancoCD_BANCO_IMP_CLIENTE: TIntegerField;
    qry_grupo_bancoCD_BANCO_IMP_INDAIA: TIntegerField;
    qry_grupo_IN_EXIGE_CFOP_EXP: TStringField;
    qry_grupo_IN_PLANILHA_CUSTOS: TStringField;
    qry_Tipo_Referencia: TQuery;
    ds_Tipo_Referencia: TDataSource;
    ds_Grupo_Ref_Comp_DI: TDataSource;
    qry_Grupo_Ref_Comp_DI: TQuery;
    qry_Tipo_ReferenciaCD_REFERENCIA: TStringField;
    qry_Tipo_ReferenciaNM_REFERENCIA: TStringField;
    qry_Grupo_Ref_Comp_DICD_GRUPO: TStringField;
    qry_Grupo_Ref_Comp_DITP_REFERENCIA: TStringField;
    qry_Grupo_Ref_Comp_DINR_ORDEM: TIntegerField;
    qry_Grupo_Ref_Comp_DINM_REFERENCIA: TStringField;
    upd_Grupo_Ref_Comp_DI: TUpdateSQL;
    qry_Despesas: TQuery;
    ds_Despesas: TDataSource;
    ds_Grupo_Despesas: TDataSource;
    qry_Grupo_Despesas: TQuery;
    upd_Grupo_Despesas: TUpdateSQL;
    qry_DespesasCD_ITEM: TStringField;
    qry_DespesasNM_ITEM: TStringField;
    qry_Grupo_DespesasCD_GRUPO: TStringField;
    qry_Grupo_DespesasCD_ITEM: TStringField;
    qry_Grupo_DespesasNM_ITEM: TStringField;
    qry_grupo_EMAIL_AVARIAS: TStringField;
    qry_grupo_NM_EMAIL_CONSULTA_MERCANTE: TStringField;
    qry_grupo_IC_CONSULTA_MERCANTE_TERCEIROS: TBooleanField;
    qry_grupo_NM_EMAIL_CONSULTA_LI: TStringField;
    qry_grupo_NM_EMAIL_CONSULTA_LI_STATUS: TMemoField;
    qry_grupo_CD_TIPO_BASE_SEGURO_DI: TStringField;
    qry_grupo_PC_SEGURO_MLE_DI: TFloatField;
    qry_grupo_bancoCD_BANCO_PGMTO_AFRMM: TIntegerField;
    qry_grupo_CD_COORDENADOR_IMPO: TStringField;
    qry_grupo_CD_COORDENADOR_EXPO: TStringField;
    qry_relatorios_mail_aut_CD_TIPO_DOCTO: TStringField;
    dsEmailConsultaLiStatus: TDataSource;
    cdsEmailConsultaLiStatus: TClientDataSet;
    cdsEmailConsultaLiStatusNM_EMAIL: TStringField;
    qry_grupo_IN_STATUS_LI_INCLUIR_CONTATO: TBooleanField;
    qry_relatorios_mail_aut_NM_RELATORIO: TStringField;
    qry_relatorios_mail_aut_DESCRICAO: TStringField;
    qry_grupo_IN_DI_EXTERNA: TStringField;
    qry_grupo_NM_EMAIL_DRAFT_BL: TStringField;
    qry_grupo_IN_PENDENCIAS_EMAIL: TStringField;
    qry_grupo_IN_PREENCHE_COMPLEMENTAR_AD: TStringField;
    qry_grupo_CD_GESTOR_CONTAS: TStringField;
    qry_grupo_IN_CONTRATO: TStringField;
    qry_grupo_DT_VIGENCIA_CONTRATO: TDateTimeField;
    qry_grupo_NM_INDICE_REAJUSTE_ACORDADO: TStringField;
    dsGrupoReajusteContr: TDataSource;
    updGrupoReajusteContr: TUpdateSQL;
    qryGrupoReajusteContr: TQuery;
    qryGrupoReajusteContrCD_GRUPO: TStringField;
    qryGrupoReajusteContrDT_PEDIDO_REAJUSTE: TDateTimeField;
    qryGrupoReajusteContrDT_REAJUSTE_NEGOCIADO: TDateTimeField;
    qryGrupoReajusteContrVL_REAJUSTE_INDICE_APROVADO: TFloatField;
    qryGrupoReajusteContrDT_VENC_PROXIMO_REAJUSTE: TDateTimeField;
    qryGrupoReajusteContrDT_REAJUSTE_INICIO_APLICACAO: TDateTimeField;
    qryGrupoReajusteContrCD_REAJUSTE_CONTRATO: TIntegerField;
    qryGrupoReajusteContrVL_INDICE_REAJUSTE: TFloatField;
    procedure qry_grupo_AfterPost(DataSet: TDataSet);
    procedure QryGrupoItemAfterDelete(DataSet: TDataSet);
    procedure QryGrupoItemAfterPost(DataSet: TDataSet);
    procedure QryGrupoItemBeforeEdit(DataSet: TDataSet);
    procedure qry_grupo_NewRecord(DataSet: TDataSet);
    procedure ds_grupo_bancoStateChange(Sender: TObject);
    procedure qry_grupo_bancoAfterPost(DataSet: TDataSet);
    procedure qry_grupo_bancoBeforePost(DataSet: TDataSet);
    procedure qry_grupo_bancoBeforeEdit(DataSet: TDataSet);
    procedure ds_grupo_bancoDataChange(Sender: TObject; Field: TField);
    procedure qry_relatorios_mail_aut_AfterDelete(DataSet: TDataSet);
    procedure qry_relatorios_mail_aut_AfterPost(DataSet: TDataSet);
    procedure qry_relatorios_mail_aut_AfterScroll(DataSet: TDataSet);
    procedure qry_relatorios_mail_aut_CalcFields(DataSet: TDataSet);
    procedure qry_relatorios_mail_aut_usuarios_CalcFields(
      DataSet: TDataSet);
    procedure ds_relatorios_mail_autDataChange(Sender: TObject;
      Field: TField);
    procedure qry_relatorios_mail_aut_usuarios_AfterScroll(
      DataSet: TDataSet);
    procedure qry_relatorios_mail_aut_NewRecord(DataSet: TDataSet);
    procedure qryFatoresAfterScroll(DataSet: TDataSet);
    procedure qryFatoresNewRecord(DataSet: TDataSet);
    procedure qryFatoresAfterPost(DataSet: TDataSet);
    procedure dsFatoresStateChange(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryFatoresCamposNewRecord(DataSet: TDataSet);
    procedure qryFatoresEventosNewRecord(DataSet: TDataSet);
    procedure qry_relatorios_mail_aut_usuarios_BeforePost(
      DataSet: TDataSet);
    procedure qry_Tipo_ReferenciaBeforeOpen(DataSet: TDataSet);
    procedure qry_Grupo_Ref_Comp_DIAfterPost(DataSet: TDataSet);
    procedure qryGrupoReajusteContrAfterDelete(DataSet: TDataSet);
    procedure qryGrupoReajusteContrAfterPost(DataSet: TDataSet);
    procedure qryGrupoReajusteContrPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure AtualizaNB;
  end;

var
  datm_grupo: Tdatm_grupo;

implementation

uses PGSM119, GSMLIB, ConsOnLineEx, Funcoes;

{$R *.DFM}

procedure Tdatm_grupo.qry_grupo_AfterPost(DataSet: TDataSet);
begin
  qry_grupo_.ApplyUpdates;
end;

procedure Tdatm_grupo.QryGrupoItemAfterDelete(DataSet: TDataSet);
begin
  QryGrupoItem.ApplyUpdates;
end;

procedure Tdatm_grupo.QryGrupoItemAfterPost(DataSet: TDataSet);
begin
  QryGrupoItem.ApplyUpdates;
end;

procedure Tdatm_grupo.QryGrupoItemBeforeEdit(DataSet: TDataSet);
begin
  frm_grupo.btn_mi( False, True, True, False );
end;

procedure Tdatm_grupo.qry_grupo_NewRecord(DataSet: TDataSet);
begin
  qry_grupo_IN_ALERTA_E01_NAO_GENERICO.AsString:='0'; //by Carlos 15/07/2010
end;

procedure Tdatm_grupo.ds_grupo_bancoStateChange(Sender: TObject);
begin
  if (qry_grupo_banco.State  in [dsEdit, dsInsert]) or qry_grupo_banco.UpdatesPending then
  begin
    {qry_grupo_bancoCD_UNID_NEG.ReadOnly :=true;
    qry_grupo_bancoCD_PRODUTO.ReadOnly  :=true;
    qry_grupo_bancoCD_SERVICO.ReadOnly  :=true;
    qry_grupo_bancoCD_GRUPO.ReadOnly    :=true;}
    frm_grupo.btn_mi( False, True, True, False);
  end
  else
    frm_grupo.btn_mi(True, False, False, qry_grupo_banco.Active and (qry_grupo_banco.RecordCount > 0));

  Exit;

   if (qry_grupo_banco.State  in [dsBrowse])  then
  begin
    frm_grupo.btn_mi( true, false, false, False );
  end;

  if (qry_grupo_banco.State in [dsInsert]) then
  begin
    frm_grupo.btn_mi( False, True, True, False );
    {qry_grupo_bancoCD_UNID_NEG.ReadOnly :=false;
    qry_grupo_bancoCD_PRODUTO.ReadOnly  :=false;
    qry_grupo_bancoCD_SERVICO.ReadOnly  :=false;
    qry_grupo_bancoCD_GRUPO.ReadOnly    :=false;}
  end
  else
  begin
    frm_grupo.btn_mi( True, false, false, False );
  end;
end;

procedure Tdatm_grupo.qry_grupo_bancoAfterPost(DataSet: TDataSet);
begin
  qry_grupo_banco.ApplyUpdates;
end;

procedure Tdatm_grupo.qry_grupo_bancoBeforePost(DataSet: TDataSet);
begin
  qry_grupo_bancoCD_GRUPO.AsString:= datm_grupo.qry_grupo_CD_GRUPO.AsString;
  if not frm_grupo.Consiste then
   abort;
end;

procedure Tdatm_grupo.qry_grupo_bancoBeforeEdit(DataSet: TDataSet);
begin
  if (qry_grupo_banco.State  in [dsEdit])  then
  begin
    qry_grupo_bancoCD_UNID_NEG.ReadOnly :=true;
  end;
end;

procedure Tdatm_grupo.ds_grupo_bancoDataChange(Sender: TObject;
  Field: TField);
begin
  //frm_grupo.btn_salvar.Enabled:=true;
  //frm_grupo.btn_cancelar.Enabled:=true;
end;

procedure Tdatm_grupo.qry_relatorios_mail_aut_AfterDelete(
  DataSet: TDataSet);
begin
   qry_relatorios_mail_aut_.ApplyUpdates;
end;

procedure Tdatm_grupo.qry_relatorios_mail_aut_AfterPost(DataSet: TDataSet);
begin
  qry_relatorios_mail_aut_.ApplyUpdates;
end;

procedure Tdatm_grupo.qry_relatorios_mail_aut_AfterScroll(
  DataSet: TDataSet);
begin
  with frm_grupo do begin
    AtualizaNB;
    file_path.Text := qry_relatorios_mail_aut_TX_MODELO.AsString;
    edt_horarios.Clear;
  end;
end;

procedure Tdatm_grupo.AtualizaNB;
var
  in_email_atendente,in_email_contato,in_email_transportador,
  in_email_Extra_Processo, in_email_ArmazemDescarga, in_email_Agente_Carga,
  in_email_Armazem_Estocagem:String;
begin
  with frm_grupo do
  begin
    chkAtendente.Checked      := False;
    chkContato.Checked        := False;
    chkTransportador.Checked  := False;
    lblSql.Visible            := False;
    mmSql.Visible             := False;
    mmSql.Clear;

    Ed40.Text                             := ExtractWord(1 ,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed29.Text                             := ExtractWord(2 ,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
//  Ed31.Text                             := ExtractWord(3 ,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/'); seria o edit do grupo
    Ed33.Text                             := ExtractWord(4 ,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed35.Text                             := ExtractWord(5 ,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed37.Text                             := ExtractWord(6 ,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed39.Text                             := ExtractWord(7 ,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit121.Text                          := ExtractWord(8 ,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    mmSql.Lines.Text                      := ExtractWord(9 ,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit135.Text                          := ExtractWord(10,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    in_email_atendente                    := ExtractWord(11,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    in_email_contato                      := ExtractWord(12,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    in_email_transportador                := ExtractWord(13,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_cd_urf_despacho.Text              := ExtractWord(14,qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edtE01_ExportadorImportador_Cod.Text  := ExtractWord(15, qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edtRepresentante.Text                 := ExtractWord(16, qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');   
    in_email_Extra_Processo               := ExtractWord(17, qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    in_email_ArmazemDescarga              := ExtractWord(18, qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    in_email_Agente_Carga                 := ExtractWord(19, qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edtcdServico.text                     := ExtractWord(20, qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edtArmazemDescarga.text               := ExtractWord(21, qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edtAgenteCarga.text                   := ExtractWord(22, qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edtCdLocalDesembarque.text            := ExtractWord(23, qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edtCdArmazemEstocagem.text            := ExtractWord(24, qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    in_email_Armazem_Estocagem            := ExtractWord(25, qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');

    edtTPDocto.Text                       := qry_relatorios_mail_aut_CD_TIPO_DOCTO.AsString;
    chkAtendente.Checked                  := (in_email_atendente       = '1');
    chkContato.Checked                    := (in_email_contato         = '1');
    chkTransportador.Checked              := (in_email_transportador   = '1');
    chkEmailExtraProcesso.Checked         := (in_email_Extra_Processo  = '1');
    chkArmazemDescarga.Checked            := (in_email_ArmazemDescarga = '1');
    chkAgenteDeCarga.Checked              := (in_email_Agente_Carga    = '1');
//    chkArmazemEstocagem.Checked           := (in_email_Armazem_Estocagem    = '1');

    mmSql.Visible  := True;
    lblSql.Visible := True;
  end;
end;

procedure Tdatm_grupo.qry_relatorios_mail_aut_CalcFields(
  DataSet: TDataSet);
begin
  if qry_relatorios_mail_aut_.FieldByName('IN_ATIVO').AsString = '1' then
    qry_relatorios_mail_aut_.FieldByName('calc_ATIVO').AsString := 'ü';
end;

procedure Tdatm_grupo.qry_relatorios_mail_aut_usuarios_CalcFields(
  DataSet: TDataSet);
begin
  qry_relatorios_mail_aut_usuarios_calc_NM_USUARIO.AsString := ConsultaLookUp('TUSUARIO','CD_USUARIO',qry_relatorios_mail_aut_usuarios_CD_USUARIO.AsString,'NM_USUARIO');
end;

procedure Tdatm_grupo.ds_relatorios_mail_autDataChange(Sender: TObject;
  Field: TField);
begin
  with frm_grupo do
  begin
    if (pgctrl_grupo.ActivePage = ts_lista) or
       (pgctrl_grupo.ActivePage = ts_disparo_automatico) then  begin
      btn_incluir.Enabled  := (qry_relatorios_mail_aut_.state in [dsBrowse])         or (qry_relatorios_mail_aut_usuarios_.state in [dsBrowse]);
      btn_salvar.Enabled   := (qry_relatorios_mail_aut_.state in [dsInsert, dsEdit]) or (qry_relatorios_mail_aut_usuarios_.state in [dsInsert, dsEdit]);
      btn_cancelar.Enabled := (qry_relatorios_mail_aut_.state in [dsInsert, dsEdit]) or (qry_relatorios_mail_aut_usuarios_.state in [dsInsert, dsEdit]);
    end
    else
    if (pgctrl_grupo.ActivePage <> tbsFatores) then
    begin
      btn_incluir.Enabled  := (qry_relatorios_mail_aut_usuarios_.state in [dsBrowse])         or (qry_relatorios_mail_aut_usuarios_.state in [dsBrowse]) ;
      btn_salvar.Enabled   := (qry_relatorios_mail_aut_usuarios_.state in [dsInsert, dsEdit]) or (qry_relatorios_mail_aut_usuarios_.state in [dsInsert, dsEdit]);
      btn_cancelar.Enabled := (qry_relatorios_mail_aut_usuarios_.state in [dsInsert, dsEdit]) or (qry_relatorios_mail_aut_usuarios_.state in [dsInsert, dsEdit]);
    end;
  end;

end;

procedure Tdatm_grupo.qry_relatorios_mail_aut_usuarios_AfterScroll(
  DataSet: TDataSet);
begin
  frm_grupo.edt_horarios.Text := qry_relatorios_mail_aut_usuarios_TX_HORARIOS_ENVIO.AsString;
end;

procedure Tdatm_grupo.qry_relatorios_mail_aut_NewRecord(DataSet: TDataSet);

  function vUltCod:String;
  begin
    with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add(' select max(CD_RELATORIO)+1 FROM TRELATORIOS_MAIL_AUT ');
        Open;
        result:=formatfloat('00000',fields[0].asinteger);
        Free;
      end;
  end;
begin
  qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString:='E01';
  qry_relatorios_mail_aut_CD_RELATORIO.AsString:=vUltCod;
  qry_relatorios_mail_aut_IN_ATIVO.AsString:='0';
end;

procedure Tdatm_grupo.qryFatoresAfterScroll(DataSet: TDataSet);
begin
  if qryFatoresCampos.Active then
    qryFatoresCampos.Close;
  qryFatoresCampos.Prepare;
  qryFatoresCampos.Open;

  if qryFatoresEventos.Active then
    qryFatoresEventos.Close;
  qryFatoresEventos.Prepare;
  qryFatoresEventos.Open;
end;

procedure Tdatm_grupo.qryFatoresNewRecord(DataSet: TDataSet);
begin
  qryFatoresCD_UNID_NEG.AsString   := str_cd_unid_neg;
  qryFatoresCD_PRODUTO.AsString    := str_cd_produto;
  qryFatoresIN_OPCIONAL.AsString   := '0';
  qryFatoresCD_GRUPO.AsString      := qry_grupo_CD_GRUPO.AsString;
  qryFatoresCD_COMPARADOR.AsString := '=';
end;

procedure Tdatm_grupo.qryFatoresAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure Tdatm_grupo.dsFatoresStateChange(Sender: TObject);
begin
  if TDataSource(Sender).State in [dsEdit, dsInsert] then
    frm_grupo.btn_mi(False, True, True, False)
  else
    frm_grupo.btn_mi(True, False, False, False);//TDataSource(Sender).DataSet.Active and (TDataSource(Sender).DataSet.RecordCount > 0));
end;

procedure Tdatm_grupo.DataModuleCreate(Sender: TObject);
begin
  if not qryComparadores.Active then
    qryComparadores.Open;

  cdsEmailConsultaLiStatus.CreateDataSet;    
end;

procedure Tdatm_grupo.qryFatoresCamposNewRecord(DataSet: TDataSet);
begin
  qryFatoresCamposCD_FATOR.AsInteger := qryFatoresCD_FATOR.AsInteger;
end;

procedure Tdatm_grupo.qryFatoresEventosNewRecord(DataSet: TDataSet);
begin
  qryFatoresEventosCD_FATOR.AsInteger := qryFatoresCD_FATOR.AsInteger;
end;

procedure Tdatm_grupo.qry_relatorios_mail_aut_usuarios_BeforePost(
  DataSet: TDataSet);
  Var
  vPermitido:Boolean;
begin
    vPermitido:=True;
    if qry_grupo_IN_ALERTA_E01_NAO_GENERICO.Value<>'1' then
    begin
      with TQuery.Create(application) do
      begin
         DatabaseName := 'DBBROKER';
         SQL.Clear;
         SQL.Add(' SELECT IsNull(C.IN_INTERNO,0) IN_INTERNO');
         SQL.Add('   FROM TUSUARIO U (NOLOCK)');
         SQL.Add('   JOIN TCARGO   C (NOLOCK) ON U.CD_CARGO=C.CD_CARGO ');
         SQL.Add('  WHERE U.CD_USUARIO= :CD_USUARIO ');
         ParamByName('CD_USUARIO').AsString:=qry_relatorios_mail_aut_usuarios_CD_USUARIO.AsString;
         Open;
         vPermitido:=(FieldByName('IN_INTERNO').AsInteger=1);
         Close;
         Free;
      end;
    end;
    if not vPermitido then begin
       showmessage('* Usuário Externo não permitido em grupos genéricos *' );
       abort;
    end;
end;

procedure Tdatm_grupo.qry_Tipo_ReferenciaBeforeOpen(DataSet: TDataSet);
begin
  TQuery(DataSet).ParamByName('CD_GRUPO').AsString := qry_grupo_CD_GRUPO.AsString;
end;

procedure Tdatm_grupo.qry_Grupo_Ref_Comp_DIAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure Tdatm_grupo.qryGrupoReajusteContrAfterDelete(DataSet: TDataSet);
begin
  qryGrupoReajusteContr.ApplyUpdates;
end;

procedure Tdatm_grupo.qryGrupoReajusteContrAfterPost(DataSet: TDataSet);
begin
  qryGrupoReajusteContr.ApplyUpdates;
  qryGrupoReajusteContr.Close;
  qryGrupoReajusteContr.Open;
  qryGrupoReajusteContr.Last;
end;

procedure Tdatm_grupo.qryGrupoReajusteContrPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  TrataErro(E);
end;

end.


