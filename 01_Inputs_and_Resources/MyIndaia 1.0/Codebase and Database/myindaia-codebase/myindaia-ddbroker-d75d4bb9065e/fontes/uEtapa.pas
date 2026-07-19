unit uEtapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls, Menus, ComCtrls, DB,
  DBTables, Grids, DBGrids, Mask, Funcoes, ConsOnLineEx;

type
  TfrmEtapa = class(TForm)
    mmCadastro: TMainMenu;
    mniIncluir: TMenuItem;
    mniSalvar: TMenuItem;
    mniCancelar: TMenuItem;
    mniExcluir: TMenuItem;
    mniSair: TMenuItem;
    pnlCadastro: TPanel;
    btnIncluir: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnlPesquisa: TPanel;                                   
    lblChave: TLabel;
    lblOrdem: TLabel;
    edtChave: TEdit;
    cmbOrdem: TComboBox;
    pgctrlEtapa: TPageControl;
    tsLista: TTabSheet;
    tsCadastro: TTabSheet;
    bvlDadosBasicos: TBevel;
    dbgrdListaEtapa: TDBGrid;
    dsEtapa: TDataSource;
    qryEtapa: TQuery;
    qryEtapaCD_ETAPA: TIntegerField;
    qryEtapaNM_ETAPA: TStringField;
    qryEtapaIN_ATIVO: TIntegerField;
    qryEtapaCD_UNID_NEG: TStringField;
    qryEtapaCD_PRODUTO: TStringField;
    qryEtapaCD_EVENTO: TStringField;
    lblCodigoEtapa: TLabel;
    dbedtCodigoEtapa: TDBEdit;
    lblDescricao: TLabel;
    dbedtDescricaoEtapa: TDBEdit;
    lblUnidade: TLabel;
    dbedtCodigoUnidade: TDBEdit;
    lblProduto: TLabel;
    dbedtCodigoProduto: TDBEdit;
    lblEvento: TLabel;
    dbedtCodigoEvento: TDBEdit;
    edtNomeUnidade: TEdit;
    edtNomeProduto: TEdit;
    btnConsultaUnidade: TSpeedButton;
    btnConsultaProduto: TSpeedButton;
    edtNomeEvento: TEdit;
    btnConsultaEvento: TSpeedButton;
    dbchkInUrgente: TDBCheckBox;
    updEtapa: TUpdateSQL;
    qryUltimoCodigoEtapa: TQuery;
    qryUltimoCodigoEtapaULTIMO: TIntegerField;
    dbnavEtapa: TDBNavigator;
    qryEtapacalcInAtivo: TStringField;
    qryEtapacalcUnidade: TStringField;
    qryEtapacalcProduto: TStringField;
    qryEtapacalcEvento: TStringField;
    bvlSeparador: TBevel;
    qryEtapaNM_INGLES: TStringField;
    qryEtapaNM_ESPANHOL: TStringField;
    lblDescIngles: TLabel;
    dbedtDescIngles: TDBEdit;
    lblDescEspanhol: TLabel;
    dbedtDescEspanhol: TDBEdit;
    pnlUnidProd: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnListaUnid: TSpeedButton;
    btnListaProd: TSpeedButton;
    edtListaUnid: TEdit;
    edtListaNmProd: TEdit;
    edtListaCdUnid: TEdit;
    edtListaCdProd: TEdit;
    qryEtapaIN_ETAPA_AUTOMATICA: TStringField;
    DBCheckBox1: TDBCheckBox;
    tsOrdena: TTabSheet;
    lstCod: TListBox;
    btnEfetivar: TSpeedButton;
    btnCima: TSpeedButton;
    btnBaixo: TSpeedButton;
    DBCheckBox2: TDBCheckBox;
    qryEtapaIN_RETRABALHO: TStringField;
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
    procedure edtChaveChange(Sender: TObject);
    procedure cmbOrdemClick(Sender: TObject);
    procedure pgctrlEtapaChange(Sender: TObject);
    procedure pgctrlEtapaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dbedtCodigoUnidadeExit(Sender: TObject);
    procedure dbedtCodigoProdutoExit(Sender: TObject);
    procedure dbedtCodigoEventoExit(Sender: TObject);
    procedure btnConsultaUnidadeClick(Sender: TObject);
    procedure btnConsultaProdutoClick(Sender: TObject);
    procedure btnConsultaEventoClick(Sender: TObject);
    procedure dbgrdListaEtapaDblClick(Sender: TObject);
    procedure dbgrdListaEtapaKeyPress(Sender: TObject; var Key: Char);
    procedure qryEtapaAfterDelete(DataSet: TDataSet);
    procedure qryEtapaAfterPost(DataSet: TDataSet);
    procedure dsEtapaStateChange(Sender: TObject);
    procedure qryEtapaCalcFields(DataSet: TDataSet);
    procedure btnListaUnidClick(Sender: TObject);
    procedure edtListaCdUnidExit(Sender: TObject);
    procedure edtListaCdProdExit(Sender: TObject);
    procedure btnListaProdClick(Sender: TObject);
    procedure btnCimaClick(Sender: TObject);
    procedure btnBaixoClick(Sender: TObject);
    procedure btnEfetivarClick(Sender: TObject);
  private
    { Private declarations }
    aStrIndice: Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    vCodigoPesquisa: string;
    procedure AtivaBtnMenu(i, s, c, e: Boolean);
    function Consiste : Boolean;
    function Grava : Boolean;
    function VerAlt : Boolean;
    procedure Cancelar;
    procedure ReabreQry;
  public
    { Public declarations }
  end;

var
  frmEtapa: TfrmEtapa;

implementation

uses GSMLIB, PGGP001, PGGP017;

{$R *.dfm}

procedure TfrmEtapa.AtivaBtnMenu(i, s, c, e: Boolean);
begin
  // habilita/desabilita os botões do form
  btnIncluir.Enabled  := i;  mniIncluir.Enabled  := i;
  btnSalvar.Enabled   := s;  mniSalvar.Enabled   := s;
  btnCancelar.Enabled := c;  mniCancelar.Enabled := c;
  btnExcluir.Enabled  := e;  mniExcluir.Enabled  := e;
end;

function TfrmEtapa.Consiste : Boolean;
begin
  Consiste := True;

  if pgctrlEtapa.ActivePage = tsCadastro then
  begin
    if not VerificaCamposTag(frmEtapa,[tsCadastro],True) then
    begin
      dbedtDescricaoEtapa.SetFocus;
      Consiste := False;
      Exit;
    end
    else
    if (Trim(dbedtCodigoUnidade.Text) <> '') and (Trim(edtNomeUnidade.Text) = '') then
    begin
      MessageDlg('Unidade não encontrada ou inválida!',mtError,[mbOK],0);
      dbedtCodigoUnidade.SetFocus;
      Consiste := False;
      Exit;
    end
    else
    if (Trim(dbedtCodigoProduto.Text) <> '') and (Trim(edtNomeProduto.Text) = '') then
    begin
      MessageDlg('Produto não encontrado ou inválido!',mtError,[mbOK],0);
      dbedtCodigoProduto.SetFocus;
      Consiste := False;
      Exit;
    end
    else
    if (Trim(dbedtCodigoEvento.Text) <> '') and (Trim(edtNomeEvento.Text) = '') then
    begin
      MessageDlg('Evento não encontrado ou inválido!',mtError,[mbOK],0);
      dbedtCodigoEvento.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
end;

function TfrmEtapa.Grava : Boolean;
var vPosicao: string;
begin
  Grava := True;
  Screen.Cursor := crHourGlass;

  try
    datm_main.db_broker.StartTransaction;
    if ( dsEtapa.State in [dsInsert, dsEdit] ) then
    begin
      if Trim(dbedtCodigoUnidade.Text) = '' then qryEtapaCD_UNID_NEG.AsVariant := Null;
      if Trim(dbedtCodigoProduto.Text) = '' then qryEtapaCD_PRODUTO.AsVariant  := Null;
      if Trim(dbedtCodigoEvento.Text)  = '' then qryEtapaCD_EVENTO.AsVariant   := Null;
      vPosicao := qryEtapaCD_ETAPA.AsString;
      qryEtapa.Post;
      //ativa botões atraves dos direitos de usuário
      AtivaBtnMenu(st_incluir, False, False, st_excluir);
      //fecha e abre tabela e posiciona registro
      qryEtapa.Close;
      qryEtapa.Open;
      Localiza(qryEtapa, vPosicao, aStrIndice[0]);
    end;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if dsEtapa.State in [dsInsert,dsEdit] then qryEtapa.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;

      TrataErro(E);
      Grava := False;
    end;
  end;
end;

function TfrmEtapa.VerAlt : Boolean;
begin
  VerAlt := True;
  if ((qryEtapa.State in [dsEdit]) and st_modificar) or (qryEtapa.State in [dsInsert]) then
  begin
    if MessageDlg('Tabela de Status foi alterada.' + #13#10 +
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

procedure TfrmEtapa.Cancelar;
begin
  try
    qryEtapa.Cancel;
    VerificaCamposTag(frmEtapa,[tsCadastro],False);
    //ativa botões atraves dos direitos de usuário
    AtivaBtnMenu(st_incluir, False, False, st_excluir);
  except
    Application.MessageBox('Falha ao tentar cancelar a edição dos dados!','Erro',0);
  end;
end;

procedure TfrmEtapa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Not VerAlt Then Exit;
  if str_cd_rotina = '2305' then str_cd_rotina := '';
  //fecha tabelas
  qryUltimoCodigoEtapa.Close;
  qryEtapa.Close;
  //libera da memoria
  Action := caFree;
end;

procedure TfrmEtapa.FormCreate(Sender: TObject);
begin
  //verifica direitos
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  //traz unidade e produto padrão do usuário
  edtListaCdUnid.Text := ConsultaLookUpSQL('SELECT ISNULL(CD_UNID_NEG, "01") UNID FROM TUSUARIO_HABILITACAO WHERE CD_USUARIO = "' + str_cd_usuario + '" AND IN_DEFAULT = "1"', 'UNID');
  edtListaCdProd.Text := ConsultaLookUpSQL('SELECT ISNULL(CD_PRODUTO,  "01") PROD FROM TUSUARIO_HABILITACAO WHERE CD_USUARIO = "' + str_cd_usuario + '" AND IN_DEFAULT = "1"', 'PROD');

  dsEtapa.AutoEdit := st_modificar;
  qryEtapa.Close;
  qryEtapa.SQL[4] := 'NM_ETAPA';
  qryEtapa.ParamByName('CD_UNID_NEG').AsString := edtListaCdUnid.Text;
  qryEtapa.ParamByName('CD_PRODUTO').AsString  := edtListaCdProd.Text;  
  qryEtapa.Open;

  aStrIndice[0] := 'CD_ETAPA';
  aStrIndice[1] := 'NM_ETAPA';

  with cmbOrdem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;
end;

procedure TfrmEtapa.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 Then
  begin
    if pgctrlEtapa.ActivePage = tsCadastro then
    begin
      if Sender = dbedtCodigoUnidade then btnConsultaUnidadeClick(btnConsultaUnidade);
      if Sender = dbedtCodigoProduto then btnConsultaProdutoClick(btnConsultaProduto);
      if Sender = dbedtCodigoEvento  then btnConsultaEventoClick(btnConsultaEvento);
    end else begin
      if Sender = edtListaCdUnid then btnListaUnidClick(btnListaUnid);
      if Sender = edtListaCdProd then btnListaProdClick(btnListaProd);
    end;
  end;
end;

procedure TfrmEtapa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //se pressionar ESC encerra
  if Key = #27 then btnSairClick(nil);
end;

procedure TfrmEtapa.FormShow(Sender: TObject);
begin
  pnlCadastro.Color      := clMenuBroker;
  pgctrlEtapa.ActivePage := tsLista;
  edtChave.SetFocus;
  //ativa botões atraves dos direitos de usuário
  AtivaBtnMenu(st_incluir, False, False, st_excluir);
end;

procedure TfrmEtapa.btnIncluirClick(Sender: TObject);
begin
  qryEtapa.Insert;
  //gera o codigo e grava a etapa
  qryEtapaIN_ETAPA_AUTOMATICA.AsString := '0';
  qryEtapaCD_ETAPA.AsInteger       := UltCod(qryUltimoCodigoEtapa, qryUltimoCodigoEtapaULTIMO);
  qryEtapaIN_ATIVO.AsInteger       := 1;
  qryEtapaIN_RETRABALHO.AsString   := '0';

  pgctrlEtapa.ActivePage := tsCadastro;

  dbedtDescricaoEtapa.SetFocus;
  dbnavEtapa.Enabled := False;
  edtChave.Enabled   := False;
  cmbOrdem.Enabled   := False;

  AtivaBtnMenu(False, True, True, False);
end;

procedure TfrmEtapa.btnSalvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then Exit;
  if not Grava then Exit;
end;

procedure TfrmEtapa.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmEtapa.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Este status será excluída! Confirma exclusão?',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
  try
    datm_main.db_broker.StartTransaction;

    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('DELETE FROM TETAPA_AUTOMATICA_ORDENA WHERE CD_ETAPA_AUTOMATICA = ''' + qryEtapa.FieldByName('CD_ETAPA').AsString + '''');
      ExecSQL;
      Free;
    end;

    qryEtapa.Delete;
    datm_main.db_broker.Commit;

    qryEtapa.Close;
    qryEtapa.SQL[4] := aStrIndice[cmbOrdem.ItemIndex];
    qryEtapa.Open;
  except
    on E: Exception do
    begin
      qryEtapa.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrlEtapa.ActivePage := tsLista;
end;

procedure TfrmEtapa.btnSairClick(Sender: TObject);
begin
  //fecha o form
  Close;
end;

procedure TfrmEtapa.edtChaveChange(Sender: TObject);
begin
  //busca pelo que for informado
  Localiza(qryEtapa, edtChave.Text, aStrIndice[cmbOrdem.ItemIndex]);
end;

procedure TfrmEtapa.cmbOrdemClick(Sender: TObject);
begin
  //altera a forma de busca
  vCodigoPesquisa := qryEtapaCD_ETAPA.AsString;
  { Apaga o campo de pesquisa }
  edtChave.Text := '';
  qryEtapa.Close;
  qryEtapa.SQL[4] := aStrIndice[cmbOrdem.ItemIndex];
  qryEtapa.Open;
  Localiza(qryEtapa, vCodigoPesquisa, aStrIndice[0] );
  edtChave.SetFocus;
end;

procedure TfrmEtapa.pgctrlEtapaChange(Sender: TObject);
begin
  if (pgctrlEtapa.ActivePage = tsLista ) then
  begin
    dbnavEtapa.Enabled := True;
    edtChave.Enabled   := True;
    cmbOrdem.Enabled   := True;
  end else if (pgctrlEtapa.ActivePage = tsCadastro) then
  begin
    dbnavEtapa.Enabled := False;
    edtChave.Enabled   := False;
    cmbOrdem.Enabled   := False;
  end else if (pgctrlEtapa.ActivePage = tsOrdena) then
  begin
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT NR_ORDEM, CD_ETAPA_AUTOMATICA');
      SQL.Add('  FROM TETAPA_AUTOMATICA_ORDENA');
      SQL.Add(' WHERE CD_UNID_NEG = ''' + edtListaCdUnid.Text + '''');
      SQL.Add('   AND CD_PRODUTO  = ''' + edtListaCdProd.Text + '''');
      SQL.Add(' ORDER BY NR_ORDEM');
      Open;
      lstCod.Clear;
      while not EOF do
      begin
        lstCod.Items.Add(FieldByName('CD_ETAPA_AUTOMATICA').AsString + ' - ' + ConsultaLookup('TETAPA','CD_ETAPA',FieldByName('CD_ETAPA_AUTOMATICA').AsString,'NM_ETAPA'));
        Next;
      end;
      Close;
      SQL.Clear;
      SQL.Add('SELECT CD_ETAPA FROM TETAPA');
      SQL.Add(' WHERE CD_UNID_NEG = ''' + edtListaCdUnid.Text + ''' AND CD_PRODUTO  = ''' + edtListaCdProd.Text + ''' AND IN_ETAPA_AUTOMATICA = ''1''');
      SQL.Add('   AND CD_ETAPA NOT IN (SELECT CD_ETAPA_AUTOMATICA FROM TETAPA_AUTOMATICA_ORDENA');
      SQL.Add('                         WHERE CD_UNID_NEG = ''' + edtListaCdUnid.Text + ''' AND CD_PRODUTO  = ''' + edtListaCdProd.Text + ''')');
      Open;
      while not EOF do
      begin
        lstCod.Items.Add(FieldByName('CD_ETAPA').AsString + ' - ' + ConsultaLookup('TETAPA','CD_ETAPA',FieldByName('CD_ETAPA').AsString,'NM_ETAPA'));
        Next;
      end;
      Close;
      Free;
    end;
  end;
end;

procedure TfrmEtapa.pgctrlEtapaChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure TfrmEtapa.dbedtCodigoUnidadeExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoUnidade);
end;

procedure TfrmEtapa.dbedtCodigoProdutoExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoProduto);
end;

procedure TfrmEtapa.dbedtCodigoEventoExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoEvento);
end;

procedure TfrmEtapa.btnConsultaUnidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryEtapa) then Exit;
    qryEtapaCD_UNID_NEG.Value := ConsultaOnLineEx('TUNID_NEG','Unidade de Negociação',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil);
  end
  else
    edtNomeUnidade.Text := ConsultaLookUp('TUNID_NEG','CD_UNID_NEG', dbedtCodigoUnidade.Text,'AP_UNID_NEG');
end;

procedure TfrmEtapa.btnConsultaProdutoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryEtapa) then Exit;
    qryEtapaCD_PRODUTO.Value := ConsultaOnLineEx('TPRODUTO','Unidade de Negociação',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil);
  end
  else
    edtNomeProduto.Text := ConsultaLookUp('TPRODUTO','CD_PRODUTO', dbedtCodigoProduto.Text,'NM_PRODUTO');
end;

procedure TfrmEtapa.btnConsultaEventoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryEtapa) then Exit;
    qryEtapaCD_EVENTO.Value := ConsultaOnLineEx('TEVENTO','Unidade de Negociação',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil);
  end
  else
    edtNomeEvento.Text := ConsultaLookUp('TEVENTO','CD_EVENTO', dbedtCodigoEvento.Text,'NM_EVENTO');
end;

procedure TfrmEtapa.dbgrdListaEtapaDblClick(Sender: TObject);
begin
  pgctrlEtapa.ActivePage := tsCadastro;
  dbedtDescricaoEtapa.SetFocus;
  qryEtapa.Edit;
end;

procedure TfrmEtapa.dbgrdListaEtapaKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbgrdListaEtapaDblClick(Sender);
end;

procedure TfrmEtapa.qryEtapaAfterDelete(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure TfrmEtapa.qryEtapaAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure TfrmEtapa.dsEtapaStateChange(Sender: TObject);
begin
  if dsEtapa.State in [dsEdit] then AtivaBtnMenu(False, True, True, False);
end;

procedure TfrmEtapa.qryEtapaCalcFields(DataSet: TDataSet);
begin
  //consulta online para os campos unidade, protudo e evento
  qryEtapa.FieldByName('calcUnidade').AsString := ConsultaLookUp('TUNID_NEG','CD_UNID_NEG', qryEtapaCD_UNID_NEG.AsString,'AP_UNID_NEG');
  qryEtapa.FieldByName('calcProduto').AsString := ConsultaLookUp('TPRODUTO','CD_PRODUTO', qryEtapaCD_PRODUTO.AsString,'AP_PRODUTO');
  qryEtapa.FieldByName('calcEvento').AsString  := ConsultaLookUp('TEVENTO','CD_EVENTO', qryEtapaCD_EVENTO.AsString,'NM_EVENTO');
  //exibe check para etapa ativa
  qryEtapa.FieldByName('calcInAtivo').AsString := '';
  if qryEtapaIN_ATIVO.AsInteger = 1 then qryEtapa.FieldByName('calcInAtivo').AsString := 'ü'
end;

procedure TfrmEtapa.btnListaUnidClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    edtListaCdUnid.Text := ConsultaOnlineExSQL('SELECT UN.CD_UNID_NEG CODIGO, UN.NM_UNID_NEG NOME, UN.AP_UNID_NEG APELIDO ' +
                           '  FROM TUNID_NEG UN WHERE UN.CD_UNID_NEG IN ' +
                           '  (SELECT DISTINCT UH.CD_UNID_NEG FROM TUSUARIO_HABILITACAO UH WHERE UH.CD_USUARIO = "' + str_cd_usuario + '") ',
                           'Unidades de Negócio', ['CODIGO', 'NOME', 'APELIDO'], ['Código', 'Unidade', 'Apelido'], 'CODIGO', nil, edtListaCdUnid.Text)
  else
    edtListaUnid.Text := ConsultaLookUpSQL('SELECT UN.NM_UNID_NEG NOME ' +
                         ' FROM TUNID_NEG UN WHERE UN.CD_UNID_NEG IN ' +
                         '      (SELECT DISTINCT UH.CD_UNID_NEG FROM TUSUARIO_HABILITACAO UH WHERE UH.CD_USUARIO = "' + str_cd_usuario + '") ' +
                         '   AND UN.CD_UNID_NEG = "' + edtListaCdUnid.Text + '" ', 'NOME');


end;

procedure TfrmEtapa.ReabreQry;
begin
  dsEtapa.AutoEdit := st_modificar;
  qryEtapa.Close;
  qryEtapa.SQL[4] := 'NM_ETAPA';
  qryEtapa.ParamByName('CD_UNID_NEG').AsString := edtListaCdUnid.Text;
  qryEtapa.ParamByName('CD_PRODUTO').AsString  := edtListaCdProd.Text;
  qryEtapa.Open;
end;

procedure TfrmEtapa.edtListaCdUnidExit(Sender: TObject);
begin
  if edtListaCdUnid.Text = '' then begin
    ShowMessage('Unidade de Negócio deve ser preenchida!');
    edtListaCdUnid.Clear;
    edtListaCdUnid.SetFocus;
  end else begin
    edtListaCdUnid.Text := Copy('00', 1, 2 - Length( edtListaCdUnid.Text)) +  edtListaCdUnid.Text;
    if edtListaUnid.Text = '' then begin
      ShowMessage('Unidade de Negócio não cadastrada ou não habilitada!');
      edtListaCdUnid.Clear;
      edtListaCdUnid.SetFocus;
    end else begin
      if edtListaNmProd.text <> '' then
        ReabreQry;
    end;
  end;
end;

procedure TfrmEtapa.edtListaCdProdExit(Sender: TObject);
begin
  if edtListaCdProd.Text = '' then begin
    ShowMessage('Produto deve ser preenchida!');
    edtListaCdProd.Clear;
    edtListaCdProd.SetFocus;
  end else begin
    edtListaCdProd.Text := Copy('00', 1, 2 - Length( edtListaCdProd.Text)) +  edtListaCdProd.Text;
    if edtListaNmProd.Text = '' then begin
      ShowMessage('Produto não cadastrada ou não habilitada!');
      edtListaCdProd.Clear;
      edtListaCdProd.SetFocus;
    end else begin
      if edtListaUnid.text <> '' then
        ReabreQry;
    end;
  end;
end;

procedure TfrmEtapa.btnListaProdClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    edtListaCdProd.Text := ConsultaOnlineExSQL('SELECT PR.CD_PRODUTO CODIGO, PR.NM_PRODUTO NOME, PR.AP_PRODUTO APELIDO ' +
                           '  FROM TPRODUTO PR WHERE PR.CD_PRODUTO IN ' +
                           '      (SELECT DISTINCT UH.CD_PRODUTO FROM TUSUARIO_HABILITACAO UH ' +
                           '        WHERE UH.CD_USUARIO = "' + str_cd_usuario + '" ' +
                           '          AND UH.CD_UNID_NEG = "' + edtListaCdUnid.Text + '") ',
                           'Produtos', ['CODIGO', 'NOME', 'APELIDO'], ['Código', 'Produto', 'Apelido'], 'CODIGO', nil, edtListaCdProd.Text)
  else
    edtListaNmProd.Text := ConsultaLookUpSQL('SELECT PR.NM_PRODUTO NOME ' +
                           '  FROM TPRODUTO PR WHERE PR.CD_PRODUTO IN ' +
                           '      (SELECT DISTINCT UH.CD_PRODUTO FROM TUSUARIO_HABILITACAO UH ' +
                           '        WHERE UH.CD_USUARIO = "' + str_cd_usuario + '" ' +
                           '          AND UH.CD_UNID_NEG = "' + edtListaCdUnid.Text + '") ' +
                           '   AND PR.CD_PRODUTO = "' + edtListaCdProd.Text + '" ', 'NOME');

end;

procedure TfrmEtapa.btnCimaClick(Sender: TObject);
var oldIndex : Integer;
begin
  if lstCod.ItemIndex = 0 then
    Exit;
  oldIndex := lstCod.ItemIndex-1;
  lstCod.Items.Move(lstCod.ItemIndex,lstCod.ItemIndex-1);
  lstCod.ItemIndex := oldIndex;
end;

procedure TfrmEtapa.btnBaixoClick(Sender: TObject);
var oldIndex : Integer;
begin
  if lstCod.ItemIndex = lstCod.Count-1 then
    Exit;
  oldIndex := lstCod.ItemIndex+1;
  lstCod.Items.Move(lstCod.ItemIndex,lstCod.ItemIndex+1);
  lstCod.ItemIndex := oldIndex;
end;

procedure TfrmEtapa.btnEfetivarClick(Sender: TObject);
var i : Integer;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('DELETE FROM TETAPA_AUTOMATICA_ORDENA');
    SQL.Add(' WHERE CD_UNID_NEG = ''' + edtListaCdUnid.Text + '''');
    SQL.Add('   AND CD_PRODUTO  = ''' + edtListaCdProd.Text + '''');
    ExecSql;
    for i := 0 to lstCod.Count-1 do
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO TETAPA_AUTOMATICA_ORDENA VALUES ('+IntToStr(i)+','''+Trim(ExtractWord(1,lstCod.Items.Strings[i],'-'))+''',''' + edtListaCdUnid.Text + ''',''' + edtListaCdProd.Text + ''')');
      ExecSql;
    end;
    Free;
  end;
end;

end.

