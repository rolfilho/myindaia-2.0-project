unit UAtualizaDatasLisProcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, Grids, DBGrids, ExtCtrls, Provider,
  DBClient, DB, DBTables, KrQuery, DBCtrls, ToolEdit, RXDBCtrl;

    Const
     cDATA  = 1;
     cTEXTO = 2;

type
  TfrmAtualizaDatasLisProcesso = class(TForm)
    pnlFundo: TPanel;
    pnlTopo: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    dbgrdLi: TDBGrid;
    dbgrdSelecionadas: TDBGrid;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    medtDataRegistro: TMaskEdit;
    medtDataProrrogacao: TMaskEdit;
    lbl_dt_reg_li: TLabel;
    lbl1: TLabel;
    chkDataRegistro: TCheckBox;
    chkDataSolicitaProrrogacao: TCheckBox;
    btnSelecionaTodos: TSpeedButton;
    btnRemove: TSpeedButton;
    btnRemoveTodos: TSpeedButton;
    btnSeleciona: TSpeedButton;
    lbl2: TLabel;
    lbl3: TLabel;
    dsLIsDisponiveis: TDataSource;
    qry_li_: TQuery;
    qry_li_NR_PROCESSO: TStringField;
    qry_li_NR_LI: TStringField;
    qry_li_DT_REGISTRO: TDateTimeField;
    cdsLisDisponiveis: TClientDataSet;
    dspLIsDisponiveis: TDataSetProvider;
    dsLIsSelecionadas: TDataSource;
    cdsLisDisponiveisNR_PROCESSO: TStringField;
    cdsLisDisponiveisNR_LI: TStringField;
    cdsLisDisponiveisDT_REGISTRO: TDateTimeField;
    cdsLIsSelecionadas: TClientDataSet;
    cdsLIsSelecionadasNR_PROCESSO: TStringField;
    cdsLIsSelecionadasNR_LI: TStringField;
    DateTimeField1: TDateTimeField;
    qry_li_DATA_SOLICI_PRORROGACAO: TDateTimeField;
    cdsLIsSelecionadasDATA_SOLICI_PRORROGACAO: TDateTimeField;
    cdsLisDisponiveisDATA_SOLICI_PRORROGACAO: TDateTimeField;
    Label435: TLabel;
    Label434: TLabel;
    edtNmEmissor: TEdit;
    btnEmissor: TSpeedButton;
    Label438: TLabel;
    Label436: TLabel;
    Label439: TLabel;
    Label440: TLabel;
    Label442: TLabel;
    chkEmissaoGRU: TCheckBox;
    chkTipoLi: TCheckBox;
    cbkFinDossie: TCheckBox;
    chkPagamentoGRU: TCheckBox;
    chkDocsAnexados: TCheckBox;
    chkAptoFinDossie: TCheckBox;
    chkSolicitacao: TCheckBox;
    chkEmissor: TCheckBox;
    medDtSolicitacao: TMaskEdit;
    medAnexoDossie: TMaskEdit;
    medFinDossie: TMaskEdit;
    medAptoFinDossie: TMaskEdit;
    medEmissaoGRU: TMaskEdit;
    rgTipoLi: TRadioGroup;
    edtUsuarioEmissor: TEdit;
    qry_li_DT_SOLICITACAO: TDateTimeField;
    qry_li_DT_APTO_FIN_DOSSIE: TDateTimeField;
    qry_li_DT_FIN_DOSSIE: TDateTimeField;
    qry_li_DT_DOCTOS_DOSSIE: TDateTimeField;
    qry_li_DT_EMISSAO_GRU: TDateTimeField;
    qry_li_DT_PGMTO_GRU: TDateTimeField;
    qry_li_IN_PRE_EMBARQUE: TStringField;
    qry_li_CD_USUARIO_EMISSOR: TStringField;
    cdsLIsSelecionadasDT_SOLICITACAO: TDateTimeField;
    cdsLIsSelecionadasDT_APTO_FIN_DOSSIE: TDateTimeField;
    cdsLIsSelecionadasDT_FIN_DOSSIE: TDateTimeField;
    cdsLIsSelecionadasDT_DOCTOS_DOSSIE: TDateTimeField;
    cdsLIsSelecionadasDT_EMISSAO_GRU: TDateTimeField;
    cdsLIsSelecionadasDT_PGMTO_GRU: TDateTimeField;
    cdsLisDisponiveisDT_SOLICITACAO: TDateTimeField;
    cdsLisDisponiveisDT_APTO_FIN_DOSSIE: TDateTimeField;
    cdsLisDisponiveisDT_FIN_DOSSIE: TDateTimeField;
    cdsLisDisponiveisDT_DOCTOS_DOSSIE: TDateTimeField;
    cdsLisDisponiveisDT_EMISSAO_GRU: TDateTimeField;
    cdsLisDisponiveisDT_PGMTO_GRU: TDateTimeField;
    cdsLisDisponiveisIN_PRE_EMBARQUE: TStringField;
    cdsLisDisponiveisCD_USUARIO_EMISSOR: TStringField;
    medPagtoGRU: TMaskEdit;
    cdsLIsSelecionadasIN_PRE_EMBARQUE: TStringField;
    cdsLIsSelecionadasCD_USUARIO_EMISSOR: TStringField;
    cdsLisDisponiveiscalc_LI_PRE: TStringField;
    cdsLIsSelecionadascalc_LI_PRE: TStringField;
    procedure btnSelecionaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionaTodosClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnRemoveTodosClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure chkDataRegistroClick(Sender: TObject);
    procedure chkDataSolicitaProrrogacaoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure medtDataRegistroExit(Sender: TObject);
    procedure chkSolicitacaoClick(Sender: TObject);
    procedure cbkFinDossieClick(Sender: TObject);
    procedure chkAptoFinDossieClick(Sender: TObject);
    procedure chkDocsAnexadosClick(Sender: TObject);
    procedure chkEmissaoGRUClick(Sender: TObject);
    procedure chkPagamentoGRUClick(Sender: TObject);
    procedure chkTipoLiClick(Sender: TObject);
    procedure chkEmissorClick(Sender: TObject);
    procedure btnEmissorClick(Sender: TObject);
    procedure cdsLisDisponiveisCalcFields(DataSet: TDataSet);
    procedure cdsLIsSelecionadasCalcFields(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    Nr_Processo :string;
    procedure AtivarBotoes;
    function VerificaFlagHabilitada : Boolean;
  end;
    procedure PreencheCampo(Tipo: Integer; Campo : String; var cdsOrigem, cdsDestino :TClientDataSet);
    procedure PreencheParametro(Tipo: Integer; Campo, valor : string; vSelecionado : Boolean; var qry : TLocalSQLQuery);
    procedure DesabilitarCamposVazios(var Campo : TMaskEdit; var checkbox : TCheckBox);Overload;
    procedure DesabilitarCamposVazios(var Campo : TRadioGroup; var checkbox : TCheckBox);Overload;
    procedure DesabilitarCamposVazios(var Campo : TEdit; var checkbox : TCheckBox; var botao : TSpeedButton); Overload;
    procedure ValidarData(data : String);
    procedure ValidarCampoPreenchido(var campo : TMaskEdit; var checkbx : TCheckBox); Overload;
    procedure ValidarCampoPreenchido(var campo : TRadioGroup; var checkbx : TCheckBox); Overload;
    procedure ValidarCampoPreenchido(var campo : TEdit; var checkbx : TCheckBox); Overload;

var
  frmAtualizaDatasLisProcesso: TfrmAtualizaDatasLisProcesso;

implementation

uses
  ConsOnLineEx;

{$R *.dfm}

procedure TfrmAtualizaDatasLisProcesso.btnSelecionaClick(Sender: TObject);
begin
  if not cdsLisDisponiveis.IsEmpty then
  begin
    if not cdsLIsSelecionadas.locate('NR_LI',cdsLisDisponiveis.fieldByName('NR_LI').asString, []) then
    begin
      cdsLIsSelecionadas.append;
      PreencheCampo(cTEXTO  , 'NR_PROCESSO', cdsLisDisponiveis, cdsLIsSelecionadas);
      PreencheCampo(cTEXTO  , 'NR_LI', cdsLisDisponiveis, cdsLIsSelecionadas);
      PreencheCampo(cTEXTO  , 'IN_PRE_EMBARQUE', cdsLisDisponiveis, cdsLIsSelecionadas);
      PreencheCampo(cTEXTO  , 'CD_USUARIO_EMISSOR', cdsLisDisponiveis, cdsLIsSelecionadas);
      PreencheCampo(cDATA   , 'DT_REGISTRO', cdsLisDisponiveis, cdsLIsSelecionadas);
      PreencheCampo(cDATA   , 'DATA_SOLICI_PRORROGACAO', cdsLisDisponiveis, cdsLIsSelecionadas);
      PreencheCampo(cDATA   , 'DT_SOLICITACAO', cdsLisDisponiveis, cdsLIsSelecionadas);
      PreencheCampo(cDATA   , 'DT_APTO_FIN_DOSSIE', cdsLisDisponiveis, cdsLIsSelecionadas);
      PreencheCampo(cDATA   , 'DT_FIN_DOSSIE', cdsLisDisponiveis, cdsLIsSelecionadas);
      PreencheCampo(cDATA   , 'DT_DOCTOS_DOSSIE', cdsLisDisponiveis, cdsLIsSelecionadas);
      PreencheCampo(cDATA   , 'DT_EMISSAO_GRU', cdsLisDisponiveis, cdsLIsSelecionadas);
      PreencheCampo(cDATA   , 'DT_PGMTO_GRU', cdsLisDisponiveis, cdsLIsSelecionadas);
//      PreencheCampo(cDATA   , 'DT_PROTOCOLO_GRU', cdsLisDisponiveis, cdsLIsSelecionadas);
      cdsLIsSelecionadas.Post;
    end;
    cdsLisDisponiveis.delete;
  end;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.FormCreate(Sender: TObject);
begin
  cdsLIsSelecionadas.CreateDataSet;
end;

procedure TfrmAtualizaDatasLisProcesso.btnSelecionaTodosClick(Sender: TObject);
begin
  if not cdsLisDisponiveis.IsEmpty then
  begin
    cdsLisDisponiveis.First;
    while not cdsLisDisponiveis.eof do
    begin
      if not cdsLIsSelecionadas.locate('NR_LI',cdsLisDisponiveis.fieldByName('NR_LI').asString, []) then
      begin
        cdsLIsSelecionadas.append;
        PreencheCampo(cTEXTO  , 'NR_PROCESSO', cdsLisDisponiveis, cdsLIsSelecionadas);
        PreencheCampo(cTEXTO  , 'NR_LI', cdsLisDisponiveis, cdsLIsSelecionadas);
        PreencheCampo(cTEXTO  , 'IN_PRE_EMBARQUE', cdsLisDisponiveis, cdsLIsSelecionadas);
        PreencheCampo(cTEXTO  , 'CD_USUARIO_EMISSOR', cdsLisDisponiveis, cdsLIsSelecionadas);
        PreencheCampo(cDATA   , 'DT_REGISTRO', cdsLisDisponiveis, cdsLIsSelecionadas);
        PreencheCampo(cDATA   , 'DATA_SOLICI_PRORROGACAO', cdsLisDisponiveis, cdsLIsSelecionadas);
        PreencheCampo(cDATA   , 'DT_SOLICITACAO', cdsLisDisponiveis, cdsLIsSelecionadas);
        PreencheCampo(cDATA   , 'DT_APTO_FIN_DOSSIE', cdsLisDisponiveis, cdsLIsSelecionadas);
        PreencheCampo(cDATA   , 'DT_FIN_DOSSIE', cdsLisDisponiveis, cdsLIsSelecionadas);
        PreencheCampo(cDATA   , 'DT_DOCTOS_DOSSIE', cdsLisDisponiveis, cdsLIsSelecionadas);
        PreencheCampo(cDATA   , 'DT_EMISSAO_GRU', cdsLisDisponiveis, cdsLIsSelecionadas);
        PreencheCampo(cDATA   , 'DT_PGMTO_GRU', cdsLisDisponiveis, cdsLIsSelecionadas);
//        PreencheCampo(cDATA   , 'DT_PROTOCOLO_GRU', cdsLisDisponiveis, cdsLIsSelecionadas);
        cdsLIsSelecionadas.Post;
      end;
      cdsLisDisponiveis.next;
    end;    
    cdsLisDisponiveis.DisableControls;
    try
      cdsLisDisponiveis.EmptyDataSet;
    finally
      cdsLisDisponiveis.EnableControls;
    end;
  end;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.btnRemoveClick(Sender: TObject);
begin
  if not cdsLIsSelecionadas.IsEmpty then
  begin 
    if not cdsLisDisponiveis.locate('NR_LI',cdsLIsSelecionadas.fieldByName('NR_LI').asString, []) then
    begin
      cdsLisDisponiveis.append;
      PreencheCampo(cTEXTO  , 'NR_PROCESSO', cdsLIsSelecionadas, cdsLisDisponiveis);
      PreencheCampo(cTEXTO  , 'NR_LI', cdsLIsSelecionadas, cdsLisDisponiveis);
      PreencheCampo(cTEXTO  , 'IN_PRE_EMBARQUE', cdsLIsSelecionadas, cdsLisDisponiveis);
      PreencheCampo(cTEXTO  , 'CD_USUARIO_EMISSOR', cdsLIsSelecionadas, cdsLisDisponiveis);
      PreencheCampo(cDATA   , 'DT_REGISTRO', cdsLIsSelecionadas, cdsLisDisponiveis);
      PreencheCampo(cDATA   , 'DATA_SOLICI_PRORROGACAO', cdsLIsSelecionadas, cdsLisDisponiveis);
      PreencheCampo(cDATA   , 'DT_SOLICITACAO', cdsLIsSelecionadas, cdsLisDisponiveis);
      PreencheCampo(cDATA   , 'DT_APTO_FIN_DOSSIE', cdsLIsSelecionadas, cdsLisDisponiveis);
      PreencheCampo(cDATA   , 'DT_FIN_DOSSIE', cdsLIsSelecionadas, cdsLisDisponiveis);
      PreencheCampo(cDATA   , 'DT_DOCTOS_DOSSIE', cdsLIsSelecionadas, cdsLisDisponiveis);
      PreencheCampo(cDATA   , 'DT_EMISSAO_GRU', cdsLIsSelecionadas, cdsLisDisponiveis);
      PreencheCampo(cDATA   , 'DT_PGMTO_GRU', cdsLIsSelecionadas, cdsLisDisponiveis);
//      PreencheCampo(cDATA   , 'DT_PROTOCOLO_GRU', cdsLIsSelecionadas, cdsLisDisponiveis);
      cdsLisDisponiveis.Post;
    end;
    cdsLIsSelecionadas.delete;
  end;
  AtivarBotoes;  
end;

procedure TfrmAtualizaDatasLisProcesso.btnRemoveTodosClick(Sender: TObject);
begin
  if not cdsLIsSelecionadas.IsEmpty then
  begin
    cdsLIsSelecionadas.First;
    while not cdsLIsSelecionadas.eof do
    begin
      if not cdsLisDisponiveis.locate('NR_LI',cdsLIsSelecionadas.fieldByName('NR_LI').asString, []) then
      begin
        cdsLisDisponiveis.append;
        PreencheCampo(cTEXTO  , 'NR_PROCESSO', cdsLIsSelecionadas, cdsLisDisponiveis);
        PreencheCampo(cTEXTO  , 'NR_LI', cdsLIsSelecionadas, cdsLisDisponiveis);
        PreencheCampo(cTEXTO  , 'IN_PRE_EMBARQUE', cdsLIsSelecionadas, cdsLisDisponiveis);
        PreencheCampo(cTEXTO  , 'CD_USUARIO_EMISSOR', cdsLIsSelecionadas, cdsLisDisponiveis);
        PreencheCampo(cDATA   , 'DT_REGISTRO', cdsLIsSelecionadas, cdsLisDisponiveis);
        PreencheCampo(cDATA   , 'DATA_SOLICI_PRORROGACAO', cdsLIsSelecionadas, cdsLisDisponiveis);
        PreencheCampo(cDATA   , 'DT_SOLICITACAO', cdsLIsSelecionadas, cdsLisDisponiveis);
        PreencheCampo(cDATA   , 'DT_APTO_FIN_DOSSIE', cdsLIsSelecionadas, cdsLisDisponiveis);
        PreencheCampo(cDATA   , 'DT_FIN_DOSSIE', cdsLIsSelecionadas, cdsLisDisponiveis);
        PreencheCampo(cDATA   , 'DT_DOCTOS_DOSSIE', cdsLIsSelecionadas, cdsLisDisponiveis);
        PreencheCampo(cDATA   , 'DT_EMISSAO_GRU', cdsLIsSelecionadas, cdsLisDisponiveis);
        PreencheCampo(cDATA   , 'DT_PGMTO_GRU', cdsLIsSelecionadas, cdsLisDisponiveis);
//        PreencheCampo(cDATA   , 'DT_PROTOCOLO_GRU', cdsLIsSelecionadas, cdsLisDisponiveis);
        cdsLisDisponiveis.Post;
      end;
      cdsLIsSelecionadas.next;
    end;           
    cdsLIsSelecionadas.DisableControls;
    try
      cdsLIsSelecionadas.EmptyDataSet;
    finally
      cdsLIsSelecionadas.EnableControls;
    end;
  end;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.btn_cancelarClick(
  Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmAtualizaDatasLisProcesso.chkDataRegistroClick(
  Sender: TObject);
begin
  medtDataRegistro.Enabled := chkDataRegistro.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.chkDataSolicitaProrrogacaoClick(
  Sender: TObject);
begin
  medtDataProrrogacao.Enabled := chkDataSolicitaProrrogacao.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.btn_salvarClick(Sender: TObject);
Var
  qryAtualizaDatas: TLocalSQLQuery;
  aLIs :string;
begin  
  {Validação}
  ValidarCampoPreenchido(medtDataRegistro, chkDataRegistro );
  ValidarCampoPreenchido(medtDataProrrogacao, chkDataSolicitaProrrogacao);
  ValidarCampoPreenchido(medDtSolicitacao, chkSolicitacao);
  ValidarCampoPreenchido(medAptoFinDossie, chkAptoFinDossie);
  ValidarCampoPreenchido(medFinDossie, cbkFinDossie);
  ValidarCampoPreenchido(medAnexoDossie, chkDocsAnexados);
  ValidarCampoPreenchido(medEmissaoGRU, chkEmissaoGRU);
  ValidarCampoPreenchido(medPagtoGRU, chkPagamentoGRU);
 // ValidarCampoPreenchido(medProtocoloGRU, chkProtocoloGRU);
  ValidarCampoPreenchido(rgTipoLi, chkTipoLi);
  ValidarCampoPreenchido(edtUsuarioEmissor, chkEmissor);

  {Validação}

  {Gravação}
 { aLIs := '';
  cdsLIsSelecionadas.First;
  while not cdsLIsSelecionadas.eof do
  begin
    if aLIs = '' then
      aLIs := '''' + TRIM(cdsLIsSelecionadas.FieldByName('NR_LI').asString) + ''''
    else
      aLIs := aLIs + ', ' + '''' + TRIM(cdsLIsSelecionadas.FieldByName('NR_LI').asString) + '''';

    cdsLIsSelecionadas.next;
  end;
  }

    qryAtualizaDatas          := TLocalSQLQuery.Create(nil);
    try
      qryAtualizaDatas.sql.Text :=
          '  DECLARE @NR_LI                   VARCHAR(10)                                                                                                   ' + sLineBreak +
          '  DECLARE @NR_PROCESSO             VARCHAR(18)                                                                                                   ' + sLineBreak +
          '  DECLARE @DATA_SOLICI_PRORROGACAO DATETIME                                                                                                      ' + sLineBreak +
          '  DECLARE @DT_REGISTRO             DATETIME                                                                                                      ' + sLineBreak +
          '  DECLARE @DT_SOLICITACAO          DATETIME                                                                                                      ' + sLineBreak +
          '  DECLARE @DT_APTO_FIN_DOSSIE      DATETIME                                                                                                      ' + sLineBreak +
          '  DECLARE @DT_FIN_DOSSIE           DATETIME                                                                                                      ' + sLineBreak +
          '  DECLARE @DT_DOCTOS_DOSSIE        DATETIME                                                                                                      ' + sLineBreak +
          '  DECLARE @DT_EMISSAO_GRU          DATETIME                                                                                                      ' + sLineBreak +
          '  DECLARE @DT_PGMTO_GRU            DATETIME                                                                                                      ' + sLineBreak +
//          '  DECLARE @DT_PROTOCOLO_GRU        DATETIME                                                                                                      ' + sLineBreak +
          '  DECLARE @IN_PRE_EMBARQUE         CHAR(1)                                                                                                       ' + sLineBreak +
          '  DECLARE @CD_USUARIO_EMISSOR      CHAR(4)                                                                                                       ' + sLineBreak +
          '  SET @NR_LI                   = :NR_LI                                                                                                          ' + sLineBreak +
          '  SET @NR_PROCESSO             = :NR_PROCESSO                                                                                                    ' + sLineBreak +
          '  SET @DATA_SOLICI_PRORROGACAO = :DATA_SOLICI_PRORROGACAO                                                                                        ' + sLineBreak +
          '  SET @DT_REGISTRO             = :DT_REGISTRO                                                                                                    ' + sLineBreak +
          '  SET @DT_SOLICITACAO          = :DT_SOLICITACAO                                                                                                 ' + sLineBreak +
          '  SET @DT_APTO_FIN_DOSSIE      = :DT_APTO_FIN_DOSSIE                                                                                             ' + sLineBreak +
          '  SET @DT_FIN_DOSSIE           = :DT_FIN_DOSSIE                                                                                                  ' + sLineBreak +
          '  SET @DT_DOCTOS_DOSSIE        = :DT_DOCTOS_DOSSIE                                                                                               ' + sLineBreak +
          '  SET @DT_EMISSAO_GRU          = :DT_EMISSAO_GRU                                                                                                 ' + sLineBreak +
          '  SET @DT_PGMTO_GRU            = :DT_PGMTO_GRU                                                                                                   ' + sLineBreak +
 //         '  SET @DT_PROTOCOLO_GRU        = :DT_PROTOCOLO_GRU                                                                                               ' + sLineBreak +
          '  SET @IN_PRE_EMBARQUE         = :IN_PRE_EMBARQUE                                                                                                ' + sLineBreak +
          '  SET @CD_USUARIO_EMISSOR      = :CD_USUARIO_EMISSOR                                                                                             ' + sLineBreak +
          '                                                                                                                                                 ' + sLineBreak +
          '    UPDATE TPROCESSO_LI                                                                                                                          ' + sLineBreak +
          '       SET DATA_SOLICI_PRORROGACAO = CASE WHEN @DATA_SOLICI_PRORROGACAO IS NULL THEN DATA_SOLICI_PRORROGACAO ELSE @DATA_SOLICI_PRORROGACAO END   ' + sLineBreak +
          '          ,DT_REGISTRO             = CASE WHEN @DT_REGISTRO             IS NULL THEN DT_REGISTRO             ELSE @DT_REGISTRO             END   ' + sLineBreak +
          '          ,DT_SOLICITACAO          = CASE WHEN @DT_SOLICITACAO          IS NULL THEN DT_SOLICITACAO          ELSE @DT_SOLICITACAO          END   ' + sLineBreak +
          '          ,DT_APTO_FIN_DOSSIE      = CASE WHEN @DT_APTO_FIN_DOSSIE      IS NULL THEN DT_APTO_FIN_DOSSIE      ELSE @DT_APTO_FIN_DOSSIE      END   ' + sLineBreak +
          '          ,DT_FIN_DOSSIE           = CASE WHEN @DT_FIN_DOSSIE           IS NULL THEN DT_FIN_DOSSIE           ELSE @DT_FIN_DOSSIE           END   ' + sLineBreak +
          '          ,DT_DOCTOS_DOSSIE        = CASE WHEN @DT_DOCTOS_DOSSIE        IS NULL THEN DT_DOCTOS_DOSSIE        ELSE @DT_DOCTOS_DOSSIE        END   ' + sLineBreak +
          '          ,DT_EMISSAO_GRU          = CASE WHEN @DT_EMISSAO_GRU          IS NULL THEN DT_EMISSAO_GRU          ELSE @DT_EMISSAO_GRU          END   ' + sLineBreak +
          '          ,DT_PGMTO_GRU            = CASE WHEN @DT_PGMTO_GRU            IS NULL THEN DT_PGMTO_GRU            ELSE @DT_PGMTO_GRU            END   ' + sLineBreak +
//          '          ,DT_PROTOCOLO_GRU        = CASE WHEN @DT_PROTOCOLO_GRU        IS NULL THEN DT_PROTOCOLO_GRU        ELSE @DT_PROTOCOLO_GRU        END   ' + sLineBreak +
          '          ,IN_PRE_EMBARQUE         = CASE WHEN @IN_PRE_EMBARQUE         IS NULL THEN IN_PRE_EMBARQUE         ELSE @IN_PRE_EMBARQUE         END   ' + sLineBreak +
          '          ,CD_USUARIO_EMISSOR      = CASE WHEN @CD_USUARIO_EMISSOR      IS NULL THEN CD_USUARIO_EMISSOR      ELSE @CD_USUARIO_EMISSOR      END   ' + sLineBreak +
          '      FROM TPROCESSO_LI WITH(NOLOCK)                                                                                                             ' + sLineBreak +
          '     WHERE NR_PROCESSO = @NR_PROCESSO                                                                                                            ' + sLineBreak +
          '       AND NR_LI       = @NR_LI                                                                                                                  ' + sLineBreak ;

      cdsLIsSelecionadas.First;
      while not cdsLIsSelecionadas.eof do
      begin
        qryAtualizaDatas.close;
        PreencheParametro(cTEXTO, 'NR_LI', cdsLIsSelecionadasNR_LI.asString, true, qryAtualizaDatas);
        PreencheParametro(cTEXTO, 'NR_PROCESSO', cdsLIsSelecionadasNR_PROCESSO.asString, true, qryAtualizaDatas);
        PreencheParametro(cDATA , 'DT_REGISTRO', medtDataRegistro.text , chkDataRegistro.Checked, qryAtualizaDatas);
        PreencheParametro(cDATA , 'DATA_SOLICI_PRORROGACAO', medtDataProrrogacao.text , chkDataSolicitaProrrogacao.Checked, qryAtualizaDatas);
        PreencheParametro(cTEXTO, 'CD_USUARIO_EMISSOR', edtUsuarioEmissor.text , chkEmissor.Checked, qryAtualizaDatas);
        PreencheParametro(cDATA , 'DT_SOLICITACAO', medDtSolicitacao.text , chkSolicitacao.Checked, qryAtualizaDatas);
        PreencheParametro(cDATA , 'DT_APTO_FIN_DOSSIE', medAptoFinDossie.text , chkAptoFinDossie.Checked, qryAtualizaDatas);
        PreencheParametro(cDATA , 'DT_FIN_DOSSIE', medFinDossie.text , cbkFinDossie.Checked, qryAtualizaDatas);
        PreencheParametro(cDATA , 'DT_DOCTOS_DOSSIE', medAnexoDossie.text , chkDocsAnexados.Checked, qryAtualizaDatas);
        PreencheParametro(cDATA , 'DT_EMISSAO_GRU', medEmissaoGRU.text , chkEmissaoGRU.Checked, qryAtualizaDatas);
        PreencheParametro(cDATA , 'DT_PGMTO_GRU', medPagtoGRU.text , chkPagamentoGRU.Checked, qryAtualizaDatas);
//        PreencheParametro(cDATA , 'DT_PROTOCOLO_GRU', medProtocoloGRU.text , chkProtocoloGRU.Checked, qryAtualizaDatas);
        if rgTipoLi.ItemIndex = 0 then {LI PRE}
         PreencheParametro(cTEXTO, 'IN_PRE_EMBARQUE', '1', chkTipoLi.Checked, qryAtualizaDatas)
        else {LI POS}
         PreencheParametro(cTEXTO, 'IN_PRE_EMBARQUE', '0', chkTipoLi.Checked, qryAtualizaDatas);        
        qryAtualizaDatas.ExecSQL;

        cdsLIsSelecionadas.next;
      end;
    finally
      qryAtualizaDatas.free;
    end;

   {Gravação}
   btn_cancelar.click;
end;

procedure TfrmAtualizaDatasLisProcesso.FormShow(Sender: TObject);
begin
  frmAtualizaDatasLisProcesso.cdsLisDisponiveis.Params.ParamByName('NR_PROCESSO').value := Nr_Processo;
  frmAtualizaDatasLisProcesso.cdsLisDisponiveis.open;

  DesabilitarCamposVazios(medtDataRegistro, chkDataRegistro );
  DesabilitarCamposVazios(medtDataProrrogacao, chkDataSolicitaProrrogacao);
  DesabilitarCamposVazios(medDtSolicitacao, chkSolicitacao);
  DesabilitarCamposVazios(medAptoFinDossie, chkAptoFinDossie);
  DesabilitarCamposVazios(medFinDossie, cbkFinDossie);
  DesabilitarCamposVazios(medAnexoDossie, chkDocsAnexados);
  DesabilitarCamposVazios(medEmissaoGRU, chkEmissaoGRU);
  DesabilitarCamposVazios(medPagtoGRU, chkPagamentoGRU);
//  DesabilitarCamposVazios(medProtocoloGRU, chkProtocoloGRU);
  DesabilitarCamposVazios(rgTipoLi, chkTipoLi);
  DesabilitarCamposVazios(edtUsuarioEmissor, chkEmissor, btnEmissor);
end;

procedure TfrmAtualizaDatasLisProcesso.medtDataRegistroExit(
  Sender: TObject);
begin
  ValidarData((Sender as TMaskEdit).text);
end;

procedure TfrmAtualizaDatasLisProcesso.chkSolicitacaoClick(
  Sender: TObject);
begin
  medDtSolicitacao.Enabled := chkSolicitacao.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.cbkFinDossieClick(Sender: TObject);
begin
  medFinDossie.Enabled := cbkFinDossie.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.chkAptoFinDossieClick(
  Sender: TObject);
begin
  medAptoFinDossie.Enabled := chkAptoFinDossie.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.chkDocsAnexadosClick(
  Sender: TObject);
begin
  medAnexoDossie.Enabled := chkDocsAnexados.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.chkEmissaoGRUClick(Sender: TObject);
begin
  medEmissaoGRU.Enabled := chkEmissaoGRU.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.chkPagamentoGRUClick(
  Sender: TObject);
begin
  medPagtoGRU.Enabled := chkPagamentoGRU.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.chkTipoLiClick(Sender: TObject);
begin
  rgTipoLi.Enabled := chkTipoLi.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.chkEmissorClick(Sender: TObject);
begin
  edtUsuarioEmissor.Enabled := chkEmissor.Checked;
  btnEmissor.Enabled   := chkEmissor.Checked;
  AtivarBotoes;
end;

procedure TfrmAtualizaDatasLisProcesso.btnEmissorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If (Sender as TSpeedButton).Enabled Then
      edtUsuarioEmissor.text := ConsultaOnLineExFiltro('TUSUARIO','Usuarios',['CD_USUARIO','NM_USUARIO'],
                                                    ['Código','Nome'],'CD_USUARIO', ' IN_ATIVO = 1 AND CD_CARGO <> ''040'' ',nil)
  end
  else
    edtNmEmissor.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO',edtUsuarioEmissor.Text,'NM_USUARIO');
end;

procedure TfrmAtualizaDatasLisProcesso.AtivarBotoes;
var Flegado : boolean;
begin
  Flegado := VerificaFlagHabilitada;
  if (not cdsLIsSelecionadas.IsEmpty) and (Flegado) then
  begin
    btn_salvar.enabled   := true;
    btn_cancelar.enabled := true;
  end
  else
  begin
    btn_salvar.enabled   := false;
    btn_cancelar.enabled := false;
  end;
end;

function TfrmAtualizaDatasLisProcesso.VerificaFlagHabilitada : Boolean;
var
  i: Integer;
begin
  result := false;

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TCheckBox then
      if TCheckBox(Components[i]).checked then
        result := true;
end;



procedure PreencheCampo(Tipo: Integer; Campo : String; var cdsOrigem, cdsDestino :TClientDataSet);
begin
  if Tipo = cTEXTO then
  begin
    cdsDestino.fieldByName(Campo).value     := cdsOrigem.fieldByName(Campo).asString;
  end
  else
  if Tipo = cDATA then
  begin
    if not (cdsOrigem.fieldByName(Campo).asDateTime = 0) then
      cdsDestino.fieldByName(Campo).value             := cdsOrigem.fieldByName(Campo).asDateTime
    else
      cdsDestino.fieldByName(Campo).value             := null;
  end
end;

procedure ValidarCampoPreenchido(var campo : TMaskEdit; var checkbx : TCheckBox); Overload;
begin
 if checkbx.checked then
  begin
    if campo.text = '  /  /    ' then
    begin
      ShowMessage('Preencha o campo ' + campo.Hint);
      abort;
    end;
    ValidarData(campo.text);
  end;
end;

procedure ValidarCampoPreenchido(var campo : TRadioGroup; var checkbx : TCheckBox); Overload;
begin
 if checkbx.checked then
  begin
    if campo.itemIndex = -1 then
    begin
      ShowMessage('Preencha o campo ' + campo.Hint);
      abort;
    end;
  end;
end;

procedure ValidarCampoPreenchido(var campo : TEdit; var checkbx : TCheckBox); Overload;
begin
 if checkbx.checked then
  begin
    if trim(campo.text) = '' then
    begin
      ShowMessage('Preencha o campo ' + campo.Hint);
      abort;
    end;
  end;
end;

procedure DesabilitarCamposVazios(var Campo : TMaskEdit; var checkbox : TCheckBox); Overload;
begin
  if Campo.text = '  /  /    ' then
  begin
    checkbox.checked := false;
    Campo.Enabled    := false;
  end;
end;

procedure DesabilitarCamposVazios(var Campo : TRadioGroup; var checkbox : TCheckBox); Overload
begin
  if Campo.ItemIndex = -1 then
  begin
    checkbox.checked := false;
    Campo.Enabled    := false;
  end;
end;

procedure DesabilitarCamposVazios(var Campo : TEdit; var checkbox : TCheckBox; var botao : TSpeedButton); Overload;
begin
  if trim(Campo.text) = '' then
  begin
    checkbox.checked := false;
    Campo.Enabled    := false;
    botao.enabled    := false;
  end;
end;

procedure ValidarData(data : String);
var sData :string;
begin
  try
    if data <> '  /  /    ' then
      sdata := DateToStr(StrToDate( data ) );
  except
    ShowMessage('Data Inválida. Digite novamente.' );
    abort;
  end;
end;

procedure PreencheParametro(Tipo: Integer; Campo, valor : string; vSelecionado : Boolean; var qry : TLocalSQLQuery);
begin
  if tipo = cTEXTO then
  begin
    qry.ParamByName(Campo).DataType := ftString;
    if vSelecionado then
      qry.ParamByName(Campo).value  := valor
    else
      qry.ParamByName(Campo).value  := unassigned;
  end
  else
  if tipo = cDATA then
  begin
    qry.ParamByName(Campo).DataType := ftDateTime;
    if ((valor <> '  /  /    ') and (vSelecionado)) then
      qry.ParamByName(Campo).value := valor
    else
      qry.ParamByName(Campo).value := unassigned;
  end;
end;


procedure TfrmAtualizaDatasLisProcesso.cdsLisDisponiveisCalcFields(
  DataSet: TDataSet);
begin
  if cdsLisDisponiveis.fieldByName('IN_PRE_EMBARQUE').asstring = '1' then
    cdsLisDisponiveis.fieldByName('calc_LI_PRE').asstring := 'Pré'
  else
  if cdsLisDisponiveis.fieldByName('IN_PRE_EMBARQUE').asstring = '0' then
    cdsLisDisponiveis.fieldByName('calc_LI_PRE').asstring := 'Pós';
end;

procedure TfrmAtualizaDatasLisProcesso.cdsLIsSelecionadasCalcFields(
  DataSet: TDataSet);
begin
  if cdsLIsSelecionadas.fieldByName('IN_PRE_EMBARQUE').asstring = '1' then
    cdsLIsSelecionadas.fieldByName('calc_LI_PRE').asstring := 'Pré'
  else
  if cdsLIsSelecionadas.fieldByName('IN_PRE_EMBARQUE').asstring = '0' then
    cdsLIsSelecionadas.fieldByName('calc_LI_PRE').asstring := 'Pós';
end;

end.

