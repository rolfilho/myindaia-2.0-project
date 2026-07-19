{ implementação dos campos, NM_CIDADE, CD_UF, CD_PAIS , CD_SIGLA -  by Carlos em 30/03/2010 }

unit PGSM014;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001, Funcoes;

type
  Tfrm_local_embarque = class(TForm)
    pgctrl_local_embarque: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    dbg_cadastro: TDBGrid;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label3: TLabel;
    dbedt_cd_local_embarque: TDBEdit;
    Label4: TLabel;
    dbedt_nm_local_embarque: TDBEdit;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    Label5: TLabel;
    dbedt_cd_unid_neg_local: TDBEdit;
    dbedt_AP_UNID_NEG: TDBEdit;
    btn_cd_unid_neg: TSpeedButton;
    pnl_cadastro: TPanel;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    dbNM_CIDADE: TDBEdit;
    Label6: TLabel;
    dbCD_SIGLA: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    dbUF: TDBEdit;
    btn_cd_uf: TSpeedButton;
    lbl_pais: TLabel;
    dbedt_cd_pais: TDBEdit;
    dbedt_nm_pais: TEdit;
    btn_co_pais: TSpeedButton;
    Label9: TLabel;
    dbedt_Fiesp: TDBEdit;
    SpeedButton3: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Status_Botoes(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure dbedt_cd_unid_neg_localKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbedt_cd_unid_neg_localExit(Sender: TObject);
    function Consiste : Boolean;
    function VerAlt : Boolean;
    function Grava : Boolean;
    procedure Cancelar;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure pgctrl_local_embarqueChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_local_embarqueChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_ufClick(Sender: TObject);
    procedure btn_co_paisClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure dbedt_FiespChange(Sender: TObject);
  private
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
  public
    Pesquisa : String;
    lCons_OnLine      : Boolean;
    Cons_OnLine       : TStringField;
    Cons_OnLine_Texto : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    { Public declarations }
  end;

var
  frm_local_embarque: Tfrm_local_embarque;

implementation

uses GSMLIB, PGSM107, PGGP017, PGSM018, ConsOnLineEx, PGSM108, KrUtil,
  KrDialog;

{$R *.DFM}

procedure Tfrm_local_embarque.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_local_embarque.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
  with datm_local_embarque do
  begin
    qry_local_embarque_.DisableControls;
    qry_local_embarque_.Cancel;
    qry_local_embarque_.Append;
    qry_local_embarque_.EnableControls;
    qry_local_embarque_CODIGO.AsString  := UltCod( qry_ult_local_embarque_, qry_ult_local_embarque_ULTIMO );
  end;
  pgctrl_local_embarque.ActivePage := ts_dados_basicos;
  dbedt_nm_local_embarque.SetFocus;
end;

procedure Tfrm_local_embarque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_local_embarque do
  begin
    qry_local_embarque_.Close;
    qry_unid_neg_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_local_embarque.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      if Not (TTable(Cons_OnLine.DataSet).State in [dsEdit, dsInsert]) then
         TTable(Cons_OnLine.DataSet).Edit;
      Cons_OnLine.AsString := datm_local_embarque.qry_local_embarque_CODIGO.AsString;
    except
      try
        Cons_Online_Texto := datm_local_embarque.qry_local_embarque_CODIGO.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Local de EmbarqueEvento!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_local_embarque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  If Key = 27 then Close;

  If Key = 13 then
  begin
    dbg_cadastroDblClick(Sender);
  end;

end;

procedure Tfrm_local_embarque.FormCreate(Sender: TObject);
begin
  pgctrl_local_embarque.activePage := ts_lista;
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Senha }
  Application.CreateForm( Tdatm_local_embarque, datm_local_embarque );

  If datm_main.db_broker.Connected = False Then datm_main.db_broker.Connected := True;

  datm_local_embarque.qry_local_embarque_.Open;

  a_str_indices[0] := 'CODIGO';
  a_str_indices[1] := 'DESCRICAO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_local_embarque.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Local de Embarque será excluído! Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_local_embarque.qry_local_embarque_.Delete;
    datm_main.db_broker.Commit;

    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' DELETE FROM MYINDAIA.DBO.TLOCAL_EMBARQUE WHERE CD_LOCAL_EMB = ''' + Pesquisa  + ''' ');
      ExecSQL;
      Free;
    end;

  except
    on E: Exception do
    begin
      datm_local_embarque.qry_local_embarque_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_local_embarque.ActivePage := ts_lista;
end;

procedure Tfrm_local_embarque.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_local_embarque.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_local_embarque.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_local_embarque.qry_local_embarque_CODIGO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_local_embarque.qry_local_embarque_.Close;
  datm_local_embarque.qry_local_embarque_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_local_embarque.qry_local_embarque_.Open;
  Localiza(datm_local_embarque.qry_local_embarque_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_local_embarque.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_local_embarque.qry_local_embarque_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;


procedure Tfrm_local_embarque.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_local_embarque.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_local_embarque.Status_Botoes(Sender: TObject);
begin
  if pgctrl_local_embarque.ActivePage =  ts_dados_basicos then
  if ( datm_local_embarque.qry_local_embarque_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_local_embarque.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_local_embarque.btn_cd_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  With frm_unidade Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_unidade.Cons_OnLine := datm_local_embarque.qry_local_embarque_CD_UNID_NEG_LOCAL;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_local_embarque.dbedt_cd_unid_neg_localKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = dbedt_cd_unid_neg_local then btn_cd_unid_negClick(nil);
  end;
end;

procedure Tfrm_local_embarque.dbedt_cd_unid_neg_localExit(Sender: TObject);
begin
  Consiste;
end;

function Tfrm_local_embarque.Consiste : Boolean;
begin
  Consiste := False;
  if dbedt_nm_local_embarque.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_local_embarque.ActivePage := ts_dados_basicos;
    dbedt_nm_local_embarque.SetFocus;
    Consiste := False;
    Exit;
  end;

  if Not ( datm_local_embarque.qry_local_embarque_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_unid_neg_local );
  if dbedt_cd_unid_neg_local.Text <> '' Then
  begin
    if dbedt_AP_UNID_NEG.Text = '' Then
    begin
      BoxMensagem('Código da Unidade de Negócio inválido!',2);
      pgctrl_local_embarque.ActivePage := ts_dados_basicos;
      dbedt_cd_unid_neg_local.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
  Consiste := True;
end;

function Tfrm_local_embarque.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_local_embarque.qry_local_embarque_.State in [dsEdit] ) and st_modificar ) or
     ( datm_local_embarque.qry_local_embarque_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Locais de Embarque foi alterado.' + #13#10 +
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

function Tfrm_local_embarque.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_local_embarque.qry_local_embarque_.State in [dsInsert, dsEdit] ) then
    begin
      datm_local_embarque.qry_local_embarque_.Post;
      Pesquisa := datm_local_embarque.qry_local_embarque_CODIGO.AsString;
      datm_local_embarque.qry_local_embarque_.Close;
      datm_local_embarque.qry_local_embarque_.Prepare;
      datm_local_embarque.qry_local_embarque_.Open;
      Localiza( datm_local_embarque.qry_local_embarque_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;

    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' DELETE FROM MYINDAIA.DBO.TLOCAL_EMBARQUE WHERE CD_LOCAL_EMB = ''' + Pesquisa  + ''' ');
      ExecSQL;
      SQL.Clear;
      SQL.Add(' INSERT INTO MYINDAIA.DBO.TLOCAL_EMBARQUE ( ');
      SQL.Add(' CD_LOCAL_EMB, NM_LOCAL_EMB, CD_UNID_NEG_LOCAL )  ');
      SQL.Add(' SELECT CODIGO, DESCRICAO, CD_UNID_NEG_LOCAL      ');
      SQL.Add(' FROM TLOCAL_EMBARQUE (NOLOCK)  WHERE CODIGO = ''' + Pesquisa + ''' ');
      ExecSQL;
      Free;
    end;

    Grava := True;
  except
    on E: Exception do
    begin
      datm_local_embarque.qry_local_embarque_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_local_embarque.Cancelar;
begin
  try
    if datm_local_embarque.qry_local_embarque_.State in [dsInsert, dsEdit] then
    begin
      datm_local_embarque.qry_local_embarque_.Cancel;
      pgctrl_local_embarque.ActivePage := ts_dados_basicos;
      dbedt_nm_local_embarque.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_local_embarque.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;


procedure Tfrm_local_embarque.pgctrl_local_embarqueChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_local_embarque.pgctrl_local_embarqueChange(Sender: TObject);
begin
  if pgctrl_local_embarque.ActivePage = ts_lista then
  begin
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
  end
  else
  begin
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;
  end;
end;

procedure Tfrm_local_embarque.edt_chaveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_local_embarque.btn_cd_ufClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    dbUF.text := ConsultaOnLineExSQL('SELECT distinct CD_UF, NM_UF FROM TUF','Estados',['CD_UF','NM_UF'],['Código','Descrição'],'CD_UF', nil, dbUF.Text);
    btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_local_embarque.btn_co_paisClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
     if not PoeEmEdicao(datm_local_embarque.qry_local_embarque_) then
      exit;
    datm_local_embarque.qry_local_embarque_CD_PAIS.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil, 1, dbedt_cd_pais.Text);
  end
  else
    dbedt_nm_pais.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais.Text,'DESCRICAO');

  if pgctrl_local_embarque.ActivePage =  ts_dados_basicos then
    btn_mi( False, True, True, False );
end;

procedure Tfrm_local_embarque.SpeedButton3Click(Sender: TObject);
begin
  if not (datm_local_embarque.qry_local_embarque_.State in [ dsInsert, dsEdit ]) then
  begin
    datm_local_embarque.qry_local_embarque_.Edit;
    btn_mi( False, True, True, False );
  end;
  ExecAndWaitRun(GetCODFullPath,
    '/Consulta /LocalEmbarque /Classe Tfrm_local_embarque /Form "Cadastro de Local de Embarque / Desembarque"',
    'TFormList', 'Lista', SW_SHOW);
end;

procedure Tfrm_local_embarque.dbedt_FiespChange(Sender: TObject);
begin
  if (datm_local_embarque.qry_local_embarque_.State in [ dsInsert, dsEdit ]) then
    Btn_Mi( False, True, True, False );
end;

procedure Tfrm_local_embarque.WMCopyData(var Msg: TWMCopyData);
var
  s: string;
begin
  if Msg.CopyDataStruct.dwData = 4 then
  begin
    s := PChar(Msg.CopyDataStruct.lpData);
    datm_local_embarque.qry_local_embarque_FIESP_Id.AsString := s;
  end
  else
  begin
    msg.Result := 0;
    Reject('Tipo de dados não suportado!');
  end;
  msg.Result := 1;
end;

end.
