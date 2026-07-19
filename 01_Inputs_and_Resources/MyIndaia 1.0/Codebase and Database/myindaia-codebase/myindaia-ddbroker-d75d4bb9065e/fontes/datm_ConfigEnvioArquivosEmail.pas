unit datm_ConfigEnvioArquivosEmail;

interface

uses
  SysUtils, Classes, FMTBcd, DBXpress, DB, SqlExpr, DBClient, Provider;

type
  Tdatm_ConfigEnvioEmail = class(TDataModule)
    dsListaGrupos: TDataSource;
    qryListaGrupos: TSQLQuery;
    cdsListaGruposCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    strngfldListaGruposCD_PRODUTO: TStringField;
    strngfldListaGruposCD_GRUPO: TStringField;
    qryConfig: TSQLQuery;
    cdsConfigCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    strngfldConfigCD_PRODUTO: TStringField;
    strngfldConfigCD_GRUPO: TStringField;
    dsConfig: TDataSource;
    qryGrupo: TSQLQuery;
    strngfldqry1CD_GRUPO: TStringField;
    strngfldqry1NM_GRUPO: TStringField;
    dsGrupo: TDataSource;
    qryProduto: TSQLQuery;
    strngfldProdutoCD_PRODUTO: TStringField;
    strngfldProdutoNM_PRODUTO: TStringField;
    dsProduto: TDataSource;
    qryTipoDocumento: TSQLQuery;
    cdsTipoDocumentoCD_TIPO_DOCTO: TIntegerField;
    strngfldTipoDocumentoNM_TIPO_DOCTO: TStringField;
    dsTipoDocumento: TDataSource;
    SQLConnection: TSQLConnection;
    dsConfigArquivo: TDataSource;
    dspListaGrupos: TDataSetProvider;
    cdsListaGrupos: TClientDataSet;
    cdsConfig: TClientDataSet;
    dspConfig: TDataSetProvider;
    dspConfigArquivo: TDataSetProvider;
    qryNomeArquivo: TSQLQuery;
    cdsNomeArquivo: TClientDataSet;
    dsNomeArquivo: TDataSource;
    dspNomeArquivo: TDataSetProvider;
    cdsConfigCD_CONFIG_ENVIO_EMAIL2: TIntegerField;
    strngfldConfigCD_PRODUTO1: TStringField;
    strngfldConfigCD_GRUPO1: TStringField;
    cdsGrupo: TClientDataSet;
    cdsProduto: TClientDataSet;
    cdsTipoDocumento: TClientDataSet;
    dspGrupo: TDataSetProvider;
    dspProduto: TDataSetProvider;
    dspTipoDocumento: TDataSetProvider;
    strngfldGrupoCD_GRUPO: TStringField;
    strngfldGrupoNM_GRUPO: TStringField;
    cdsTipoDocumentoCD_TIPO_DOCTO2: TIntegerField;
    strngfldTipoDocumentoNM_TIPO_DOCTO1: TStringField;
    strngfldProdutoCD_PRODUTO1: TStringField;
    strngfldProdutoNM_PRODUTO1: TStringField;
    cdsConfigArquivo: TClientDataSet;
    cdsConfigArquivoCD_CONFIG_ENVIO_EMAIL_ARQU2: TIntegerField;
    cdsConfigArquivoCD_CONFIG_ENVIO_EMAIL2: TIntegerField;
    cdsConfigArquivoCD_ARQUIVO2: TIntegerField;
    qryConfigArquivo: TSQLQuery;
    cdsConfigArquivoCD_CONFIG_ENVIO_EMAIL_ARQU: TIntegerField;
    cdsConfigArquivoCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    cdsConfigArquivoCD_ARQUIVO: TIntegerField;
    cdsConfigArquivoNM_ARQUIVO: TStringField;
    cdsListaGruposCD_CONFIG_ENVIO_EMAIL2: TIntegerField;
    cdsListaGruposCD_PRODUTO: TStringField;
    cdsListaGruposCD_GRUPO: TStringField;
    qryListaGruposNM_PRODUTO: TStringField;
    qryListaGruposNM_GRUPO: TStringField;
    cdsListaGruposNM_PRODUTO: TStringField;
    cdsListaGruposNM_GRUPO: TStringField;
    qryConfigEmpresa: TSQLQuery;
    dsConfigEmpresa: TDataSource;
    dsConfigArquivoEmpresa: TDataSource;
    cdsConfigEmpresa: TClientDataSet;
    dspConfigEmpresa: TDataSetProvider;
    dspConfigArquivoEmpresa: TDataSetProvider;
    qryNomeArquivoEmpresa: TSQLQuery;
    cdsNomeArquivoEmpresa: TClientDataSet;
    dsNomeArquivoEmpresa: TDataSource;
    dspNomeArquivoEmpresa: TDataSetProvider;
    cdsConfigArquivoEmpresa: TClientDataSet;
    qryConfigArquivoEmpresa: TSQLQuery;
    qryConfigEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField;
    qryConfigEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    cdsConfigEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField;
    cdsConfigEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    qryConfigArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP_ARQ: TIntegerField;
    qryConfigArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField;
    qryConfigArquivoEmpresaCD_ARQUIVO: TIntegerField;
    cdsConfigArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP_ARQ: TIntegerField;
    cdsConfigArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField;
    cdsConfigArquivoEmpresaCD_ARQUIVO: TIntegerField;
    qryNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP_SL: TIntegerField;
    qryNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP_ARQ: TIntegerField;
    qryNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField;
    qryNomeArquivoEmpresaNM_SIGLA: TStringField;
    qryNomeArquivoEmpresaNM_NOVO_NOME_ARQUIVO: TStringField;
    cdsNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP_SL: TIntegerField;
    cdsNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP_ARQ: TIntegerField;
    cdsNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField;
    cdsNomeArquivoEmpresaNM_SIGLA: TStringField;
    cdsNomeArquivoEmpresaNM_NOVO_NOME_ARQUIVO: TStringField;
    cdsConfigArquivoEmpresaNM_ARQUIVO: TStringField;
    qryEmpresa: TSQLQuery;
    dsEmpresa: TDataSource;
    cdsEmpresa: TClientDataSet;
    dspEmpresa: TDataSetProvider;
    qryEmpresaCD_EMPRESA: TStringField;
    qryEmpresaNM_EMPRESA: TStringField;
    dsListaEmpresa: TDataSource;
    qryListaEmpresa: TSQLQuery;
    dspListaEmpresa: TDataSetProvider;
    cdsListaEmpresa: TClientDataSet;
    cdsEmpresaCD_EMPRESA: TStringField;
    cdsEmpresaNM_EMPRESA: TStringField;
    qryConfigArquivoEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    cdsConfigArquivoEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    qryNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    cdsNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    cdsNomeArquivoCD_CONFIG_ENVIO_EMAIL_ARQU_SL: TIntegerField;
    cdsNomeArquivoCD_CONFIG_ENVIO_EMAIL_ARQU: TIntegerField;
    cdsNomeArquivoCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    cdsNomeArquivoNM_SIGLA: TStringField;
    cdsNomeArquivoNM_NOVO_NOME_ARQUIVO: TStringField;
    qryNomeArquivoCD_CONFIG_ENVIO_EMAIL_ARQU_SL: TIntegerField;
    qryNomeArquivoCD_CONFIG_ENVIO_EMAIL_ARQU: TIntegerField;
    qryNomeArquivoNM_SIGLA: TStringField;
    qryNomeArquivoNM_NOVO_NOME_ARQUIVO: TStringField;
    qryNomeArquivoCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    qryConfigEmpresaCD_EMPRESA: TStringField;
    cdsConfigEmpresaCD_EMPRESA: TStringField;
    qryListaEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField;
    qryListaEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    qryListaEmpresaCD_EMPRESA: TStringField;
    qryListaEmpresaNM_EMPRESA: TStringField;
    cdsListaEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField;
    cdsListaEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField;
    cdsListaEmpresaCD_EMPRESA: TStringField;
    cdsListaEmpresaNM_EMPRESA: TStringField;
    qryConfigArquivoNM_ASSUNTO: TStringField;
    qryConfigArquivoNM_DESTINATARIO: TStringField;
    qryConfigArquivoNM_COPIA: TStringField;
    qryConfigArquivoNM_CORPO: TStringField;
    cdsConfigArquivoNM_ASSUNTO: TStringField;
    cdsConfigArquivoNM_DESTINATARIO: TStringField;
    cdsConfigArquivoNM_COPIA: TStringField;
    cdsConfigArquivoNM_CORPO: TStringField;
    qryConfigArquivoEmpresaNM_ASSUNTO: TStringField;
    qryConfigArquivoEmpresaNM_DESTINATARIO: TStringField;
    qryConfigArquivoEmpresaNM_COPIA: TStringField;
    qryConfigArquivoEmpresaNM_CORPO: TStringField;
    cdsConfigArquivoEmpresaNM_ASSUNTO: TStringField;
    cdsConfigArquivoEmpresaNM_DESTINATARIO: TStringField;
    cdsConfigArquivoEmpresaNM_COPIA: TStringField;
    cdsConfigArquivoEmpresaNM_CORPO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsConfigStateChange(Sender: TObject);
    procedure dsConfigArquivoStateChange(Sender: TObject);
    procedure dsNomeArquivoStateChange(Sender: TObject);
    procedure cdsGrupoAfterScroll(DataSet: TDataSet);
    procedure cdsProdutoAfterScroll(DataSet: TDataSet);
    procedure dsConfigEmpresaStateChange(Sender: TObject);
    procedure dsConfigArquivoEmpresaStateChange(Sender: TObject);
    procedure dsNomeArquivoEmpresaStateChange(Sender: TObject);
    procedure cdsEmpresaAfterScroll(DataSet: TDataSet);
    procedure cdsNomeArquivoBeforePost(DataSet: TDataSet);
    procedure cdsNomeArquivoEmpresaBeforePost(DataSet: TDataSet);
    procedure cdsConfigArquivoEmpresaBeforePost(DataSet: TDataSet);
    procedure cdsConfigEmpresaBeforePost(DataSet: TDataSet);
    procedure cdsConfigArquivoBeforePost(DataSet: TDataSet);
    procedure cdsConfigArquivoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsConfigEmpresaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsConfigArquivoEmpresaReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsNomeArquivoEmpresaReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);

  private
    { Private declarations }
    chaveTemporaria : integer;
   procedure VerificaBotoesMaster(dataset : TDataSet);
   procedure VerificaBotoesDetail(dataset : TDataSet);   

  public
    { Public declarations }
  end;

var
  datm_ConfigEnvioEmail: Tdatm_ConfigEnvioEmail;

implementation

uses uConfigurarEnvioArquivosEmail;


{$R *.dfm}

procedure Tdatm_ConfigEnvioEmail.DataModuleCreate(Sender: TObject);
begin
  cdsConfig.createDataSet;
  cdsConfigArquivo.createDataSet;
  cdsNomeArquivo.createDataSet;

  cdsConfigEmpresa.createDataSet;
  cdsConfigArquivoEmpresa.createDataSet;
  cdsNomeArquivoEmpresa.createDataSet;

  chaveTemporaria := 0;
end;

procedure Tdatm_ConfigEnvioEmail.dsConfigStateChange(Sender: TObject);
begin
  VerificaBotoesMaster(dsConfig.DataSet);
end;

procedure Tdatm_ConfigEnvioEmail.dsConfigArquivoStateChange(
  Sender: TObject);
begin
  VerificaBotoesMaster(dsConfigArquivo.DataSet);
end;

procedure Tdatm_ConfigEnvioEmail.VerificaBotoesMaster(dataset : TDataSet);
begin
  if Assigned(frmConfigurarEnvioArquivosEmail) then
  begin
    if not frmConfigurarEnvioArquivosEmail.btn_incluir.Enabled then
      frmConfigurarEnvioArquivosEmail.btn_incluir.Enabled  := (dataset.state in [dsBrowse]);

    if not frmConfigurarEnvioArquivosEmail.btn_salvar.Enabled then
      frmConfigurarEnvioArquivosEmail.btn_salvar.Enabled   := (dataset.state in [dsInsert, dsEdit]);

    if not frmConfigurarEnvioArquivosEmail.btn_cancelar.Enabled then
      frmConfigurarEnvioArquivosEmail.btn_cancelar.Enabled := (dataset.state in [dsInsert, dsEdit]);
  end;
end;

procedure Tdatm_ConfigEnvioEmail.VerificaBotoesDetail(dataset : TDataSet);
begin
  if Assigned(frmConfigurarEnvioArquivosEmail) then
  begin
    if not frmConfigurarEnvioArquivosEmail.btn_IncluirEmpresa.Enabled then
      frmConfigurarEnvioArquivosEmail.btn_IncluirEmpresa.Enabled  := (dataset.state in [dsBrowse]);

    if not frmConfigurarEnvioArquivosEmail.btn_GravarEmpresa.Enabled then
      frmConfigurarEnvioArquivosEmail.btn_GravarEmpresa.Enabled   := (dataset.state in [dsInsert, dsEdit]);

    if not frmConfigurarEnvioArquivosEmail.btnCancelarEmpresa.Enabled then
      frmConfigurarEnvioArquivosEmail.btnCancelarEmpresa.Enabled := (dataset.state in [dsInsert, dsEdit]);
  end;
end;

procedure Tdatm_ConfigEnvioEmail.dsNomeArquivoStateChange(Sender: TObject);
begin
  VerificaBotoesMaster(dsNomeArquivo.DataSet);
end;

procedure Tdatm_ConfigEnvioEmail.cdsGrupoAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmConfigurarEnvioArquivosEmail) then
  begin
    if frmConfigurarEnvioArquivosEmail.pgcConsultaCadastra.ActivePage = frmConfigurarEnvioArquivosEmail.tsConsulta then
      frmConfigurarEnvioArquivosEmail.FiltrarLista;
  end;
end;

procedure Tdatm_ConfigEnvioEmail.cdsProdutoAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmConfigurarEnvioArquivosEmail) then
  begin
    if frmConfigurarEnvioArquivosEmail.pgcConsultaCadastra.ActivePage = frmConfigurarEnvioArquivosEmail.tsConsulta then
      frmConfigurarEnvioArquivosEmail.FiltrarLista;
  end;
end;

procedure Tdatm_ConfigEnvioEmail.dsConfigEmpresaStateChange(
  Sender: TObject);
begin
  VerificaBotoesDetail(dsConfigEmpresa.dataset);
end;

procedure Tdatm_ConfigEnvioEmail.dsConfigArquivoEmpresaStateChange(
  Sender: TObject);
begin
  VerificaBotoesDetail(dsConfigArquivoEmpresa.dataset);
end;

procedure Tdatm_ConfigEnvioEmail.dsNomeArquivoEmpresaStateChange(
  Sender: TObject);
begin
  VerificaBotoesDetail(dsNomeArquivoEmpresa.dataset);
end;

procedure Tdatm_ConfigEnvioEmail.cdsEmpresaAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmConfigurarEnvioArquivosEmail) then
  begin
    if frmConfigurarEnvioArquivosEmail.pgcConsultaCadastra.ActivePage = frmConfigurarEnvioArquivosEmail.tsCadastro     then
      if frmConfigurarEnvioArquivosEmail.pgcGrupoEmpresa.ActivePage   = frmConfigurarEnvioArquivosEmail.tsEmpresa      then
        if frmConfigurarEnvioArquivosEmail.pgcDadosEmpresa.ActivePage = frmConfigurarEnvioArquivosEmail.tsListaEmpresa then
          frmConfigurarEnvioArquivosEmail.FiltrarListaEmpresa;
  end;
end;

procedure Tdatm_ConfigEnvioEmail.cdsNomeArquivoBeforePost(
  DataSet: TDataSet);
begin       
  if datm_ConfigEnvioEmail.cdsNomeArquivo.fieldbyName('CD_CONFIG_ENVIO_EMAIL_ARQU_SL').asinteger = 0 then
  begin
    dec(chaveTemporaria);
    datm_ConfigEnvioEmail.cdsNomeArquivo.fieldByName('CD_CONFIG_ENVIO_EMAIL_ARQU_SL').value := chaveTemporaria;
  end;

  if datm_ConfigEnvioEmail.cdsNomeArquivo.fieldbyName('CD_CONFIG_ENVIO_EMAIL').AsInteger  = 0 then
  begin
    datm_ConfigEnvioEmail.cdsNomeArquivo.fieldbyName('CD_CONFIG_ENVIO_EMAIL').AsInteger       := datm_ConfigEnvioEmail.cdsConfigArquivo.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;
    datm_ConfigEnvioEmail.cdsNomeArquivo.fieldbyName('CD_CONFIG_ENVIO_EMAIL_ARQU').AsInteger  := datm_ConfigEnvioEmail.cdsConfigArquivo.fieldByName('CD_CONFIG_ENVIO_EMAIL_ARQU').asInteger;
  end;
end;

procedure Tdatm_ConfigEnvioEmail.cdsNomeArquivoEmpresaBeforePost(
  DataSet: TDataSet);
begin
  if datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.FieldByName('CD_CONFIG_ENVIO_EMAIL_EMP_SL').AsInteger  = 0 then
  begin
    dec(chaveTemporaria);
    datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.FieldByName('CD_CONFIG_ENVIO_EMAIL_EMP_SL').AsInteger := chaveTemporaria;
  end;

  if datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.FieldByName('CD_CONFIG_ENVIO_EMAIL').AsInteger  = 0 then
  begin
    datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.FieldByName('CD_CONFIG_ENVIO_EMAIL').AsInteger          := datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;
    datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.FieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').AsInteger      := datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger;
    datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.FieldByName('CD_CONFIG_ENVIO_EMAIL_EMP_ARQ').AsInteger  := datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP_ARQ').asInteger;
  end;
end;

procedure Tdatm_ConfigEnvioEmail.cdsConfigArquivoEmpresaBeforePost(
  DataSet: TDataSet);
begin
  if datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.FieldByName('CD_CONFIG_ENVIO_EMAIL_EMP_ARQ').AsInteger  = 0 then
  begin
    dec(chaveTemporaria);
    datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.FieldByName('CD_CONFIG_ENVIO_EMAIL_EMP_ARQ').AsInteger := chaveTemporaria;
  end;

  if datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.FieldByName('CD_CONFIG_ENVIO_EMAIL').AsInteger  = 0 then
  begin
    datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.FieldByName('CD_CONFIG_ENVIO_EMAIL').AsInteger     := datm_ConfigEnvioEmail.cdsConfig.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;
    datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.FieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').AsInteger := datm_ConfigEnvioEmail.cdsConfigEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger;
  end;
end;

procedure Tdatm_ConfigEnvioEmail.cdsConfigEmpresaBeforePost(
  DataSet: TDataSet);
begin
  if datm_ConfigEnvioEmail.cdsConfigEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL').AsInteger = 0 then
    datm_ConfigEnvioEmail.cdsConfigEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL').AsInteger := datm_ConfigEnvioEmail.cdsConfig.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;
end;

procedure Tdatm_ConfigEnvioEmail.cdsConfigArquivoBeforePost(
  DataSet: TDataSet);
begin
  if datm_ConfigEnvioEmail.cdsConfigArquivo.fieldByName('CD_CONFIG_ENVIO_EMAIL').asinteger = 0 then
    datm_ConfigEnvioEmail.cdsConfigArquivo.fieldByName('CD_CONFIG_ENVIO_EMAIL').value := datm_ConfigEnvioEmail.cdsConfig.FieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;

  if datm_ConfigEnvioEmail.cdsConfigArquivo.fieldByName('CD_CONFIG_ENVIO_EMAIL_ARQU').asinteger = 0 then
  begin
    dec(chaveTemporaria);
    datm_ConfigEnvioEmail.cdsConfigArquivo.fieldByName('CD_CONFIG_ENVIO_EMAIL_ARQU').value := chaveTemporaria;
  end;
end;

procedure Tdatm_ConfigEnvioEmail.cdsConfigArquivoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  raise Exception.Create(E.message); 
end;

procedure Tdatm_ConfigEnvioEmail.cdsConfigEmpresaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  raise Exception.Create(E.message); 
end;

procedure Tdatm_ConfigEnvioEmail.cdsConfigArquivoEmpresaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  raise Exception.Create(E.message); 
end;

procedure Tdatm_ConfigEnvioEmail.cdsNomeArquivoEmpresaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  raise Exception.Create(E.message); 
end;

end.
