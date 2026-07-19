unit PGSM011;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, StdCtrls, Db, Mask, DBCtrls, DBTABLES, Grids,
  DBGrids, ComCtrls;

type
  Tfrm_via_transp = class(TForm)
    pgctrl_via_transp: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_descricao: TLabel;
    lbl_codigo: TLabel;
    dbedt_nm_via_transp: TDBEdit;
    dbedt_codigo: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    lbl_via_transp_siscomex: TLabel;
    dbedt_cd_via_transp_scx: TDBEdit;
    dbedt_nm_via_transp_scx: TDBEdit;
    btn_co_via_transp_scx: TSpeedButton;
    dbedt_nm_via_transp_ing: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbedt_nm_via_transp_esp: TDBEdit;
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
    dbchkAtivo: TDBCheckBox;
    dbchkFCL: TDBCheckBox;
    dbchkLCL: TDBCheckBox;
    dbchkCS: TDBCheckBox;
    shpModal: TShape;
    lbl1: TLabel;
    SpeedButton3: TSpeedButton;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    dbedt_Fiesp: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure btn_co_via_transp_scxClick(Sender: TObject);
    procedure dbedt_cd_via_transp_scxExit(Sender: TObject);
    procedure dbedt_nm_via_transpChange(Sender: TObject);
    procedure pgctrl_via_transpChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_via_transpChange(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_via_transp_scxKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    OnChanging : Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lnm_via_transp, lcd_via_transp_scx : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String );
  end;

var
  frm_via_transp: Tfrm_via_transp;

implementation

uses GSMLIB, PGSM013, PGGP017, PGSM096, PGSM148, KrUtil, KrDialog;

{$R *.DFM}

procedure Tfrm_via_transp.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Via de Transporte}
  Application.CreateForm( Tdatm_via_transp, datm_via_transp );

  with datm_via_transp do
  begin
    ds_via_transp.AutoEdit := st_modificar;
    qry_via_scx_.Prepare;
    qry_via_scx_.Open;

    qry_via_transp_.Prepare;
    qry_via_transp_.SQL[2] := 'NM_VIA_TRANSP';
    qry_via_transp_.Open;
  end;

  a_str_indices[0] := 'CD_VIA_TRANSP';
  a_str_indices[1] := 'NM_VIA_TRANSP';

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

procedure Tfrm_via_transp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_via_transp.qry_via_scx_.Close;
  datm_via_transp.qry_via_transp_.Close;
//  datm_via_transp.Destroy;
  datm_via_transp.Free;
  Action := caFree;
end;

procedure Tfrm_via_transp.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_via_transp.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_via_transp.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_via_transp.qry_via_transp_CD_VIA_TRANSP.AsString;
    except
      try
        Cons_OnLine_Texto := datm_via_transp.qry_via_transp_CD_VIA_TRANSP.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código da Via de Transporte!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_via_transp.btn_incluirClick(Sender: TObject);
begin
  with datm_via_transp do
  begin
    qry_via_transp_.DisableControls;
    qry_via_transp_.Cancel;
    qry_via_transp_.Append;
    qry_via_transp_.EnableControls;
    qry_via_transp_CD_VIA_TRANSP.AsString  := UltCod( qry_ult_via_transp_, qry_ult_via_transp_ULTIMO );
    qry_via_transp_IN_ATIVO.AsString  := '1';
    qry_via_transp_IN_FCL.AsString := '0';
    qry_via_transp_IN_LCL.AsString := '0';
    qry_via_transp_IN_CS.AsString := '0';
  end;
  pgctrl_via_transp.ActivePage := ts_dados_basicos;
  dbedt_nm_via_transp.SetFocus;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;

end;

procedure Tfrm_via_transp.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_via_transp.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_via_transp.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Via de Transporte será excluída! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_via_transp.qry_via_transp_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_via_transp.qry_via_transp_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_via_transp.ActivePage := ts_lista;
end;

procedure Tfrm_via_transp.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_via_transp.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_via_transp.qry_via_transp_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_via_transp.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_via_transp.qry_via_transp_CD_VIA_TRANSP.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_via_transp.qry_via_transp_.Close;
  datm_via_transp.qry_via_transp_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_via_transp.qry_via_transp_.Open;
  Localiza(datm_via_transp.qry_via_transp_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_via_transp.btn_co_via_transp_scxClick(Sender: TObject);
begin
  Consulta_On_line( 'TVIA_TRANSPORTE', datm_via_transp.qry_via_transp_CD_VIA_TRANSP_SISCOMEX, 'Vias de Transporte' );
end;

procedure Tfrm_via_transp.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := 6;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine       := fCampo;
  frm_consulta_padrao.st_modificar      := st_modificar;

  With frm_consulta_padrao Do Begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_via_transp.dbedt_cd_via_transp_scxExit(Sender: TObject);
begin
  if Not OnChanging then
  begin
    Consiste;
    lcd_via_transp_scx := False;
  end;
end;

procedure Tfrm_via_transp.dbedt_nm_via_transpChange(Sender: TObject);
begin
  If ( datm_via_transp.qry_via_transp_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

function Tfrm_via_transp.Consiste : Boolean;
begin
  Consiste := False;
  if dbedt_nm_via_transp.Text = '' then
  begin
    BoxMensagem('Campo Nome da Via de Transporte deve ser preenchido!', 2);
    pgctrl_via_transp.ActivePage := ts_dados_basicos;
    dbedt_nm_via_transp.SetFocus;
    lnm_via_transp := True;
    Consiste := False;
    Exit;
  end;
  if dbedt_nm_via_transp_scx.Text = '' then
  begin
    BoxMensagem('Campo Cód. da Via de Transporte SISCOMEX deve ser preenchido!', 2);
    pgctrl_via_transp.ActivePage := ts_dados_basicos;
    dbedt_cd_via_transp_scx.SetFocus;
    lcd_via_transp_scx := True;
    Consiste := False;
    Exit;
  end;

  If Not ( datm_via_transp.qry_via_transp_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_via_transp_scx );
  if dbedt_cd_via_transp_scx.Text <> '' Then
  begin
    if dbedt_nm_via_transp_scx.Text = '' Then
    begin
      BoxMensagem('Código da Via de Transporte do SISCOMEX inválido!',2);
      pgctrl_via_transp.ActivePage := ts_dados_basicos;
      dbedt_cd_via_transp_scx.SetFocus;
      lcd_via_transp_scx := True;
      Consiste := False;
      Exit;
    end;
  end;

  Consiste := True;
end;

function Tfrm_via_transp.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_via_transp.qry_via_transp_.State in [dsInsert, dsEdit] ) then
    begin
      datm_via_transp.qry_via_transp_.Post;
      Pesquisa := datm_via_transp.qry_via_transp_CD_VIA_TRANSP.AsString;
      datm_via_transp.qry_via_transp_.Close;
      datm_via_transp.qry_via_transp_.Prepare;
      datm_via_transp.qry_via_transp_.Open;
      Localiza(datm_via_transp.qry_via_transp_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_via_transp.qry_via_transp_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_via_transp.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_via_transp.qry_via_transp_.State in [dsEdit] ) and st_modificar ) or
     ( datm_via_transp.qry_via_transp_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Vias de Transporte foi alterado.' + #13#10 +
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

procedure Tfrm_via_transp.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

Procedure Tfrm_via_transp.Cancelar;
begin
  try
    if datm_via_transp.qry_via_transp_.State in [dsInsert, dsEdit] then
    begin
      datm_via_transp.qry_via_transp_.Cancel;
      pgctrl_via_transp.ActivePage := ts_dados_basicos;
      dbedt_nm_via_transp.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_via_transp.pgctrl_via_transpChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

procedure Tfrm_via_transp.pgctrl_via_transpChange(Sender: TObject);
begin
  OnChanging := False;

  if lnm_via_transp then
  begin
    lnm_via_transp := False;
    pgctrl_via_transp.ActivePage := ts_dados_basicos;
    dbedt_nm_via_transp.SetFocus;
    Exit;
  end;

  if lcd_via_transp_scx then
  begin
    lcd_via_transp_scx := False;
    pgctrl_via_transp.ActivePage := ts_dados_basicos;
    dbedt_cd_via_transp_scx.SetFocus;
    Exit;
  end;

  if (pgctrl_via_transp.ActivePage = ts_lista ) then
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

procedure Tfrm_via_transp.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_via_transp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_via_transp.dbedt_cd_via_transp_scxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = dbedt_cd_via_transp_scx then btn_co_via_transp_scxClick(nil);
  end;
end;

procedure Tfrm_via_transp.SpeedButton1Click(Sender: TObject);
begin
  if not (datm_via_transp.qry_via_transp_.State in [dsInsert, dsEdit]) then
    datm_via_transp.qry_via_transp_.Edit;
  dbedt_nm_via_transpChange(nil);
  ExecAndWaitRun(GetCODFullPath,
    '/Consulta /ViaTransporte /Classe Tfrm_via_transp /Form "Tabela de Vias de Transporte"',
    'TFormList', 'Lista', SW_SHOW);
end;

procedure Tfrm_via_transp.WMCopyData(var Msg: TWMCopyData);
var
  s: string;
begin
  if Msg.CopyDataStruct.dwData = 5 then
  begin
    s := PChar(Msg.CopyDataStruct.lpData);
    datm_via_transp.qry_via_transp_FIESP_Id.AsString := s;
  end
  else
  begin
    msg.Result := 0;
    Reject('Tipo de dados não suportado!');
  end;
  msg.Result := 1;
end;

end.
