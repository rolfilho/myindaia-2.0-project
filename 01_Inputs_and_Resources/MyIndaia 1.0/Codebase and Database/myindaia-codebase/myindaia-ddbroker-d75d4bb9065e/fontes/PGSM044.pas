unit PGSM044;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Funcoes;

type
  Tfrm_celula = class(TForm)
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
    pgctrl_celula: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_celula: TLabel;
    lbl_codigo: TLabel;
    lblAtivo: TLabel;
    dbedt_nm_celula: TDBEdit;
    dbedt_cd_celula: TDBEdit;
    dblkpcbox_ativo: TDBLookupComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    lbl_analista_com_im: TLabel;
    dbedt_cd_analista: TDBEdit;
    dbedt_nm_analista: TDBEdit;
    btn_co_analista: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_nm_celulaChange(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure pgctrl_celulaChange(Sender: TObject);
    procedure pgctrl_celulaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_ct_contabilExit(Sender: TObject);
    procedure dbedt_cd_analistaExit(Sender: TObject);
    procedure btn_co_analistaClick(Sender: TObject);
    procedure dbedt_cd_analistaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    st_modulo, st_rotina : String;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    lNaoConsiste, lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_celula: Tfrm_celula;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM016, PGSM045, PGSM168;


procedure Tfrm_celula.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  st_modulo    := vStr_cd_modulo;
  st_rotina    := str_cd_rotina;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Célula}
  Application.CreateForm( Tdatm_celula, datm_celula );

  with datm_celula do
  begin
    ds_celula.AutoEdit := st_modificar;
    tbl_yesno_.Open;
    qry_celula_.Prepare;
    qry_celula_.SQL[2] := 'NM_CELULA';
    qry_celula_.Open;
  end;

  a_str_indices[0] := 'CD_CELULA';
  a_str_indices[1] := 'NM_CELULA';

  With cb_ordem do
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

procedure Tfrm_celula.FormShow(Sender: TObject);
begin
  pgctrl_celula.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_celula.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_celula do
    begin
      tbl_yesno_.Close;
      qry_celula_.Close;
      Free;
    end;
    Action := caFree;
  end
  else
  begin
    Action := caNone;
  end;
end;

procedure Tfrm_celula.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_celula.qry_celula_CD_CELULA.AsString;
    except
      try
        Cons_Online_Texto := datm_celula.qry_celula_CD_CELULA.AsString;
      except
        BoxMensagem('Não consegui retornar Código da Célula!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_celula.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_celula do
  begin
    qry_celula_.DisableControls;
    qry_celula_.Cancel;
    qry_celula_.Append;
    qry_celula_.EnableControls;
    qry_celula_CD_CELULA.AsString  := UltCod( qry_ult_celula_, qry_ult_celula_ULTIMO );
    qry_celula_IN_ATIVO.AsString  := '1';
  end;
  pgctrl_celula.ActivePage := ts_dados_basicos;
  dbedt_nm_celula.SetFocus;
end;

procedure Tfrm_celula.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_celula.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_celula.Cancelar;
begin
  try
    if datm_celula.qry_celula_.State in [dsInsert, dsEdit] then
    begin
      datm_celula.qry_celula_.Cancel;
      pgctrl_celula.ActivePage := ts_dados_basicos;
      dbedt_nm_celula.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_celula.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta célula será excluída! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_celula.qry_celula_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_celula.qry_celula_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  pgctrl_celula.ActivePage := ts_lista;
end;

procedure Tfrm_celula.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_celula.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_celula.qry_celula_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_celula.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_celula.qry_celula_CD_CELULA.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_celula.qry_celula_.Close;
  datm_celula.qry_celula_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_celula.qry_celula_.Open;
  Localiza(datm_celula.qry_celula_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_celula.dbedt_nm_celulaChange(Sender: TObject);
begin
  if ( datm_celula.qry_celula_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

function Tfrm_celula.Consiste : Boolean;
begin
  if Not lNaoConsiste then
  begin
    if dbedt_nm_celula.Text = '' then
    begin
      BoxMensagem( 'Campo Nome deve ser preenchido!', 2 );
      pgctrl_celula.ActivePage := ts_dados_basicos;
      dbedt_nm_celula.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dbedt_cd_analista.Text = '' then
    begin
      BoxMensagem( 'Campo Analista deve ser preenchido!', 2 );
      pgctrl_celula.ActivePage := ts_dados_basicos;
      dbedt_cd_analista.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  ValidCodigo( dbedt_cd_analista );
  if dbedt_cd_analista.Text <> '' then
  begin
    if dbedt_nm_analista.Text = '' then
    begin
      BoxMensagem( 'Campo Código do Analista inválido!', 2 );
      pgctrl_celula.ActivePage := ts_dados_basicos;
      dbedt_cd_analista.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  Consiste := True;
end;

function Tfrm_celula.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_celula.qry_celula_.State in [dsInsert, dsEdit] ) then
    begin
      datm_celula.qry_celula_.Post;
      Pesquisa := datm_celula.qry_celula_CD_CELULA.AsString;
      datm_celula.qry_celula_.Close;
      datm_celula.qry_celula_.Prepare;
      datm_celula.qry_celula_.Open;
      Localiza(datm_celula.qry_celula_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_celula.qry_celula_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_celula.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_celula.pgctrl_celulaChange(Sender: TObject);
begin
  if (pgctrl_celula.ActivePage = ts_lista ) then
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

procedure Tfrm_celula.pgctrl_celulaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_celula.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_celula.qry_celula_.State in [dsEdit] ) and st_modificar ) or
     ( datm_celula.qry_celula_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Células foi alterado.' + #13#10 +
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

procedure Tfrm_celula.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_celula.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_celula.dbedt_cd_ct_contabilExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_celula.dbedt_cd_analistaExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_celula.btn_co_analistaClick(Sender: TObject);
begin
  with datm_celula do
  begin
    Application.CreateForm( Tfrm_usuario, frm_usuario );
    with frm_usuario do
    begin
      Cons_OnLine := qry_celula_CD_ANALISTA;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_celula_.State in [dsEdit] ) then
         qry_celula_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;
    dbedt_cd_analistaExit(nil);
  end;
end;

procedure Tfrm_celula.dbedt_cd_analistaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_analista then btn_co_analistaClick(nil);
  end;
end;

procedure Tfrm_celula.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

end.
