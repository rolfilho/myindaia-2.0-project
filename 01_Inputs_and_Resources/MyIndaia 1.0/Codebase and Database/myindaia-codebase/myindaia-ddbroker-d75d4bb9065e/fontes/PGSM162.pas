unit PGSM162;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB;

type
  Tfrm_enquad_op = class(TForm)
    pgctrl_enquad_op: TPageControl;
    ts_lista: TTabSheet;
    dbgrd_enquad_op: TDBGrid;
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
    dbedt_cd_enquad_op: TDBEdit;
    Label4: TLabel;
    dbedt_nm_enquad_op: TDBEdit;
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
    procedure pgctrl_enquad_opChange(Sender: TObject);
    procedure dbgrd_enquad_opDblClick(Sender: TObject);
    procedure dbgrd_enquad_opKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure pgctrl_enquad_opChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dblkpcbox_ativoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_enquad_opChange(Sender: TObject);
    procedure dbedt_cd_enquad_opExit(Sender: TObject);
    procedure dbedt_nm_enquad_opExit(Sender: TObject);
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
  frm_enquad_op: Tfrm_enquad_op;

implementation

uses PGSM161, GSMLIB, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_enquad_op.btn_incluirClick(Sender: TObject);
begin
   btn_incluir.Enabled := False;
   mi_incluir.Enabled  := False;
   btn_excluir.Enabled := False;
   mi_excluir.Enabled  := False;
   with datm_enquad_op do
   begin
     qry_enquad_op_.DisableControls;
     qry_enquad_op_.Cancel;
     qry_enquad_op_.Append;
     qry_enquad_op_.EnableControls;
     qry_enquad_op_IN_ATIVO.AsString := '1';
   end;
   pgctrl_enquad_op.ActivePage:=ts_dados_basicos;
   dbedt_cd_enquad_op.SetFocus;
end;

procedure Tfrm_enquad_op.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_enquad_op.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_enquad_op.Cancelar;
begin
  try
    if datm_enquad_op.qry_enquad_op_.State in [dsInsert, dsEdit] then
    begin
      datm_enquad_op.qry_enquad_op_.Cancel;
      pgctrl_enquad_op.ActivePage := ts_dados_basicos;
      dbedt_nm_enquad_op.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_enquad_op.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Enquadramento de operação será excluído!' + #13#10 + 
                  'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_enquad_op.qry_enquad_op_.Delete;
    datm_main.db_broker.Commit;
    pgctrl_enquad_op.ActivePage:=ts_lista;
  except
    on E: Exception do
    begin
      datm_enquad_op.qry_enquad_op_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_enquad_op.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_enquad_op.edt_chaveChange(Sender: TObject);
begin
   Localiza( datm_enquad_op.qry_enquad_op_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_enquad_op.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_enquad_op.qry_enquad_op_CD_enquad_op.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_enquad_op.qry_enquad_op_.Close;
  datm_enquad_op.qry_enquad_op_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_enquad_op.qry_enquad_op_.Prepare;
  datm_enquad_op.qry_enquad_op_.Open;
  Localiza( datm_enquad_op.qry_enquad_op_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_enquad_op.pgctrl_enquad_opChange(Sender: TObject);
begin
  if (pgctrl_enquad_op.ActivePage = ts_lista ) then
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

procedure Tfrm_enquad_op.dbgrd_enquad_opDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_enquad_op.qry_enquad_op_CD_enquad_op.AsString;
    except
      try
        Cons_Online_Texto := datm_enquad_op.qry_enquad_op_CD_enquad_op.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Enquadramento!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_enquad_op.dbgrd_enquad_opKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbgrd_enquad_opDblClick(Sender);
end;

procedure Tfrm_enquad_op.FormCreate(Sender: TObject);
begin
  { Cria o DataModule do Enquadramento da Operação }

  Application.CreateForm( Tdatm_enquad_op, datm_enquad_op );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_enquad_op do
  begin
    tbl_yesno_.Open;
    qry_enquad_op_.Close;
    qry_enquad_op_.SQL[2] := 'NM_ENQUAD_OP';
    qry_enquad_op_.Prepare;
    qry_enquad_op_.Open;
  end;

  a_str_indices[0] := 'CD_ENQUAD_OP';
  a_str_indices[1] := 'NM_ENQUAD_OP';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;
  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  datm_enquad_op.ds_enquad_op.AutoEdit     := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

procedure Tfrm_enquad_op.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_enquad_op do
    begin
      qry_enquad_op_.Close;
      tbl_yesno_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

function Tfrm_enquad_op.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_enquad_op.qry_enquad_op_.State in [dsInsert, dsEdit] ) then
    begin
      Pesquisa := datm_enquad_op.qry_enquad_op_CD_ENQUAD_OP.AsString;
      datm_enquad_op.qry_enquad_op_.Post;
      datm_enquad_op.qry_enquad_op_.Locate( 'CD_ENQUAD_OP', Pesquisa, [loCaseInsensitive] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_enquad_op.qry_enquad_op_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi( st_incluir, False, False, st_excluir );
end;

function Tfrm_enquad_op.Consiste : Boolean;
begin
  Consiste := True;

  if datm_enquad_op.qry_enquad_op_.State in [dsEdit, dsInsert] then
  begin
    ValidCodigo( dbedt_cd_enquad_op );
  end;
  {Código}
  if Not lNaoConsiste then
  begin
    if dbedt_cd_enquad_op.Text = '' then
    begin
      BoxMensagem('Campo Código do Enquadramento da Operação deve ser preenchido!', 2);
      dbedt_cd_enquad_op.SetFocus;
      Consiste := False;
      Exit;
    end;

    {Descrição}
    if dbedt_nm_enquad_op.Text = '' then
    begin
      BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
      dbedt_nm_enquad_op.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

end;

procedure Tfrm_enquad_op.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_enquad_op.dbedt_cd_bancoExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_enquad_op.pgctrl_enquad_opChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_enquad_op.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_enquad_op.qry_enquad_op_.State in [dsEdit] ) and st_modificar ) or
     ( datm_enquad_op.qry_enquad_op_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Enquadramento da Operação foi alterado.' + #13#10 +
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

procedure Tfrm_enquad_op.dblkpcbox_ativoExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_enquad_op.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_enquad_op.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_enquad_op.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_enquad_op.dbedt_cd_enquad_opChange(Sender: TObject);
begin
  if ( datm_enquad_op.qry_enquad_op_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_enquad_op.dbedt_cd_enquad_opExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_enquad_op.dbedt_nm_enquad_opExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

end.

