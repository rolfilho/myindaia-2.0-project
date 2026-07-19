unit PGSM091;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, Funcoes;

type
  Tfrm_embal = class(TForm)
    pgctrl_embal: TPageControl;
    ts_lista: TTabSheet;
    dbg_embal: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_embal: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedt_cd_embal: TDBEdit;
    dbedt_nm_embal_s: TDBEdit;
    dbedt_nm_embal_p: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    lbl_comprimento: TLabel;
    dbedt_nr_comprimento: TDBEdit;
    dbedt_nr_largura: TDBEdit;
    lbl_largura: TLabel;
    lbl_altura: TLabel;
    dbedt_nr_altura: TDBEdit;
    lbl_peso_embal: TLabel;
    dbedt_nr_peso: TDBEdit;
    Label11: TLabel;
    dbedt_cd_classif: TDBEdit;
    Label7: TLabel;
    dbedt_cd_embal_sup: TDBEdit;
    dbedt_nm_embalagem: TDBEdit;
    btn_co_embalagem: TSpeedButton;
    lbl_qt_por_embalagem: TLabel;
    dbedt_qt_por_embalagem: TDBEdit;
    dbedt_cd_emb_cliente: TDBEdit;
    Label8: TLabel;
    PageControl1: TPageControl;
    tbsht_port: TTabSheet;
    tbsht_ingles: TTabSheet;
    tbsht_espanhol: TTabSheet;
    dbedt_nm_descricao: TDBEdit;
    dbedt_nm_descricao_i: TDBEdit;
    dbedt_nm_descricao_e: TDBEdit;
    Label9: TLabel;
    lbl_unid_med: TLabel;
    btn_co_unid_med_emb: TSpeedButton;
    Label12: TLabel;
    dbedt_cd_unid_med_emb: TDBEdit;
    dbedt_nm_sigla_unid_med: TDBEdit;
    dbedt_qt_merc_emb: TDBEdit;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbedt_Fiesp: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_embalChange(Sender: TObject);
    procedure dbedt_nm_embal_sChange(Sender: TObject);
    procedure dbg_embalDblClick(Sender: TObject);
    procedure dbg_embalKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_embalChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_embalagemClick(Sender: TObject);
    procedure dbedt_cd_embal_supKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_embal_supExit(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btn_co_unid_med_embClick(Sender: TObject);
    procedure dbedt_cd_unid_med_embExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    OnChanging : Boolean;
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lnm_embal_s, lnm_embal_p : Boolean;
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
  frm_embal: Tfrm_embal;

implementation

Uses PGSM092, PGGP017, GSMLIB, PGGP001, ConsOnLineEx, PGSM013, KrUtil,
  KrDialog;

{$R *.DFM}


procedure Tfrm_embal.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
  with datm_embal do
  begin
    qry_embal_.DisableControls;
    qry_embal_.Cancel;
    qry_embal_.Append;
    qry_embal_.EnableControls;
    qry_ult_embal_.Open;
    pgctrl_embal.ActivePage:=ts_dados_basicos;
    qry_embal_.FieldByName('CD_EMBALAGEM').AsString := UltCod( qry_ult_embal_, qry_ult_embal_ULTIMO );
    qry_embal_.FieldByName('IN_ATIVO').AsString  := '1';
  end;
  dbedt_nm_embal_s.SetFocus;
end;

procedure Tfrm_embal.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_embal.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_embal.Cancelar;
begin
  try
    if datm_embal.qry_embal_.State in [dsInsert, dsEdit] then
    begin
      datm_embal.qry_embal_.Cancel;
      pgctrl_embal.ActivePage := ts_dados_basicos;
      dbedt_nm_embal_s.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_embal.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Embalagem será excluída! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_embal.qry_embal_.Delete;
    datm_main.db_broker.Commit;
    pgctrl_embal.ActivePage := ts_lista;
  except
    on E: Exception do
    begin
      datm_embal.qry_embal_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_embal.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_embal.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_embal.qry_embal_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_embal.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_embal.qry_embal_CD_EMBALAGEM.AsString;

  // Apaga o campo de pesquisa
  edt_chave.Text := '';
  datm_embal.qry_embal_.Close;
  datm_embal.qry_embal_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_embal.qry_embal_.Open;
  Localiza(datm_embal.qry_embal_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_embal.pgctrl_embalChange(Sender: TObject);
begin
  OnChanging := False;

  if lnm_embal_p then
  begin
    lnm_embal_p := False;
    pgctrl_embal.ActivePage := ts_dados_basicos;
    dbedt_nm_embal_p.SetFocus;
    Exit;
  end;

  if lnm_embal_s then
  begin
    lnm_embal_s := False;
    pgctrl_embal.ActivePage := ts_dados_basicos;
    dbedt_nm_embal_s.SetFocus;
    Exit;
  end;

  if (pgctrl_embal.ActivePage = ts_lista ) then
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

procedure Tfrm_embal.dbedt_nm_embal_sChange(Sender: TObject);
begin
  if ( datm_embal.qry_embal_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_embal.dbg_embalDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
//    try
//      Cons_OnLine.AsString := datm_embal.qry_embal_CD_EMBALAGEM.AsString;
//    except
      try
        Cons_Online_Texto := datm_embal.qry_embal_CD_EMBALAGEM.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código da Embalagem !', 2);
      end;
//    end;
    Close;
  end;
end;

function Tfrm_embal.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_embal.qry_embal_.State in [dsInsert, dsEdit] ) then
    begin
      datm_embal.qry_embal_.Post;
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_embal.qry_embal_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_embal.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_embal.Consiste;
begin
  if dbedt_nm_embal_s.Text = '' then
  begin
    BoxMensagem('Campo ''Descrição S'' deve ser preenchido!', 2);
    dbedt_nm_embal_s.SetFocus;
    lnm_embal_s := True;
    Consiste := False;
    exit;
  end;

  if dbedt_nm_embal_p.Text = '' then
  begin
    BoxMensagem('Campo ''Descrição P'' deve ser preenchido!', 2);
    dbedt_nm_embal_p.SetFocus;
    lnm_embal_p := True;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

procedure Tfrm_embal.dbg_embalKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_embalDblClick(Sender);
end;

procedure Tfrm_embal.FormCreate(Sender: TObject);
begin
  // Cria o DataModule da embalagem
  Application.CreateForm(Tdatm_embal, datm_embal );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_embal do
  begin
    tbl_yesno_.Open;
    qry_embal_.SQL[2] := 'NM_EMBALAGEM_S';
    qry_embal_.Prepare;
    qry_embal_.Open;
  end;

  a_str_indices[0] := 'CD_EMBALAGEM';
  a_str_indices[1] := 'NM_EMBALAGEM_S';
  a_str_indices[2] := 'CD_EMBALAGEM_CLIENTE';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    Items.Add('Cód. Embalagem no Cliente');
    ItemIndex := 1;
  end;
  vStr_cd_modulo:='22';
  str_cd_rotina:='2226';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_embal.ds_embal.AutoEdit := st_modificar;

  btn_incluir.Enabled          := st_incluir;
  btn_excluir.Enabled          := st_excluir;
  mi_incluir.Enabled           := st_incluir;
  mi_excluir.Enabled           := st_excluir;
end;

procedure Tfrm_embal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_embal.qry_embal_.Close;
  datm_embal.tbl_yesno_.Close;
  datm_embal.Free;
  Action := caFree;
end;

procedure Tfrm_embal.pgctrl_embalChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_embal.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_embal.qry_embal_.State in [dsEdit] ) and st_modificar ) or
     ( datm_embal.qry_embal_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Embalagem foi alterado.' + #13#10 +
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

procedure Tfrm_embal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then close;
end;

procedure Tfrm_embal.btn_co_embalagemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_embal.qry_embal_) then exit;
    if (Sender as TSpeedButton).Enabled then
      datm_embal.qry_embal_CD_EMBALAGEM_SUP.AsString := ConsultaOnLineEx('TEMBALAGEM','Embalagem',['CD_EMBALAGEM', 'NM_EMBALAGEM_S'],['Código', 'Descrição'], 'CD_EMBALAGEM',nil)
  end
  else
    dbedt_cd_embal_sup.Text := ConsultaLookUP('TEMBALAGEM','CD_EMBALAGEM',dbedt_cd_embal_sup.Text, 'NM_EMBALAGEM_S');
end;

procedure Tfrm_embal.dbedt_cd_embal_supKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_embal_sup    then btn_co_embalagemClick(nil);
    if Sender = dbedt_cd_unid_med_emb then btn_co_unid_med_embClick(btn_co_unid_med_emb);
  end;
end;

procedure Tfrm_embal.dbedt_cd_embal_supExit(Sender: TObject);
begin
  if datm_embal.qry_embal_.State in [dsEdit,dsInsert] then
  begin
    ValidCodigo( dbedt_cd_embal_sup );
    if dbedt_cd_embal_sup.Text <> '' then
    begin
      if ( dbedt_nm_embalagem.Text = '' ) then
      begin
        BoxMensagem('Código da Embalagem inválido !',2);
        pgctrl_embal.ActivePage := ts_dados_basicos;
        dbedt_cd_embal_sup.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_embal.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_embalDblClick(nil);
end;

procedure Tfrm_embal.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_embal.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_embal.btn_co_unid_med_embClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_embal.qry_embal_) then exit;
    if (Sender as TSpeedButton).Enabled then
      datm_embal.qry_embal_CD_UNID_MED_EMB.AsString := ConsultaOnLineEx('TUNID_MEDIDA_BROKER','Unidade de Medida',['CD_UNID_MEDIDA', 'NM_UNID_MEDIDA'],['Código', 'Descrição'], 'CD_UNID_MEDIDA',nil)
  end
  else
    dbedt_cd_unid_med_emb.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA',dbedt_cd_unid_med_emb.Text, 'NM_UNID_MEDIDA');
end;

procedure Tfrm_embal.dbedt_cd_unid_med_embExit(Sender: TObject);
begin
  if datm_embal.qry_embal_.State in [dsEdit,dsInsert] then
  begin
    ValidCodigo( dbedt_cd_unid_med_emb );
    if dbedt_cd_unid_med_emb.Text <> '' then
    begin
      if ( dbedt_nm_sigla_unid_med.Text = '' ) then
      begin
        BoxMensagem( 'Código da Unidade de Medida inválido !', 2 );
        pgctrl_embal.ActivePage := ts_dados_basicos;
        dbedt_cd_unid_med_emb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_embal.SpeedButton1Click(Sender: TObject);
begin
  if not (datm_embal.qry_embal_.State in [dsInsert, dsEdit]) then
  begin
    datm_embal.qry_embal_.Edit;
    Btn_Mi(False, True, True, False);
  end;
  ExecAndWaitRun(GetCODFullPath,
    '/Consulta /Embalagem /Classe Tfrm_embal /Form "Cadastro de Embalagem"',
    'TFormList', 'Lista', SW_SHOW);
end;

procedure Tfrm_embal.WMCopyData(var Msg: TWMCopyData);
var
  s: string;
begin
  if Msg.CopyDataStruct.dwData = 7 then
  begin
    s := PChar(Msg.CopyDataStruct.lpData);
    datm_embal.qry_embal_FIESP_Id.AsString := s;
  end
  else
  begin
    msg.Result := 0;
    Reject('Tipo de dados não suportado!');
  end;
  msg.Result := 1;
end;

end.
