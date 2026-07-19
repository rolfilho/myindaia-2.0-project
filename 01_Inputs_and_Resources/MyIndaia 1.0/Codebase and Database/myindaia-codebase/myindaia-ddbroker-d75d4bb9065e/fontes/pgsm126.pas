unit PGSM126;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB;

type
  Tfrm_ag_tx = class(TForm)
    pgctrl_ag_tx: TPageControl;
    ts_lista: TTabSheet;
    dbg_ag_tx: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_ag_tx: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_ativo: TLabel;
    dbedt_cd_ag_tx: TDBEdit;
    dbedt_nm_ag_tx: TDBEdit;
    dblkpcbox_ativo_ag: TDBLookupComboBox;
    pnl_btn_ag_tx: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    panel100: TPanel;
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
    Label5: TLabel;
    dbedt_VL_CPTZ_CNTR_20: TDBEdit;
    Label6: TLabel;
    dbedt_VL_CPTZ_CNTR_40: TDBEdit;
    Label7: TLabel;
    dbedt_VL_CPTZ_C_SOLTA: TDBEdit;
    Label8: TLabel;
    dbedt_VL_CPTZ_MINIMA: TDBEdit;
    Label9: TLabel;
    dbedt_VL_LIBERACAO_BL: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_ag_txChange(Sender: TObject);
    procedure dbedt_nm_ag_txChange(Sender: TObject);
    procedure dbg_ag_txDblClick(Sender: TObject);
    procedure dbg_ag_txKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pgctrl_ag_txChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;

    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_ag_tx: Tfrm_ag_tx;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM125;

{$R *.DFM}

procedure Tfrm_ag_tx.btn_incluirClick(Sender: TObject);
begin
  with datm_ag_tx do
  begin
    qry_ag_tx_.DisableControls;
    qry_ag_tx_.Cancel;
    qry_ag_tx_.Append;
    qry_ag_tx_.EnableControls;
    qry_ag_tx_.FieldByName('CD_TAXA').AsString   := UltCod( qry_ult_ag_tx_, qry_ult_ag_tx_ULTIMO );
    qry_ag_tx_.FieldByName('IN_ATIVO').AsString  := '1';
  end;
  pgctrl_ag_tx.ActivePage := ts_dados_basicos;
  dbedt_nm_ag_tx.SetFocus;
  btn_mi( False, False, False, False );
end;

procedure Tfrm_ag_tx.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_ag_tx.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ag_tx.Cancelar;
begin
  try
  if datm_ag_tx.qry_ag_tx_.State in [dsInsert, dsEdit] then
  begin
    datm_ag_tx.qry_ag_tx_.Cancel;
    pgctrl_ag_tx.ActivePage := ts_dados_basicos;
    dbedt_nm_ag_tx.SetFocus;
  end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_ag_tx.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta taxa de agente será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_ag_tx.qry_ag_tx_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_ag_tx.qry_ag_tx_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_ag_tx.ActivePage := ts_lista;
end;

procedure Tfrm_ag_tx.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ag_tx.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_ag_tx.qry_ag_tx_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_ag_tx.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_ag_tx.qry_ag_tx_CD_TAXA.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_ag_tx.qry_ag_tx_.Close;
  datm_ag_tx.qry_ag_tx_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_ag_tx.qry_ag_tx_.Prepare;
  datm_ag_tx.qry_ag_tx_.Open;
  Localiza(datm_ag_tx.qry_ag_tx_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_ag_tx.pgctrl_ag_txChange(Sender: TObject);
begin
  if ( pgctrl_ag_tx.ActivePage = ts_lista ) then
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

procedure Tfrm_ag_tx.dbedt_nm_ag_txChange(Sender: TObject);
begin
   if ( datm_ag_tx.qry_ag_tx_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_ag_tx.dbg_ag_txDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_ag_tx.qry_ag_tx_CD_TAXA.AsString;
    except
      try
         Cons_Online_Texto := datm_ag_tx.qry_ag_tx_CD_TAXA.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Agente !', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_ag_tx.dbg_ag_txKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_ag_txDblClick(nil);
end;

procedure Tfrm_ag_tx.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  {Inicializa o DataModule para Agentes}
  Application.CreateForm(Tdatm_ag_tx, datm_ag_tx );

  with datm_ag_tx do
  begin
    ds_ag_tx.AutoEdit := st_modificar;

    qry_ag_tx_.SQL[2] := 'NM_TAXA';
    qry_ag_tx_.Prepare;
    qry_ag_tx_.Open;
  end;

  a_str_indices[0] := 'CD_TAXA';
  a_str_indices[1] := 'NM_TAXA';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_incluir.Enabled  := st_incluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_ag_tx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_ag_tx do
    begin
      qry_ag_tx_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

function Tfrm_ag_tx.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_ag_tx.qry_ag_tx_.State in [dsInsert, dsEdit] ) then
    begin
      datm_ag_tx.qry_ag_tx_.Post;
      Pesquisa := datm_ag_tx.qry_ag_tx_CD_TAXA.AsString;
      datm_ag_tx.qry_ag_tx_.Close;
      datm_ag_tx.qry_ag_tx_.Prepare;
      datm_ag_tx.qry_ag_tx_.Open;
      Localiza(datm_ag_tx.qry_ag_tx_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_ag_tx.qry_ag_tx_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_ag_tx.Consiste : Boolean;
begin
  {Descrição da Taxa do agente}
  if Not lNaoConsiste then
  begin
    if dbedt_nm_ag_tx.Text = '' then
    begin
      BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
      pgctrl_ag_tx.ActivePage := ts_dados_basicos;
      dbedt_nm_ag_tx.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
  Consiste := True;
end;

procedure Tfrm_ag_tx.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ag_tx.FormShow(Sender: TObject);
begin
  lNaoConsiste            := False;
  pgctrl_ag_tx.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_ag_tx.pgctrl_ag_txChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_ag_tx.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_ag_tx.qry_ag_tx_.State in [dsEdit] ) and st_modificar ) or
     ( datm_ag_tx.qry_ag_tx_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Taxas de Agentes foi alterado.' + #13#10 +
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

procedure Tfrm_ag_tx.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

end.
