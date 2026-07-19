unit uEtapaProdutoEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, DBTables, Grids, DBGrids, ComCtrls, ExtCtrls,
  StdCtrls, Mask, DBCtrls;

type
  TfrmEtapaProdutoEvento = class(TForm)
    pnlOpcoes: TPanel;
    pgcEtapaEvento: TPageControl;
    tbsEtapas: TTabSheet;
    tbsEventos: TTabSheet;
    dsEtapaProduto: TDataSource;
    dbgrdEtapaProduto: TDBGrid;
    qryEtapaProduto: TQuery;
    updEtapaProduto: TUpdateSQL;
    qryEtapaProdutoCD_ETAPA: TAutoIncField;
    qryEtapaProdutoNM_ETAPA: TStringField;
    qryEtapaProdutoCD_PRODUTO: TStringField;
    qryProduto: TQuery;
    qryProdutoCD_PRODUTO: TStringField;
    qryProdutoNM_PRODUTO: TStringField;
    qryProdutoAP_PRODUTO: TStringField;
    qryEtapaProdutoNM_PRODUTO: TStringField;
    btnIncluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    qryEtapaProdutoIN_ATIVO: TStringField;
    dsEtapaProdutoEvento: TDataSource;
    qryEtapaProdutoEvento: TQuery;
    updEtapaProdutoEvento: TUpdateSQL;
    qryEtapaProdutoEventoCD_ETAPA: TIntegerField;
    qryEtapaProdutoEventoCD_EVENTO: TStringField;
    qryEvento: TQuery;
    qryEventoCD_EVENTO: TStringField;
    qryEventoNM_EVENTO: TStringField;
    qryEtapaProdutoEventoNM_EVENTO: TStringField;
    pnlDadosBasicos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbchkIN_ATIVO: TDBCheckBox;
    dbedtCD_ETAPA: TDBEdit;
    dbedtNM_ETAPA: TDBEdit;
    dbedtCD_PRODUTO: TDBEdit;
    dbedtNM_PRODUTO: TDBEdit;
    btnProduto: TSpeedButton;
    dbgrdEtapaProdutoEvento: TDBGrid;
    qryEventoCD_NM_EVENTO: TStringField;
    qryEtapaProdutoEventoCD_NM_EVENTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure dsEtapaProdutoStateChange(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure pgcEtapaEventoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgcEtapaEventoChange(Sender: TObject);
    procedure qryEtapaProdutoNewRecord(DataSet: TDataSet);
    procedure qryEtapaProdutoEventoNewRecord(DataSet: TDataSet);
    procedure qryEtapaProdutoAfterPost(DataSet: TDataSet);
    procedure qryEtapaProdutoEventoAfterPost(DataSet: TDataSet);
  private
    FIncluir, FExcluir, FAlterar: Boolean;
  public
    procedure AtualizaBotoes;
  end;

var
  frmEtapaProdutoEvento: TfrmEtapaProdutoEvento;

implementation

uses
  PGGP017, GSMLIB, Funcoes, ConsOnlineEx;

{$R *.dfm}

procedure TfrmEtapaProdutoEvento.FormCreate(Sender: TObject);
begin
  qryProduto.Open;
  qryEtapaProduto.Open;

  vStr_cd_modulo := '01';
  str_cd_rotina := '0102';
  AtribuiDireitos(FAlterar, FIncluir, FExcluir);
  dsEtapaProduto.AutoEdit       := FAlterar;
  dsEtapaProdutoEvento.AutoEdit := FAlterar;
  pgcEtapaEvento.ActivePage := tbsEtapas;
  AtualizaBotoes;
end;

procedure TfrmEtapaProdutoEvento.dsEtapaProdutoStateChange(Sender: TObject);
begin
  AtualizaBotoes;
end;

procedure TfrmEtapaProdutoEvento.AtualizaBotoes;
begin
  if (pgcEtapaEvento.ActivePage = tbsEtapas) then
  begin
    btnIncluir.Enabled  := FIncluir and qryEtapaProduto.Active;
    btnSalvar.Enabled   := qryEtapaProduto.Active and (dsEtapaProduto.State in [dsEdit, dsInsert]);
    btnCancelar.Enabled := btnSalvar.Enabled;
    btnExcluir.Enabled  := FExcluir and qryEtapaProduto.Active and (not btnSalvar.Enabled) and (not qryEtapaProduto.Eof);
    btnProduto.Enabled  := FIncluir or FAlterar;
  end
  else
  begin
    btnIncluir.Enabled  := FIncluir and qryEtapaProdutoEvento.Active;
    btnSalvar.Enabled   := qryEtapaProdutoEvento.Active and (qryEtapaProdutoEvento.State in [dsEdit, dsInsert]);
    btnCancelar.Enabled := btnSalvar.Enabled;
    btnExcluir.Enabled  := FExcluir and qryEtapaProdutoEvento.Active and (not btnSalvar.Enabled) and (not qryEtapaProdutoEvento.Eof);
  end;
end;

procedure TfrmEtapaProdutoEvento.btnIncluirClick(Sender: TObject);
begin
  if (pgcEtapaEvento.ActivePage = tbsEtapas) then
  begin
    qryEtapaProduto.Append;
    dbedtNM_ETAPA.SetFocus;
  end
  else
  begin
    qryEtapaProdutoEvento.Append;
    dbgrdEtapaProdutoEvento.SetFocus;
  end;
end;

procedure TfrmEtapaProdutoEvento.btnSalvarClick(Sender: TObject);
begin
  if (pgcEtapaEvento.ActivePage = tbsEtapas) then
    qryEtapaProduto.Post
  else
    qryEtapaProdutoEvento.Post;
end;

procedure TfrmEtapaProdutoEvento.btnCancelarClick(Sender: TObject);
begin
  if (pgcEtapaEvento.ActivePage = tbsEtapas) then
    qryEtapaProduto.Cancel
  else
    qryEtapaProdutoEvento.Cancel;
end;

procedure TfrmEtapaProdutoEvento.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    if (pgcEtapaEvento.ActivePage = tbsEtapas) then
      qryEtapaProduto.Delete
    else
      qryEtapaProdutoEvento.Delete;
end;

procedure TfrmEtapaProdutoEvento.btnProdutoClick(Sender: TObject);
var
  S: String;
begin
  S := qryEtapaProdutoCD_PRODUTO.AsString;
  S := ConsultaOnLineExSQL('SELECT CD_PRODUTO, NM_PRODUTO, AP_PRODUTO FROM TPRODUTO WHERE IN_ATIVO = ''1''', 'Produto', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Nome'], 'CD_PRODUTO', nil, S);
  if S <> qryEtapaProdutoCD_PRODUTO.AsString then
  begin
    if not (qryEtapaProduto.State in [dsEdit, dsInsert]) then
      qryEtapaProduto.Edit;
    qryEtapaProdutoCD_PRODUTO.AsString := S;
  end;
end;

procedure TfrmEtapaProdutoEvento.pgcEtapaEventoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (qryEtapaProduto.State in [dsEdit, dsInsert]) or (qryEtapaProdutoEvento.State in [dsEdit, dsInsert]) then
    case MessageDlg('As alterações ainda não foram salvas.'#13'Deseja salvar antes de mudar de guia?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: begin
               if (qryEtapaProduto.State in [dsEdit, dsInsert]) then
                 qryEtapaProduto.Post
               else
                 qryEtapaProdutoEvento.Post;
               AllowChange := True;
             end;
      mrNo: begin
              if (qryEtapaProduto.State in [dsEdit, dsInsert]) then
                 qryEtapaProduto.Cancel
               else
                 qryEtapaProdutoEvento.Cancel;
               AllowChange := True;
            end;
    else
      AllowChange := False;
    end
  else
    AllowChange := True;
end;

procedure TfrmEtapaProdutoEvento.pgcEtapaEventoChange(Sender: TObject);
begin
  if qryEtapaProdutoEvento.Active then
    qryEtapaProdutoEvento.Close;
  if pgcEtapaEvento.ActivePage = tbsEventos then
  begin
    qryEtapaProdutoEvento.ParamByName('CD_ETAPA').AsInteger := qryEtapaProdutoCD_ETAPA.AsInteger;
    qryEtapaProdutoEvento.Open;
  end;
  AtualizaBotoes;
end;

procedure TfrmEtapaProdutoEvento.qryEtapaProdutoNewRecord(DataSet: TDataSet);
begin
  qryEtapaProdutoIN_ATIVO.AsString := '1';
end;

procedure TfrmEtapaProdutoEvento.qryEtapaProdutoEventoNewRecord(DataSet: TDataSet);
begin
  qryEtapaProdutoEventoCD_ETAPA.AsInteger := qryEtapaProdutoCD_ETAPA.AsInteger;
end;

procedure TfrmEtapaProdutoEvento.qryEtapaProdutoAfterPost(DataSet: TDataSet);
begin
  qryEtapaProduto.ApplyUpdates;
  if VarIsNull(qryEtapaProdutoCD_ETAPA.AsVariant) then // Quer dizer que é inserção. Então fecha, abre e posiciona o cursor no último registro
  begin
    qryEtapaProduto.Close;
    qryEtapaProduto.Open;
    qryEtapaProduto.Last;
  end;
end;

procedure TfrmEtapaProdutoEvento.qryEtapaProdutoEventoAfterPost(DataSet: TDataSet);
begin
  qryEtapaProdutoEvento.ApplyUpdates;
end;

end.
