unit PGSM046;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, Funcoes;

type
  Tfrm_despachante = class(TForm)
    pgctrl_despachante: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_sair: TMenuItem;
    Label3: TLabel;
    dbedt_cd_despachante: TDBEdit;
    lblNome: TLabel;
    dbedt_nm_despachante: TDBEdit;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    Label5: TLabel;
    dbedt_apelido: TDBEdit;
    Label6: TLabel;
    lblAtivo: TLabel;
    dblkpcbox_ativo: TDBLookupComboBox;
    lbl_vl_min_SDA: TLabel;
    dbedt_vl_min_SDA: TDBEdit;
    lbl_vl_max_SDA: TLabel;
    dbedt_vl_max_SDA: TDBEdit;
    dbg_cadastro: TDBGrid;
    mi_excluir: TMenuItem;
    lblCodRISC: TLabel;
    dbedt_nr_registro: TDBEdit;
    lbl_favorecido: TLabel;
    dbedt_cd_favorecido: TDBEdit;
    dbedt_nm_favorecido: TDBEdit;
    btn_co_favorecido: TSpeedButton;
    lbl_mod_sda: TLabel;
    dblkpcbox_mod_sda: TDBLookupComboBox;
    Label19: TLabel;
    dbedt_cpf_despachante: TDBEdit;
    dbedt_nr_conta_corrente: TDBEdit;
    dbedt_nr_digito_conta_corrente: TDBEdit;
    Label4: TLabel;
    Label7: TLabel;
    dbedt_cd_desp_sda: TDBEdit;
    Label8: TLabel;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_nm_despachanteChange(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure pgctrl_despachanteChange(Sender: TObject);
    procedure pgctrl_despachanteChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mi_excluirClick(Sender: TObject);
    procedure dbedt_cd_favorecidoExit(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure dbedt_cpf_despachanteExit(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lnm_despachante : Boolean;
    st_cd_modulo,
    st_cd_rotina:string;

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
  end;

var
  frm_despachante: Tfrm_despachante;

implementation

uses GSMLIB, PGSM113, PGGP017, PGGP001, PGSM090;

{$R *.DFM}

procedure Tfrm_despachante.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_despachante.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;

  with datm_despachante do
  begin
    qry_despachante_.DisableControls;
    qry_despachante_.Cancel;
    qry_despachante_.Append;
    qry_despachante_.EnableControls;
    qry_despachante_CD_DESPACHANTE.AsString  := UltCod( qry_ult_despachante_, qry_ult_despachante_ULTIMO );
    qry_despachante_IN_ATIVO.AsString  := '1';
    qry_despachante_VL_MAX_SDA.AsFloat := 0;
    qry_despachante_VL_MIN_SDA.AsFloat := 0;
  end;
  pgctrl_despachante.ActivePage := ts_dados_basicos;
  dbedt_nm_despachante.SetFocus;
end;

procedure Tfrm_despachante.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_despachante do
  begin
    tbl_yesno_.Close;
    qry_despachante_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_despachante.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_despachante.qry_despachante_CD_DESPACHANTE.AsString;
    except
      try
        Cons_Online_Texto := datm_despachante.qry_despachante_CD_DESPACHANTE.AsString;
      except
        BoxMensagem('Não consegui retornar Código do Despachante!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_despachante.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  { Inicializa o Data Module para Despachante}
  Application.CreateForm( Tdatm_despachante, datm_despachante );

  with datm_despachante do
  begin
    ds_despachante.AutoEdit := st_modificar;
    tbl_yesno_.Open;
    qry_despachante_.Prepare;
    qry_despachante_.SQL[2] := 'NM_DESPACHANTE';
    qry_despachante_.Open;
  end;

  a_str_indices[0] := 'CD_DESPACHANTE';
  a_str_indices[1] := 'NM_DESPACHANTE';

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
  mi_excluir.Enabled := st_excluir;

end;

procedure Tfrm_despachante.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_despachante.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_despachante.Cancelar;
begin
  try
    if datm_despachante.qry_despachante_.State in [dsInsert, dsEdit] then
    begin
      datm_despachante.qry_despachante_.Cancel;
      pgctrl_despachante.ActivePage := ts_dados_basicos;
      dbedt_nm_despachante.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_despachante.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_despachante.qry_despachante_CD_DESPACHANTE.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_despachante.qry_despachante_.Close;
  datm_despachante.qry_despachante_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_despachante.qry_despachante_.Open;
  Localiza(datm_despachante.qry_despachante_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_despachante.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_despachante.qry_despachante_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_despachante.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_despachante.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_despachante.dbedt_nm_despachanteChange(Sender: TObject);
begin
  If ( datm_despachante.qry_despachante_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_despachante.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

function Tfrm_despachante.Consiste : Boolean;
begin
  {C.P.F.}
  if Not CPF( dbedt_cpf_despachante.Text ) then
  begin
    pgctrl_despachante.ActivePage := ts_dados_basicos;
    dbedt_cpf_despachante.SetFocus;
    Consiste := False;
    Exit;
  end;

  {Despachante}
  if dbedt_nm_despachante.Text = '' then
  begin
    BoxMensagem('Campo Nome deve ser preenchido!', 2);
    pgctrl_despachante.ActivePage := ts_dados_basicos;
    dbedt_nm_despachante.SetFocus;
    lnm_despachante := True;
    Consiste := False;
    Exit;
  end;
  Consiste := True;

  {Conta Corrente}
  if ( Trim( dbedt_nr_digito_conta_corrente.Text ) <> '' ) and
     ( Trim( dbedt_nr_conta_corrente.Text ) = '' ) then
  begin
    BoxMensagem('Campo Nr. Conta Corrente deve ser preenchido',2);
    pgctrl_despachante.ActivePage := ts_dados_basicos;
    dbedt_nr_conta_corrente.SetFocus;
    Consiste := False;
    Exit;
  end;

end;

function Tfrm_despachante.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_despachante.qry_despachante_.State in [dsInsert, dsEdit] ) then
    begin
      datm_despachante.qry_despachante_.Post;
      Pesquisa := datm_despachante.qry_despachante_CD_DESPACHANTE.AsString;
      datm_despachante.qry_despachante_.Close;
      datm_despachante.qry_despachante_.Prepare;
      datm_despachante.qry_despachante_.Open;
      Localiza(datm_despachante.qry_despachante_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_despachante.qry_despachante_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_despachante.pgctrl_despachanteChange(Sender: TObject);
begin
  if lnm_despachante then
  begin
    lnm_despachante := False;
    pgctrl_despachante.ActivePage := ts_dados_basicos;
    dbedt_nm_despachante.SetFocus;
    Exit;
  end;

  if (pgctrl_despachante.ActivePage = ts_lista ) then
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

procedure Tfrm_despachante.pgctrl_despachanteChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  VerAlt;
end;

function Tfrm_despachante.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_despachante.qry_despachante_.State in [dsEdit] ) and st_modificar ) or
     ( datm_despachante.qry_despachante_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Despachantes foi alterado.' + #13#10 +
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

procedure Tfrm_despachante.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
end;

procedure Tfrm_despachante.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_despachante.mi_excluirClick(Sender: TObject);
begin
  if (pgctrl_despachante.ActivePage = ts_lista) or (pgctrl_despachante.ActivePage = ts_dados_basicos) then
  begin
    if BoxMensagem( 'Este despachante será excluído! Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_despachante.qry_despachante_.Delete;
        datm_despachante.qry_despachante_.Close;
        datm_despachante.qry_despachante_.Prepare;
        datm_despachante.qry_despachante_.Open;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_despachante.qry_despachante_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_despachante.ActivePage := ts_lista;
  end;
end;


procedure Tfrm_despachante.dbedt_cd_favorecidoExit(Sender: TObject);
begin
  if datm_despachante.qry_despachante_.State in [dsEdit, dsInsert] then
     ValidCodigo(dbedt_cd_favorecido);
  Consiste;
end;

procedure Tfrm_despachante.btn_co_favorecidoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2208';
  Application.CreateForm(Tfrm_favor, frm_favor);
  frm_favor.Cons_OnLine := datm_despachante.qry_despachante_CD_FAVORECIDO;
  With frm_favor Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_despachante.qry_despachante_.State in [dsEdit, dsInsert] ) and
      ( st_modificar ) and
      ( datm_despachante.ds_despachante.AutoEdit ) then
       begin
         datm_despachante.qry_despachante_.Edit;
       end;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_despachante do
  begin
    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
  if ( datm_despachante.ds_despachante.AutoEdit ) then
    dbedt_cd_favorecidoExit(Sender);

end;


procedure Tfrm_despachante.dbedt_cpf_despachanteExit(Sender: TObject);
begin
  Consiste;
end;


end.
