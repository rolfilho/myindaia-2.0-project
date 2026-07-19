unit PGSM302;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBCtrls, ExtCtrls, Mask, Grids, DBGrids, Menus,
  Buttons, ComCtrls;

type
  Tfrm_cliente_conta_contabil = class(TForm)
    pgctrl_cliente_conta_contabil: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_entrada_de_dados: TPanel;
    dbedt_nm_cta_contabil: TDBEdit;
    dbg_conta: TDBGrid;
    dbedt_cd_cliente: TDBEdit;
    dbedt_razao_social: TDBEdit;
    lbl_Cliente: TLabel;
    lbl_unid_neg: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    dbedt_cd_produto: TDBEdit;
    lbl_produto: TLabel;
    lbl_cliente2: TLabel;
    dbedt_cd_cliente2: TDBEdit;
    dbedt_nm_cliente2: TDBEdit;
    lbl_unid_neg2: TLabel;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    lbl_produto2: TLabel;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    lbl_cod: TLabel;
    dbedt_cd_cta_contabil: TDBEdit;
    btn_cta_contabil: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbedt_nm_cta_contabilChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_cliente_conta_contabilChange(Sender: TObject);
    procedure pgctrl_cliente_conta_contabilChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbg_contaDblClick(Sender: TObject);
    procedure dbedt_cd_cta_contabilExit(Sender: TObject);
    procedure btn_cta_contabilClick(Sender: TObject);
    procedure dbedt_cd_cta_contabilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_cta_contabilChange(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    str_cliente, str_unid, str_produto : String;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_cliente_conta_contabil: Tfrm_cliente_conta_contabil;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM303;

{$R *.DFM}

procedure Tfrm_cliente_conta_contabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_cliente_conta_contabil do
  begin
    qry_empresa_nac_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_cliente_cta_contabil_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_cliente_conta_contabil.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_cliente_conta_contabil.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_cliente_conta_contabil.Cancelar;
begin
  try
    if datm_cliente_conta_contabil.qry_cliente_cta_contabil_.State in [dsInsert, dsEdit] then
    begin
      datm_cliente_conta_contabil.qry_cliente_cta_contabil_.Cancel;
      pgctrl_cliente_conta_contabil.ActivePage := ts_dados_basicos;
      dbedt_cd_cta_contabil.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_conta_contabil.dbedt_nm_cta_contabilChange(Sender: TObject);
begin
  if ( datm_cliente_conta_contabil.qry_cliente_cta_contabil_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_conta_contabil.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  // Inicializa o Data Module para Cliente X Conta Contábil
  Application.CreateForm( Tdatm_cliente_conta_contabil, datm_cliente_conta_contabil );
end;

procedure Tfrm_cliente_conta_contabil.FormShow(Sender: TObject);
begin
  with datm_cliente_conta_contabil do
  begin
    ds_cliente_cta_contabil.AutoEdit := st_modificar;

    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_lista_.Close;
    qry_lista_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_lista_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_lista_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_lista_.Prepare;
    qry_lista_.Open;

  end;

  a_str_indices[0] := 'DESCRICAO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Nome');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

  pgctrl_cliente_conta_contabil.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_cliente_conta_contabil.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_cliente_conta_contabil do
  begin
    if qry_cliente_cta_contabil_.State in [dsInsert, dsEdit] then
    begin
      // está em Insert/Edit
    end
    else
    begin
      qry_cliente_cta_contabil_.Open;
    end;

    qry_cliente_cta_contabil_.DisableControls;
    qry_cliente_cta_contabil_.Cancel;
    qry_cliente_cta_contabil_.Append;
    qry_cliente_cta_contabil_.EnableControls;
    qry_cliente_cta_contabil_CD_CLIENTE.AsString      := str_cliente;
    qry_cliente_cta_contabil_CD_UNID_NEG.AsString     := str_unid;
    qry_cliente_cta_contabil_CD_PRODUTO.AsString      := str_produto;
  end;
  pgctrl_cliente_conta_contabil.ActivePage := ts_dados_basicos;
  dbedt_cd_cta_contabil.SetFocus;
end;

procedure Tfrm_cliente_conta_contabil.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Conta Contábil será excluída! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_cliente_conta_contabil.qry_cliente_cta_contabil_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_cliente_conta_contabil.qry_cliente_cta_contabil_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  datm_cliente_conta_contabil.qry_lista_.Close;
  datm_cliente_conta_contabil.qry_lista_.Prepare;
  datm_cliente_conta_contabil.qry_lista_.Open;
  pgctrl_cliente_conta_contabil.ActivePage := ts_lista;
end;

procedure Tfrm_cliente_conta_contabil.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

function Tfrm_cliente_conta_contabil.Consiste : Boolean;
begin
  if Not lNaoConsiste then
  begin
    if dbedt_nm_cta_contabil.Text = '' then
    begin
      BoxMensagem('Campo Conta Contábil deve ser preenchido!', 2);
      pgctrl_cliente_conta_contabil.ActivePage := ts_dados_basicos;
      dbedt_cd_cta_contabil.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  // Conta Contábil
  if ( datm_cliente_conta_contabil.qry_cliente_cta_contabil_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_cta_contabil );
    if dbedt_cd_cta_contabil.Text <> '' then
    begin
      if dbedt_nm_cta_contabil.Text = '' then
      begin
        BoxMensagem( 'Código da Conta inválido!', 2 );
        pgctrl_cliente_conta_contabil.ActivePage := ts_dados_basicos;
        dbedt_cd_cta_contabil.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  Consiste := True;
end;

function Tfrm_cliente_conta_contabil.Grava : Boolean;
var str_conta : String[3];
begin
  with datm_cliente_conta_contabil do
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( qry_cliente_cta_contabil_.State in [dsInsert, dsEdit] ) then
      begin
        qry_cliente_cta_contabil_.Post;
        str_conta := qry_cliente_cta_contabil_CD_CT_CONTABIL.AsString;

        qry_lista_.Close;
        qry_lista_.Prepare;
        qry_lista_.Open;
        qry_lista_.Locate( 'CD_CLIENTE;CD_UNID_NEG;CD_PRODUTO;CD_CTA_CONTABIL',
                                     VarArrayOf([str_cliente,str_unid,str_produto,str_conta]), [loCaseInsensitive]);
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        qry_cliente_cta_contabil_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_cliente_conta_contabil.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_cliente_conta_contabil.qry_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_cliente_conta_contabil.pgctrl_cliente_conta_contabilChange(Sender: TObject);
begin
  if (pgctrl_cliente_conta_contabil.ActivePage = ts_lista ) then
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

procedure Tfrm_cliente_conta_contabil.pgctrl_cliente_conta_contabilChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_cliente_conta_contabil.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_cliente_conta_contabil.qry_cliente_cta_contabil_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cliente_conta_contabil.qry_cliente_cta_contabil_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Contas foi alterado.' + #13#10 +
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

procedure Tfrm_cliente_conta_contabil.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cliente_conta_contabil.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_cliente_conta_contabil.dbg_contaDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_cliente_conta_contabil.qry_cliente_cta_contabil_CD_CT_CONTABIL.AsString;
    except
      try
        Cons_OnLine_Texto := datm_cliente_conta_contabil.qry_cliente_cta_contabil_CD_CT_CONTABIL.AsString;
      except
        BoxMensagem( 'Não consegui retornar Código da Conta!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_cliente_conta_contabil.dbedt_cd_cta_contabilExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_cliente_conta_contabil.btn_cta_contabilClick(Sender: TObject);
begin
//Aqu
end;

procedure Tfrm_cliente_conta_contabil.dbedt_cd_cta_contabilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_cta_contabil then btn_cta_contabilClick(nil);
  end;
end;

procedure Tfrm_cliente_conta_contabil.dbedt_cd_cta_contabilChange(Sender: TObject);
begin
  if ( datm_cliente_conta_contabil.qry_cliente_cta_contabil_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

end.
