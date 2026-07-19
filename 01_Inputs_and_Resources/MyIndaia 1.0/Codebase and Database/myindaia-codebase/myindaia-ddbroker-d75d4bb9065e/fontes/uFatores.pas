unit uFatores;
           
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, TypInfo, StrUtils,
  cxGridDBTableView, cxGrid, DBTables, cxContainer, cxGroupBox, ExtCtrls,
  StdCtrls, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxDBEdit, AdvMemo, AdvmSQLS, DBAdvMemo,
  Buttons, Grids, DBGrids, cxGridBandedTableView, cxGridDBBandedTableView,
  cxCheckBox, cxSpinEdit, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  TfrmFatores = class(TForm)
    pgcFatores: TPageControl;
    tbsFatores: TTabSheet;
    tbsDadosBasicosFator: TTabSheet;
    cxgdbtvFatores: TcxGridDBTableView;
    cxglFatores: TcxGridLevel;
    cxgFatores: TcxGrid;
    AdvSQLMemoStyler1: TAdvSQLMemoStyler;
    cxgdbtvFatoresCD_FATOR: TcxGridDBColumn;
    cxgdbtvFatoresNM_FATOR: TcxGridDBColumn;
    pnlBotoes: TPanel;
    btnIncluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cxdbtxtNM_FATOR: TcxDBTextEdit;
    cxdbtxtDS_FATOR: TcxDBTextEdit;
    cxdblcbCD_UNID_NEG: TcxDBLookupComboBox;
    cxdblcbCD_PRODUTO: TcxDBLookupComboBox;
    cxdblcbCD_GRUPO: TcxDBLookupComboBox;
    cxdblcbNM_CAMPO_PROCESSO: TcxDBLookupComboBox;
    cxdblcbCD_COMPARADOR: TcxDBLookupComboBox;
    cxdbtxtNM_RETORNO: TcxDBTextEdit;
    cxdblcbIN_OPCIONAL: TcxDBLookupComboBox;
    dbadvmNM_SQL: TDBAdvMemo;
    tbsServicos: TTabSheet;
    tbsCampos: TTabSheet;
    tbsTriggers: TTabSheet;
    tbsEventos: TTabSheet;
    cxgEventos: TcxGrid;
    cxglEventos: TcxGridLevel;
    pnlDadosEventos: TPanel;
    Label13: TLabel;
    dbgrdFatoresServicos: TDBGrid;
    cxdblcbCD_SERVICO_FATOR: TcxDBLookupComboBox;
    cxgdbbtvEventos: TcxGridDBBandedTableView;
    cxStyleRepository1: TcxStyleRepository;
    cxsCaption: TcxStyle;
    Label15: TLabel;
    cxdblcbCD_EVENTO: TcxDBLookupComboBox;
    cxdblcbCD_EVENTO_ANTERIOR: TcxDBLookupComboBox;
    Label14: TLabel;
    cxdblcbCD_EVENTO_BASE: TcxDBLookupComboBox;
    Label16: TLabel;
    Label17: TLabel;
    cxdbspePZ_EVENTO_BASE: TcxDBSpinEdit;
    Label18: TLabel;
    Label19: TLabel;
    cxdblcbCD_SERVICO: TcxDBLookupComboBox;
    cxgbTabela: TcxGroupBox;
    cxdblcbNM_TABELA: TcxDBLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    cxdblcbNM_CAMPO_CHAVE_TABELA: TcxDBLookupComboBox;
    Label20: TLabel;
    cxdblcbNM_CAMPO_RETORNO_TABELA: TcxDBLookupComboBox;
    cxdbchkIN_INCLUIR: TcxDBCheckBox;
    cxdbchkIN_ALTERAR: TcxDBCheckBox;
    cxdbchkIN_EXCLUIR: TcxDBCheckBox;
    cxgdbbtvEventosCD_EVENTO: TcxGridDBBandedColumn;
    cxgdbbtvEventosCD_EVENTO_ANTERIOR: TcxGridDBBandedColumn;
    cxgdbbtvEventosCD_EVENTO_BASE: TcxGridDBBandedColumn;
    cxgdbbtvEventosPZ_EVENTO_BASE: TcxGridDBBandedColumn;
    cxgdbbtvEventosCD_SERVICO: TcxGridDBBandedColumn;
    cxgdbbtvEventosLK_NM_EVENTO: TcxGridDBBandedColumn;
    cxgdbbtvEventosLK_NM_EVENTO_ANTERIOR: TcxGridDBBandedColumn;
    cxgdbbtvEventosLK_NM_EVENTO_BASE: TcxGridDBBandedColumn;
    cxgdbbtvEventosLK_NM_SERVICO: TcxGridDBBandedColumn;
    cxgdbbtvEventosNM_OPERACAO: TcxGridDBBandedColumn;
    cxgdbtvFatoresLK_NM_GRUPO: TcxGridDBColumn;
    cxgdbtvFatoresLK_NM_PRODUTO: TcxGridDBColumn;
    cxdbchkIN_PRAZO_UTIL: TcxDBCheckBox;
    cxdbchkIN_PRAZO_FERIADO: TcxDBCheckBox;
    btnFollowup: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgcFatoresChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pgcFatoresChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure cxdbchkIN_INCLUIRMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFollowupClick(Sender: TObject);
  private
    FInTI: Boolean;
    FCargos: array of String;
    FUsuarios: array of String;
    function Grava: Boolean;
    function GetQuery(AControl: TControl = nil): TQuery;
    function GetListQuery(AControl: TControl = nil): TQuery;
    function GetPageQuery(APage: TTabSheet = nil): TQuery;
    procedure DoOnStateChange(Sender: TObject);
    function ValidatePage(APage: TTabSheet = nil): Boolean;
  public
    procedure AtualizaBotoes(AIncluir, ASalvar, ACancelar, AExcluir: Boolean);
  end;

var
  frmFatores: TfrmFatores;

implementation

uses
  PGGP017, dFatores, Funcoes, PGGP001, ConsOnlineEx;

{$R *.dfm}

procedure TfrmFatores.FormCreate(Sender: TObject);
var
  S, S2: String;
begin
  CarregaGridView(cxgdbtvFatores);
  FInTI := (str_cd_cargo = '001');
  Application.CreateForm(TdatmFatores, datmFatores);
  if tbsDadosBasicosFator.TabVisible <> (str_cd_cargo = '001') then
    tbsDadosBasicosFator.TabVisible := (str_cd_cargo = '001'); // Só o TI visualiza
  if tbsServicos.TabVisible <> (str_cd_cargo = '001') then
    tbsServicos.TabVisible := (str_cd_cargo = '001'); // Só o TI visualiza
  if tbsCampos.TabVisible <> (str_cd_cargo = '001') then
    tbsCampos.TabVisible := False;//(str_cd_cargo = '001'); // Só o TI visualiza
  if tbsTriggers.TabVisible <> (str_cd_cargo = '001') then
    tbsTriggers.TabVisible := False;//(str_cd_cargo = '001'); // Só o TI visualiza
  pgcFatores.ActivePageIndex := 0;
  datmFatores.OnStateChange := DoOnStateChange;
  DoOnStateChange(datmFatores.qryFatores);

  SetLength(FUsuarios, 2);
  FUsuarios[0] := '0088'; // Nelson
  FUsuarios[1] := '2330'; // Wagner

  SetLength(FCargos, 0);
  S := ConsultaLookUPSQL('SELECT MASTER.DBO.RowConcat(CD_CARGO + '','') AS CARGOS ' +
                         'FROM TCARGO ' +
                         'WHERE (NM_CARGO LIKE ''%COORD%'' OR NM_CARGO LIKE ''%GESTOR%'' OR NM_CARGO LIKE ''%GERENTE%'') ' +
                         '  AND IN_ATIVO = ''1''', 'CARGOS');
  while S <> '' do
  begin
    while (S <> '') and not (S[1] in ['0','1','2','3','4','5','6','7','8','9']) do
      Delete(S, 1, 1);
    S2 := '';
    while (S <> '') and (S[1] in ['0','1','2','3','4','5','6','7','8','9']) do
    begin
      S2 := S2 + S[1];
      Delete(S, 1, 1);
    end;
    if S2 <> '' then
    begin
      SetLength(FCargos, High(FCargos) +2);
      FCargos[High(FCargos)] := S2;
    end;
  end;
end;

procedure TfrmFatores.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Query: TDataSet;
begin
  if Key = VK_F5 then
  begin
    Query := GetListQuery;
    if Assigned(Query) then
    begin
      // Se estiver editando ou inserindo
      if Query.State in [dsEdit, dsInsert] then
      begin
        case MessageDlg('Há alterações não salvas. Deseja salvá-las antes de sair?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
          mrYes: if not Grava then
                   Exit;
          mrNo: { Deixa fechar a query };
          mrCancel: Exit;
        end;
      end;
      if Query.Active then
        Query.Close;
      Query.Open;
    end;
  end;
end;

procedure TfrmFatores.FormDestroy(Sender: TObject);
begin
  if Assigned(datmFatores) and (datmFatores.ComponentCount > 0) then
    FreeAndNil(datmFatores);
end;

procedure TfrmFatores.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFatores.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  if btnSalvar.Enabled then
    case MessageDlg('Há alterações não salvas. Deseja salvá-las antes de sair?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: if not Grava then
               CanClose := False;
      mrNo: { Apenas fecha };
      mrCancel: CanClose := False;
    end;
end;

procedure TfrmFatores.btnSalvarClick(Sender: TObject);
begin
  Grava;
end;

procedure TfrmFatores.btnCancelarClick(Sender: TObject);
var
  I: Integer;
  Query: TQuery;
begin
  Query := GetPageQuery;
  if Assigned(Query) and (Query.State in [dsEdit, dsInsert]) then
  begin
    case MessageDlg('Deseja realmente cancelar as alterações?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: { Deixa cancelar };
      mrNo: Exit;
      mrCancel: Exit;
    end;
    Query.Cancel;
  end;
end;

procedure TfrmFatores.btnIncluirClick(Sender: TObject);
var
  I: Integer;
begin
  // Fatores
  if (pgcFatores.ActivePage = tbsFatores) or (pgcFatores.ActivePage = tbsDadosBasicosFator) then
  begin
    pgcFatores.ActivePage := tbsDadosBasicosFator;
    cxdbtxtNM_FATOR.SetFocus;
    datmFatores.qryFatores.Append;
  end
  // Serviços
  else if (pgcFatores.ActivePage = tbsServicos) then
  begin
    cxdblcbCD_SERVICO_FATOR.SetFocus;
    datmFatores.qryFatoresServicos.Append;
  end
  // Campos
  else if (pgcFatores.ActivePage = tbsCampos) then
  begin

  end
  // Triggers
  else if (pgcFatores.ActivePage = tbsTriggers) then
  begin

  end
  // Eventos
  else
  begin
    cxdblcbCD_EVENTO.SetFocus;
    datmFatores.qryFatoresEvento.Append;
  end;
end;

function TfrmFatores.GetQuery(AControl: TControl): TQuery;
var
  DataSource: TDataSource;
begin
  if not Assigned(AControl) then
    AControl := ActiveControl;
  Result := nil;
  while Assigned(AControl) and not Assigned(Result) do
  begin
    // Grid
    if AControl is TcxGrid then
      DataSource := TcxGridDBTableView(TcxGrid(AControl).ActiveView).DataController.DataSource
    // Text Edit
    else if AControl is TcxDBTextEdit then
      DataSource := TcxDBTextEdit(AControl).DataBinding.DataSource
    // Lookup ComboBox
    else if AControl is TcxDBLookupComboBox then
      DataSource := TcxDBLookupComboBox(AControl).DataBinding.DataSource
    // Spin Edit
    else if AControl is TcxDBSpinEdit then
      DataSource := TcxDBSpinEdit(AControl).DataBinding.DataSource
    // CheckBox
    else if AControl is TcxDBCheckBox then
      DataSource := TcxDBCheckBox(AControl).DataBinding.DataSource
    // AdvMemo
    else if AControl is TDBAdvMemo then
      DataSource := TDBAdvMemo(AControl).DataSource
    else
      DataSource := nil;
    if Assigned(DataSource) then
      Result := TQuery(DataSource.DataSet)
    else
      Result := nil;
    if Assigned(Result) then
      Break;
    AControl := AControl.Parent;
  end;
end;

function TfrmFatores.Grava: Boolean;
var
  Query: TQuery;
  Inserindo: Boolean;
begin
  Query := GetPageQuery;

  if Assigned(Query) and (Query.State in [dsEdit, dsInsert]) and ValidatePage then
  begin
    Inserindo := Query.State = dsInsert;
    Query.Post;
    if Inserindo then
    begin
      Query.Close;
      Query.Open;
      Query.Last;
    end;
  end;
end;

procedure TfrmFatores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaGridView(cxgdbtvFatores);
  Action := caFree;
  if Assigned(datmFatores) and (datmFatores.ComponentCount > 0) then
    FreeAndNil(datmFatores);
end;

procedure TfrmFatores.pgcFatoresChanging(Sender: TObject; var AllowChange: Boolean);
var
  Query: TQuery;
begin
  if not btnSalvar.Enabled then
    AllowChange := True
  else
  begin
    case MessageDlg('Há alterações não salvas. Deseja salvar antes?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: begin
               btnSalvar.Click;
               AllowChange := not btnSalvar.Enabled;
             end;
      mrNo: btnCancelar.Click;
    else
      AllowChange := False;
    end;
  end;
  if AllowChange then
  begin
    Query := GetPageQuery;
    if Assigned(Query) and (Query <> datmFatores.qryFatores) and (Query.Active) then
      Query.Close;
  end;
end;

procedure TfrmFatores.pgcFatoresChange(Sender: TObject);
var
  Query: TQuery;
begin
  with datmFatores do
  begin
    Query := GetPageQuery;
    if Query <> qryFatores then
    begin
      if Query.Active then
        Query.Close;
      Query.Open;
    end
    else
      DoOnStateChange(Query)
  end;
end;

procedure TfrmFatores.AtualizaBotoes(AIncluir, ASalvar, ACancelar, AExcluir: Boolean);
begin
  btnIncluir.Enabled  := AIncluir;
  btnSalvar.Enabled   := ASalvar;
  btnCancelar.Enabled := ACancelar;
  btnExcluir.Enabled  := AExcluir;
  btnFollowup.Enabled := frm_main.btn_proc_realiza.Visible and not ASalvar;
end;

function TfrmFatores.GetListQuery(AControl: TControl): TQuery;
var
  DataSource: TDataSource;
begin
  if not Assigned(AControl) then
    AControl := ActiveControl;
  Result := nil;
  while Assigned(AControl) and not Assigned(Result) do
  begin
    // Lookup ComboBox
    if AControl is TcxDBLookupComboBox then
      DataSource := TcxDBLookupComboBox(AControl).Properties.ListSource
    else
      DataSource := nil;
    if Assigned(DataSource) then
      Result := TQuery(DataSource.DataSet)
    else
      Result := nil;
    if Assigned(Result) then
      Break;
    AControl := AControl.Parent;
  end;
end;

procedure TfrmFatores.DoOnStateChange(Sender: TObject);
var
  Aux: Boolean;
  Query: TQuery;
begin
  if Sender is TDataSource then
    Query := TQuery(TDataSource(Sender).DataSet)
  else if Sender is TQuery then
    Query := TQuery(Sender)
  else
    Query := nil;
  if Assigned(Query) then
  begin
    if not Query.Active then
      AtualizaBotoes(False, False, False, False)
    else
    begin         // Habilitado para o Wagner e Nelson
      Aux := FInTI or (AnsiIndexText(str_cd_usuario, FUsuarios) >= 0) or (AnsiIndexText(str_cd_cargo, FCargos) >= 0);
      AtualizaBotoes(Aux and not (Query.State in [dsEdit, dsInsert]), (Query.State in [dsEdit, dsInsert]),
         (Query.State in [dsEdit, dsInsert]), Aux and (Query.RecordCount > 0) and not (Query.State in [dsEdit, dsInsert]));
      btnIncluir.Enabled := btnIncluir.Enabled and datmFatores.PodeIncluir;
      btnExcluir.Enabled := btnExcluir.Enabled and datmFatores.PodeExcluir;
    end;
  end;
end;

function TfrmFatores.GetPageQuery(APage: TTabSheet): TQuery;
begin
  if not Assigned(APage) then
    APage := pgcFatores.ActivePage;
  if (APage = tbsFatores) or (APage = tbsDadosBasicosFator) then
    Result := datmFatores.qryFatores
  else if (APage = tbsServicos) then
    Result := datmFatores.qryFatoresServicos
  else if (APage = tbsCampos) then
    Result := datmFatores.qryFatoresCampos
  else if (APage = tbsTriggers) then
    Result := datmFatores.qryFatoresTriggers
  else if (APage = tbsEventos) then
    Result := datmFatores.qryFatoresEvento
  else
    Result := nil;
end;

procedure TfrmFatores.btnExcluirClick(Sender: TObject);
var
  Query: TQuery;
begin
  Query := GetPageQuery;
  if Assigned(Query) and (MessageDlg('Deseja realmente excluir este item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    Query.Delete;
end;

function TfrmFatores.ValidatePage(APage: TTabSheet): Boolean;
  function ValidateFatores: Boolean;
  var
    Msg: String;
  begin
    with datmFatores do
    begin
      Msg := '';
      if (Trim(qryFatoresNM_SQL.AsString) = '') and (Trim(dbadvmNM_SQL.Lines.Text) <> '') and btnSalvar.Enabled then
        qryFatoresNM_SQL.AsString := Trim(dbadvmNM_SQL.Lines.Text);
      if Trim(qryFatoresNM_FATOR.AsString) = '' then
      begin
        cxdbtxtNM_FATOR.SetFocus;
        Msg := 'É necessário informar um nome para o fator.';
      end
      else if Trim(qryFatoresIN_OPCIONAL.AsString) = '' then
      begin
        cxdblcbIN_OPCIONAL.SetFocus;
        Msg := 'É necessário informar se os campos do fator serão opcionais ou não.';
      end
      else if Trim(qryFatoresCD_UNID_NEG.AsString) = '' then
      begin
        cxdblcbCD_UNID_NEG.SetFocus;
        Msg := 'É necessário informar a Unidade de Negócio para o fator.';
      end
      else if Trim(qryFatoresCD_PRODUTO.AsString) = '' then
      begin
        cxdblcbCD_PRODUTO.SetFocus;
        Msg := 'É necessário informar o Produto para o fator.';
      end
      else if Trim(qryFatoresCD_GRUPO.AsString) = '' then
      begin
        cxdblcbCD_GRUPO.SetFocus;
        Msg := 'É necessário informar o Grupo de Clientes para o fator.';
      end
      else if (Trim(qryFatoresNM_CAMPO_PROCESSO.AsString) = '') and (Trim(qryFatoresNM_SQL.AsString) = '') then
      begin
        cxdblcbNM_CAMPO_PROCESSO.SetFocus;
        Msg := 'É necessário informar um meio de consulta para o resultado do fator.';
      end
      else if (Trim(qryFatoresNM_TABELA.AsString) <> '') then
      begin
        if (Trim(qryFatoresNM_CAMPO_PROCESSO.AsString) = '') then
        begin
          cxdblcbNM_CAMPO_PROCESSO.SetFocus;
          Msg := 'É necessário informar o campo da tabela TPROCESSO.';
        end
        else if (Trim(qryFatoresNM_CAMPO_CHAVE_TABELA.AsString) = '') then
        begin
          cxdblcbNM_CAMPO_CHAVE_TABELA.SetFocus;
          Msg := 'É necessário informar o campo chave da tabela ' + qryFatoresNM_TABELA.AsString + '.';
        end
        else if (Trim(qryFatoresNM_CAMPO_RETORNO_TABELA.AsString) = '') then
        begin
          cxdblcbNM_CAMPO_RETORNO_TABELA.SetFocus;
          Msg := 'É necessário informar o campo de retorno da tabela ' + qryFatoresNM_TABELA.AsString + '.';
        end;
      end
      else if (Trim(qryFatoresCD_COMPARADOR.AsString) = '') then
      begin
        cxdblcbCD_COMPARADOR.SetFocus;
        Msg := 'É necessário informar o comparador para o resultado do fator.';
      end;

      if Msg = '' then
        if (Trim(qryFatoresCD_COMPARADOR.AsString) = '') then
        begin
          cxdblcbCD_COMPARADOR.SetFocus;
          Msg := 'É necessário informar o comparador para o resultado do fator.';
        end
        else if (Trim(qryFatoresNM_RETORNO.AsString) = '') then
        begin
          cxdbtxtNM_RETORNO.SetFocus;
          Msg := 'É necessário informar o comparador para o resultado do fator.';
        end;
    end;
    Result := Msg = '';
    if not Result then
      MessageDlg(Msg, mtError, [mbOk], 0);
  end;

  function ValidateServicos: Boolean;
  begin
    Result := False;
  end;

  function ValidateCampos: Boolean;
  begin
    Result := False;
  end;

  function ValidateTriggers: Boolean;
  begin
    Result := False;
  end;

  function ValidateEventos: Boolean;
  var
    Msg: String;
  begin
    with datmFatores do
    begin
      Msg := '';
      if Trim(qryFatoresEventoCD_EVENTO.AsString) = '' then
      begin
        cxdblcbCD_EVENTO.SetFocus;
        Msg := 'É necessário informar o evento.';
      end
      else if Trim(qryFatoresIN_OPCIONAL.AsString) = '' then
      begin
        cxdblcbIN_OPCIONAL.SetFocus;
        Msg := 'É necessário informar se os campos do fator serão opcionais ou não.';
      end
      else if Trim(qryFatoresCD_UNID_NEG.AsString) = '' then
      begin
        cxdblcbCD_UNID_NEG.SetFocus;
        Msg := 'É necessário informar a Unidade de Negócio para o fator.';
      end
      else if Trim(qryFatoresCD_PRODUTO.AsString) = '' then
      begin
        cxdblcbCD_PRODUTO.SetFocus;
        Msg := 'É necessário informar o Produto para o fator.';
      end
      else if Trim(qryFatoresCD_GRUPO.AsString) = '' then
      begin
        cxdblcbCD_GRUPO.SetFocus;
        Msg := 'É necessário informar o Grupo de Clientes para o fator.';
      end
      else if (Trim(qryFatoresNM_CAMPO_PROCESSO.AsString) = '') and (Trim(qryFatoresNM_SQL.AsString) = '') then
      begin
        cxdblcbNM_CAMPO_PROCESSO.SetFocus;
        Msg := 'É necessário informar um meio de consulta para o resultado do fator.';
      end
      else if (Trim(qryFatoresNM_TABELA.AsString) <> '') then
      begin
        if (Trim(qryFatoresNM_CAMPO_PROCESSO.AsString) = '') then
        begin
          cxdblcbNM_CAMPO_PROCESSO.SetFocus;
          Msg := 'É necessário informar o campo da tabela TPROCESSO.';
        end
        else if (Trim(qryFatoresNM_CAMPO_CHAVE_TABELA.AsString) = '') then
        begin
          cxdblcbNM_CAMPO_CHAVE_TABELA.SetFocus;
          Msg := 'É necessário informar o campo chave da tabela ' + qryFatoresNM_TABELA.AsString + '.';
        end
        else if (Trim(qryFatoresNM_CAMPO_RETORNO_TABELA.AsString) = '') then
        begin
          cxdblcbNM_CAMPO_RETORNO_TABELA.SetFocus;
          Msg := 'É necessário informar o campo de retorno da tabela ' + qryFatoresNM_TABELA.AsString + '.';
        end;
      end{---Guilherme e Michel 23/04/2013
      else if (Trim(qryFatoresNM_SQL.AsString) = '') then
      begin
        dbadvmNM_SQL.SetFocus;
        Msg := 'É necessário informar o comparador para o resultado do fator.';
      end};

      if Msg = '' then
        if (Trim(qryFatoresCD_COMPARADOR.AsString) = '') then
        begin
          cxdblcbCD_COMPARADOR.SetFocus;
          Msg := 'É necessário informar o comparador para o resultado do fator.';
        end
        else if (Trim(qryFatoresNM_RETORNO.AsString) = '') then
        begin
          cxdbtxtNM_RETORNO.SetFocus;
          Msg := 'É necessário informar o comparador para o resultado do fator.';
        end;
    end;
    Result := Msg = '';
    if not Result then
      MessageDlg(Msg, mtError, [mbOk], 0);
  end;
begin
  if not Assigned(APage) then
    APage := pgcFatores.ActivePage;
  Self.SelectNext(ActiveControl, True, True);
  Self.SelectNext(ActiveControl, False, True);

  if (APage = tbsFatores) or (APage = tbsDadosBasicosFator) then
    Result := ValidateFatores
  else if (APage = tbsServicos) then
    Result := ValidateServicos
  else if (APage = tbsCampos) then
    Result := ValidateCampos
  else if (APage = tbsTriggers) then
    Result := ValidateTriggers
  else if (APage = tbsEventos) then
    Result := ValidateEventos
  else
    Result := False;
end;

procedure TfrmFatores.cxdbchkIN_INCLUIRMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with datmfatores do
  begin
    if not (qryFatoresEvento.State in [dsEdit, dsInsert]) then
    begin
      if (qryFatoresEventoCD_EVENTO.AsString <> '') and PodeModificar then
        qryFatoresEvento.Edit
      else if (qryFatoresEventoCD_EVENTO.AsString = '') and PodeIncluir then
        qryFatoresEvento.Append;
    end;
    if (qryFatoresEvento.State in [dsEdit, dsInsert]) then
    begin
      if qryFatoresEventoIN_ALTERAR.AsString = '1' then
        qryFatoresEventoIN_ALTERAR.AsString := '0';
      if qryFatoresEventoIN_EXCLUIR.AsString = '1' then
        qryFatoresEventoIN_EXCLUIR.AsString := '0';
    end;
  end;
end;

procedure TfrmFatores.btnFollowupClick(Sender: TObject);
var
  old_vstr_cd_modulo, old_str_cd_rotina: String;
begin
  old_vstr_cd_modulo := vstr_cd_modulo;
  old_str_cd_rotina := str_cd_rotina;

  try
    frm_main.btn_proc_realiza.Click;
  finally
    vstr_cd_modulo := old_vstr_cd_modulo;
    str_cd_rotina := old_str_cd_rotina;
  end;
end;

end.
