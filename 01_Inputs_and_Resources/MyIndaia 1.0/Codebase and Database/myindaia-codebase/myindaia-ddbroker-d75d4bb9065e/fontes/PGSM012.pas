unit PGSM012;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, StdCtrls, Db, Mask, DBCtrls, DBTABLES, Grids,
  DBGrids, ComCtrls;

type
  Tfrm_unid_medida = class(TForm)
    pgctrl_unid_medida: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_codigo: TLabel;
    lbl_nome: TLabel;
    dbedt_cd_unid_medida: TDBEdit;
    dbedt_nm_unid_medida: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbedt_cd_GIPLITE: TDBEdit;
    Label3: TLabel;
    lbl_sigla: TLabel;
    dbedt_nm_sigla: TDBEdit;
    Label4: TLabel;
    dbedt_cd_scx_exp: TDBEdit;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    Label1: TLabel;
    edt_chave: TEdit;
    Label2: TLabel;
    cb_ordem: TComboBox;
    lbl1: TLabel;
    dbedtDescIng: TDBEdit;
    lbl2: TLabel;
    dbedtSiglaIng: TDBEdit;
    dbedtDescEsp: TDBEdit;
    dbedtSiglaEsp: TDBEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    dbchkAtivo: TDBCheckBox;
    qry_unid_medida_: TQuery;
    qry_unid_medida_CD_UNID_MEDIDA: TStringField;
    qry_unid_medida_NM_UNID_MEDIDA: TStringField;
    qry_unid_medida_IN_ATIVO: TStringField;
    qry_unid_medida_CD_GIPLITE: TStringField;
    qry_unid_medida_NM_SIGLA: TStringField;
    qry_unid_medida_CD_SCX_EXP: TStringField;
    qry_unid_medida_NM_UNID_MEDIDA_ING: TStringField;
    qry_unid_medida_NM_UNID_MEDIDA_ESP: TStringField;
    qry_unid_medida_NM_SIGLA_ING: TStringField;
    qry_unid_medida_NM_SIGLA_ESP: TStringField;
    ds_unid_medida: TDataSource;
    qry_unid_medida_calcAtivo: TStringField;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    dbedt_Fiesp: TDBEdit;
    qry_unid_medida_FIESP_Id: TIntegerField;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_nm_unid_medidaChange(Sender: TObject);
    procedure pgctrl_unid_medidaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_unid_medidaChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qry_unid_medida_CalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_unid_medida: Tfrm_unid_medida;

implementation

uses GSMLIB, PGGP017, KrUtil, KrDialog;

{$R *.DFM}

procedure Tfrm_unid_medida.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_unid_medida.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_unid_medida.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_unid_medida.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_unid_medida.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_unid_medida.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := qry_unid_medida_CD_UNID_MEDIDA.AsString;
    except
      try
        Cons_OnLine_Texto := qry_unid_medida_CD_UNID_MEDIDA.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código da Unidade de Medida!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_unid_medida.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  ds_unid_medida.AutoEdit := st_modificar;
  qry_unid_medida_.SQL[2] := 'NM_UNID_MEDIDA';
  qry_unid_medida_.Prepare;
  qry_unid_medida_.Open;

  a_str_indices[0] := 'CD_UNID_MEDIDA';
  a_str_indices[1] := 'NM_UNID_MEDIDA';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_unid_medida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    qry_unid_medida_.Close;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_unid_medida.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_unid_medida.btn_incluirClick(Sender: TObject);
begin
  qry_unid_medida_.DisableControls;
  qry_unid_medida_.Cancel;
  qry_unid_medida_.Append;
  qry_unid_medida_.EnableControls;
//  qry_unid_medida_CD_UNID_MEDIDA.AsString  := UltCod( qry_ult_unid_medida_, qry_ult_unid_medida_ULTIMO );

  with TQuery.Create(application) do begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('  SELECT  RIGHT( "000" + CONVERT( VARCHAR,ISNULL( CONVERT(INT, MAX(ISNULL(CD_UNID_MEDIDA, "0"))), 0) + 1 ), 3 ) ');
    SQL.Add('    FROM TUNID_MEDIDA_BROKER');
    Open;
    qry_unid_medida_CD_UNID_MEDIDA.AsString  := Fields[0].AsString;
    Free;
  end;

  pgctrl_unid_medida.ActivePage := ts_dados_basicos;
  dbedt_nm_unid_medida.SetFocus;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;

end;

procedure Tfrm_unid_medida.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Unidade de Medida será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    qry_unid_medida_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_unid_medida.ActivePage := ts_lista;
end;

procedure Tfrm_unid_medida.edt_chaveChange(Sender: TObject);
begin
  Localiza(qry_unid_medida_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_unid_medida.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := qry_unid_medida_CD_UNID_MEDIDA.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  qry_unid_medida_.Close;
  qry_unid_medida_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  qry_unid_medida_.Prepare;
  qry_unid_medida_.Open;
  Localiza(qry_unid_medida_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_unid_medida.dbedt_nm_unid_medidaChange(Sender: TObject);
begin
  If ( qry_unid_medida_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

function Tfrm_unid_medida.Consiste : Boolean;
begin
  if dbedt_nm_unid_medida.Text = '' then
  begin
    BoxMensagem('Campo Nome deve ser preenchido!', 2);
    pgctrl_unid_medida.ActivePage := ts_dados_basicos;
    dbedt_nm_unid_medida.SetFocus;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

function Tfrm_unid_medida.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( qry_unid_medida_.State in [dsInsert, dsEdit] ) then
    begin
      qry_unid_medida_.Post;
      Pesquisa := qry_unid_medida_CD_UNID_MEDIDA.AsString;
      qry_unid_medida_.Close;
      qry_unid_medida_.Prepare;
      qry_unid_medida_.Open;
      Localiza(qry_unid_medida_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      qry_unid_medida_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_unid_medida.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( qry_unid_medida_.State in [dsEdit] ) and st_modificar ) or
     ( qry_unid_medida_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Unidades de Medida foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
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

procedure Tfrm_unid_medida.Cancelar;
begin
  try
    if qry_unid_medida_.State in [dsInsert, dsEdit] then
    begin
      qry_unid_medida_.Cancel;
      pgctrl_unid_medida.ActivePage := ts_dados_basicos;
      dbedt_nm_unid_medida.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_unid_medida.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_unid_medida.pgctrl_unid_medidaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_unid_medida.pgctrl_unid_medidaChange(Sender: TObject);
begin
  if (pgctrl_unid_medida.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := True;
  end
  else
  begin
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
  end;

end;

procedure Tfrm_unid_medida.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_unid_medida.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_unid_medida.qry_unid_medida_CalcFields(DataSet: TDataSet);
begin
    DataSet.FieldByName('calcAtivo').AsString := '';
  if ( DataSet.FieldByName('IN_ATIVO').AsString = '1' ) then
    DataSet.FieldByName('calcAtivo').AsString := 'ü';
end;

procedure Tfrm_unid_medida.SpeedButton1Click(Sender: TObject);
begin
  if not (qry_unid_medida_.State in [dsInsert, dsEdit]) then
  begin
    qry_unid_medida_.Edit;
    Btn_Mi( False, True, True, False );
  end;
  ExecAndWaitRun(GetCODFullPath,
    '/Consulta /UnidadeMedida /Classe Tfrm_unid_medida /Form "Cadastro de Unidades de Medida"',
    'TFormList', 'Lista', SW_SHOW);
end;

procedure Tfrm_unid_medida.WMCopyData(var Msg: TWMCopyData);
var
  s: string;
begin
  if Msg.CopyDataStruct.dwData = 6 then
  begin
    s := PChar(Msg.CopyDataStruct.lpData);
    qry_unid_medida_FIESP_Id.AsString := s;
  end
  else
  begin
    msg.Result := 0;
    Reject('Tipo de dados não suportado!');
  end;
  msg.Result := 1;
end;

end.
