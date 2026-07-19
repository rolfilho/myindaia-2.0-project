unit PGSM176;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB;

type
  Tfrm_finalidade_merc = class(TForm)
    pgctrl_finalidade_merc: TPageControl;
    ts_lista: TTabSheet;
    dbgrd_finalidade_merc: TDBGrid;
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
    dbedt_cd_finalidade_merc: TDBEdit;
    Label4: TLabel;
    dbedt_nm_finalidade_merc: TDBEdit;
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
    DBEdit1: TDBEdit;
    Label5: TLabel;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_finalidade_mercChange(Sender: TObject);
    procedure dbgrd_finalidade_mercDblClick(Sender: TObject);
    procedure dbgrd_finalidade_mercKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_finalidade_mercChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dblkpcbox_ativoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_finalidade_mercChange(Sender: TObject);
    procedure dbedt_nm_finalidade_mercExit(Sender: TObject);
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
  frm_finalidade_merc: Tfrm_finalidade_merc;

implementation

uses PGSM177, GSMLIB, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_finalidade_merc.btn_incluirClick(Sender: TObject);
begin

   btn_incluir.Enabled := False;
   mi_incluir.Enabled  := False;
   btn_excluir.Enabled := False;
   mi_excluir.Enabled  := False;
   with datm_finalidade_merc do
   begin
     qry_finalidade_merc_.DisableControls;
     qry_finalidade_merc_.Cancel;
     qry_finalidade_merc_.Append;
     qry_finalidade_merc_.EnableControls;
     qry_finalidade_merc_IN_ATIVO.AsString := '1';
   end;
   pgctrl_finalidade_merc.ActivePage := ts_dados_basicos;
   dbedt_cd_finalidade_merc.SetFocus;
end;

procedure Tfrm_finalidade_merc.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_finalidade_merc.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_finalidade_merc.Cancelar;
begin
  try
    if datm_finalidade_merc.qry_finalidade_merc_.State in [dsInsert, dsEdit] then
    begin
      datm_finalidade_merc.qry_finalidade_merc_.Cancel;
      pgctrl_finalidade_merc.ActivePage := ts_dados_basicos;
      dbedt_nm_finalidade_merc.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_finalidade_merc.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Finalidade da Mercadoria será excluída!' + #13#10 +
                  'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_finalidade_merc.qry_finalidade_merc_.Delete;
    datm_main.db_broker.Commit;
    pgctrl_finalidade_merc.ActivePage := ts_lista;
  except
    on E: Exception do
    begin
      datm_finalidade_merc.qry_finalidade_merc_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_finalidade_merc.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_finalidade_merc.edt_chaveChange(Sender: TObject);
begin
   Localiza( datm_finalidade_merc.qry_finalidade_merc_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_finalidade_merc.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_finalidade_merc.qry_finalidade_merc_CD_FINALIDADE_MERC.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_finalidade_merc.qry_finalidade_merc_.Close;
  datm_finalidade_merc.qry_finalidade_merc_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_finalidade_merc.qry_finalidade_merc_.Prepare;
  datm_finalidade_merc.qry_finalidade_merc_.Open;
  Localiza( datm_finalidade_merc.qry_finalidade_merc_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_finalidade_merc.pgctrl_finalidade_mercChange(Sender: TObject);
begin
  if ( pgctrl_finalidade_merc.ActivePage = ts_lista ) then
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

procedure Tfrm_finalidade_merc.dbgrd_finalidade_mercDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_finalidade_merc.qry_finalidade_merc_CD_FINALIDADE_MERC.AsString;
    except
      try
        Cons_Online_Texto := datm_finalidade_merc.qry_finalidade_merc_CD_FINALIDADE_MERC.AsString;
      except
         BoxMensagem('Não foi possível retornar o Código da Finalidade da Mercadoria!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_finalidade_merc.dbgrd_finalidade_mercKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbgrd_finalidade_mercDblClick(nil);
end;

procedure Tfrm_finalidade_merc.FormCreate(Sender: TObject);
begin
  { Cria o DataModule da Finalidade da Mercadoria}

  Application.CreateForm( Tdatm_finalidade_merc, datm_finalidade_merc );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_finalidade_merc do
  begin
    tbl_yesno_.Open;
    qry_finalidade_merc_.Close;
    qry_finalidade_merc_.SQL[2] := 'NM_FINALIDADE_MERC';
    qry_finalidade_merc_.Prepare;
    qry_finalidade_merc_.Open;
  end;

  a_str_indices[0] := 'CD_FINALIDADE_MERC';
  a_str_indices[1] := 'NM_FINALIDADE_MERC';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;
  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  datm_finalidade_merc.ds_finalidade_merc.AutoEdit     := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

procedure Tfrm_finalidade_merc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_finalidade_merc do
    begin
      qry_finalidade_merc_.Close;
      tbl_yesno_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

function Tfrm_finalidade_merc.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_finalidade_merc.qry_finalidade_merc_.State in [dsInsert, dsEdit] ) then
    begin
      Pesquisa := datm_finalidade_merc.qry_finalidade_merc_CD_FINALIDADE_MERC.AsString;
      datm_finalidade_merc.qry_finalidade_merc_.Post;
      datm_finalidade_merc.qry_finalidade_merc_.Locate( 'CD_FINALIDADE_MERC', Pesquisa, [loCaseInsensitive] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_finalidade_merc.qry_finalidade_merc_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi( st_incluir, False, False, st_excluir );
end;

function Tfrm_finalidade_merc.Consiste : Boolean;
begin
  Consiste := True;

  {Código}
  if Not lNaoConsiste then
  begin
    if dbedt_cd_finalidade_merc.Text = '' then
    begin
      BoxMensagem('Campo Código da Finalidade da Mercadoria deve ser preenchido!', 2);
      dbedt_cd_finalidade_merc.SetFocus;
      Consiste := False;
      Exit;
    end;

    {Descrição}
    if dbedt_nm_finalidade_merc.Text = '' then
    begin
      BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
      dbedt_nm_finalidade_merc.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
end;

procedure Tfrm_finalidade_merc.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_finalidade_merc.pgctrl_finalidade_mercChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_finalidade_merc.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_finalidade_merc.qry_finalidade_merc_.State in [dsEdit] ) and st_modificar ) or
     ( datm_finalidade_merc.qry_finalidade_merc_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Finalidade da Mercadoria foi alterado.' + #13#10 +
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

procedure Tfrm_finalidade_merc.dblkpcbox_ativoExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_finalidade_merc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_finalidade_merc.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_finalidade_merc.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_finalidade_merc.dbedt_cd_finalidade_mercChange(Sender: TObject);
begin
  if ( datm_finalidade_merc.qry_finalidade_merc_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_finalidade_merc.dbedt_nm_finalidade_mercExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

end.

