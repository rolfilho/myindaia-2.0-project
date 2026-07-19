unit PGSM244;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, Db, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls;

type
  Tfrm_prop_merc = class(TForm)
    pgctrl_prop_merc: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_prop_merc: TLabel;
    lbl_cd_prop_merc: TLabel;
    dbedt_nm_prop_merc: TDBEdit;
    dbedt_cd_prop_merc: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_prop_mercChange(Sender: TObject);
    procedure pgctrl_prop_mercChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_nm_prop_mercChange(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    str_cd_proprietario : String;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure Abertura;

  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;

  end;

var
  frm_prop_merc: Tfrm_prop_merc;

implementation

uses  PGGP001, PGGP017, GSMLIB, PGSM245;

{$R *.DFM}




procedure Tfrm_prop_merc.btn_incluirClick(Sender: TObject);
begin
  with datm_prop_merc do
  begin
    qry_prop_merc_.DisableControls;
    qry_prop_merc_.Cancel;
    qry_prop_merc_.Append;
    qry_prop_merc_.EnableControls;
    qry_prop_merc_CD_PROPRIETARIO.AsString  := UltCod( qry_ult_prop_merc_, qry_ult_prop_merc_ULTIMO );
  end;

  pgctrl_prop_merc.ActivePage := ts_dados_basicos;

  btn_mi( False, True, True, False );

  dbedt_nm_prop_merc.SetFocus;
end;

procedure Tfrm_prop_merc.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;


procedure Tfrm_prop_merc.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;


procedure Tfrm_prop_merc.btn_excluirClick(Sender: TObject);
begin
 with datm_prop_merc do
  begin
    if BoxMensagem( 'Este Proprietário de Mercadoria será excluído! Confirma exclusão?', 1 ) then
    begin
      try
        datm_main.db_broker.StartTransaction;
        qry_prop_merc_.Delete;
        qry_prop_merc_.ApplyUpdates;
        Abertura;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_prop_merc.qry_prop_merc_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
         end;
      end;
   end;
end;
   pgctrl_prop_merc.ActivePage := ts_lista;


end;
procedure Tfrm_prop_merc.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;


function Tfrm_prop_merc.Consiste : Boolean;
begin
  Consiste := True;

  {Descrição}
  if dbedt_nm_prop_merc.Text = '' then
 begin
    BoxMensagem('Campo Nome deve ser preenchido!', 2);
    pgctrl_prop_merc.ActivePage := ts_dados_basicos;
    dbedt_nm_prop_merc.SetFocus;
    Consiste := False;
    Exit;
   end;
 end;

function Tfrm_prop_merc.Grava;
begin
  begin
    Grava := Commit( datm_prop_merc.qry_prop_merc_ );

    btn_mi(st_incluir, False, False, st_excluir );
  end;
end;

function Tfrm_prop_merc.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_prop_merc.qry_prop_merc_.State in [dsEdit] ) and st_modificar ) or
     ( datm_prop_merc.qry_prop_merc_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Proprietários de Mercadorias foi alterado.' + #13#10 +
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


procedure Tfrm_prop_merc.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_prop_merc.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_prop_merc.qry_prop_merc_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;


procedure Tfrm_prop_merc.edt_chaveKeyDown(Sender: TObject;var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_prop_merc.cb_ordemClick(Sender: TObject);
begin
  with datm_prop_merc do
  begin
    Pesquisa := qry_prop_merc_CD_PROPRIETARIO.AsString;

    edt_chave.Text := '';
    qry_prop_merc_.Close;
    qry_prop_merc_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
    qry_prop_merc_.Prepare;
    qry_prop_merc_.Open;
    Localiza( qry_prop_merc_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
  end;
end;


procedure Tfrm_prop_merc.pgctrl_prop_mercChange(Sender: TObject);
begin
   if (pgctrl_prop_merc.ActivePage = ts_lista ) then
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


procedure Tfrm_prop_merc.pgctrl_prop_mercChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   AllowChange := VerAlt;
end;



procedure Tfrm_prop_merc.dbedt_nm_prop_mercChange(Sender: TObject);
begin
   if ( datm_prop_merc.qry_prop_merc_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_prop_merc.dbg_cadastroDblClick(Sender: TObject);
begin
if lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_prop_merc.qry_prop_merc_CD_PROPRIETARIO.AsString;
    except
      try
        Cons_OnLine_Texto := datm_prop_merc.qry_prop_merc_CD_PROPRIETARIO.AsString;
      except
        BoxMensagem( 'Não consegui retornar Código do Proprietário!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_prop_merc.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_prop_merc.Abertura;
begin
  with datm_prop_merc do
  begin
    qry_prop_merc_.Close;
    qry_prop_merc_.Prepare;
    qry_prop_merc_.Open;
    if str_cd_proprietario <> '' then
      qry_prop_merc_.Locate('CD_PROPRIETARIO', str_cd_proprietario, [loCaseInsensitive]);
  end;
end;

procedure Tfrm_prop_merc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if VerAlt then
  begin
    with datm_prop_merc do
    begin
      qry_prop_merc_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_prop_merc.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module para Proprietários de Mercadoria}
  Application.CreateForm( Tdatm_prop_merc, datm_prop_merc );
end;

procedure Tfrm_prop_merc.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then close;
end;

procedure Tfrm_prop_merc.FormShow(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  pgctrl_prop_merc.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_prop_merc do
  begin
    ds_prop_merc.AutoEdit := st_modificar;

    qry_prop_merc_.Close;
    qry_prop_merc_.SQL[3] := 'NM_PROPRIETARIO';
    qry_prop_merc_.Prepare;
    qry_prop_merc_.Open;
  end;
  a_str_indices[0] := 'CD_PROPRIETARIO';
  a_str_indices[1] := 'NM_PROPRIETARIO';

  with cb_ordem do
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

  pnl_cadastro.Color := clMenuBroker;
end;

procedure Tfrm_prop_merc.Cancelar;
begin
  with datm_prop_merc do
  begin
    try
      qry_prop_merc_.CancelUpdates;
      pgctrl_prop_merc.ActivePage := ts_lista;
      Abertura;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;
end;


end.
