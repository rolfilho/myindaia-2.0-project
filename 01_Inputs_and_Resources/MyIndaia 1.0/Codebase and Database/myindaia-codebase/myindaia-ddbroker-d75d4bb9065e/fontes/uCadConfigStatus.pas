unit uCadConfigStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, DBTables, Mask;

type
  TfrmCadConfigStatus = class(TForm)
    pgctrlEtapa: TPageControl;
    tsLista: TTabSheet;
    dbgrdLista: TDBGrid;
    tsCadastro: TTabSheet;
    bvlDadosBasicos: TBevel;
    bvlSeparador: TBevel;
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
    dbnavEtapa: TDBNavigator;
    mmCadastro: TMainMenu;
    mniIncluir: TMenuItem;
    mniSalvar: TMenuItem;
    mniCancelar: TMenuItem;
    mniExcluir: TMenuItem;
    mniSair: TMenuItem;
    dsCadConfigStatus: TDataSource;
    dsCadConfigStatusDetail: TDataSource;
    qryCadConfigStatus: TQuery;
    qryCadConfigStatusDetail: TQuery;
    qryCadConfigStatusNR_CAD_CONFIG_STATUS: TAutoIncField;
    qryCadConfigStatusTX_CAD_CONFIG_STATUS: TStringField;
    qryCadConfigStatusDetailNR_CAD_CONFIG_STATUS: TIntegerField;
    qryCadConfigStatusDetailCD_ETAPA: TIntegerField;
    qryCadConfigStatusDetailCD_EVENTO: TStringField;
    pnlMaster: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    btnIncluirDetail: TSpeedButton;
    btnSalvarDetail: TSpeedButton;
    btnCancelarDetail: TSpeedButton;
    btnExcluirDetail: TSpeedButton;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    qryCadConfigStatusDetailcalcEtapa: TStringField;
    qryCadConfigStatusDetailcalcEvento: TStringField;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pgctrlEtapaChange(Sender: TObject);
    procedure dsCadConfigStatusStateChange(Sender: TObject);
    procedure dsCadConfigStatusDetailStateChange(Sender: TObject);
    procedure btnIncluirDetailClick(Sender: TObject);
    procedure btnSalvarDetailClick(Sender: TObject);
    procedure btnCancelarDetailClick(Sender: TObject);
    procedure btnExcluirDetailClick(Sender: TObject);
    procedure qryCadConfigStatusDetailBeforePost(DataSet: TDataSet);
    procedure qryCadConfigStatusDetailCalcFields(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure qryCadConfigStatusDetailPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
  private
    st_modificar, st_incluir, st_excluir : Boolean;
    procedure Cancelar;
    function Grava: Boolean;
    procedure AtivaBtnMenu(i, s, c, e: Boolean);
    procedure AtivaBtnMenuDetail(i, s, c, e: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadConfigStatus: TfrmCadConfigStatus;

implementation

uses PGGP017, GSMLIB, ConsOnlineEx;

{$R *.dfm}

procedure TfrmCadConfigStatus.btnIncluirClick(Sender: TObject);
begin
  qryCadConfigStatus.Insert;
  pgctrlEtapa.ActivePage := tsCadastro;
  DBEdit2.SetFocus;
  dbnavEtapa.Enabled := False;
  edtChave.Enabled   := False;
  cmbOrdem.Enabled   := False;
end;

procedure TfrmCadConfigStatus.btnSalvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Grava then Exit;
end;

function TfrmCadConfigStatus.Grava : Boolean;
var
  vPosicao: string;
begin
  Grava := True;
  Screen.Cursor := crHourGlass;
  try
    datm_main.db_broker.StartTransaction;
    qryCadConfigStatus.Post;
    vPosicao := qryCadConfigStatusNR_CAD_CONFIG_STATUS.AsString;
    //fecha e abre tabela e posiciona registro
    qryCadConfigStatus.Close;
    qryCadConfigStatus.Open;
    Localiza(qryCadConfigStatus, vPosicao, 'NR_CAD_CONFIG_STATUS');
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if dsCadConfigStatus.State in [dsInsert,dsEdit] then qryCadConfigStatus.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
end;

procedure TfrmCadConfigStatus.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmCadConfigStatus.Cancelar;
begin
  try
    qryCadConfigStatus.Cancel;
    //ativa botões atraves dos direitos de usuário
  except
    Application.MessageBox('Falha ao tentar cancelar a edição dos dados!','Erro',0);
  end;
end;

procedure TfrmCadConfigStatus.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Este status será excluída! Confirma exclusão?',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
  try
    datm_main.db_broker.StartTransaction;
    qryCadConfigStatus.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      qryCadConfigStatus.Cancel;
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrlEtapa.ActivePage := tsLista;
end;

procedure TfrmCadConfigStatus.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadConfigStatus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCadConfigStatus.FormCreate(Sender: TObject);
begin
  pgctrlEtapa.ActivePage := tsLista;
  qryCadConfigStatus.Open;
end;

procedure TfrmCadConfigStatus.pgctrlEtapaChange(Sender: TObject);
begin
  if pgctrlEtapa.ActivePage = tsLista then
  begin
    qryCadConfigStatusDetail.Close;
    dbnavEtapa.DataSource := dsCadConfigStatus;
  end else begin
    qryCadConfigStatusDetail.Open;
    dbnavEtapa.DataSource := dsCadConfigStatusDetail;
  end;
end;

procedure TfrmCadConfigStatus.AtivaBtnMenu(i, s, c, e: Boolean);
begin
  // habilita/desabilita os botões do form
  btnIncluir.Enabled  := i;  mniIncluir.Enabled  := i;
  btnSalvar.Enabled   := s;  mniSalvar.Enabled   := s;
  btnCancelar.Enabled := c;  mniCancelar.Enabled := c;
  btnExcluir.Enabled  := e;  mniExcluir.Enabled  := e;
end;

procedure TfrmCadConfigStatus.AtivaBtnMenuDetail(i, s, c, e: Boolean);
begin
  // habilita/desabilita os botões do form
  btnIncluirDetail.Enabled  := i;
  btnSalvarDetail.Enabled   := s;
  btnCancelarDetail.Enabled := c;
  btnExcluirDetail.Enabled  := e;
//  DBGrid1.Enabled := s;
end;

procedure TfrmCadConfigStatus.dsCadConfigStatusStateChange(
  Sender: TObject);
begin
  AtivaBtnMenu((dsCadConfigStatus.state = dsBrowse),
               (dsCadConfigStatus.state in [dsEdit, dsInsert]),
               (dsCadConfigStatus.state in [dsEdit, dsInsert]),
               not (qryCadConfigStatus.IsEmpty));
end;

procedure TfrmCadConfigStatus.dsCadConfigStatusDetailStateChange(
  Sender: TObject);
begin
  AtivaBtnMenuDetail((dsCadConfigStatusDetail.state = dsBrowse),
                     (dsCadConfigStatusDetail.state in [dsEdit, dsInsert]),
                     (dsCadConfigStatusDetail.state in [dsEdit, dsInsert]),
                     not (qryCadConfigStatusDetail.IsEmpty));
end;

procedure TfrmCadConfigStatus.btnIncluirDetailClick(Sender: TObject);
begin
  DBGrid1.SetFocus;
  qryCadConfigStatusDetail.Insert;
end;

procedure TfrmCadConfigStatus.btnSalvarDetailClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    datm_main.db_broker.StartTransaction;
    qryCadConfigStatusDetail.Post;
    //fecha e abre tabela e posiciona registro
    qryCadConfigStatusDetail.Close;
    qryCadConfigStatusDetail.Open;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if dsCadConfigStatusDetail.State in [dsInsert,dsEdit] then qryCadConfigStatusDetail.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure TfrmCadConfigStatus.btnCancelarDetailClick(Sender: TObject);
begin
  try
    qryCadConfigStatusDetail.Cancel;
  except
    Application.MessageBox('Falha ao tentar cancelar a edição dos dados!','Erro',0);
  end;
end;

procedure TfrmCadConfigStatus.btnExcluirDetailClick(Sender: TObject);
begin
  if MessageDlg('Este status será excluída! Confirma exclusão?',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
  try
    datm_main.db_broker.StartTransaction;
    qryCadConfigStatusDetail.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      qryCadConfigStatusDetail.Cancel;
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure TfrmCadConfigStatus.qryCadConfigStatusDetailBeforePost(
  DataSet: TDataSet);
begin
  qryCadConfigStatusDetail.FieldByName('NR_CAD_CONFIG_STATUS').AsInteger := qryCadConfigStatus.FieldByName('NR_CAD_CONFIG_STATUS').AsInteger;
//  if ( qryCadConfigStatusDetail.FieldByName('CD_ETAPA').AsString = '' ) or
//     ( qryCadConfigStatusDetail.FieldByName('CD_EVENTO').AsString = '' ) then
//    qryCadConfigStatusDetail.
end;

procedure TfrmCadConfigStatus.qryCadConfigStatusDetailCalcFields(
  DataSet: TDataSet);
begin
  qryCadConfigStatusDetail.FieldByName('calcEtapa').AsString :=
    ConsultaLookUp('TETAPA','CD_ETAPA',qryCadConfigStatusDetail.FieldByName('CD_ETAPA').AsString,'NM_ETAPA');
  qryCadConfigStatusDetail.FieldByName('calcEvento').AsString :=
    ConsultaLookUp('TEVENTO','CD_EVENTO',qryCadConfigStatusDetail.FieldByName('CD_EVENTO').AsString,'NM_EVENTO');
end;

procedure TfrmCadConfigStatus.DBGrid1DblClick(Sender: TObject);
begin
  if DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName = 'CD_ETAPA' then
    qryCadConfigStatusDetail.FieldByName('CD_ETAPA').AsString :=
      ConsultaOnLineExSQL('SELECT CD_ETAPA,NM_ETAPA FROM TETAPA WHERE IN_ETAPA_AUTOMATICA = ''1''','Etapas',['CD_ETAPA','NM_ETAPA'],['Código','Descrição'],'CD_ETAPA');
  if DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName = 'CD_EVENTO' then
    qryCadConfigStatusDetail.FieldByName('CD_EVENTO').AsString :=
      ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Descrição'],'CD_EVENTO');
end;

procedure TfrmCadConfigStatus.qryCadConfigStatusDetailPostError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  TrataErro(E);
  Action := daAbort;
end;

end.
