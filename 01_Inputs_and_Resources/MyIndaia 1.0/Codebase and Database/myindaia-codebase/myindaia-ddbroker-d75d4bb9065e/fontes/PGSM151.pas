unit PGSM151;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls;

type
  Tfrm_feriado = class(TForm)
    pgctrl_feriado: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_descr: TLabel;
    lbl_dt_feriado: TLabel;
    dbedt_nm_feriado: TDBEdit;
    dbedt_dt_feriado: TDBEdit;
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
    procedure dbedt_nm_feriadoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_feriadoChange(Sender: TObject);
    procedure pgctrl_feriadoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_dt_feriadoChange(Sender: TObject);
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
    lRecDesp, lRec : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_feriado: Tfrm_feriado;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM152;

procedure Tfrm_feriado.dbedt_nm_feriadoChange(Sender: TObject);
begin
  if ( datm_feriado.qry_feriado_.State in [ dsInsert, dsEdit ] ) then
     btn_Mi( False, True, True, False );
end;

procedure Tfrm_feriado.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  lRecDesp     := False;
  lRec         := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  Application.CreateForm( Tdatm_feriado, datm_feriado );

  with datm_feriado do
  begin
    ds_feriado.AutoEdit := st_modificar;
    qry_feriado_.Prepare;
    qry_feriado_.Open;

    a_str_indices[0] := 'DT_FERIADO';
    a_str_indices[1] := 'NM_FERIADO';

    with cb_ordem do
    begin
      Clear;
      Items.Add('Data');
      Items.Add('Descrição');
      ItemIndex := 1;
    end;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_feriado.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_feriado.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_feriado do
  begin
    qry_feriado_.Close;
    qry_feriado_.Prepare;
    qry_feriado_.Open;

    btn_excluir.Enabled := True;
    mi_excluir.Enabled  := True;
    if qry_feriado_.RecordCount = 0 then
    begin
       btn_excluir.Enabled := False;
       mi_excluir.Enabled  := False;
    end;
  end;
end;

procedure Tfrm_feriado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_feriado do
    begin
      qry_feriado_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_feriado.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_feriado.qry_feriado_DT_FERIADO.AsString;
    except
      try
        Cons_OnLine_Texto := datm_feriado.qry_feriado_DT_FERIADO.AsString;
      except
        BoxMensagem('Não consegui retornar Data do Feriado !', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_feriado.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_feriado.btn_incluirClick(Sender: TObject);
begin
  btn_Mi( False, True, True, False );

  with datm_feriado do
  begin
    qry_feriado_.DisableControls;
    qry_feriado_.Cancel;
    qry_feriado_.Append;
    qry_feriado_.EnableControls;
  end;
  pgctrl_feriado.ActivePage := ts_dados_basicos;
  ts_dados_basicos.Enabled := True;
  pnl_entrada_de_dados.Enabled := True;

  dbedt_dt_feriado.SetFocus;

end;

procedure Tfrm_feriado.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_feriado.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_feriado.Cancelar;
begin
  try
    if datm_feriado.qry_feriado_.State in [dsInsert, dsEdit] then
    begin
      Btn_Mi(st_incluir, False, False, st_excluir );

      datm_feriado.qry_feriado_.Cancel;
      pgctrl_feriado.ActivePage := ts_dados_basicos;
      pgctrl_feriado.SetFocus;

      pnl_entrada_de_dados.Enabled := False;
      btn_excluir.Enabled := True;
      mi_excluir.Enabled := True;

      if datm_feriado.qry_feriado_.RecordCount = 0 then
      begin
        pnl_entrada_de_dados.Enabled := False;
        btn_excluir.Enabled := False;
        mi_excluir.Enabled := False;
      end;

    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_feriado.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta data será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_feriado.qry_feriado_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_feriado.qry_feriado_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  pgctrl_feriado.ActivePage := ts_lista;
end;

procedure Tfrm_feriado.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_feriado.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_feriado.qry_feriado_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_feriado.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_feriado.qry_feriado_DT_FERIADO.AsString;
  edt_chave.Text := '';
  datm_feriado.qry_feriado_.Close;
  datm_feriado.qry_feriado_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_feriado.qry_feriado_.Prepare;
  datm_feriado.qry_feriado_.Open;
  Localiza( datm_feriado.qry_feriado_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_feriado.Consiste : Boolean;
begin
  Consiste := True;
  if dbedt_dt_feriado.Text = '  /  /  ' then
  begin
    BoxMensagem('Campo Data deve ser preenchido!', 2);
    pgctrl_feriado.ActivePage := ts_dados_basicos;
    dbedt_dt_feriado.SetFocus;
    Consiste := False;
    Exit;
  end;
  if dbedt_nm_feriado.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_feriado.ActivePage := ts_dados_basicos;
    dbedt_nm_feriado.SetFocus;
    Consiste := False;
    Exit;
  end;

end;

function Tfrm_feriado.Grava : Boolean;
var dt_feriado : TDateTime;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_feriado.qry_feriado_.State in [dsInsert, dsEdit] ) then
    begin
      datm_feriado.qry_feriado_.Post;
      dt_feriado := datm_feriado.qry_feriado_DT_FERIADO.AsdateTime;
      Pesquisa := datm_feriado.qry_feriado_DT_FERIADO.AsString;
      datm_feriado.qry_feriado_.Close;
      datm_feriado.qry_feriado_.Prepare;
      datm_feriado.qry_feriado_.Open;
      //Localiza(datm_feriado.qry_feriado_, Pesquisa, a_str_indices[0] );
      datm_feriado.qry_feriado_.Locate('DT_FERIADO', dt_feriado, [] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_feriado.qry_feriado_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_feriado.pgctrl_feriadoChange(Sender: TObject);
begin
  if (pgctrl_feriado.ActivePage = ts_lista ) then
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

  If pgctrl_feriado.ActivePage = ts_dados_basicos then
  begin
    pnl_entrada_de_dados.Enabled := True;
    If datm_feriado.qry_feriado_.RecordCount = 0 then
       pnl_entrada_de_dados.Enabled := False;
  end;

end;

procedure Tfrm_feriado.pgctrl_feriadoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_feriado.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_feriado.qry_feriado_.State in [dsEdit] ) and st_modificar ) and (btn_salvar.Enabled = True) or
     ( datm_feriado.qry_feriado_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Feriado foi alterado.' + #13#10 +
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

procedure Tfrm_feriado.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
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

procedure Tfrm_feriado.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_feriado.dbedt_dt_feriadoChange(Sender: TObject);
begin
  if ( datm_feriado.qry_feriado_.State in [ dsInsert, dsEdit ] ) then
     btn_Mi( False, True, True, False );
end;

end.
