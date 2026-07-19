unit uFollowUpEtapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, ExtCtrls, Mask, Grids, DBGrids, Menus,
  Buttons, DBCtrls, Funcoes, ConsOnLineEx;

Type
  TTipoProcesso = (tpDesembaraco, tpPedido);

type
  TfrmFollowUpEtapa = class(TForm)
    pnlMenu: TPanel;
    btnIncluir: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    mmCadastro: TMainMenu;
    mniIncluir: TMenuItem;
    mniSalvar: TMenuItem;
    mniCancelar: TMenuItem;
    mniExcluir: TMenuItem;
    mniSair: TMenuItem;
    dbgrdEtapas: TDBGrid;
    shpBusca: TShape;
    shpLabel: TShape;
    lblBusca: TLabel;
    pnlProcesso: TPanel;
    lblNrProcesso: TLabel;
    edtNrProcesso: TEdit;
    shpProcesso: TShape;
    lblUnidade: TLabel;
    edtNomeUnidade: TEdit;
    lblProduto: TLabel;
    edtNomeProduto: TEdit;
    qryFollowUpEtapa: TQuery;
    updFollowUpEtapa: TUpdateSQL;
    dsFollowUpEtapa: TDataSource;
    pnlCadastroEtapa: TPanel;
    qryFollowUpEtapaCD_UNID_NEG: TStringField;
    qryFollowUpEtapaCD_PRODUTO: TStringField;
    qryFollowUpEtapaNR_PROCESSO: TStringField;
    qryFollowUpEtapaCD_FOLLOWUP_ETAPA: TIntegerField;
    qryFollowUpEtapaCD_ETAPA: TIntegerField;
    qryFollowUpEtapaCD_USUARIO: TStringField;
    qryFollowUpEtapaDT_ALTERACAO: TDateTimeField;
    lblCodigo: TLabel;
    dbedtCodigo: TDBEdit;
    lblEtapa: TLabel;
    dbedtCodigoEtapa: TDBEdit;
    edtNomeEtapa: TEdit;
    btnConsultaEtapa: TSpeedButton;
    qryUltimoCodigoEtapa: TQuery;
    qryUltimoCodigoEtapaULTIMO: TIntegerField;
    edtBuscaEtapa: TEdit;
    qryFollowUpEtapaNM_ETAPA: TStringField;
    qryFollowUpEtapaAP_USUARIO: TStringField;
    btnCancel: TButton;
    updFlpPoItemEtapa: TUpdateSQL;
    qryFlpPoItemEtapa: TQuery;
    dsFlpPoItemEtapa: TDataSource;
    qryFlpPoItemEtapaNR_PROCESSO: TStringField;
    qryFlpPoItemEtapaCD_FLP_PO_ITEM_ETAPA: TIntegerField;
    qryFlpPoItemEtapaCD_ETAPA: TIntegerField;
    qryFlpPoItemEtapaCD_USUARIO: TStringField;
    qryFlpPoItemEtapaDT_ALTERACAO: TDateTimeField;
    qryFlpPoItemEtapaNM_ETAPA: TStringField;
    qryFlpPoItemEtapaAP_USUARIO: TStringField;
    edtNrItem: TEdit;
    lbl1: TLabel;
    qryFlpPoItemEtapaNR_ITEM: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dbedtCodigoEtapaExit(Sender: TObject);
    procedure btnConsultaEtapaClick(Sender: TObject);
    procedure dbgrdEtapasDblClick(Sender: TObject);
    procedure dbgrdEtapasKeyPress(Sender: TObject; var Key: Char);
    procedure qryFollowUpEtapaAfterDelete(DataSet: TDataSet);
    procedure qryFollowUpEtapaAfterPost(DataSet: TDataSet);
    procedure dsFollowUpEtapaStateChange(Sender: TObject);
    procedure edtBuscaEtapaChange(Sender: TObject);
  private
    { Private declarations }
    st_modificar, st_incluir, st_excluir : Boolean;
    vProcesso : string[18];
    vServico, vItem : string[3];
    procedure AtivaBtnMenu(i, s, c, e: Boolean);
    function Consiste : Boolean;
    function Grava : Boolean;
    function VerAlt : Boolean;
    procedure Cancelar;
  public
    { Public declarations }
    vUnidade, vProduto : string[2];
    vTipoProcesso : TTipoProcesso;
  end;

var
  frmFollowUpEtapa: TfrmFollowUpEtapa;

implementation

uses GSMLIB, PGGP001, PGGP017, uFollowUp, PGPO018;

{$R *.dfm}

procedure TfrmFollowUpEtapa.AtivaBtnMenu(i, s, c, e: Boolean);
begin
  // habilita/desabilita os botões do form
  btnIncluir.Enabled  := i;  mniIncluir.Enabled  := i;
  btnSalvar.Enabled   := s;  mniSalvar.Enabled   := s;
  btnCancelar.Enabled := c;  mniCancelar.Enabled := c;
  btnExcluir.Enabled  := e;  mniExcluir.Enabled  := e;
end;

function TfrmFollowUpEtapa.Consiste : Boolean;
begin
  Consiste := True;

  if Trim(edtNomeEtapa.Text) = '' then
  begin
    MessageDlg('Status não encontrado ou inválido!',mtError,[mbOK],0);
    dbedtCodigoEtapa.SetFocus;
    Consiste := False;
    Exit;
  end;
end;

function TfrmFollowUpEtapa.Grava : Boolean;
var
  vPosicao: string;
begin
  Grava := True;
  Screen.Cursor := crHourGlass;
  try
    datm_main.db_broker.StartTransaction;

    if TDataSource(dbgrdEtapas.DataSource).State in [dsInsert, dsEdit] then
    begin
      TField(dbgrdEtapas.Columns[2].Field).AsDateTime := now;
//      qryFollowUpEtapaDT_ALTERACAO.AsDateTime := Now;
//      vPosicao := qryFollowUpEtapaCD_FOLLOWUP_ETAPA.AsString;
      vPosicao := TField(dbgrdEtapas.Columns[0].Field).AsString;
      TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Post;
      //ativa botões atraves dos direitos de usuário
      AtivaBtnMenu(st_incluir, False, False, st_excluir);
      pnlCadastroEtapa.Visible := False;
      dbgrdEtapas.Enabled      := True;
      //fecha e abre tabela e posiciona registro
      TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Close;
      TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).ParamByName('nr_processo').AsString := vProcesso;
      TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Open;
      Localiza(TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset), vPosicao, dbgrdEtapas.Columns[0].FieldName);
    end;

    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if TDataSource(dbgrdEtapas.DataSource).State in [dsInsert,dsEdit] then TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
end;

function TfrmFollowUpEtapa.VerAlt : Boolean;
begin
  VerAlt := True;
  if ((TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).State in [dsEdit]) and st_modificar) or (TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).State in [dsInsert]) then
  begin
    if MessageDlg('O controle de status foi alterado.' + #13#10 +
       'Deseja salvar as alterações?',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
    begin
      if Not Consiste then
      begin
        VerAlt := False;
        Exit;
      end;
      if Not Grava then
      begin
        VerAlt := False;
        Exit;
      end;
    end
    else
      Cancelar;
  end;
end;

procedure TfrmFollowUpEtapa.Cancelar;
begin
  try
    TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Cancel;
    VerificaCamposTag(frmFollowUpEtapa,[pnlCadastroEtapa],False);
    //ativa botões atraves dos direitos de usuário
    AtivaBtnMenu(st_incluir, False, False, st_excluir);
    pnlCadastroEtapa.Visible := False;
    dbgrdEtapas.Enabled      := True;
  except
    Application.MessageBox('Falha ao tentar cancelar a edição dos dados!','Erro',0);
  end;
end;

procedure TfrmFollowUpEtapa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Not VerAlt Then Exit;
  if str_cd_rotina = '0136' then str_cd_rotina := '0110';
  //fecha tabelas
  qryUltimoCodigoEtapa.Close;
  TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Close;
  //libera o form da memoria
  Action := caFree;
end;

procedure TfrmFollowUpEtapa.FormCreate(Sender: TObject);
begin
  //verifica direitos
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
end;

procedure TfrmFollowUpEtapa.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 Then
  begin
    if Sender = dbedtCodigoEtapa then btnConsultaEtapaClick(btnConsultaEtapa);
  end;
end;

procedure TfrmFollowUpEtapa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //se pressionar ESC encerra
  if Key = #27 then btnSairClick(nil);
end;

procedure TfrmFollowUpEtapa.FormShow(Sender: TObject);
begin
  pnlMenu.Color := clMenuBroker;
  //ativa botões atraves dos direitos de usuário
  AtivaBtnMenu(st_incluir, False, False, st_excluir);

  if vTipoProcesso = tpPedido then
  begin
    dbgrdEtapas.DataSource := dsFlpPoItemEtapa;
    dbgrdEtapas.Columns[0].FieldName:='CD_FLP_PO_ITEM_ETAPA';
    vProcesso := frm_po_flp.qryPoItemNR_PROCESSO.AsString;
    vItem     := frm_po_flp.qryPoItemNR_ITEM.AsString;
    vServico  := frm_po_flp.dbedt_cd_servico.Text;
    edtNrProcesso.Text  := vProcesso;
    edtNrItem.Visible := True;
    lbl1.Visible := True;
    edtNrItem.Text  := vItem;
    edtNomeUnidade.Text := frm_po_flp.edt_nm_unid_neg.Text;
    edtNomeProduto.Text := frm_po_flp.edt_nm_produto.Text;
  end
  else
  begin
    dbgrdEtapas.DataSource := dsFollowUpEtapa;
    dbgrdEtapas.Columns[0].FieldName:='CD_FOLLOWUP_ETAPA';
    vProcesso := frm_followup.qryFollowUpNR_PROCESSO.AsString;
    vServico  := frm_followup.dbedt_cd_servico.Text;
    edtNrProcesso.Text  := Copy(vProcesso, 5, 18);
    edtNrItem.Visible := False;
    lbl1.Visible := False;
    vUnidade  := Copy(vProcesso, 1, 2);
    vProduto  := Copy(vProcesso, 3, 2);
    edtNomeUnidade.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',vUnidade,'AP_UNID_NEG');
    edtNomeProduto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO',vProduto,'NM_PRODUTO');
  end;
  TDataSource(dbgrdEtapas.DataSource).AutoEdit := st_modificar;
  TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Close;
  if vTipoProcesso = tpPedido then
  begin
    TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).ParamByName('nr_processo').AsString := vProcesso;
    TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).ParamByName('nr_item').AsString := vItem;
  end else TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).ParamByName('nr_processo').AsString := vProcesso;
  TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Open;

  qryUltimoCodigoEtapa.SQL[2] := 'WHERE NR_PROCESSO = '''+vProcesso+''' '
end;

procedure TfrmFollowUpEtapa.btnIncluirClick(Sender: TObject);
begin
  if vTipoProcesso = tpPedido then
  begin
    qryFlpPoItemEtapa.Insert;
    qryFlpPoItemEtapaNR_PROCESSO.AsString           := vProcesso;
    qryFlpPoItemEtapaNR_ITEM.AsString               := vItem;
    qryFlpPoItemEtapaCD_USUARIO.AsString            := str_cd_usuario;
    qryFlpPoItemEtapaCD_FLP_PO_ITEM_ETAPA.AsInteger := StrToIntDef(ConsultaLookupSQL('SELECT ( ISNULL(MAX(CD_FLP_PO_ITEM_ETAPA),0) + 1 ) BLA FROM TFLP_PO_ITEM_ETAPA WHERE NR_PROCESSO = ''' + vProcesso + ''' AND NR_ITEM = ''' + vItem + '''','BLA'),1);
    dbedtCodigoEtapa.DataSource := dsFlpPoItemEtapa;
    dbedtCodigo.DataField := 'CD_FLP_PO_ITEM_ETAPA';
    dbedtCodigo.DataSource := dsFlpPoItemEtapa;
  end else begin
    qryFollowUpEtapa.Insert;
    qryFollowUpEtapaNR_PROCESSO.AsString := vProcesso;
    qryFollowUpEtapaCD_UNID_NEG.AsString := vUnidade;
    qryFollowUpEtapaCD_PRODUTO.AsString  := vProduto;
    qryFollowUpEtapaCD_USUARIO.AsString  := str_cd_usuario;
    qryFollowUpEtapaCD_FOLLOWUP_ETAPA.AsInteger := UltCod(qryUltimoCodigoEtapa, qryUltimoCodigoEtapaULTIMO);
    dbedtCodigoEtapa.DataSource := dsFollowUpEtapa;
    dbedtCodigo.DataField := 'CD_FOLLOWUP_ETAPA';
    dbedtCodigo.DataSource := dsFlpPoItemEtapa;
  end;

  pnlCadastroEtapa.Visible := True;
  edtNomeEtapa.Text        := '';
  dbgrdEtapas.Enabled      := False;
  dbedtCodigoEtapa.SetFocus;
  AtivaBtnMenu(False, True, True, False);
end;

procedure TfrmFollowUpEtapa.btnSalvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then Exit;
  if not Grava then Exit;
end;

procedure TfrmFollowUpEtapa.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmFollowUpEtapa.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Este status será excluído! Confirma exclusão?',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
  try
    datm_main.db_broker.StartTransaction;
    TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Delete;
    datm_main.db_broker.Commit;

    TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Close;
    if vTipoProcesso = tpPedido then
    begin
      TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).ParamByName('nr_processo').AsString := vProcesso;
      TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).ParamByName('nr_item').AsString := vItem;
    end else begin
      TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).ParamByName('nr_processo').AsString := frm_followup.qryFollowUpNR_PROCESSO.AsString;
    end;
    TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Open;
  except
    on E: Exception do
    begin
      TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure TfrmFollowUpEtapa.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFollowUpEtapa.dbedtCodigoEtapaExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoEtapa);
end;

procedure TfrmFollowUpEtapa.btnConsultaEtapaClick(Sender: TObject);
begin
  if vTipoProcesso = tpPedido then
  begin
    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(qryFlpPoItemEtapa) then Exit;
      qryFlpPoItemEtapaCD_ETAPA.AsString := ConsultaOnLineExSQL(
        'SELECT CD_ETAPA, NM_ETAPA '+
        'FROM TETAPA (NOLOCK) '+
        'WHERE (CD_UNID_NEG = '''+ vUnidade +''' OR CD_UNID_NEG IS NULL) '+
        '  AND (CD_PRODUTO  = '''+ vProduto +''' OR CD_PRODUTO  IS NULL) '+
        '  AND (CD_EVENTO  IN (SELECT SE.CD_EVENTO '+
        '                      FROM TSERVICO_EVENTO SE (NOLOCK), TEVENTO E (NOLOCK) '+
        '                      WHERE SE.CD_SERVICO = '''+ vServico +''' '+
        '                        AND SE.CD_EVENTO = E.CD_EVENTO '+
        '                        AND ISNULL(E.IN_ATIVO,''1'') = ''1'') '+
        '       OR CD_EVENTO IS NULL)',
        'Status do Processo',['CD_ETAPA','NM_ETAPA'],['Código','Nome'],'CD_ETAPA',nil);
    end
    else
      edtNomeEtapa.Text := ConsultaLookUPSQL(
        'SELECT CD_ETAPA, NM_ETAPA '+
        'FROM TETAPA (NOLOCK) '+
        'WHERE CD_ETAPA = '''+ dbedtCodigoEtapa.Text +''' '+
        '  AND (CD_UNID_NEG = '''+vUnidade+''' OR CD_UNID_NEG IS NULL) '+
        '  AND (CD_PRODUTO  = '''+vProduto+''' OR CD_PRODUTO  IS NULL) '+
        '  AND (CD_EVENTO  IN (SELECT SE.CD_EVENTO '+
        '                      FROM TSERVICO_EVENTO SE (NOLOCK), TEVENTO E (NOLOCK) '+
        '                      WHERE SE.CD_SERVICO = '''+vServico+''' '+
        '                        AND SE.CD_EVENTO = E.CD_EVENTO '+
        '                        AND ISNULL(E.IN_ATIVO,''1'') = ''1'') '+
        '       OR CD_EVENTO IS NULL)','NM_ETAPA');
  end else begin
    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(qryFollowUpEtapa) then Exit;
      qryFollowUpEtapaCD_ETAPA.AsString := ConsultaOnLineExSQL(
        'SELECT CD_ETAPA, NM_ETAPA '+
        'FROM TETAPA (NOLOCK) '+
        'WHERE (CD_UNID_NEG = '''+vUnidade+''' OR CD_UNID_NEG IS NULL) '+
        '  AND (CD_PRODUTO  = '''+vProduto+''' OR CD_PRODUTO  IS NULL) '+
        '  AND (CD_EVENTO  IN (SELECT SE.CD_EVENTO '+
        '                      FROM TSERVICO_EVENTO SE (NOLOCK), TEVENTO E (NOLOCK) '+
        '                      WHERE SE.CD_SERVICO = '''+vServico+''' '+
        '                        AND SE.CD_EVENTO = E.CD_EVENTO '+
        '                        AND ISNULL(E.IN_ATIVO,''1'') = ''1'') '+
        '       OR CD_EVENTO IS NULL)',
        'Status do Processo',['CD_ETAPA','NM_ETAPA'],['Código','Nome'],'CD_ETAPA',nil);
    end
    else
      edtNomeEtapa.Text := ConsultaLookUPSQL(
        'SELECT CD_ETAPA, NM_ETAPA '+
        'FROM TETAPA (NOLOCK) '+
        'WHERE CD_ETAPA = '''+ dbedtCodigoEtapa.Text +''' '+
        '  AND (CD_UNID_NEG = '''+vUnidade+''' OR CD_UNID_NEG IS NULL) '+
        '  AND (CD_PRODUTO  = '''+vProduto+''' OR CD_PRODUTO  IS NULL) '+
        '  AND (CD_EVENTO  IN (SELECT SE.CD_EVENTO '+
        '                      FROM TSERVICO_EVENTO SE (NOLOCK), TEVENTO E (NOLOCK) '+
        '                      WHERE SE.CD_SERVICO = '''+vServico+''' '+
        '                        AND SE.CD_EVENTO = E.CD_EVENTO '+
        '                        AND ISNULL(E.IN_ATIVO,''1'') = ''1'') '+
        '       OR CD_EVENTO IS NULL)','NM_ETAPA');
  end;
end;

procedure TfrmFollowUpEtapa.dbgrdEtapasDblClick(Sender: TObject);
begin
  //coloca em modo de edição
  pnlCadastroEtapa.Visible := True;
  dbgrdEtapas.Enabled      := False;
  dbedtCodigoEtapa.SetFocus;
  TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset).Edit;
end;

procedure TfrmFollowUpEtapa.dbgrdEtapasKeyPress(Sender: TObject; var Key: Char);
begin
  //coloca em modo de edição
  If Key = #13 then dbgrdEtapasDblClick(Sender);
end;

procedure TfrmFollowUpEtapa.qryFollowUpEtapaAfterDelete(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure TfrmFollowUpEtapa.qryFollowUpEtapaAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure TfrmFollowUpEtapa.dsFollowUpEtapaStateChange(Sender: TObject);
begin
  if TDataSource(dbgrdEtapas.DataSource).State in [dsEdit] then AtivaBtnMenu(False, True, True, False);
end;

procedure TfrmFollowUpEtapa.edtBuscaEtapaChange(Sender: TObject);
begin
  Localiza( TQuery(TDataSource(dbgrdEtapas.DataSource).Dataset), edtBuscaEtapa.Text, 'NM_ETAPA' );
end;

end.

