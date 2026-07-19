unit PGSM083;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, StdCtrls,
  Buttons, DB, Funcoes;

type
  Tfrm_tx_amg = class(TForm)
    Panel300: TPanel;
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
    pgctrl_tx_amg: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedt_look_ativo: TDBEdit;
    dbedt_cd_taxa_amg: TDBEdit;
    dbedt_nm_descricao: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label6: TLabel;
    dbedt_VL_CNTR_20_MD_PALLET: TDBEdit;
    Label7: TLabel;
    dbedt_VL_CNTR_20_MD_OUTROS: TDBEdit;
    Label8: TLabel;
    dbedt_VL_CNTR_40_MD_PALLET: TDBEdit;
    Label9: TLabel;
    dbedt_VL_CNTR_40_MD_OUTROS: TDBEdit;
    Label10: TLabel;
    dbedt_VL_C_SOLTA_MD: TDBEdit;
    Label11: TLabel;
    dbedt_VL_CNTR_20_ME_PALLET: TDBEdit;
    Label12: TLabel;
    dbedt_VL_CNTR_20_ME_OUTROS: TDBEdit;
    Label13: TLabel;
    dbedt_VL_CNTR_40_ME_PALLET: TDBEdit;
    Label14: TLabel;
    dbedt_VL_CNTR_40_ME_OUTROS: TDBEdit;
    Label15: TLabel;
    dbedt_VL_C_SOLTA_ME: TDBEdit;
    Label16: TLabel;
    dbedt_VL_MINIMO: TDBEdit;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pgctrl_tx_amgChange(Sender: TObject);
    procedure dbedt_nm_descricaoChange(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure pgctrl_tx_amgChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;    
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_tx_amg: Tfrm_tx_amg;

implementation

uses PGSM084, GSMLIB, PGGP017, PGGP001;

{$R *.DFM}


procedure Tfrm_tx_amg.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
  with datm_tx_amg do
  begin
    qry_tx_amg_.DisableControls;
    qry_tx_amg_.Cancel;
    qry_tx_amg_.Append;
    qry_tx_amg_.EnableControls;
    qry_tx_amg_CD_TAXA.AsString  := UltCod( qry_ult_tx_amg_, qry_ult_tx_amg_ULTIMO );
    qry_tx_amg_IN_ATIVO.AsString  := '1';
  end;

  pgctrl_tx_amg.ActivePage := ts_dados_basicos;
  dbedt_nm_descricao.SetFocus;
end;

procedure Tfrm_tx_amg.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_tx_amg.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_tx_amg.Cancelar;
begin
  try
    if datm_tx_amg.qry_tx_amg_.State in [dsInsert, dsEdit] then
    begin
      datm_tx_amg.qry_tx_amg_.Cancel;
      pgctrl_tx_amg.ActivePage := ts_dados_basicos;
      dbedt_nm_descricao.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_tx_amg.btn_excluirClick(Sender: TObject);
begin
   if BoxMensagem( 'Esta taxa será excluída! Confirma exclusão?', 1 ) Then
   try
     datm_main.db_broker.StartTransaction;
     datm_tx_amg.qry_tx_amg_.Delete;
     datm_main.db_broker.Commit;
   except
     on E: Exception do
     begin
       datm_tx_amg.qry_tx_amg_.Cancel;
       if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
       TrataErro(E);
     end;
   end;
   pgctrl_tx_amg.ActivePage := ts_lista;
end;

procedure Tfrm_tx_amg.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_tx_amg.qry_tx_amg_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_tx_amg.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_tx_amg.qry_tx_amg_CD_TAXA.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_tx_amg.qry_tx_amg_.Close;
  datm_tx_amg.qry_tx_amg_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_tx_amg.qry_tx_amg_.Open;
  Localiza(datm_tx_amg.qry_tx_amg_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_tx_amg.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_tx_amg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_tx_amg do
    begin
      qry_tx_amg_.Close;
      tbl_yesno_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_tx_amg.FormCreate(Sender: TObject);
begin
  { Cria o DataModule do Taxa Armazenagem }

  Application.CreateForm(Tdatm_tx_amg, datm_tx_amg );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_tx_amg do
  begin
    tbl_yesno_.Open;
    qry_tx_amg_.SQL[2] := 'NM_DESCRICAO';
    qry_tx_amg_.Prepare;
    qry_tx_amg_.Open;
  end;

  a_str_indices[0] := 'CD_TAXA';
  a_str_indices[1] := 'NM_DESCRICAO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;
  vStr_cd_modulo:='22';
  str_cd_rotina:='2223';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_tx_amg.ds_tx_amg.AutoEdit                   := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

procedure Tfrm_tx_amg.pgctrl_tx_amgChange(Sender: TObject);
begin
  if (pgctrl_tx_amg.ActivePage = ts_lista ) then
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

procedure Tfrm_tx_amg.dbedt_nm_descricaoChange(Sender: TObject);
begin
  if ( datm_tx_amg.qry_tx_amg_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

function Tfrm_tx_amg.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_tx_amg.qry_tx_amg_.State in [dsInsert, dsEdit] ) then
    begin
      datm_tx_amg.qry_tx_amg_.Post;
    end;
    datm_main.db_broker.Commit;
    Grava:=True;
  except
    on E: Exception do
    begin
      datm_tx_amg.qry_tx_amg_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_tx_amg.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_tx_amg.Consiste;
begin
  if dbedt_nm_descricao.Text = '' then
  begin
    BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
    dbedt_nm_descricao.SetFocus;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

procedure Tfrm_tx_amg.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_tx_amg.qry_tx_amg_CD_TAXA.AsString;
    except
      try
        Cons_Online_Texto := datm_tx_amg.qry_tx_amg_CD_TAXA.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código da Taxa Armazenagem !', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_tx_amg.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_tx_amg.pgctrl_tx_amgChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_tx_amg.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_tx_amg.qry_tx_amg_.State in [dsEdit] ) and st_modificar ) or
     ( datm_tx_amg.qry_tx_amg_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro Taxa de Armazenagem foi alterado.' + #13#10 +
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

procedure Tfrm_tx_amg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then Close;
end;

procedure Tfrm_tx_amg.FormShow(Sender: TObject);
begin
  pgctrl_tx_amg.ActivePage := ts_lista;
end;

end.
