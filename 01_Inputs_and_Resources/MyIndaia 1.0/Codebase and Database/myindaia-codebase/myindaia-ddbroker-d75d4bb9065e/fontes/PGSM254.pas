unit PGSM254;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, Db, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, ToolEdit, RXDBCtrl;

type
  Tfrm_delegacia = class(TForm)
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
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_delegacia: TPanel;
    pgctrl_delegacia: TPageControl;
    dbg_cadastro: TDBGrid;
    btn_imp: TSpeedButton;
    mi_imprimir: TMenuItem;
    lbl_nm_prop_merc: TLabel;
    lbl_cd_prop_merc: TLabel;
    dbedt_nm_delegacia: TDBEdit;
    dbedt_cd_delegacia: TDBEdit;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure pgctrl_delegaciaChange(Sender: TObject);
    procedure pgctrl_delegaciaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_nr_pedidoChange(Sender: TObject);

  private
    { Private declarations }
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir, lNaoConsiste : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;

  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    procedure VerDelegacia;
  end;

var
  frm_delegacia: Tfrm_delegacia;

implementation

uses PGGP001, PGGP017, GSMLIB, PGSM255;

{$R *.DFM}
procedure Tfrm_delegacia.btn_incluirClick(Sender: TObject);
begin
  with datm_delegacia do
  begin
    if qry_delegacia_.State in [dsInsert] then
       qry_delegacia_.Cancel;

    qry_delegacia_.DisableControls;
    qry_delegacia_.Cancel;
    qry_delegacia_.Append;
    qry_delegacia_.EnableControls;
    qry_delegacia_CD_DELEGACIA.AsString := UltCod( qry_ult_delegacia_, qry_ult_delegacia_ULTIMO );

    pgctrl_delegacia.ActivePage := ts_dados_basicos;
    pnl_delegacia.Enabled       := True;
    dbedt_nm_delegacia.SetFocus;
  end;

  btn_mi( False, True, True, False );
end;

procedure Tfrm_delegacia.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_delegacia.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_delegacia.btn_excluirClick(Sender: TObject);
begin
  with datm_delegacia do
  begin
    if BoxMensagem( 'Esta Delegacia - RF será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      qry_delegacia_.Delete;
      qry_delegacia_.ApplyUpdates;
      datm_main.db_broker.Commit;
      qry_lista_.Close;
      qry_lista_.Prepare;
      qry_lista_.Open;
      VerDelegacia;
    except
      on E: Exception do
      begin
        TrataErro(E);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        qry_delegacia_.Cancel;
      end;
    end;
  end;
end;

procedure Tfrm_delegacia.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

function Tfrm_delegacia.Consiste : Boolean;
begin
  Consiste := True;

  with datm_delegacia do
  begin
    if ( qry_delegacia_.State in [dsInsert, dsEdit] ) then
    begin
      if Not lNaoConsiste then
      begin
        {Delegacia}
        if Trim( dbedt_nm_delegacia.Text ) = '' then
        begin
          BoxMensagem( 'Campo Nome deve ser preenchido!', 2 );
          pgctrl_delegacia.ActivePage := ts_dados_basicos;
          dbedt_nm_delegacia.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;
end;

function Tfrm_delegacia.Grava;
var
  CdDelegaciaAnt : String[2];
begin
  Grava := False;

  with datm_delegacia do
  begin
    if pgctrl_delegacia.ActivePage = ts_dados_basicos then
    begin
      CdDelegaciaAnt := qry_delegacia_CD_DELEGACIA.AsString;
      Grava := Commit( qry_delegacia_ );
      qry_lista_.Close;
      qry_lista_.Prepare;
      qry_lista_.Open;
      qry_lista_.Locate('CD_DELEGACIA', CdDelegaciaAnt, [loCaseInsensitive] );
      VerDelegacia;
    end;
  end;

  btn_mi( st_incluir, False, False, st_excluir );
end;

function Tfrm_delegacia.VerAlt : Boolean;
begin
  VerAlt := True;

  if ( ( datm_delegacia.qry_delegacia_.State in [dsEdit] ) and st_modificar ) or
     ( datm_delegacia.qry_delegacia_.State in [dsInsert] ) then
  begin
    if BoxMensagem( 'Cadastro de Delegacias foi alterado.' + #13#10 +
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

procedure Tfrm_delegacia.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_delegacia.edt_chaveChange(Sender: TObject);
begin
  with datm_delegacia do
  begin
    Localiza( qry_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
  end;
end;

procedure Tfrm_delegacia.edt_chaveKeyDown(Sender: TObject;var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_delegacia.cb_ordemClick(Sender: TObject);
begin
  with datm_delegacia do
  begin
    Pesquisa := qry_delegacia_CD_DELEGACIA.AsString;

    edt_chave.Text := '';
    qry_lista_.Close;
    qry_lista_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
    qry_lista_.Prepare;
    qry_lista_.Open;
    Localiza( qry_lista_, Pesquisa, a_str_indices[1] );
    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_delegacia.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_delegacia.qry_delegacia_CD_DELEGACIA.AsString;
    except
      try
        Cons_OnLine_Texto := datm_delegacia.qry_delegacia_CD_DELEGACIA.AsString;
      except
        BoxMensagem( 'Não consegui retornar Cód da Delegacia - RF!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_delegacia.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_delegacia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_delegacia do
    begin
      qry_delegacia_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_delegacia.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module para Delegacia - RF}
  Application.CreateForm( Tdatm_delegacia, datm_delegacia );
end;

procedure Tfrm_delegacia.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_delegacia.FormShow(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  pgctrl_delegacia.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_delegacia do
  begin
    ds_delegacia.AutoEdit := st_modificar;

    qry_lista_.Close;
    qry_lista_.SQL[3] := 'NM_DELEGACIA';
    qry_lista_.Prepare;
    qry_lista_.Open;
  end;
  a_str_indices[0]  := 'CD_DELEGACIA';
  a_str_indices[1]  := 'NM_DELEGACIA';

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
end;

procedure Tfrm_delegacia.Cancelar;
begin
  with datm_delegacia do
  begin
    try
      if qry_delegacia_.State in [dsInsert, dsEdit] then
      begin
        qry_delegacia_.CancelUpdates;
        VerDelegacia;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_delegacia.VerDelegacia;
begin
  pnl_delegacia.Enabled := ( Not ( datm_delegacia.qry_delegacia_.State in [dsInactive] ) );
end;

procedure Tfrm_delegacia.pgctrl_delegaciaChange(Sender: TObject);
begin
  if ( pgctrl_delegacia.ActivePage = ts_lista ) then
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

procedure Tfrm_delegacia.pgctrl_delegaciaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_delegacia.dbedt_nr_pedidoChange(Sender: TObject);
begin
  if ( datm_delegacia.qry_delegacia_.State in [ dsInsert, dsEdit ] ) then
    btn_mi( False, True, True, False );
end;

end.
