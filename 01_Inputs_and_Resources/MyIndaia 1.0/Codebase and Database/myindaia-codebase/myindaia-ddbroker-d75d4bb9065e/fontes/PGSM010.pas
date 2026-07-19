unit PGSM010;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001, RxDBComb, Funcoes;

type
  Tfrm_produto = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbnvg: TDBNavigator;
    pgctrl_produto: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    dbg_cadastro: TDBGrid;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label3: TLabel;
    dbedt_cd_produto: TDBEdit;
    Label4: TLabel;
    dbedt_nm_produto: TDBEdit;
    Label5: TLabel;
    dbedt_ap_produto: TDBEdit;
    lbl_usuatio_ativo: TLabel;
    dblkpcbox_ativo: TDBLookupComboBox;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    dblckbox_fat_sem_rec: TDBLookupComboBox;
    Label6: TLabel;
    rxcmbox_tp_produto: TRxDBComboBox;
    Label7: TLabel;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_nm_produtoChange(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure pgctrl_produtoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_produtoChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    OnChanging : Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lnm_produto, lap_produto : boolean;

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
  frm_produto: Tfrm_produto;

implementation

uses GSMLIB, PGGP017, PGSM110;

{$R *.DFM}

procedure Tfrm_produto.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_produto.btn_incluirClick(Sender: TObject);
begin
  with datm_produto do
  begin
    qry_produto_.DisableControls;
    qry_produto_.Cancel;
    qry_produto_.Append;
    qry_produto_.EnableControls;
    qry_produto_CD_PRODUTO.AsString  := UltCod( qry_ult_produto_, qry_ult_produto_ULTIMO );
    qry_produto_IN_ATIVO.AsString  := '1';
  end;
  pgCtrl_produto.ActivePage := ts_dados_basicos;
  dbedt_nm_produto.SetFocus;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;
end;

procedure Tfrm_produto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//datm_produto.destroy;
  datm_produto.Free;
  Action := caFree;
end;

procedure Tfrm_produto.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_produto.qry_produto_CD_PRODUTO.AsString;
    except
      try
        Cons_OnLine_Texto := datm_produto.qry_produto_CD_PRODUTO.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Produto !', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 27 then Close;
  If Key = 13 then
  begin
    dbg_cadastroDblClick(Sender);
  end;
end;

procedure Tfrm_produto.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de Unid Neg }

  Application.CreateForm(Tdatm_produto, datm_produto );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  lnm_produto  := False;
  lap_produto  := False;

  with datm_produto do
  begin
    tbl_yesno_.Open;
    qry_produto_lista_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_produto_lista_.ParamByName('CD_CARGO').AsString   := str_cd_cargo;
    qry_produto_lista_.SQL[7] := 'NM_PRODUTO';
    qry_produto_lista_.Prepare;
    qry_produto_lista_.Open;
    qry_produto_.Prepare;
    qry_produto_.Open;
  end;

  a_str_indices[0] := 'CD_PRODUTO';
  a_str_indices[1] := 'NM_PRODUTO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_produto.ds_produto.AutoEdit := st_modificar;
  datm_produto.ds_produto.AutoEdit := st_modificar;
  datm_produto.ds_produto.AutoEdit := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

procedure Tfrm_produto.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este produto será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_produto.qry_produto_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_produto.qry_produto_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  Pesquisa := datm_produto.qry_produto_CD_PRODUTO.AsString;
  datm_produto.qry_produto_lista_.Close;
  datm_produto.qry_produto_lista_.Prepare;
  datm_produto.qry_produto_lista_.Open;
  Localiza(datm_produto.qry_produto_lista_, Pesquisa, a_str_indices[0] );
  pgctrl_produto.ActivePage := ts_lista;
end;

procedure Tfrm_produto.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_produto.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_produto.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_produto.qry_produto_CD_PRODUTO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_produto.qry_produto_lista_.Close;
  datm_produto.qry_produto_lista_.SQL[7] := a_str_indices[cb_ordem.ItemIndex];
  datm_produto.qry_produto_lista_.Open;
  Localiza(datm_produto.qry_produto_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_produto.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_produto.qry_produto_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_produto.FormShow(Sender: TObject);
begin
  pgctrl_produto.ActivePage := ts_lista;
end;

procedure Tfrm_produto.dbedt_nm_produtoChange(Sender: TObject);
begin
  If ( datm_produto.qry_produto_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_produto.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

function Tfrm_produto.Consiste : Boolean;
begin
  if dbedt_nm_produto.Text = '' then
  begin
    BoxMensagem('Campo Nome deve ser preenchido!', 2);
    pgctrl_produto.ActivePage := ts_dados_basicos;
    dbedt_nm_produto.SetFocus;
    lnm_produto := True;
    Consiste := False;
    Exit;
  end;
  if dbedt_ap_produto.Text = '' then
  begin
    BoxMensagem('Campo Apelido deve ser preenchido!', 2);
    pgctrl_produto.ActivePage := ts_dados_basicos;
    dbedt_ap_produto.SetFocus;
    lap_produto := True;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

function Tfrm_produto.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_produto.qry_produto_.State in [dsInsert, dsEdit] ) then
    begin
      datm_produto.qry_produto_.Post;

      if ( datm_produto.qry_produto_.State in [dsInsert] ) then  //consiste in_ativo
      begin
        CloseStoredProc(datm_produto.sp_inc_produto_usuario);
        datm_produto.sp_inc_produto_usuario.ParamByName('@CD_USUARIO').AsString  := str_cd_usuario;
        datm_produto.sp_inc_produto_usuario.ParamByName('@CD_PRODUTO').AsString  := datm_produto.qry_produto_CD_PRODUTO.AsString;
        datm_produto.sp_inc_produto_usuario.ParamByName('@CD_UNID_NEG').AsString := str_cd_unid_neg;
        ExecStoredProc(datm_produto.sp_inc_produto_usuario);
        CloseStoredProc(datm_produto.sp_inc_produto_usuario);
      end;

      if ( datm_produto.qry_produto_.State in [dsEdit] ) then  //consiste in_ativo
      begin
        CloseStoredProc(datm_produto.sp_ativar_desativar_produto);
        datm_produto.sp_ativar_desativar_produto.ParamByName('@CD_PRODUTO').AsString:=datm_produto.qry_produto_CD_PRODUTO.AsString;
        datm_produto.sp_ativar_desativar_produto.ParamByName('@IN_ATIVO').AsString:=datm_produto.qry_produto_IN_ATIVO.AsString;
        ExecStoredProc(datm_produto.sp_ativar_desativar_produto);
        CloseStoredProc(datm_produto.sp_ativar_desativar_produto);
      end;

      Pesquisa := datm_produto.qry_produto_CD_PRODUTO.AsString;
      datm_produto.qry_produto_lista_.Close;
      datm_produto.qry_produto_lista_.Prepare;
      datm_produto.qry_produto_lista_.Open;
      Localiza(datm_produto.qry_produto_lista_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_produto.qry_produto_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_produto.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_produto.qry_produto_.State in [dsEdit] ) and st_modificar ) or
     ( datm_produto.qry_produto_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Produtos foi alterado.' + #13#10 +
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

procedure Tfrm_produto.pgctrl_produtoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

procedure Tfrm_produto.Cancelar;
begin
  try
    if datm_produto.qry_produto_.State in [dsInsert, dsEdit] then
    begin
      datm_produto.qry_produto_.Cancel;
      pgctrl_produto.ActivePage := ts_dados_basicos;
      dbedt_nm_produto.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_produto.pgctrl_produtoChange(Sender: TObject);
begin
  OnChanging := False;

  if lnm_produto then
  begin
    lnm_produto := False;
    pgctrl_produto.ActivePage := ts_dados_basicos;
    dbedt_nm_produto.SetFocus;
    Exit;
  end;

  if lap_produto then
  begin
    lap_produto := False;
    pgctrl_produto.ActivePage := ts_dados_basicos;
    dbedt_ap_produto.SetFocus;
    Exit;
  end;

  if (pgctrl_produto.ActivePage = ts_lista ) then
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

procedure Tfrm_produto.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_produto.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then dbg_cadastroDblClick(nil);
end;



end.
