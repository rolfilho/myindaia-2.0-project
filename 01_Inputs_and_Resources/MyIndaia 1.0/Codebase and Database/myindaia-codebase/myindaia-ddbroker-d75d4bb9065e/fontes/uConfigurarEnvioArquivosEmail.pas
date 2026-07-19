unit uConfigurarEnvioArquivosEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, Grids, DBGrids, ComCtrls, ExtCtrls,
  FMTBcd, DB, SqlExpr, DBTables, Buttons, DBXpress;

type
  TfrmConfigurarEnvioArquivosEmail = class(TForm)
    pnlFundo: TPanel;
    pnl1: TPanel;
    pgcConsultaCadastra: TPageControl;
    tsConsulta: TTabSheet;
    pnl2: TPanel;
    lbl16: TLabel;
    lbl15: TLabel;
    dbgLista: TDBGrid;
    tsCadastro: TTabSheet;
    pgcGrupoEmpresa: TPageControl;
    tsGrupo: TTabSheet;
    pgcDadosGrupo: TPageControl;
    tsArquivos: TTabSheet;
    dbgArquivoGrupo: TDBGrid;
    tsEmailConfig: TTabSheet;
    tsMudarNomeArquivo: TTabSheet;
    tsEmpresa: TTabSheet;
    pnl3: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    cbCD_GRUPO: TDBLookupComboBox;
    btn_excluir: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_salvar: TSpeedButton;
    pgcDadosEmpresa: TPageControl;
    tsListaEmpresa: TTabSheet;
    pnl5: TPanel;
    lbl17: TLabel;
    cbEmpresaPesquisa: TDBLookupComboBox;
    dbgListaEmpresa: TDBGrid;
    tsConfigEmpresa: TTabSheet;
    pgcConfigEmpresa: TPageControl;
    tsArquivosEmpresa: TTabSheet;
    dbgArquivosEmpresa: TDBGrid;
    tsEmailEmpresa: TTabSheet;
    tsMudarNomeEmpresa: TTabSheet;
    dbgNomeArquivoEmpresa: TDBGrid;
    btn_incluir: TSpeedButton;
    cbCD_PRODUTO: TDBLookupComboBox;
    cbProduto: TDBLookupComboBox;
    cbGrupo: TDBLookupComboBox;
    Panel1: TPanel;
    Label1: TLabel;
    dbgArquivo: TDBGrid;
    Panel2: TPanel;
    btnExcluirEmpresa: TSpeedButton;
    btnCancelarEmpresa: TSpeedButton;
    btn_GravarEmpresa: TSpeedButton;
    btn_IncluirEmpresa: TSpeedButton;
    cbEmpresa: TDBLookupComboBox;
    edtChaveMaster: TEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    dbmmoNM_CORPO: TDBMemo;
    dbedtNM_ASSUNTO: TDBEdit;
    dbedtNM_DESTINATARIO: TDBEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl12: TLabel;
    dbedtNM_CORPO_EMP: TDBMemo;
    dbedtNM_ASSUNTO_EMP: TDBEdit;
    dbedtNM_DESTINATARIO_EMP: TDBEdit;
    Label3: TLabel;
    dbedtNM_COPIA: TDBEdit;
    Label4: TLabel;
    dbedtNM_COPIA_EMP: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgcConsultaCadastraChange(Sender: TObject);
    procedure cbProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbEmpresaPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgcDadosGrupoChange(Sender: TObject);
    procedure dbgArquivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgArquivoGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_IncluirEmpresaClick(Sender: TObject);
    procedure pgcDadosEmpresaChange(Sender: TObject);
    procedure pgcGrupoEmpresaChange(Sender: TObject);
    procedure btnCancelarEmpresaClick(Sender: TObject);
    procedure btnExcluirEmpresaClick(Sender: TObject);
    procedure btn_GravarEmpresaClick(Sender: TObject);
    procedure pgcConfigEmpresaChange(Sender: TObject);
    procedure dbgArquivosEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgNomeArquivoEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgcGrupoEmpresaEnter(Sender: TObject);
    procedure pgcConfigEmpresaEnter(Sender: TObject);
    procedure dbgListaTitleClick(Column: TColumn);
    procedure dbgListaEmpresaTitleClick(Column: TColumn);

  private
    { Private declarations }
  chaveGrupo, chaveGrupoEmpresa : integer;
  novoRegistro : boolean;

  function getSQLTipoDocumento: string;
  function GetSQLProduto :string;
  function GetSQLGrupo :String;
  function GetSQLListaGrupo :String;
  function GetSQLListaEmpresa:String;
  function getSQLConfigArquivo :string;
  function getSQLConfig(ComParametro : boolean) :String;
  function GetSQLNomeArquivo: string;
  function GetSQLEmpresa :String;
  function getSQLConfigArquivoEmpresa: string;
  function getSQLConfigEmpresa(ComParametro : boolean) :String;
  function GetSQLNomeArquivoEmpresa: string;

  procedure AbrirQueryTipoDocumento;
  procedure AbrirQueryGrupo;
  procedure AbrirQueryProduto;
  procedure AbrirQueryListaGrupo;

  procedure AtivarDataSets;
  procedure PosicaoInicial;
  procedure GravarMaster(GravaDetailArquivo :boolean);
  procedure GravarMasterEmpresa(GravaDetailArquivo :boolean);
  Procedure CarregarDetail;
  Procedure CarregarDetailEmpresa;
  procedure ValidarMaster;

  public
    { Public declarations }
  procedure FiltrarLista;
  procedure FiltrarListaEmpresa;  
  end;

var
  frmConfigurarEnvioArquivosEmail: TfrmConfigurarEnvioArquivosEmail;

implementation

uses datm_ConfigEnvioArquivosEmail, KrQuery;

{$R *.dfm}

procedure TfrmConfigurarEnvioArquivosEmail.FormCreate(Sender: TObject);
begin
  Application.CreateForm(tdatm_ConfigEnvioEmail, datm_ConfigEnvioEmail );

  pgcConsultaCadastra.tabindex := 0;

  PosicaoInicial;

  AtivarDataSets;

  AbrirQueryTipoDocumento;
  AbrirQueryListaGrupo;
  AbrirQueryProduto;
  AbrirQueryGrupo;  
end;

function TfrmConfigurarEnvioArquivosEmail.GetSQLProduto :string;
begin
  Result := '  SELECT CD_PRODUTO, NM_PRODUTO   '+ sLineBreak +
            '    FROM TPRODUTO A WITH(NOLOCK)  '+ sLineBreak ;
end;

function TfrmConfigurarEnvioArquivosEmail.GetSQLGrupo :String;
begin
  Result := ' SELECT CD_GRUPO, NM_GRUPO   '+ sLineBreak +
            '   FROM TGRUPO WITH(NOLOCK)  '+ sLineBreak +
            '  WHERE IN_ATIVO = 1         '+ sLineBreak ;
end;

function TfrmConfigurarEnvioArquivosEmail.GetSQLEmpresa :String;
begin
  Result := ' SELECT CD_EMPRESA, NM_EMPRESA              '+ sLineBreak +
            '   FROM TEMPRESA_NAC WITH(NOLOCK)           '+ sLineBreak +
            '  WHERE ISNULL(CD_GRUPO,''0'') = :CD_GRUPO  '+ sLineBreak +
            '  ORDER BY NM_EMPRESA                       '+ sLineBreak ;
end;

function TfrmConfigurarEnvioArquivosEmail.getSQLTipoDocumento: string;
begin
  Result :=  ' SELECT DISTINCT CD_TIPO_DOCTO               '+ sLineBreak +
             '       ,NM_TIPO_DOCTO                        '+ sLineBreak +
             ' FROM TTP_DOCTO_DIGITALIZADO A WITH(NOLOCK)  '+ sLineBreak +
             ' UNION ALL                                   '+ sLineBreak +
             ' SELECT ''999''                              '+ sLineBreak +
             '       ,''Todos''                            '+ sLineBreak +
             ' ORDER BY NM_TIPO_DOCTO                      '+ sLineBreak ;
end;

function TfrmConfigurarEnvioArquivosEmail.getSQLConfigArquivo;
begin
  Result :=  ' SELECT CD_CONFIG_ENVIO_EMAIL_ARQU                      '+ sLineBreak +
             '	     ,CD_CONFIG_ENVIO_EMAIL                           '+ sLineBreak +
             '	     ,CD_ARQUIVO                                      '+ sLineBreak +
             '	     ,NM_ASSUNTO                                      '+ sLineBreak +
             '	     ,NM_DESTINATARIO                                 '+ sLineBreak +
             '	     ,NM_COPIA                                        '+ sLineBreak +
             '	     ,NM_CORPO                                        '+ sLineBreak +
             '  FROM TCONFIG_ENVIO_EMAIL_ARQUIVOS A WITH(NOLOCK)      '+ sLineBreak +
             ' WHERE A.CD_CONFIG_ENVIO_EMAIL = :CD_CONFIG_ENVIO_EMAIL ';
end;

function TfrmConfigurarEnvioArquivosEmail.getSQLConfig(ComParametro : boolean) :String;
var
  str :string;
begin
  str := '   SELECT  A.CD_CONFIG_ENVIO_EMAIL                          '+ sLineBreak +
         '   	      ,A.CD_PRODUTO                                     '+ sLineBreak +
         '      	  ,A.CD_GRUPO                                       '+ sLineBreak +
         '     FROM TCONFIG_ENVIO_EMAIL A WITH(NOLOCK)                '+ sLineBreak ;

  if ComParametro then
    str := str + '    WHERE A.CD_CONFIG_ENVIO_EMAIL = :CD_CONFIG_ENVIO_EMAIL  '+ sLineBreak ;

  result := str;
end;

function TfrmConfigurarEnvioArquivosEmail.GetSQLListaGrupo :String;
begin
   Result := ' SELECT A.CD_CONFIG_ENVIO_EMAIL                                           '+ sLineBreak +
             '        ,A.CD_PRODUTO                                                     '+ sLineBreak +
             '        ,B.NM_PRODUTO                                                     '+ sLineBreak +
             '        ,A.CD_GRUPO                                                       '+ sLineBreak +
             '        ,C.NM_GRUPO                                                       '+ sLineBreak +
             '  FROM TCONFIG_ENVIO_EMAIL A WITH(NOLOCK)                                 '+ sLineBreak +
             '  JOIN TPRODUTO            B WITH(NOLOCK) ON B.CD_PRODUTO = A.CD_PRODUTO  '+ sLineBreak +
             '  JOIN TGRUPO              C WITH(NOLOCK) ON C.CD_GRUPO   = A.CD_GRUPO    '+ sLineBreak ;

end;


function TfrmConfigurarEnvioArquivosEmail.GetSQLNomeArquivo: string;
begin
  result := ' SELECT CD_CONFIG_ENVIO_EMAIL_ARQU_SL                           '  + sLineBreak +
            '       ,CD_CONFIG_ENVIO_EMAIL_ARQU                              '  + sLineBreak +
            '       ,NM_SIGLA                                                '  + sLineBreak +
            '       ,NM_NOVO_NOME_ARQUIVO                                    '  + sLineBreak +
            '       ,CD_CONFIG_ENVIO_EMAIL                                   '  + sLineBreak +
            '  FROM TCONFIG_ENVIO_EMAIL_ARQUIVOS_SIGLAS  WITH(NOLOCK)        '  + sLineBreak +
            ' WHERE CD_CONFIG_ENVIO_EMAIL      = :CD_CONFIG_ENVIO_EMAIL      '  + sLineBreak +
            '   AND CD_CONFIG_ENVIO_EMAIL_ARQU = :CD_CONFIG_ENVIO_EMAIL_ARQU '  + sLineBreak ;
end;

function TfrmConfigurarEnvioArquivosEmail.GetSQLListaEmpresa:String;
begin
 result :=  ' SELECT A.CD_EMPRESA                                                                 '  + sLineBreak +
            '      , B.NM_EMPRESA                                                                 '  + sLineBreak +
            '      ,CD_CONFIG_ENVIO_EMAIL_EMP                                                     '  + sLineBreak +
            '      ,CD_CONFIG_ENVIO_EMAIL                                                         '  + sLineBreak +
            '   FROM TCONFIG_ENVIO_EMAIL_EMPRESAS A WITH(NOLOCK)                                  '  + sLineBreak +
            '   JOIN TEMPRESA_NAC                 B WITH(NOLOCK) ON B.CD_EMPRESA = A.CD_EMPRESA   '  + sLineBreak +
            '  WHERE A.CD_CONFIG_ENVIO_EMAIL      = :CD_CONFIG_ENVIO_EMAIL                        '  + sLineBreak +
            ' ORDER BY NM_EMPRESA                                                                 '  + sLineBreak ;
end;

function TfrmConfigurarEnvioArquivosEmail.GetSQLConfigEmpresa (ComParametro : boolean) :String;
var str :string;
begin
  str := ' SELECT CD_CONFIG_ENVIO_EMAIL_EMP                              '  + sLineBreak +
            '       ,CD_CONFIG_ENVIO_EMAIL                                  '  + sLineBreak +
            '       ,CD_EMPRESA                                             '  + sLineBreak +
            '   FROM TCONFIG_ENVIO_EMAIL_EMPRESAS A WITH(NOLOCK)            '  + sLineBreak +
            '  WHERE CD_CONFIG_ENVIO_EMAIL     = :CD_CONFIG_ENVIO_EMAIL     '  + sLineBreak ;
  if ComParametro then
    str := str + '    AND CD_CONFIG_ENVIO_EMAIL_EMP = :CD_CONFIG_ENVIO_EMAIL_EMP '  + sLineBreak ;

  result := str;
end;

function TfrmConfigurarEnvioArquivosEmail.GetSQLConfigArquivoEmpresa :String;
begin
  result :=' SELECT  CD_CONFIG_ENVIO_EMAIL_EMP_ARQ                          '  + sLineBreak +
           '   	   	,CD_CONFIG_ENVIO_EMAIL_EMP                              '  + sLineBreak +
           '        ,CD_CONFIG_ENVIO_EMAIL                                  '  + sLineBreak +
           '   	   	,CD_ARQUIVO                                             '  + sLineBreak +
           '   	   	,NM_ASSUNTO                                             '  + sLineBreak +
           '   	   	,NM_DESTINATARIO                                        '  + sLineBreak +
           '   	   	,NM_COPIA                                               '  + sLineBreak +
           '   	   	,NM_CORPO                                               '  + sLineBreak +
           '   FROM TCONFIG_ENVIO_EMAIL_EMPRESAS_ARQUIVOS WITH(NOLOCK)      '  + sLineBreak +
           '  WHERE CD_CONFIG_ENVIO_EMAIL     = :CD_CONFIG_ENVIO_EMAIL      '  + sLineBreak +
           '    AND CD_CONFIG_ENVIO_EMAIL_EMP = :CD_CONFIG_ENVIO_EMAIL_EMP  '  + sLineBreak ;
end;

function TfrmConfigurarEnvioArquivosEmail.GetSQLNomeArquivoEmpresa : String;
begin
  result := ' SELECT CD_CONFIG_ENVIO_EMAIL_EMP_SL                                   '  + sLineBreak +
            '  	   	,CD_CONFIG_ENVIO_EMAIL_EMP_ARQ                                  '  + sLineBreak +
            '  	   	,CD_CONFIG_ENVIO_EMAIL_EMP                                      '  + sLineBreak +
            '       ,CD_CONFIG_ENVIO_EMAIL                                          '  + sLineBreak +
            '  	   	,NM_SIGLA                                                       '  + sLineBreak +
            '  	   	,NM_NOVO_NOME_ARQUIVO                                           '  + sLineBreak +
            '  FROM TCONFIG_ENVIO_EMAIL_EMPRESAS_SIGLAS A WITH(NOLOCK)              '  + sLineBreak +
            ' WHERE CD_CONFIG_ENVIO_EMAIL         = :CD_CONFIG_ENVIO_EMAIL          '  + sLineBreak +
            '   AND CD_CONFIG_ENVIO_EMAIL_EMP     = :CD_CONFIG_ENVIO_EMAIL_EMP      '  + sLineBreak +
            '   AND CD_CONFIG_ENVIO_EMAIL_EMP_ARQ = :CD_CONFIG_ENVIO_EMAIL_EMP_ARQ  '  + sLineBreak ;
end;

procedure TfrmConfigurarEnvioArquivosEmail.AbrirQueryGrupo;
begin
  datm_ConfigEnvioEmail.qryGrupo.close;
  datm_ConfigEnvioEmail.qryGrupo.SQL.Text := GetSQLGrupo;
  datm_ConfigEnvioEmail.qryGrupo.open;
end;

procedure TfrmConfigurarEnvioArquivosEmail.AbrirQueryProduto;
begin
  datm_ConfigEnvioEmail.qryProduto.close;
  datm_ConfigEnvioEmail.qryProduto.sql.text := GetSQLProduto;
  datm_ConfigEnvioEmail.qryProduto.open;
end;

procedure TfrmConfigurarEnvioArquivosEmail.AbrirQueryTipoDocumento;
begin
  datm_ConfigEnvioEmail.qryTipoDocumento.Close;
  datm_ConfigEnvioEmail.qryTipoDocumento.SQL.Text := getSQLTipoDocumento;
  datm_ConfigEnvioEmail.qryTipoDocumento.open;
end;

procedure TfrmConfigurarEnvioArquivosEmail.AbrirQueryListaGrupo;
begin
  datm_ConfigEnvioEmail.qryListaGrupos.close;
  datm_ConfigEnvioEmail.qryListaGrupos.SQL.Text := GetSQLListaGrupo;
  datm_ConfigEnvioEmail.qryListaGrupos.open;
end;

procedure TfrmConfigurarEnvioArquivosEmail.btn_incluirClick(
  Sender: TObject);
begin
  pgcConsultaCadastra.tabindex := 1;
  chaveGrupo        := 0;
  chaveGrupoEmpresa := 0;
  novoRegistro      := true;
  
  edtChaveMaster.clear;

  pgcDadosGrupo.tabindex    := 0;
  pgcGrupoEmpresa.tabindex  := 0;
  pgcDadosEmpresa.tabindex  := 0;
  pgcConfigEmpresa.tabindex := 0;

  
  datm_ConfigEnvioEmail.qryConfig.DisableControls;
  datm_ConfigEnvioEmail.cdsConfig.DisableControls;

  datm_ConfigEnvioEmail.qryConfig.close;
  datm_ConfigEnvioEmail.cdsConfig.close;
  datm_ConfigEnvioEmail.qryConfig.SQL.Text := getSQLConfig(false);
  datm_ConfigEnvioEmail.qryConfig.open;
  datm_ConfigEnvioEmail.cdsConfig.open;

  datm_ConfigEnvioEmail.qryConfigArquivo.close;
  datm_ConfigEnvioEmail.cdsConfigArquivo.close;

  datm_ConfigEnvioEmail.cdsNomeArquivo.close;
  datm_ConfigEnvioEmail.qryNomeArquivo.close;

  datm_ConfigEnvioEmail.qryConfigEmpresa.close;
  datm_ConfigEnvioEmail.cdsConfigEmpresa.close;

  datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.close;
  datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.close;

  datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.close;
  datm_ConfigEnvioEmail.qryNomeArquivoEmpresa.close;

  datm_ConfigEnvioEmail.cdsListaEmpresa.close;
  datm_ConfigEnvioEmail.qryListaEmpresa.close;  

  datm_ConfigEnvioEmail.qryConfig.EnableControls;
  datm_ConfigEnvioEmail.cdsConfig.EnableControls;

  datm_ConfigEnvioEmail.cdsConfig.append;

  btn_salvar.enabled   := true;
  btn_cancelar.enabled := true;
  btn_incluir.enabled  := false;
end;

procedure TfrmConfigurarEnvioArquivosEmail.btn_salvarClick(
  Sender: TObject);
begin

  if ((cbCD_PRODUTO.KeyValue = '') or (cbCD_PRODUTO.KeyValue = null))
  or ((cbCD_GRUPO.KeyValue = '') or (cbCD_GRUPO.KeyValue = null)) then
  begin
    ShowMessage('Preencha os dados do Grupo/Produto.');
    pgcGrupoEmpresa.TabIndex := 0;
    cbCD_PRODUTO.SetFocus;
    abort;
  end;

  //o usuario clicou no botão gravar. não é mais um registro que foi gravado automaticamente.
  novoRegistro := false;

  GravarMaster(true);
end;

procedure TfrmConfigurarEnvioArquivosEmail.GravarMaster(GravaDetailArquivo :boolean);
  var
    chaveArquivo : integer;
    bookmarkConfig : TBookmark;
begin
   datm_ConfigEnvioEmail.SQLConnection.CloseDataSets;

   if datm_ConfigEnvioEmail.cdsConfig.state in [dsInsert, dsEdit] then
   begin
     datm_ConfigEnvioEmail.cdsConfig.post;
     datm_ConfigEnvioEmail.cdsConfig.ApplyUpdates(-1);

     if datm_ConfigEnvioEmail.cdsConfig.FieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger = 0 then
       datm_ConfigEnvioEmail.cdsConfig.Refresh;
   end;

   chaveGrupo := datm_ConfigEnvioEmail.cdsConfig.FieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;

   edtChaveMaster.text := inttostr(chaveGrupo);

   if GravaDetailArquivo then
   begin
     if not (datm_ConfigEnvioEmail.cdsConfigArquivo.state in [dsInactive]) then
     begin
       datm_ConfigEnvioEmail.cdsConfigArquivo.ApplyUpdates(-1);

       if datm_ConfigEnvioEmail.cdsConfigArquivo.fieldByName('CD_CONFIG_ENVIO_EMAIL_ARQU').asinteger < 0 then
        datm_ConfigEnvioEmail.cdsConfigArquivo.refresh;
     end;

     if not (datm_ConfigEnvioEmail.cdsNomeArquivo.state in [dsInactive]) then
       datm_ConfigEnvioEmail.cdsNomeArquivo.ApplyUpdates(-1);
   end;

   btn_salvar.enabled   := false;
   btn_cancelar.enabled := false;
   btn_incluir.enabled  := true;
end;

procedure TfrmConfigurarEnvioArquivosEmail.btn_cancelarClick(
  Sender: TObject);
begin

  if datm_ConfigEnvioEmail.cdsConfig.state in [dsInsert, dsEdit] then
    datm_ConfigEnvioEmail.cdsConfig.cancel;

  if datm_ConfigEnvioEmail.cdsConfigArquivo.state in [dsInsert, dsEdit] then
    datm_ConfigEnvioEmail.cdsConfigArquivo.cancel;

  if datm_ConfigEnvioEmail.cdsNomeArquivo.state in [dsInsert, dsEdit] then
    datm_ConfigEnvioEmail.cdsNomeArquivo.cancel;

  //os registros são salvos automaticamente. Se o usuario cancelar sem ter realmente clicado em gravar, tem que excluir
  if novoRegistro and (chaveGrupo <> 0) then
  begin
    btn_excluirClick(Sender);
  end;

  pgcConsultaCadastra.tabindex := 0;

  btn_salvar.enabled   := false;
  btn_cancelar.enabled := false;
  btn_incluir.enabled  := true;
end;

procedure TfrmConfigurarEnvioArquivosEmail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(datm_ConfigEnvioEmail);
end;

procedure TfrmConfigurarEnvioArquivosEmail.pgcConsultaCadastraChange(
  Sender: TObject);
  var
    BookMarkConsulta :TBookmark;
begin
  chaveGrupo := 0;
  edtChaveMaster.Text := '';
  
  if pgcConsultaCadastra.ActivePage = tsConsulta then
  begin
    btn_incluir.Enabled := true;
    if btn_cancelar.enabled then
    begin
      btn_cancelar.Click;
    end;

    if not datm_ConfigEnvioEmail.cdsListaGrupos.IsEmpty then
    begin
      BookMarkConsulta := datm_ConfigEnvioEmail.cdsListaGrupos.GetBookmark;

      datm_ConfigEnvioEmail.qryListaGrupos.DisableControls;
      datm_ConfigEnvioEmail.cdsListaGrupos.DisableControls;
            
      datm_ConfigEnvioEmail.cdsListaGrupos.close;
      datm_ConfigEnvioEmail.qryListaGrupos.close;
      datm_ConfigEnvioEmail.qryListaGrupos.open;
      datm_ConfigEnvioEmail.cdsListaGrupos.open;

      datm_ConfigEnvioEmail.cdsListaGrupos.GotoBookmark(BookMarkConsulta);
      datm_ConfigEnvioEmail.cdsListaGrupos.FreeBookmark(BookMarkConsulta);
    end
    else
    begin
      datm_ConfigEnvioEmail.qryListaGrupos.DisableControls;
      datm_ConfigEnvioEmail.cdsListaGrupos.DisableControls;

      datm_ConfigEnvioEmail.cdsListaGrupos.close;
      datm_ConfigEnvioEmail.qryListaGrupos.close;
      datm_ConfigEnvioEmail.qryListaGrupos.open;
      datm_ConfigEnvioEmail.cdsListaGrupos.open;
    end;

    datm_ConfigEnvioEmail.qryListaGrupos.EnableControls;
    datm_ConfigEnvioEmail.cdsListaGrupos.EnableControls;
  end;

  if pgcConsultaCadastra.ActivePage = tsCadastro then
  begin
   // btn_incluir.Enabled := false;
    PosicaoInicial;
    if not datm_ConfigEnvioEmail.cdsListaGrupos.IsEmpty then
    begin
      chaveGrupo   := datm_ConfigEnvioEmail.cdsListaGrupos.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;

      novoRegistro := false;

      edtChaveMaster.text := inttostr(chaveGrupo);

      datm_ConfigEnvioEmail.qryConfig.DisableControls;
      datm_ConfigEnvioEmail.cdsConfig.DisableControls;

      datm_ConfigEnvioEmail.qryConfigArquivo.DisableControls;
      datm_ConfigEnvioEmail.cdsConfigArquivo.DisableControls;

      datm_ConfigEnvioEmail.qryConfig.close;
      datm_ConfigEnvioEmail.cdsConfig.close;
      datm_ConfigEnvioEmail.qryConfig.SQL.Text                                              := getSQLConfig(true);
      datm_ConfigEnvioEmail.qryConfig.ParamByName('CD_CONFIG_ENVIO_EMAIL').AsInteger        := datm_ConfigEnvioEmail.cdsListaGrupos.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;
      datm_ConfigEnvioEmail.qryConfig.open;
      datm_ConfigEnvioEmail.cdsConfig.open;

      datm_ConfigEnvioEmail.qryConfigArquivo.close;
      datm_ConfigEnvioEmail.cdsConfigArquivo.close;
      datm_ConfigEnvioEmail.qryConfigArquivo.SQL.Text                                       := getSQLConfigArquivo;
      datm_ConfigEnvioEmail.qryConfigArquivo.ParamByName('CD_CONFIG_ENVIO_EMAIL').AsInteger := datm_ConfigEnvioEmail.cdsListaGrupos.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;
      datm_ConfigEnvioEmail.qryConfigArquivo.open;
      datm_ConfigEnvioEmail.cdsConfigArquivo.open;

      datm_ConfigEnvioEmail.qryConfig.EnableControls;
      datm_ConfigEnvioEmail.cdsConfig.EnableControls;

      datm_ConfigEnvioEmail.qryConfigArquivo.EnableControls;
      datm_ConfigEnvioEmail.cdsConfigArquivo.EnableControls;
    end
    else
    begin
      edtChaveMaster.text := '';    
      btn_incluir.Click;
    end;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.cbProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_Delete, VK_back] then
  begin
    cbProduto.KeyValue := Null;
    FiltrarLista;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.cbGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_Delete, VK_back] then
  begin
    cbGrupo.KeyValue := Null;
    FiltrarLista;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.FiltrarLista;
var sfiltro : string;
begin
  sfiltro := '';

  if not ((cbProduto.keyvalue = '') or (cbProduto.keyvalue = null)) then
    sfiltro :=  '(CD_PRODUTO = '+ QuotedStr(cbProduto.keyvalue) + ')';

  if not((cbGrupo.keyvalue = '') or (cbGrupo.keyvalue = null)) then
    if sfiltro <> '' then
     sfiltro :=  sfiltro + ' AND (CD_GRUPO = '+ QuotedStr(cbGrupo.keyvalue) + ')'
    else
     sfiltro :=  '(CD_GRUPO = ' +QuotedStr(cbGrupo.keyvalue) + ')';

  datm_ConfigEnvioEmail.cdsListaGrupos.Filtered := false;
  if sfiltro <> '' then
  begin
    datm_ConfigEnvioEmail.cdsListaGrupos.Filter   := sfiltro;
    datm_ConfigEnvioEmail.cdsListaGrupos.Filtered := true;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.FiltrarListaEmpresa;
var sfiltroEmp : string;
begin
  sfiltroEmp := '';

  if not ((cbEmpresaPesquisa.keyvalue = '') or (cbEmpresaPesquisa.keyvalue = null)) then
    sfiltroEmp :=  '(CD_EMPRESA = '+ QuotedStr(cbEmpresaPesquisa.keyvalue) + ')';

  datm_ConfigEnvioEmail.cdsListaEmpresa.Filtered := false;
  if sfiltroEmp <> '' then
  begin
    datm_ConfigEnvioEmail.cdsListaEmpresa.Filter   := sfiltroEmp;
    datm_ConfigEnvioEmail.cdsListaEmpresa.Filtered := true;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.cbEmpresaPesquisaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_Delete, VK_back] then
  begin
    cbEmpresaPesquisa.KeyValue := Null;
    FiltrarListaEmpresa;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.btn_excluirClick(
  Sender: TObject);
var
   qryExec: TLocalSQLQuery;
   ssql :string;
begin
  if not (Sender = btn_cancelar) then
  if pgcConsultaCadastra.ActivePage = tscadastro then
   if datm_ConfigEnvioEmail.cdsConfig.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger = 0 then
   begin
     ShowMessage('Registro ainda não foi salvo.');
     abort;
   end;

  if MessageDlg('Confirma Exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if not (Sender = btn_cancelar) then
     if btn_cancelar.enabled then
        btn_cancelar.click;

    ssql := ' DELETE TCONFIG_ENVIO_EMAIL                               '  + sLineBreak +
            '   FROM TCONFIG_ENVIO_EMAIL A WITH(NOLOCK)                '  + sLineBreak +
            '  WHERE CD_CONFIG_ENVIO_EMAIL = :CD_CONFIG_ENVIO_EMAIL    '  + sLineBreak ;

    qryExec := AutoQuery.DBXQuery(ssql);

    if pgcConsultaCadastra.ActivePage = tsconsulta then
      qryExec.ParamByName('CD_CONFIG_ENVIO_EMAIL').asInteger := datm_ConfigEnvioEmail.cdsListaGrupos.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger
    else
      qryExec.ParamByName('CD_CONFIG_ENVIO_EMAIL').asInteger := datm_ConfigEnvioEmail.cdsConfig.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;

    qryExec.ExecSQL;

    datm_ConfigEnvioEmail.qryListaGrupos.DisableControls;
    datm_ConfigEnvioEmail.cdsListaGrupos.DisableControls;
    datm_ConfigEnvioEmail.qryListaGrupos.close;
    datm_ConfigEnvioEmail.cdsListaGrupos.close;
    datm_ConfigEnvioEmail.qryListaGrupos.open;
    datm_ConfigEnvioEmail.cdsListaGrupos.open;
    datm_ConfigEnvioEmail.qryListaGrupos.EnableControls;
    datm_ConfigEnvioEmail.cdsListaGrupos.EnableControls;

    pgcConsultaCadastra.tabindex := 0;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.pgcDadosGrupoChange(
  Sender: TObject);
  var
    BookMarkArquivo :TBookmark;
begin
  if pgcDadosGrupo.ActivePage =  tsMudarNomeArquivo then
  begin
    if datm_ConfigEnvioEmail.cdsConfigArquivo.fieldByName('CD_ARQUIVO').asInteger = 0 then
    begin
      ShowMessage('Selecione um tipo arquivo.');
      pgcDadosGrupo.TabIndex := 0;
    end
    else
    begin     
      BookMarkArquivo := datm_ConfigEnvioEmail.cdsConfigArquivo.GetBookmark;

      if (datm_ConfigEnvioEmail.cdsConfigArquivo.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger < 1) or
         (datm_ConfigEnvioEmail.cdsConfigArquivo.fieldByName('CD_CONFIG_ENVIO_EMAIL_ARQU').asInteger < 1) then
        GravarMaster(true);

      datm_ConfigEnvioEmail.cdsConfigArquivo.GotoBookmark(BookMarkArquivo);
      datm_ConfigEnvioEmail.cdsConfigArquivo.FreeBookmark(BookMarkArquivo);

      datm_ConfigEnvioEmail.qryNomeArquivo.DisableControls;
      datm_ConfigEnvioEmail.cdsNomeArquivo.DisableControls;

      datm_ConfigEnvioEmail.qryNomeArquivo.close;
      datm_ConfigEnvioEmail.cdsNomeArquivo.close;

      datm_ConfigEnvioEmail.qryNomeArquivo.SQL.Text := GetSQLNomeArquivo;

      datm_ConfigEnvioEmail.qryNomeArquivo.ParamByName('CD_CONFIG_ENVIO_EMAIL').AsInteger       := datm_ConfigEnvioEmail.cdsConfigArquivo.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;
      datm_ConfigEnvioEmail.qryNomeArquivo.ParamByName('CD_CONFIG_ENVIO_EMAIL_ARQU').AsInteger  := datm_ConfigEnvioEmail.cdsConfigArquivo.fieldByName('CD_CONFIG_ENVIO_EMAIL_ARQU').asInteger;

      datm_ConfigEnvioEmail.qryNomeArquivo.open;
      datm_ConfigEnvioEmail.cdsNomeArquivo.open;

      datm_ConfigEnvioEmail.qryNomeArquivo.EnableControls;
      datm_ConfigEnvioEmail.cdsNomeArquivo.EnableControls;
    end;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.dbgArquivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_Delete] then
  begin
    datm_ConfigEnvioEmail.cdsNomeArquivo.delete;

    btn_salvar.enabled   := true;
    btn_cancelar.enabled := true;
    btn_incluir.enabled  := false;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.dbgArquivoGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_Delete] then
  begin
    datm_ConfigEnvioEmail.cdsConfigArquivo.delete;

    btn_salvar.enabled   := true;
    btn_cancelar.enabled := true;
    btn_incluir.enabled  := false;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.btn_IncluirEmpresaClick(
  Sender: TObject);
begin
  pgcDadosEmpresa.tabindex := 1;
  pgcConfigEmpresa.tabindex := 0;

  chaveGrupoEmpresa :=0;
  
  datm_ConfigEnvioEmail.qryConfigEmpresa.DisableControls;
  datm_ConfigEnvioEmail.cdsConfigEmpresa.DisableControls;

  datm_ConfigEnvioEmail.qryConfigEmpresa.close;
  datm_ConfigEnvioEmail.cdsConfigEmpresa.close;
  datm_ConfigEnvioEmail.qryConfigEmpresa.SQL.Text                                              := getSQLConfigEmpresa(false);
  datm_ConfigEnvioEmail.qryConfigEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL').AsInteger        := datm_ConfigEnvioEmail.cdsConfig.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;
  datm_ConfigEnvioEmail.qryConfigEmpresa.open;
  datm_ConfigEnvioEmail.cdsConfigEmpresa.open;

  datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.close;
  datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.close;

  datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.close;
  datm_ConfigEnvioEmail.qryNomeArquivoEmpresa.close;

  datm_ConfigEnvioEmail.qryConfigEmpresa.EnableControls;
  datm_ConfigEnvioEmail.cdsConfigEmpresa.EnableControls;
  
  datm_ConfigEnvioEmail.cdsConfigEmpresa.append;

  btn_IncluirEmpresa.Enabled := false;  
end;

procedure TfrmConfigurarEnvioArquivosEmail.pgcDadosEmpresaChange(
  Sender: TObject);
  var
    BookMarkConsulta :TBookmark;
begin
  if pgcDadosEmpresa.ActivePage = tsConfigEmpresa then
  begin
    pgcConfigEmpresa.TabIndex := 0;

    if not datm_ConfigEnvioEmail.cdsListaEmpresa.IsEmpty then
    begin
      datm_ConfigEnvioEmail.qryConfigEmpresa.DisableControls;
      datm_ConfigEnvioEmail.cdsConfigEmpresa.DisableControls;

      datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.DisableControls;
      datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.DisableControls;

      datm_ConfigEnvioEmail.qryConfigEmpresa.close;
      datm_ConfigEnvioEmail.cdsConfigEmpresa.close;
      datm_ConfigEnvioEmail.qryConfigEmpresa.SQL.Text                                              := getSQLConfigEmpresa(true);
      datm_ConfigEnvioEmail.qryConfigEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL').AsInteger        := datm_ConfigEnvioEmail.cdsConfig.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;
      datm_ConfigEnvioEmail.qryConfigEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL_EMP').AsInteger    := datm_ConfigEnvioEmail.cdsListaEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger;
      datm_ConfigEnvioEmail.qryConfigEmpresa.open;
      datm_ConfigEnvioEmail.cdsConfigEmpresa.open;

      datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.close;
      datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.close;
      datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.SQL.Text                                           := getSQLConfigArquivoEmpresa;
      datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL').AsInteger     := datm_ConfigEnvioEmail.cdsConfig.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;
      datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL_EMP').AsInteger := datm_ConfigEnvioEmail.cdsListaEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger;
      datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.open;
      datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.open;


      datm_ConfigEnvioEmail.qryConfigEmpresa.EnableControls;
      datm_ConfigEnvioEmail.cdsConfigEmpresa.EnableControls;

      datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.EnableControls;
      datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.EnableControls;

    end
    else
    begin
      btn_IncluirEmpresa.click;
    end;
  end;

  if pgcDadosEmpresa.ActivePage = tsListaEmpresa then
  begin
    btn_IncluirEmpresa.Enabled := true;
      
    if btnCancelarEmpresa.enabled then
    begin
      btnCancelarEmpresa.Click;
    end;

    if not datm_ConfigEnvioEmail.cdsListaEmpresa.IsEmpty then
    begin
      BookMarkConsulta := datm_ConfigEnvioEmail.cdsListaEmpresa.GetBookmark;

      datm_ConfigEnvioEmail.qryListaEmpresa.DisableControls;
      datm_ConfigEnvioEmail.cdsListaEmpresa.DisableControls;

      datm_ConfigEnvioEmail.qryListaEmpresa.close;
      datm_ConfigEnvioEmail.cdsListaEmpresa.close;
      datm_ConfigEnvioEmail.qryListaEmpresa.SQL.Text := GetSQLListaEmpresa;
      datm_ConfigEnvioEmail.qryListaEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL').Value := chaveGrupo;
      datm_ConfigEnvioEmail.qryListaEmpresa.open;
      datm_ConfigEnvioEmail.cdsListaEmpresa.open;

      datm_ConfigEnvioEmail.cdsListaEmpresa.GotoBookmark(BookMarkConsulta);
      datm_ConfigEnvioEmail.cdsListaEmpresa.FreeBookmark(BookMarkConsulta);
    end
    else
    begin
      datm_ConfigEnvioEmail.qryListaEmpresa.DisableControls;
      datm_ConfigEnvioEmail.cdsListaEmpresa.DisableControls;

      datm_ConfigEnvioEmail.qryListaEmpresa.close;
      datm_ConfigEnvioEmail.cdsListaEmpresa.close;
      datm_ConfigEnvioEmail.qryListaEmpresa.SQL.Text := GetSQLListaEmpresa;
      datm_ConfigEnvioEmail.qryListaEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL').Value := chaveGrupo;
      datm_ConfigEnvioEmail.qryListaEmpresa.open;
      datm_ConfigEnvioEmail.cdsListaEmpresa.open;

    end;

    datm_ConfigEnvioEmail.qryListaEmpresa.EnableControls;
    datm_ConfigEnvioEmail.cdsListaEmpresa.EnableControls;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.pgcGrupoEmpresaChange(
  Sender: TObject);
begin

  if pgcGrupoEmpresa.ActivePage = tsEmpresa then
  begin
    btn_GravarEmpresa.enabled   := false;
    btnCancelarEmpresa.enabled  := false;
    btn_IncluirEmpresa.enabled  := true;

    datm_ConfigEnvioEmail.cdsEmpresa.DisableControls;
    datm_ConfigEnvioEmail.qryEmpresa.close;
    datm_ConfigEnvioEmail.cdsEmpresa.close;
    datm_ConfigEnvioEmail.qryEmpresa.SQL.Text := GetSQLEmpresa;
    datm_ConfigEnvioEmail.qryEmpresa.ParamByName('CD_GRUPO').value := cbCD_GRUPO.keyvalue;
    datm_ConfigEnvioEmail.qryEmpresa.open;
    datm_ConfigEnvioEmail.cdsEmpresa.open;
    datm_ConfigEnvioEmail.cdsEmpresa.enableControls;

    if chaveGrupo = 0 then
    begin
      ValidarMaster;
      GravarMaster(true);
    end;
    pgcDadosEmpresa.TabIndex := 0;

    datm_ConfigEnvioEmail.qryListaEmpresa.DisableControls;
    datm_ConfigEnvioEmail.cdsListaEmpresa.DisableControls;
    datm_ConfigEnvioEmail.qryListaEmpresa.close;
    datm_ConfigEnvioEmail.cdsListaEmpresa.close;
    datm_ConfigEnvioEmail.qryListaEmpresa.SQL.Text := GetSQLListaEmpresa;
    datm_ConfigEnvioEmail.qryListaEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL').Value := chaveGrupo;
    datm_ConfigEnvioEmail.qryListaEmpresa.open;
    datm_ConfigEnvioEmail.cdsListaEmpresa.open;
    datm_ConfigEnvioEmail.qryListaEmpresa.EnableControls;
    datm_ConfigEnvioEmail.cdsListaEmpresa.EnableControls;
  end;

end;

procedure TfrmConfigurarEnvioArquivosEmail.btnCancelarEmpresaClick(
  Sender: TObject);
begin
  if datm_ConfigEnvioEmail.cdsConfigEmpresa.state in [dsInsert, dsEdit] then
    datm_ConfigEnvioEmail.cdsConfigEmpresa.cancel;

  if datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.state in [dsInsert, dsEdit] then
    datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.cancel;

  if datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.state in [dsInsert, dsEdit] then
    datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.cancel;

  pgcDadosEmpresa.tabindex := 0;

  btn_GravarEmpresa.enabled   := false;
  btnCancelarEmpresa.enabled  := false;
  btn_IncluirEmpresa.enabled  := true;
end;

procedure TfrmConfigurarEnvioArquivosEmail.btnExcluirEmpresaClick(
  Sender: TObject);
var
   qryExec: TLocalSQLQuery;
   ssql :string;
begin
   if pgcDadosEmpresa.ActivePage = tsConfigEmpresa then
     if datm_ConfigEnvioEmail.cdsConfigEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger = 0 then
     begin
       ShowMessage('Registro ainda não foi salvo.');
       abort;
     end;

  if MessageDlg('Confirma Exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if btn_cancelar.enabled then
      btn_cancelar.click;

    ssql := ' DELETE TCONFIG_ENVIO_EMAIL_EMPRESAS                              '  + sLineBreak +
            '   FROM TCONFIG_ENVIO_EMAIL_EMPRESAS  A WITH(NOLOCK)              '  + sLineBreak +
            '  WHERE CD_CONFIG_ENVIO_EMAIL_EMP = :CD_CONFIG_ENVIO_EMAIL_EMP    '  + sLineBreak ;

    qryExec := AutoQuery.DBXQuery(ssql);

    if pgcDadosEmpresa.ActivePage = tsListaEmpresa then
      qryExec.ParamByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger := datm_ConfigEnvioEmail.cdsListaEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger
    else
      qryExec.ParamByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger := datm_ConfigEnvioEmail.cdsConfigEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger;

    qryExec.ExecSQL;

    datm_ConfigEnvioEmail.qryListaEmpresa.DisableControls;
    datm_ConfigEnvioEmail.cdsListaEmpresa.DisableControls;
    datm_ConfigEnvioEmail.qryListaEmpresa.close;
    datm_ConfigEnvioEmail.cdslistaEmpresa.close;
    datm_ConfigEnvioEmail.cdslistaEmpresa.open;
    datm_ConfigEnvioEmail.qryListaEmpresa.open;
    datm_ConfigEnvioEmail.qryListaEmpresa.EnableControls;
    datm_ConfigEnvioEmail.cdsListaEmpresa.EnableControls;

      
    pgcDadosEmpresa.tabindex := 0;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.btn_GravarEmpresaClick(
  Sender: TObject);
begin
  if (cbEmpresa.KeyValue = '') or (cbEmpresa.KeyValue = null) then
  begin
    ShowMessage('Preencha a Empresa.');
    pgcConfigEmpresa.TabIndex := 0;
    cbEmpresa.SetFocus;
    abort;
  end;
  
  GravarMasterEmpresa(True);
end;

procedure TfrmConfigurarEnvioArquivosEmail.GravarMasterEmpresa(GravaDetailArquivo :boolean);
  var
    bookmarkArquivoEmpresa : TBookmark;
begin
  datm_ConfigEnvioEmail.SQLConnection.CloseDataSets;

  if datm_ConfigEnvioEmail.cdsConfigEmpresa.State in [dsInsert, dsEdit] then
  begin
    datm_ConfigEnvioEmail.cdsConfigEmpresa.post;
    datm_ConfigEnvioEmail.cdsConfigEmpresa.ApplyUpdates(-1);

    if datm_ConfigEnvioEmail.cdsConfigEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger = 0 then
      datm_ConfigEnvioEmail.cdsConfigEmpresa.refresh;
  end;

  chaveGrupoEmpresa := datm_ConfigEnvioEmail.cdsConfigEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger;

  if GravaDetailArquivo then
  begin
    if datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.State in [dsInsert, dsEdit] then
      datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.post;

    if not (datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.State in [dsInactive]) then
    begin
      datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.ApplyUpdates(-1);

     //pegar a chave
     if datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.FieldByName('CD_CONFIG_ENVIO_EMAIL_EMP_ARQ').AsInteger < 0 then
      datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.refresh;
    end;

    if datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.State in [dsInsert, dsEdit] then
      datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.post;

    if not (datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.State in [dsInactive]) then
      datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.ApplyUpdates(-1);
  end;

  btn_GravarEmpresa.enabled   := false;
  btnCancelarEmpresa.enabled  := false;
  btn_IncluirEmpresa.enabled  := true;
end;

procedure TfrmConfigurarEnvioArquivosEmail.pgcConfigEmpresaChange(
  Sender: TObject);
  var
    BookMarkArquivo : TBookmark;
begin
  if pgcConfigEmpresa.ActivePage = tsMudarNomeEmpresa then
  begin
    if datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.fieldByName('CD_ARQUIVO').asInteger = 0 then
    begin
      ShowMessage('Selecione um tipo arquivo.');
      pgcConfigEmpresa.TabIndex := 0;
    end
    else
    begin  
      BookMarkArquivo := datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.GetBookmark;

      if (datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger < 1) or
         (datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger < 1) or
         (datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP_ARQ').asInteger < 1) then
        GravarMasterEmpresa(True);

      datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.GotoBookmark(BookMarkArquivo);
      datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.FreeBookmark(BookMarkArquivo);

      datm_ConfigEnvioEmail.qryNomeArquivoEmpresa.DisableControls;
      datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.DisableControls;

      datm_ConfigEnvioEmail.qryNomeArquivoEmpresa.close;
      datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.close;

      datm_ConfigEnvioEmail.qryNomeArquivoEmpresa.SQL.Text := GetSQLNomeArquivoEmpresa;

      datm_ConfigEnvioEmail.qryNomeArquivoEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL').AsInteger          := datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;
      datm_ConfigEnvioEmail.qryNomeArquivoEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL_EMP').AsInteger      := datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP').asInteger;
      datm_ConfigEnvioEmail.qryNomeArquivoEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL_EMP_ARQ').AsInteger  := datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.fieldByName('CD_CONFIG_ENVIO_EMAIL_EMP_ARQ').asInteger;

      datm_ConfigEnvioEmail.qryNomeArquivoEmpresa.open;
      datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.open;

      datm_ConfigEnvioEmail.qryNomeArquivoEmpresa.EnableControls;
      datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.EnableControls;
    end;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.dbgArquivosEmpresaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_Delete] then
  begin
    datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.delete;
    
    btn_GravarEmpresa.enabled   := true;
    btnCancelarEmpresa.enabled  := true;
    btn_IncluirEmpresa.enabled  := false;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.dbgNomeArquivoEmpresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_Delete] then
  begin
    datm_ConfigEnvioEmail.cdsNomeArquivoEmpresa.delete;

    btn_GravarEmpresa.enabled   := true;
    btnCancelarEmpresa.enabled  := true;
    btn_IncluirEmpresa.enabled  := false;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.AtivarDataSets;
begin
  datm_ConfigEnvioEmail.cdsListaGrupos.active    := true;
  datm_ConfigEnvioEmail.cdsListaEmpresa.active   := true;
  datm_ConfigEnvioEmail.cdsGrupo.active          := true;
  datm_ConfigEnvioEmail.cdsTipoDocumento.active  := true;
  datm_ConfigEnvioEmail.cdsProduto.active        := true;
  datm_ConfigEnvioEmail.cdsEmpresa.active        := true;
end;

procedure TfrmConfigurarEnvioArquivosEmail.PosicaoInicial;
begin
  pgcGrupoEmpresa.TabIndex     := 0;
  pgcDadosGrupo.TabIndex       := 0;
  pgcDadosEmpresa.TabIndex     := 0;
  pgcConfigEmpresa.TabIndex    := 0;

end;

procedure TfrmConfigurarEnvioArquivosEmail.CarregarDetail;
begin
  if chaveGrupo = 0 then
  begin
    GravarMaster(false);

    datm_ConfigEnvioEmail.cdsConfigArquivo.DisableControls;
    datm_ConfigEnvioEmail.qryConfigArquivo.DisableControls;

    datm_ConfigEnvioEmail.qryConfigArquivo.close;
    datm_ConfigEnvioEmail.cdsConfigArquivo.close;
    datm_ConfigEnvioEmail.qryConfigArquivo.SQL.Text                                           := getSQLConfigArquivo;
    datm_ConfigEnvioEmail.qryConfigArquivo.ParamByName('CD_CONFIG_ENVIO_EMAIL').AsInteger     := chaveGrupo;
    datm_ConfigEnvioEmail.qryConfigArquivo.open;
    datm_ConfigEnvioEmail.cdsConfigArquivo.open;

    datm_ConfigEnvioEmail.qryConfigArquivo.EnableControls;
    datm_ConfigEnvioEmail.cdsConfigArquivo.EnableControls;
  end;
end;

Procedure TfrmConfigurarEnvioArquivosEmail.CarregarDetailEmpresa;
begin
  if chaveGrupoEmpresa = 0 then
  begin
    GravarMasterEmpresa(False);

    datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.DisableControls;
    datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.DisableControls;

    datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.close;
    datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.close;
    datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.SQL.Text                                           := getSQLConfigArquivoEmpresa;
    datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL').AsInteger     := datm_ConfigEnvioEmail.cdsConfig.fieldByName('CD_CONFIG_ENVIO_EMAIL').asInteger;
    datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.ParamByName('CD_CONFIG_ENVIO_EMAIL_EMP').AsInteger := chaveGrupoEmpresa;
    datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.open;
    datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.open;

    datm_ConfigEnvioEmail.qryConfigArquivoEmpresa.EnableControls;
    datm_ConfigEnvioEmail.cdsConfigArquivoEmpresa.EnableControls;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.pgcGrupoEmpresaEnter(
  Sender: TObject);
begin
  if ((cbCD_PRODUTO.KeyValue = '') or (cbCD_PRODUTO.KeyValue = null))
  or ((cbCD_GRUPO.KeyValue = '') or (cbCD_GRUPO.KeyValue = null)) then
  begin
    ShowMessage('Preencha os dados do Grupo/Produto.');
    cbCD_PRODUTO.SetFocus;
    abort;
  end
  else
  begin
    CarregarDetail;  
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.pgcConfigEmpresaEnter(
  Sender: TObject);
begin
  if (cbEmpresa.KeyValue = '') or (cbEmpresa.KeyValue = null) then
  begin
    ShowMessage('Preencha a Empresa.');
    pgcConfigEmpresa.TabIndex := 0;
    cbEmpresa.SetFocus;
    abort;
  end
  else
    CarregarDetailEmpresa;
end;

procedure TfrmConfigurarEnvioArquivosEmail.ValidarMaster;
begin
  if ((cbCD_PRODUTO.KeyValue = '') or (cbCD_PRODUTO.KeyValue = null))
  or ((cbCD_GRUPO.KeyValue = '') or (cbCD_GRUPO.KeyValue = null)) then
  begin
    ShowMessage('Preencha os dados do Grupo/Produto.');
    pgcGrupoEmpresa.TabIndex := 0;
    cbCD_PRODUTO.SetFocus;
    abort;
  end
  else
  begin
    CarregarDetail;
  end;
end;

procedure TfrmConfigurarEnvioArquivosEmail.dbgListaTitleClick(
  Column: TColumn);
begin
  datm_ConfigEnvioEmail.cdsListaGrupos.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConfigurarEnvioArquivosEmail.dbgListaEmpresaTitleClick(
  Column: TColumn);
begin
  datm_ConfigEnvioEmail.cdsListaEmpresa.IndexFieldNames := Column.FieldName;
end;

end.


