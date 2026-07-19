unit PGSM206;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Funcoes, ConsOnLineEx;

type
  Tfrm_manut_rel_fin = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    lbl_ordem_pesquisa: TLabel;
    cb_ordem: TComboBox;
    pgctrl_manut_rel_fin: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_rel_fin: TPanel;
    lbl_ano: TLabel;
    lbl_num: TLabel;
    dbedt_nr_ano: TDBEdit;
    dbedt_nr_relat: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    lbl_grupo: TLabel;
    lbl_cliente: TLabel;
    dbedt_cd_grupo: TDBEdit;
    dbedt_nm_grupo: TDBEdit;
    dbedt_cd_cliente: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbedt_dt_vencto: TDBEdit;
    btn_co_grupo: TSpeedButton;
    btn_co_cliente: TSpeedButton;
    lbl_dt_vencto: TLabel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    lbl_reembolso: TLabel;
    dbedt_vl_reembolso: TDBEdit;
    lbl_juros: TLabel;
    dbedt_vl_juros: TDBEdit;
    lbl_cpmf: TLabel;
    dbedt_vl_cpmf: TDBEdit;
    lbl_nr_ano: TLabel;
    msk_nr_ano: TMaskEdit;
    Label1: TLabel;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    btn_co_produto: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_manut_rel_finChange(Sender: TObject);
    procedure pgctrl_manut_rel_finChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_grupoChange(Sender: TObject);
    procedure dbedt_cd_grupoExit(Sender: TObject);
    procedure dbedt_cd_clienteExit(Sender: TObject);
    procedure dbedt_dt_venctoChange(Sender: TObject);
    procedure dbedt_cd_clienteChange(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure dbedt_cd_grupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure msk_nr_anoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..4] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    cd_unid_neg : String[2];
    cd_produto : String[2];
    cd_grupo : String[3];
    cd_cliente : String[5];
    nr_relatorio : String[3];
    nr_ano : String[4];
    procedure LimpaCampos;
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
  frm_manut_rel_fin: Tfrm_manut_rel_fin;

implementation

uses PGSM018, PGSM104, PGSM119, PGSM207, GSMLIB, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_manut_rel_fin.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  // Inicializa o Data Module para Manutenção do Relatório de Reembolso Financeiro
  Application.CreateForm( Tdatm_manut_rel_fin, datm_manut_rel_fin );
end;

procedure Tfrm_manut_rel_fin.FormShow(Sender: TObject);
begin
  pgctrl_manut_rel_fin.ActivePage := ts_lista;
  lNaoConsiste                    := False;

  msk_nr_ano.Text := FormatDateTime( 'yyyy', dt_server );

  a_str_indices[0] := 'AP_UNID_NEG';
  a_str_indices[1] := 'NM_GRUPO';
  a_str_indices[2] := 'NM_EMPRESA';
  a_str_indices[3] := 'NR_RELATORIO, AP_UNID_NEG, NM_GRUPO, NM_EMPRESA';
  a_str_indices[4] := 'DT_EMISSAO DESC, AP_UNID_NEG, NM_GRUPO, NM_EMPRESA';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Unid. Neg.');
    Items.Add('Grupo');
    Items.Add('Cliente');
    Items.Add('Relatório');
    Items.Add('Emissão');
    ItemIndex := 4;
  end;

  with datm_manut_rel_fin do
  begin
    ds_rel_fin_controle.AutoEdit := st_modificar;

    qry_grupo_.Close;
    qry_grupo_.Prepare;
    qry_grupo_.Open;

    qry_cliente_.Close;
    qry_cliente_.Prepare;
    qry_cliente_.Open;

    qry_rel_fin_controle_lista_.Close;
    qry_rel_fin_controle_lista_.ParamByName('NR_ANO').AsString := Trim( msk_nr_ano.Text );
    qry_rel_fin_controle_lista_.SQL[18] := a_str_indices[cb_ordem.ItemIndex];
    qry_rel_fin_controle_lista_.Prepare;
    qry_rel_fin_controle_lista_.Open;

    qry_rel_fin_controle_.Close;
    qry_rel_fin_controle_.Prepare;
    qry_rel_fin_controle_.Open;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_manut_rel_fin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_manut_rel_fin do
    begin
      qry_grupo_.Close;
      qry_cliente_.Close;
      qry_rel_fin_controle_lista_.Close;
      qry_rel_fin_controle_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_manut_rel_fin.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_manut_rel_fin do
  begin
    qry_rel_fin_controle_.DisableControls;
    qry_rel_fin_controle_.Cancel;
    qry_rel_fin_controle_.Append;
    qry_rel_fin_controle_.EnableControls;
    pgctrl_manut_rel_fin.ActivePage           := ts_dados_basicos;
    qry_rel_fin_controle_CD_UNID_NEG.AsString := str_cd_unid_neg;
    qry_rel_fin_controle_CD_PRODUTO.AsString  := str_cd_produto;
    qry_rel_fin_controle_CD_GRUPO.AsString    := '';
    qry_rel_fin_controle_CD_CLIENTE.AsString  := '';
    qry_rel_fin_controle_NR_ANO.AsString      := FormatDateTime( 'yyyy', Date );
    pnl_rel_fin.Enabled                       := True;
    LimpaCampos;
  end;
  pnl_rel_fin.Enabled := True;
end;


procedure Tfrm_manut_rel_fin.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_manut_rel_fin.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  if datm_manut_rel_fin.qry_rel_fin_controle_.EOF then pnl_rel_fin.Enabled := False;
end;


procedure Tfrm_manut_rel_fin.Cancelar;
begin
  try
    if datm_manut_rel_fin.qry_rel_fin_controle_.State in [dsInsert, dsEdit] then
    begin
      datm_manut_rel_fin.qry_rel_fin_controle_.Cancel;
      pgctrl_manut_rel_fin.ActivePage := ts_dados_basicos;
      LimpaCampos;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;


procedure Tfrm_manut_rel_fin.btn_excluirClick(Sender: TObject);
begin
  with datm_manut_rel_fin do
  begin
    if BoxMensagem( 'Este Nº de Relatório será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      qry_rel_fin_controle_.Delete;
      qry_rel_fin_controle_lista_.Close;
      qry_rel_fin_controle_lista_.Prepare;
      qry_rel_fin_controle_lista_.Open;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        qry_rel_fin_controle_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_manut_rel_fin.ActivePage := ts_lista;
    if qry_rel_fin_controle_.EOF then pnl_rel_fin.Enabled := False;
  end;
end;

procedure Tfrm_manut_rel_fin.btn_sairClick(Sender: TObject);
begin
  Close;
end;


procedure Tfrm_manut_rel_fin.cb_ordemClick(Sender: TObject);
begin
  with datm_manut_rel_fin do
  begin
    cd_unid_neg  := qry_rel_fin_controle_lista_CD_UNID_NEG.AsString;
    cd_produto   := qry_rel_fin_controle_lista_CD_PRODUTO.AsString;
    cd_grupo     := qry_rel_fin_controle_lista_CD_GRUPO.AsString;
    cd_cliente   := qry_rel_fin_controle_lista_CD_CLIENTE.AsString;
    nr_relatorio := qry_rel_fin_controle_lista_NR_RELATORIO.AsString;
    nr_ano       := qry_rel_fin_controle_lista_NR_ANO.AsString;

    qry_rel_fin_controle_lista_.Close;
    qry_rel_fin_controle_lista_.ParamByName('NR_ANO').AsString := Trim( msk_nr_ano.Text );
    qry_rel_fin_controle_lista_.SQL[18] := a_str_indices[cb_ordem.ItemIndex];
    qry_rel_fin_controle_lista_.Prepare;
    qry_rel_fin_controle_lista_.Open;
    qry_rel_fin_controle_lista_.Locate( 'CD_UNID_NEG;CD_PRODUTO;CD_GRUPO;CD_CLIENTE;NR_RELATORIO;NR_ANO', VarArrayOf ( [cd_unid_neg, cd_produto, cd_grupo, cd_cliente, nr_relatorio, nr_ano] ), [loCaseInsensitive] );
  end;
end;


function Tfrm_manut_rel_fin.Consiste : Boolean;
begin
  Consiste := True;

  // Unidade de Negócio
  if Not lNaoConsiste then
  begin
    if  ( Not ( dbedt_cd_unid_neg.Enabled ) ) and ( Trim( dbedt_cd_unid_neg.Text ) = '' ) then
    begin
      BoxMensagem( 'Campo Unidade de Negócio deve ser preenchido!', 2 );
      pgctrl_manut_rel_fin.ActivePage := ts_dados_basicos;
      dbedt_cd_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if datm_manut_rel_fin.qry_rel_fin_controle_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_unid_neg );

  with datm_manut_rel_fin do
  begin
    if dbedt_cd_unid_neg.Text <> '' then
    begin
      if dbedt_nm_unid_neg.Text = '' then
      begin
        BoxMensagem( 'Código da Unidade de Negócio inválido!', 2 );
        pgctrl_manut_rel_fin.ActivePage := ts_dados_basicos;
        dbedt_cd_unid_neg.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Produto
  if Not lNaoConsiste then
  begin
    if  ( Not ( dbedt_cd_produto.Enabled ) ) and ( Trim( dbedt_cd_produto.Text ) = '' ) then
    begin
      BoxMensagem( 'Campo Produto deve ser preenchido!', 2 );
      pgctrl_manut_rel_fin.ActivePage := ts_dados_basicos;
      dbedt_cd_produto.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if datm_manut_rel_fin.qry_rel_fin_controle_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_produto );

  with datm_manut_rel_fin do
  begin
    if dbedt_cd_produto.Text <> '' then
    begin
      if dbedt_nm_produto.Text = '' then
      begin
        BoxMensagem( 'Código do Produto inválido!', 2 );
        pgctrl_manut_rel_fin.ActivePage := ts_dados_basicos;
        dbedt_cd_produto.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Grupo
  if Not lNaoConsiste then
  begin
    if  ( Not ( dbedt_cd_cliente.Enabled ) ) and ( Trim( dbedt_cd_grupo.Text ) = '' ) then
    begin
      BoxMensagem( 'Campo Grupo deve ser preenchido!', 2 );
      pgctrl_manut_rel_fin.ActivePage := ts_dados_basicos;
      dbedt_cd_grupo.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if datm_manut_rel_fin.qry_rel_fin_controle_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_grupo );

  with datm_manut_rel_fin do
  begin
    if dbedt_cd_grupo.Text <> '' then
    begin
      if dbedt_nm_grupo.Text = '' then
      begin
        BoxMensagem( 'Código do Grupo inválido!', 2 );
        pgctrl_manut_rel_fin.ActivePage := ts_dados_basicos;
        dbedt_cd_grupo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Cliente
  if Not lNaoConsiste then
  begin
    if  ( Not ( dbedt_cd_grupo.Enabled ) ) and ( Trim( dbedt_cd_cliente.Text ) = '' ) then
    begin
      BoxMensagem( 'Campo Cliente deve ser preenchido!', 2 );
      pgctrl_manut_rel_fin.ActivePage := ts_dados_basicos;
      dbedt_cd_cliente.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if datm_manut_rel_fin.qry_rel_fin_controle_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_cliente );

  with datm_manut_rel_fin do
  begin
    if dbedt_cd_cliente.Text <> '' then
    begin
      if dbedt_nm_cliente.Text = '' then
      begin
        BoxMensagem( 'Código do Cliente inválido!', 2 );
        pgctrl_manut_rel_fin.ActivePage := ts_dados_basicos;
        dbedt_cd_cliente.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Relatório
  if Not lNaoConsiste then
  begin
    if Trim( dbedt_nr_relat.Text ) = '' then
    begin
      BoxMensagem( 'Campo Nº Relatório deve ser preenchido!', 2 );
      pgctrl_manut_rel_fin.ActivePage := ts_dados_basicos;
      dbedt_nr_relat.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  // Ano
  if Not lNaoConsiste then
  begin
    if Trim( dbedt_nr_ano.Text ) = '' then
    begin
      BoxMensagem( 'Campo Ano deve ser preenchido!', 2 );
      pgctrl_manut_rel_fin.ActivePage := ts_dados_basicos;
      dbedt_nr_ano.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  // Data
  if Not lNaoConsiste then
  begin
    if dbedt_dt_vencto.Text = '  /  /    ' then
    begin
      BoxMensagem( 'Campo Data de Vencimento deve ser preenchida!', 2 );
      pgctrl_manut_rel_fin.ActivePage := ts_dados_basicos;
      dbedt_dt_vencto.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
end;


function Tfrm_manut_rel_fin.Grava : Boolean;
begin
  with datm_manut_rel_fin do
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( qry_rel_fin_controle_.State in [dsInsert, dsEdit] ) then
      begin
        datm_manut_rel_fin.qry_rel_fin_controle_.Post;
        cd_unid_neg  := qry_rel_fin_controle_CD_UNID_NEG.AsString;
        cd_produto   := qry_rel_fin_controle_CD_PRODUTO.AsString;
        cd_grupo     := qry_rel_fin_controle_CD_GRUPO.AsString;
        cd_cliente   := qry_rel_fin_controle_CD_CLIENTE.AsString;
        nr_relatorio := qry_rel_fin_controle_NR_RELATORIO.AsString;
        nr_ano       := qry_rel_fin_controle_NR_ANO.AsString;

        qry_rel_fin_controle_lista_.Close;
        qry_rel_fin_controle_lista_.ParamByName('NR_ANO').AsString := Trim( msk_nr_ano.Text );
        qry_rel_fin_controle_lista_.SQL[18] := 'U.AP_UNID_NEG, P.AP_PRODUTO, G.NM_GRUPO, E.NM_EMPRESA, R.DT_EMISSAO';
        qry_rel_fin_controle_lista_.Prepare;
        qry_rel_fin_controle_lista_.Open;
        qry_rel_fin_controle_lista_.Locate( 'CD_UNID_NEG;CD_PRODUTO;CD_GRUPO;CD_CLIENTE;NR_RELATORIO;NR_ANO', VarArrayOf ( [cd_unid_neg, cd_produto, cd_grupo, cd_cliente, nr_relatorio, nr_ano] ), [loCaseInsensitive] );
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        qry_rel_fin_controle_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;
end;


procedure Tfrm_manut_rel_fin.pgctrl_manut_rel_finChange(Sender: TObject);
begin
  if ( pgctrl_manut_rel_fin.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled     := True;
    cb_ordem.Enabled  := True;
  end
  else
  begin
    if datm_manut_rel_fin.qry_rel_fin_controle_.EOF then pnl_rel_fin.Enabled := False;
    dbnvg.Enabled     := False;
    cb_ordem.Enabled  := False;
  end;
end;


procedure Tfrm_manut_rel_fin.pgctrl_manut_rel_finChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;


function Tfrm_manut_rel_fin.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_manut_rel_fin.qry_rel_fin_controle_.State in [dsEdit] ) and st_modificar ) or
     ( datm_manut_rel_fin.qry_rel_fin_controle_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Manutenção do Relatório de Reembolso Financeiro foi alterado.' + #13#10 +
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


procedure Tfrm_manut_rel_fin.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;


procedure Tfrm_manut_rel_fin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;


procedure Tfrm_manut_rel_fin.dbedt_cd_grupoChange(Sender: TObject);
begin
  dbedt_dt_venctoChange(nil);
  if dbedt_cd_grupo.Text = '' then
  begin
    dbedt_cd_cliente.Color   := clWindow;
    dbedt_cd_cliente.Enabled := True;
    dbedt_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled   := True;
  end
  else
  begin
    dbedt_cd_cliente.Color   := clMenu;
    dbedt_cd_cliente.Enabled := False;
    dbedt_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled   := False;
  end;
end;


procedure Tfrm_manut_rel_fin.LimpaCampos;
begin
  dbedt_cd_cliente.Enabled   := True;
  dbedt_cd_cliente.ReadOnly  := False;
  dbedt_cd_cliente.TabStop   := True;
  dbedt_cd_cliente.Color     := clWindow;
  btn_co_cliente.Enabled     := True;                       

  dbedt_cd_grupo.Enabled     := True;
  dbedt_cd_grupo.ReadOnly    := False;
  dbedt_cd_grupo.TabStop     := True;
  dbedt_cd_grupo.Color       := clWindow;
  btn_co_grupo.Enabled       := True;
  dbedt_cd_grupo.SetFocus;
end;


procedure Tfrm_manut_rel_fin.dbedt_cd_grupoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;

  if ( datm_manut_rel_fin.qry_rel_fin_controle_.State in [dsEdit, dsInsert] ) and
     ( datm_manut_rel_fin.qry_rel_fin_controle_CD_GRUPO.AsString <> '' ) and
     ( datm_manut_rel_fin.qry_rel_fin_controle_CD_UNID_NEG.AsString <> '' ) then
  begin
    // Nº Relatório por Grupo
    with datm_manut_rel_fin.qry_ult_relat_grupo_ do
    begin
      Close;
      ParamByName('CD_GRUPO').AsString    := dbedt_cd_grupo.Text;
      ParamByName('CD_UNID_NEG').AsString := dbedt_cd_unid_neg.Text;
      Prepare;
      Open;
      dbedt_dt_venctoChange(nil);
      if EOF then
         datm_manut_rel_fin.qry_rel_fin_controle_NR_RELATORIO.AsString := '001'
      else
         datm_manut_rel_fin.qry_rel_fin_controle_NR_RELATORIO.AsString := FieldByName('NR_RELATORIO').AsString;
      Close;
    end;
  end;
end;


procedure Tfrm_manut_rel_fin.dbedt_cd_clienteExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;

  if ( datm_manut_rel_fin.qry_rel_fin_controle_.State in [dsEdit, dsInsert] ) and
     ( datm_manut_rel_fin.qry_rel_fin_controle_CD_CLIENTE.AsString <> '' ) and
     ( datm_manut_rel_fin.qry_rel_fin_controle_CD_UNID_NEG.AsString <> '' ) then
  begin
    // Nº Relatório por Cliente
    with datm_manut_rel_fin.qry_ult_relat_cli_ do
    begin
      Close;
      ParamByName('CD_CLIENTE').AsString  := dbedt_cd_cliente.Text;
      ParamByName('CD_UNID_NEG').AsString := dbedt_cd_unid_neg.Text;
      Prepare;
      Open;
      dbedt_dt_venctoChange(nil);
      if EOF then
         datm_manut_rel_fin.qry_rel_fin_controle_NR_RELATORIO.AsString := '001'
      else
         datm_manut_rel_fin.qry_rel_fin_controle_NR_RELATORIO.AsString := FieldByName('NR_RELATORIO').AsString;
      Close;
    end;
  end;
end;


procedure Tfrm_manut_rel_fin.dbedt_dt_venctoChange(Sender: TObject);
begin
  if ( datm_manut_rel_fin.qry_rel_fin_controle_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;


procedure Tfrm_manut_rel_fin.dbedt_cd_clienteChange(Sender: TObject);
begin
  dbedt_dt_venctoChange(nil);
  if dbedt_cd_cliente.Text = '' then
  begin
    dbedt_cd_grupo.Color   := clWindow;
    dbedt_cd_grupo.Enabled := True;
    dbedt_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled   := True;
  end
  else
  begin
    dbedt_cd_grupo.Color   := clMenu;
    dbedt_cd_grupo.Enabled := False;
    dbedt_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled   := False;
  end;
end;


procedure Tfrm_manut_rel_fin.btn_co_grupoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2201';
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  frm_grupo.Cons_OnLine := datm_manut_rel_fin.qry_rel_fin_controle_CD_GRUPO;
  with frm_grupo do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_manut_rel_fin.qry_rel_fin_controle_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_manut_rel_fin.qry_rel_fin_controle_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_manut_rel_fin do
  begin
    qry_rel_fin_controle_.Close;
    qry_rel_fin_controle_.Prepare;
    qry_rel_fin_controle_.Open;
  end;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1214';
  dbedt_cd_grupoExit(nil);
end;


procedure Tfrm_manut_rel_fin.btn_co_clienteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  frm_cliente_co.Cons_OnLine := datm_manut_rel_fin.qry_rel_fin_controle_CD_CLIENTE;
  with frm_cliente_co do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_manut_rel_fin.qry_rel_fin_controle_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_manut_rel_fin.qry_rel_fin_controle_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_manut_rel_fin do
  begin
    qry_rel_fin_controle_.Close;
    qry_rel_fin_controle_.Prepare;
    qry_rel_fin_controle_.Open;
  end;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1214';
  dbedt_cd_clienteExit(nil);
end;


procedure Tfrm_manut_rel_fin.dbedt_cd_grupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = dbedt_cd_produto  then btn_co_produtoClick(nil);
    if Sender = dbedt_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = dbedt_cd_cliente  then btn_co_clienteClick(nil);
  end;
end;


procedure Tfrm_manut_rel_fin.btn_co_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm( Tfrm_unidade, frm_unidade );
  frm_unidade.Cons_OnLine := datm_manut_rel_fin.qry_rel_fin_controle_CD_UNID_NEG;
  with frm_unidade do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_manut_rel_fin.qry_rel_fin_controle_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_manut_rel_fin.qry_rel_fin_controle_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_manut_rel_fin do
  begin
    qry_rel_fin_controle_.Close;
    qry_rel_fin_controle_.Prepare;
    qry_rel_fin_controle_.Open;
  end;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1214';
  dbedt_cd_unid_negExit(nil);
end;


procedure Tfrm_manut_rel_fin.dbedt_cd_unid_negExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;


procedure Tfrm_manut_rel_fin.msk_nr_anoExit(Sender: TObject);
begin
  with datm_manut_rel_fin do
  begin
    qry_rel_fin_controle_lista_.Close;
    qry_rel_fin_controle_lista_.ParamByName('NR_ANO').AsString := Trim( msk_nr_ano.Text );
    qry_rel_fin_controle_lista_.Prepare;
    qry_rel_fin_controle_lista_.Open;
  end;
end;


procedure Tfrm_manut_rel_fin.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    dbedt_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    dbedt_cd_unid_negExit(nil);
  end
  else
    dbedt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', dbedt_cd_produto.Text,'AP_PRODUTO');
end;

end.
