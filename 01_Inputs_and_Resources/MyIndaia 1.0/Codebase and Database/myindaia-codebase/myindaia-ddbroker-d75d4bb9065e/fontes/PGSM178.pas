unit PGSM178;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB;

type
  Tfrm_modalidade_trans = class(TForm)
    pgctrl_modalidade_trans: TPageControl;
    ts_lista: TTabSheet;
    dbgrd_modalidade_trans: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_cnt: TPanel;
    lbl_ativo: TLabel;
    dblkpcbox_ativo: TDBLookupComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label3: TLabel;
    dbedt_cd_modalidade_trans: TDBEdit;
    Label4: TLabel;
    dbedt_nm_modalidade_trans: TDBEdit;
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
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_modalidade_transChange(Sender: TObject);
    procedure dbgrd_modalidade_transDblClick(Sender: TObject);
    procedure dbgrd_modalidade_transKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_modalidade_transChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dblkpcbox_ativoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_modalidade_transChange(Sender: TObject);
    procedure dbedt_nm_modalidade_transExit(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir   : boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    lNaoConsiste : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_modalidade_trans: Tfrm_modalidade_trans;

implementation

uses PGSM179, GSMLIB, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_modalidade_trans.btn_incluirClick(Sender: TObject);
begin
   btn_incluir.Enabled := False;
   mi_incluir.Enabled  := False;
   btn_excluir.Enabled := False;
   mi_excluir.Enabled  := False;
   with datm_modalidade_trans do
   begin
     qry_modalidade_trans_.DisableControls;
     qry_modalidade_trans_.Cancel;
     qry_modalidade_trans_.Append;
     qry_modalidade_trans_.EnableControls;
     qry_modalidade_trans_IN_ATIVO.AsString := '1';
   end;
   pgctrl_modalidade_trans.ActivePage := ts_dados_basicos;
   dbedt_cd_modalidade_trans.SetFocus;
end;

procedure Tfrm_modalidade_trans.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_modalidade_trans.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_modalidade_trans.Cancelar;
begin
  try
    if datm_modalidade_trans.qry_modalidade_trans_.State in [dsInsert, dsEdit] then
    begin
      datm_modalidade_trans.qry_modalidade_trans_.Cancel;
      pgctrl_modalidade_trans.ActivePage := ts_dados_basicos;
      dbedt_nm_modalidade_trans.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_modalidade_trans.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Modalidade de Transação será excluída!' + #13#10 + 
                  'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_modalidade_trans.qry_modalidade_trans_.Delete;
    datm_main.db_broker.Commit;
    pgctrl_modalidade_trans.ActivePage := ts_lista;
  except
    on E: Exception do
    begin
      datm_modalidade_trans.qry_modalidade_trans_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_modalidade_trans.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_modalidade_trans.edt_chaveChange(Sender: TObject);
begin
   Localiza( datm_modalidade_trans.qry_modalidade_trans_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_modalidade_trans.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_modalidade_trans.qry_modalidade_trans_CD_MODALIDADE_TRANS.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_modalidade_trans.qry_modalidade_trans_.Close;
  datm_modalidade_trans.qry_modalidade_trans_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_modalidade_trans.qry_modalidade_trans_.Prepare;
  datm_modalidade_trans.qry_modalidade_trans_.Open;
  Localiza( datm_modalidade_trans.qry_modalidade_trans_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_modalidade_trans.pgctrl_modalidade_transChange(Sender: TObject);
begin
  if (pgctrl_modalidade_trans.ActivePage = ts_lista ) then
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

procedure Tfrm_modalidade_trans.dbgrd_modalidade_transDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_modalidade_trans.qry_modalidade_trans_CD_MODALIDADE_TRANS.AsString;
    except
      try
        Cons_Online_Texto := datm_modalidade_trans.qry_modalidade_trans_CD_MODALIDADE_TRANS.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código da Modalidade de Transação!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_modalidade_trans.dbgrd_modalidade_transKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbgrd_modalidade_transDblClick(nil);
end;

procedure Tfrm_modalidade_trans.FormCreate(Sender: TObject);
begin
  { Cria o DataModule da Modalidade de Transação}

  Application.CreateForm( Tdatm_modalidade_trans, datm_modalidade_trans );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_modalidade_trans do
  begin
    tbl_yesno_.Open;
    qry_modalidade_trans_.Close;
    qry_modalidade_trans_.SQL[2] := 'NM_MODALIDADE_TRANS';
    qry_modalidade_trans_.Prepare;
    qry_modalidade_trans_.Open;
  end;

  a_str_indices[0] := 'CD_MODALIDADE_TRANS';
  a_str_indices[1] := 'NM_MODALIDADE_TRANS';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;
  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  datm_modalidade_trans.ds_modalidade_trans.AutoEdit     := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

procedure Tfrm_modalidade_trans.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_modalidade_trans do
    begin
      qry_modalidade_trans_.Close;
      tbl_yesno_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

function Tfrm_modalidade_trans.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_modalidade_trans.qry_modalidade_trans_.State in [dsInsert, dsEdit] ) then
    begin
      Pesquisa := datm_modalidade_trans.qry_modalidade_trans_CD_MODALIDADE_TRANS.AsString;
      datm_modalidade_trans.qry_modalidade_trans_.Post;
      datm_modalidade_trans.qry_modalidade_trans_.Locate( 'CD_MODALIDADE_TRANS', Pesquisa, [loCaseInsensitive] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_modalidade_trans.qry_modalidade_trans_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi( st_incluir, False, False, st_excluir );
end;

function Tfrm_modalidade_trans.Consiste : Boolean;
begin
  Consiste := True;

  {Código}
  if Not lNaoConsiste then
  begin
    if dbedt_cd_modalidade_trans.Text = '' then
    begin
      BoxMensagem('Campo Código da Modalidade de Transação deve ser preenchido!', 2);
      dbedt_cd_modalidade_trans.SetFocus;
      Consiste := False;
      Exit;
    end;

    {Descrição}
    if dbedt_nm_modalidade_trans.Text = '' then
    begin
      BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
      dbedt_nm_modalidade_trans.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

end;

procedure Tfrm_modalidade_trans.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_modalidade_trans.pgctrl_modalidade_transChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_modalidade_trans.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_modalidade_trans.qry_modalidade_trans_.State in [dsEdit] ) and st_modificar ) or
     ( datm_modalidade_trans.qry_modalidade_trans_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Modalidade de Transação foi alterado.' + #13#10 +
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

procedure Tfrm_modalidade_trans.dblkpcbox_ativoExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_modalidade_trans.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_modalidade_trans.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_modalidade_trans.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_modalidade_trans.dbedt_cd_modalidade_transChange(Sender: TObject);
begin
  if ( datm_modalidade_trans.qry_modalidade_trans_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_modalidade_trans.dbedt_nm_modalidade_transExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

end.

