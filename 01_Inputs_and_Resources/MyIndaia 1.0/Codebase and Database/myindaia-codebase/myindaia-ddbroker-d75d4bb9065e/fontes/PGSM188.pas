unit PGSM188;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB;

type
  Tfrm_normas = class(TForm)
    pgctrl_normas: TPageControl;
    ts_lista: TTabSheet;
    dbg_normas: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_normas: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_ativo: TLabel;
    Label5: TLabel;
    dbedt_cd_normas: TDBEdit;
    dbedt_nm_normas: TDBEdit;
    dblkpcbox_ativo_favor: TDBLookupComboBox;
    pnl_btn_normas: TPanel;
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
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbedt_descricao: TDBEdit;
    Label35: TLabel;
    dbedt_cd_pais: TDBEdit;
    dbedt_nm_pais: TDBEdit;
    btn_co_pais: TSpeedButton;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_normasChange(Sender: TObject);
    procedure dbedt_nm_normasChange(Sender: TObject);
    procedure dbg_normasDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_normasChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure btn_co_paisClick(Sender: TObject);
    procedure dbedt_cd_paisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_normasKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    cd_acordo : String;
    lNaoConsiste, lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_normas: Tfrm_normas;

implementation

Uses PGSM189, PGGP017, GSMLIB, PGGP001;

{$R *.DFM}


procedure Tfrm_normas.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
  with datm_normas do
  begin
    qry_normas_.DisableControls;
    qry_normas_.Cancel;
    qry_normas_.Append;
    qry_normas_.EnableControls;
    qry_normas_IN_ATIVO.AsString := '1';

    pgctrl_normas.ActivePage:=ts_dados_basicos;
  end;

  dbedt_cd_normas.Color := clWindow;
  dbedt_cd_normas.ReadOnly := False;

  dbedt_cd_normas.SetFocus;
end;

procedure Tfrm_normas.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;

  pgctrl_normas.SetFocus;
  dbedt_cd_normas.Color := clBtnFace;
  dbedt_cd_normas.ReadOnly := True;
end;

procedure Tfrm_normas.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_normas.Cancelar;
begin
  try
    if datm_normas.qry_normas_.State in [dsInsert, dsEdit] then
    begin
      datm_normas.qry_normas_.Cancel;
      pgctrl_normas.ActivePage := ts_dados_basicos;
      dbedt_nm_normas.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );

  dbedt_cd_normas.Color := clBtnFace;
  dbedt_cd_normas.ReadOnly := True;

end;

procedure Tfrm_normas.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta normas será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_normas.qry_normas_.Delete;
    datm_main.db_broker.Commit;
    pgctrl_normas.ActivePage:=ts_lista;
  except
    on E: Exception do
    begin
      datm_normas.qry_normas_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_normas.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_normas.edt_chaveChange(Sender: TObject);
begin
   Localiza( datm_normas.qry_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_normas.cb_ordemClick(Sender: TObject);
begin
  with datm_normas do
  begin
    Pesquisa := qry_lista_CODIGO.AsString;
    { Apaga o campo de pesquisa }
    edt_chave.Text := '';
    qry_lista_.Close;
    qry_lista_.ParamByName('CD_ACORDO').AsString := cd_acordo;
    qry_lista_.SQL[7] := a_str_indices[cb_ordem.ItemIndex];
    qry_lista_.Open;
    Localiza( qry_lista_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_normas.pgctrl_normasChange(Sender: TObject);
begin
  if ( pgctrl_normas.ActivePage = ts_lista ) then
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
    dbedt_cd_normas.Color := clBtnFace;
    dbedt_cd_normas.ReadOnly := True;
  end;
end;

procedure Tfrm_normas.dbedt_nm_normasChange(Sender: TObject);
begin
  if ( datm_normas.qry_normas_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_normas.dbg_normasDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_normas.qry_normas_CODIGO.AsString;
    except
      try
        Cons_Online_Texto := datm_normas.qry_normas_CODIGO.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do normas !', 2);
      end;
    end;
    Close;
  end;
end;

function Tfrm_normas.Grava;
var cd_norma: String;
begin
  with datm_normas do
  begin
    try
      datm_main.db_broker.StartTransaction;
      cd_norma := qry_normas_CODIGO.AsString;
      if ( qry_normas_.State in [dsInsert, dsEdit] ) then
        qry_normas_.Post;
      qry_lista_.Close;
      qry_lista_.Prepare;
      qry_lista_.Open;
      qry_lista_.Locate( 'CODIGO', cd_norma, [] );

      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        qry_normas_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_normas.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_normas.Consiste;
begin
  if dbedt_nm_normas.Text = '' then
  begin
    BoxMensagem('Campo Nome deve ser preenchido!', 2);
    dbedt_nm_normas.SetFocus;
    Consiste := False;
    Exit;
  end;

  {País}
  if dbedt_cd_pais.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_pais );
    if ( dbedt_nm_pais.Text = '' ) then
    begin
      BoxMensagem( 'Código do País inválido !', 2 );
      pgctrl_normas.ActivePage := ts_dados_basicos;
      dbedt_cd_pais.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  Consiste := True;
end;

procedure Tfrm_normas.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_normas, datm_normas );
end;

procedure Tfrm_normas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_normas do
  begin
    qry_lista_.Close;
    qry_normas_.Close;
    tbl_yesno_.Close;
    Free;

    Action := caFree;
  end;
end;

procedure Tfrm_normas.pgctrl_normasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_normas.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_normas.qry_normas_.State in [dsEdit] ) and st_modificar ) or
     ( datm_normas.qry_normas_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de normas foi alterado.' + #13#10 +
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

procedure Tfrm_normas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_normas.FormShow(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_normas do
  begin
    tbl_yesno_.Open;
    qry_lista_.Close;
    qry_lista_.ParamByName('CD_ACORDO').AsString := cd_acordo;
    qry_lista_.SQL[7] := 'NOME';
    qry_lista_.Prepare;
    qry_lista_.Open;
  end;

  a_str_indices[0] := 'CODIGO';
  a_str_indices[1] := 'NOME';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 1;
  end;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_normas.ds_normas.AutoEdit   := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;

  pgctrl_normas.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_normas.dbedt_cd_paisExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_normas.btn_co_paisClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TPAIS',
                datm_normas.qry_normas_CD_PAIS,
                'País', 1, '', 'TQuery');
  dbedt_cd_paisExit(nil);
end;

procedure Tfrm_normas.dbedt_cd_paisKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_pais then btn_co_paisClick(nil);
  end;
end;

procedure Tfrm_normas.dbg_normasKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) and ( pgctrl_normas.ActivePage = ts_lista ) then
     dbg_normasDblClick(Sender);
end;

procedure Tfrm_normas.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_normasDblClick(nil);
end;

end.
