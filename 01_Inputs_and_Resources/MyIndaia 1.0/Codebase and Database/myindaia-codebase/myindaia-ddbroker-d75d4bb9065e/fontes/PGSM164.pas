unit PGSM164;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls;

type
  Tfrm_urf_scx_exp = class(TForm)
    pgctrl_urf_scx_exp: TPageControl;
    ts_lista: TTabSheet;
    dbgrd_urf: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_descr: TLabel;
    lbl_dt_feriado: TLabel;
    dbedt_nm_urf_scx_exp: TDBEdit;
    dbedt_cd_urf_scx_exp: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dblckpbox_via_transp: TDBLookupComboBox;
    Label1: TLabel;
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
    procedure dbedt_nm_urf_scx_expChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrd_urfDblClick(Sender: TObject);
    procedure dbgrd_urfKeyPress(Sender: TObject; var Key: Char);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_urf_scx_expChange(Sender: TObject);
    procedure pgctrl_urf_scx_expChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_urf_scx_expChange(Sender: TObject);
    procedure dbedt_cd_urf_scx_expExit(Sender: TObject);
    procedure dbedt_nm_urf_scx_expExit(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    lNaoConsiste : Boolean;
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
  frm_urf_scx_exp: Tfrm_urf_scx_exp;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM163;

procedure Tfrm_urf_scx_exp.dbedt_nm_urf_scx_expChange(Sender: TObject);
begin
  if ( datm_urf_scx_exp.qry_urf_scx_exp_.State in [ dsInsert, dsEdit ] ) then
     btn_Mi( False, True, True, False );
end;

procedure Tfrm_urf_scx_exp.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  Application.CreateForm( Tdatm_urf_scx_exp, datm_urf_scx_exp );

  with datm_urf_scx_exp do
  begin
    ds_urf_scx_exp.AutoEdit := st_modificar;
    qry_urf_scx_exp_.Close;
    qry_urf_scx_exp_.Prepare;
    qry_urf_scx_exp_.Open;

    a_str_indices[0] := 'CD_URF';
    a_str_indices[1] := 'NM_URF';

    with cb_ordem do
    begin
      Clear;
      Items.Add('Código');
      Items.Add('Descrição');
      ItemIndex := 1;
    end;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_urf_scx_exp.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_urf_scx_exp.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_urf_scx_exp do
  begin
    qry_urf_scx_exp_.Close;
    qry_urf_scx_exp_.Prepare;
    qry_urf_scx_exp_.Open;

    btn_excluir.Enabled := True;
    mi_excluir.Enabled  := True;
    if qry_urf_scx_exp_.RecordCount = 0 then
    begin
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := False;
    end;
  end;
end;

procedure Tfrm_urf_scx_exp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_urf_scx_exp do
    begin
      qry_via_transp_broker_.Close;
      qry_urf_scx_exp_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_urf_scx_exp.dbgrd_urfDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_urf_scx_exp.qry_urf_scx_exp_CD_URF.AsString;
    except
      try
        Cons_OnLine_Texto := datm_urf_scx_exp.qry_urf_scx_exp_CD_URF.AsString;
      except
        BoxMensagem('Não consegui retornar URF!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_urf_scx_exp.dbgrd_urfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbgrd_urfDblClick(nil);
end;

procedure Tfrm_urf_scx_exp.btn_incluirClick(Sender: TObject);
begin
  btn_mi( False, True, True, False );

  with datm_urf_scx_exp do
  begin
    qry_urf_scx_exp_.DisableControls;
    qry_urf_scx_exp_.Cancel;
    qry_urf_scx_exp_.Append;
    qry_urf_scx_exp_CD_VIA_TRANSP.AsString := '';
    qry_urf_scx_exp_.EnableControls;
  end;
  pgctrl_urf_scx_exp.ActivePage := ts_dados_basicos;
  ts_dados_basicos.Enabled      := True;

  dbedt_cd_urf_scx_exp.SetFocus;

end;

procedure Tfrm_urf_scx_exp.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_urf_scx_exp.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_urf_scx_exp.Cancelar;
begin
  try
    if datm_urf_scx_exp.qry_urf_scx_exp_.State in [dsInsert, dsEdit] then
    begin
      datm_urf_scx_exp.qry_urf_scx_exp_.Cancel;
      pgctrl_urf_scx_exp.ActivePage := ts_dados_basicos;
      dbedt_nm_urf_scx_exp.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_urf_scx_exp.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta URF será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_urf_scx_exp.qry_urf_scx_exp_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_urf_scx_exp.qry_urf_scx_exp_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  pgctrl_urf_scx_exp.ActivePage := ts_lista;
end;

procedure Tfrm_urf_scx_exp.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_urf_scx_exp.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_urf_scx_exp.qry_urf_scx_exp_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_urf_scx_exp.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_urf_scx_exp.qry_urf_scx_exp_CD_URF.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_urf_scx_exp.qry_urf_scx_exp_.Close;
  datm_urf_scx_exp.qry_urf_scx_exp_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_urf_scx_exp.qry_urf_scx_exp_.Prepare;
  datm_urf_scx_exp.qry_urf_scx_exp_.Open;
  Localiza( datm_urf_scx_exp.qry_urf_scx_exp_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_urf_scx_exp.Consiste : Boolean;
begin
  Consiste := True;
  if Not lNaoConsiste then
  begin
    if dbedt_cd_urf_scx_exp.Text = '' then
    begin
      BoxMensagem('Campo Código deve ser preenchido!', 2);
      pgctrl_urf_scx_exp.ActivePage := ts_dados_basicos;
      dbedt_cd_urf_scx_exp.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dbedt_nm_urf_scx_exp.Text = '' then
    begin
      BoxMensagem('Campo Descrição deve ser preenchido!', 2);
      pgctrl_urf_scx_exp.ActivePage := ts_dados_basicos;
      dbedt_nm_urf_scx_exp.SetFocus;
      Consiste := False;
      Exit;
    end;

    if datm_urf_scx_exp.qry_urf_scx_exp_CD_VIA_TRANSP.AsString = '' then
    begin
      BoxMensagem('Campo Via de Transporte deve ser preenchido!', 2);
      pgctrl_urf_scx_exp.ActivePage := ts_dados_basicos;
      dblckpbox_via_transp.SetFocus;
      Consiste := False;
      Exit;
    end;

  end;
end;

function Tfrm_urf_scx_exp.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_urf_scx_exp.qry_urf_scx_exp_.State in [dsInsert, dsEdit] ) then
    begin
      datm_urf_scx_exp.qry_urf_scx_exp_.Post;
      Pesquisa := datm_urf_scx_exp.qry_urf_scx_exp_CD_URF.AsString;
      datm_urf_scx_exp.qry_urf_scx_exp_.Close;
      datm_urf_scx_exp.qry_urf_scx_exp_.Prepare;
      datm_urf_scx_exp.qry_urf_scx_exp_.Open;
      datm_urf_scx_exp.qry_urf_scx_exp_.Locate('CD_URF', Pesquisa, [loCaseInsensitive] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_urf_scx_exp.qry_urf_scx_exp_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_urf_scx_exp.pgctrl_urf_scx_expChange(Sender: TObject);
begin
  if ( pgctrl_urf_scx_exp.ActivePage = ts_lista ) then
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

procedure Tfrm_urf_scx_exp.pgctrl_urf_scx_expChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_urf_scx_exp.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_urf_scx_exp.qry_urf_scx_exp_.State in [dsEdit] ) and st_modificar ) or
     ( datm_urf_scx_exp.qry_urf_scx_exp_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de URF foi alterado.' + #13#10 +
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

procedure Tfrm_urf_scx_exp.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
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

procedure Tfrm_urf_scx_exp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_urf_scx_exp.dbedt_cd_urf_scx_expChange(Sender: TObject);
begin
  if ( datm_urf_scx_exp.qry_urf_scx_exp_.State in [ dsInsert, dsEdit ] ) then
     btn_Mi( False, True, True, False );
end;


procedure Tfrm_urf_scx_exp.dbedt_cd_urf_scx_expExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_urf_scx_exp.dbedt_nm_urf_scx_expExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

end.
