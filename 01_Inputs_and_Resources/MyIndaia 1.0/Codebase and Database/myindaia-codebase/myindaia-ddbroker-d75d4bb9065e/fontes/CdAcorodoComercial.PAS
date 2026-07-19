unit CdAcorodoComercial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxDBComb, Mask, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Menus,DB, DBTables, PGGP017, KrComunication;

type
  TfrmCdAcordoComercial = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_cntr: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    lbl_nm_pais: TLabel;
    dbedt_Acordo: TDBEdit;
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dsMain: TDataSource;
    dbedit_Acronimo: TDBEdit;
    Label3: TLabel;
    dbedt_Descricao: TDBEdit;
    Label4: TLabel;
    dsPais: TDataSource;
    QryPais: TQuery;
    QryPaisCODIGO: TStringField;
    QryPaisDESCRICAO: TStringField;
    updMain: TUpdateSQL;
    qryMain: TQuery;
    qryMainID: TAutoIncField;
    qryMainACORDO: TStringField;
    qryMainACRONIMO: TStringField;
    qryMainDESCRICAO: TStringField;
    tsPaises: TTabSheet;
    dsPaises: TDataSource;
    qryPaises: TQuery;
    updPaises: TUpdateSQL;
    qryPaisesID: TAutoIncField;
    qryPaisesACORDO_COMERCIAL_ID: TIntegerField;
    qryPaisesPAIS_CODIGO: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    qryPaisesPAIS_NOME: TStringField;
    Panel3: TPanel;
    DBLookupComboBox: TDBLookupComboBox;
    Label5: TLabel;
    btnIncluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    Label6: TLabel;
    dbedt_Fiesp: TDBEdit;
    qryMainFIESP_ID: TIntegerField;
    SpeedButton3: TSpeedButton;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_cntrChange(Sender: TObject);
    procedure pgctrl_cntrChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_ordemClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbedt_AcordoChange(Sender: TObject);
    procedure qryMainAfterPost(DataSet: TDataSet);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure Cancelar;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure HabilitaBotoes;
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
  public
    { Public declarations }
     lCons_OnLine : Boolean;
     Cons_OnLine : TStringField;
     Cons_OnLine_Texto : String;
  end;

var
  frmCdAcordoComercial: TfrmCdAcordoComercial;

implementation

uses GSMLIB, PGGP001, KrDialog, KrUtil, PGSM095;

{$R *.DFM}

procedure TfrmCdAcordoComercial.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;
  mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;
  mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;
  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;
  mi_Cancelar.Enabled  := Canc;
end;

procedure TfrmCdAcordoComercial.Cancelar;
begin
  if qryMain.State in [dsEdit,dsinsert] then
    qryMain.cancel;
  btn_mi(st_incluir,false,false,st_excluir);
end;

function TfrmCdAcordoComercial.Consiste: Boolean;
begin
  consiste := true;
  if dbedt_Descricao.Text = '' then
  begin
    Boxmensagem('Deve ser Inserido a Descrição do Acordo.',2);
    dbedt_Acordo.SetFocus;
    consiste := false;
    Exit;
  end
end;

function TfrmCdAcordoComercial.Grava: Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( qryMain.State in [dsInsert, dsEdit] ) then
    begin
      qryMain.Post;
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      qryMain.Cancel;
      Grava := False;
      TrataErro(E);
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function TfrmCdAcordoComercial.Veralt: Boolean;
begin
  Veralt := True;
  if ( pgctrl_cntr.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( qryMain.State in [dsEdit] ) and st_modificar ) or
       ( qryMain.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Acrodo Comercial foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          Veralt := False;
          Exit;
        end;
        if Not Grava then
        begin
          Veralt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end;
end;

procedure TfrmCdAcordoComercial.btn_incluirClick(Sender: TObject);
begin
  qryMain.DisableControls;
  qryMain.Cancel;
  qryMain.Append;
  qryMain.EnableControls;
  dbnvg.Enabled:=false;
  pgctrl_cntr.ActivePage := ts_dados_basicos;
  dbedt_Acordo.SetFocus;
  btn_mi(false,st_modificar,st_modificar,false);
end;

procedure TfrmCdAcordoComercial.btn_salvarClick(Sender: TObject);
begin
  if not consiste then
    Exit;
  if not grava then
    Exit;
end;

procedure TfrmCdAcordoComercial.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmCdAcordoComercial.btn_excluirClick(Sender: TObject);
begin
 if BoxMensagem( 'Este Acrodo Comercial será excluído! Confirma exclusão?', 1 ) Then
  begin
    try
      datm_main.db_broker.StartTransaction;
      qryMain.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        qryMain.Cancel;
        TrataErro(E);
      end;
    end;
  end;
  pgctrl_cntr.ActivePage := ts_lista;
end;

procedure TfrmCdAcordoComercial.pgctrl_cntrChange(Sender: TObject);
begin
  if pgctrl_cntr.ActivePage = ts_lista then
    dbnvg.Enabled:=true
  else
    dbnvg.Enabled:=false;
  if pgctrl_cntr.ActivePage = tsPaises then
  begin
    qryPaises.Close;
    qryPaises.ParamByName('ACORDO_COMERCIAL_ID').AsInteger := qryMainID.AsInteger;
    qryPaises.Open;
  end;
end;

procedure TfrmCdAcordoComercial.pgctrl_cntrChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure TfrmCdAcordoComercial.FormCreate(Sender: TObject);
begin
  st_modificar := True;
  st_incluir   := True;
  st_excluir   := True;

  //AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  //Application.CreateForm( Tdatm_cntr, datm_cntr );

  dsMain.AutoEdit := st_modificar;
  qryMain.Close;
  qryMain.Prepare;
  qryMain.Open;
  a_str_indices[0] := 'ACORDO';
  a_str_indices[1] := 'DESCRICAO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Acordo');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_mi(st_incluir,false,false,st_excluir);

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
end;

procedure TfrmCdAcordoComercial.edt_chaveChange(Sender: TObject);
begin
  Localiza(qryMain, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure TfrmCdAcordoComercial.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    dbg_cadastroDblClick(Sender);
end;

procedure TfrmCdAcordoComercial.cb_ordemClick(Sender: TObject);
var
  pesquisa : string;
begin
  Pesquisa := qryMainACORDO.AsString;
  edt_chave.Text := '';
  qryMain.Close;
  qryMain.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  qryMain.Open;
  Localiza(qryMain, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure TfrmCdAcordoComercial.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCdAcordoComercial.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := qryMainACORDO.AsString;
    except
      try
        Cons_Online_Texto := qryMainACORDO.AsString;
      except
        BoxMensagem( 'Não foi possível retornar o Código do Contanier!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure TfrmCdAcordoComercial.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
   dbg_cadastroDblClick(Sender);
end;

procedure TfrmCdAcordoComercial.FormShow(Sender: TObject);
begin
  pgctrl_cntr.ActivePage := ts_lista;
  edt_chave.SetFocus;

  qryMain.Close;
  qryMain.Prepare;
  qryMain.Open;
  QryPais.Open;

  btn_excluir.Enabled := True;
  mi_excluir.Enabled  := True;
  if qryMain.RecordCount = 0 then
  begin
     btn_excluir.Enabled := False;
     mi_excluir.Enabled  := False;
  end;
end;

procedure TfrmCdAcordoComercial.dbedt_AcordoChange(Sender: TObject);
begin
  if qryMain.State in [dsEdit,dsInsert] then
    btn_mi(false,st_modificar,st_modificar,false);
end;

procedure TfrmCdAcordoComercial.qryMainAfterPost(DataSet: TDataSet);
begin
  qryMain.ApplyUpdates;
end;

procedure TfrmCdAcordoComercial.HabilitaBotoes;
begin
  btnIncluir.Enabled := not btnIncluir.Enabled;
  btnSalvar.Enabled := not btnSalvar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
  btnExcluir.Enabled := not btnExcluir.Enabled;
  DBLookupComboBox.Enabled := not DBLookupComboBox.Enabled; 
end;

procedure TfrmCdAcordoComercial.btnIncluirClick(Sender: TObject);
begin
  if qryMain.State in [dsEdit, dsInsert] then
    Reject('Antes de prosseguir você deve Salvar ou Cancelar as alterações no registro principal.');

  HabilitaBotoes;
  qryPaises.Append;
  qryPaisesACORDO_COMERCIAL_ID.AsInteger := qryMainID.AsInteger;
end;

procedure TfrmCdAcordoComercial.btnSalvarClick(Sender: TObject);
begin
  HabilitaBotoes;
  qryPaises.Post;
  qryPaises.ApplyUpdates;
end;

procedure TfrmCdAcordoComercial.btnCancelarClick(Sender: TObject);
begin
  HabilitaBotoes;
  qryPaises.Cancel;
end;

procedure TfrmCdAcordoComercial.btnExcluirClick(Sender: TObject);
begin
  qryPaises.Delete;
  qryPaises.ApplyUpdates;
end;

procedure TfrmCdAcordoComercial.SpeedButton3Click(Sender: TObject);
begin
  if not (qryMain.State in [dsEdit, dsInsert]) then
    qryMain.Edit;
  dbedt_AcordoChange(nil);
  ExecAndWaitRun(GetCODFullPath,
    '/Consulta /Acordo /Classe TfrmCdAcordoComercial /Form "Acordo Comercial"',
    'TFormList', 'Lista', SW_SHOW);
end;

procedure TfrmCdAcordoComercial.WMCopyData(var Msg: TWMCopyData);
var
  s: string;
begin
  if Msg.CopyDataStruct.dwData = 2 then
  begin
    s := PChar(Msg.CopyDataStruct.lpData);
    qryMainFIESP_ID.AsString := s;
  end
  else
  begin
    msg.Result := 0;
    Reject('Tipo de dados não suportado!');
  end;
  msg.Result := 1;
end;

end.
