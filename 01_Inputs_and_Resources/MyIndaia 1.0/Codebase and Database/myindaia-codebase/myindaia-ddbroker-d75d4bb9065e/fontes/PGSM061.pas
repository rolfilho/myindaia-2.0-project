unit PGSM061;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Funcoes;

type
  Tfrm_priori_item = class(TForm)
    pgctrl_priori_item: TPageControl;
    ts_lista: TTabSheet;
    btn_co_unidade: TSpeedButton;
    btn_co_produto: TSpeedButton;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_prioridade: TLabel;
    lbl_unidade2: TLabel;
    lbl_produto2: TLabel;
    lbl_item: TLabel;
    dbedt_cd_unidade2: TDBEdit;
    dbedt_nm_unidade2: TDBEdit;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    dbedt_nr_prioridade: TDBEdit;
    lbl_unid_neg: TLabel;
    Label1: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbnvgClick(Sender: TObject; Button: TNavigateBtn);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_cd_unidadeEnter(Sender: TObject);
    procedure dbedt_cd_produtoEnter(Sender: TObject);
    procedure btn_co_unidadeClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure dbedt_nr_prioridadeChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_unidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure pgctrl_priori_itemChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    a_str_indices : Array[0..2] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    st_cd_unid_neg, st_cd_prod : String[2];
    function VerAlt   : Boolean;
    function Grava    : Boolean;
  public
    Pesquisa : String;
    { Private declarations }
  end;

var
  frm_priori_item: Tfrm_priori_item;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM010, PGSM018, PGSM059, PGSM062;


procedure Tfrm_priori_item.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Prioridade de Itens}
  Application.CreateForm( Tdatm_priori_item, datm_priori_item );

  with datm_priori_item do
  begin
    ds_priori_item.AutoEdit := st_modificar;

    tbl_yesno_.Open;
    if qry_item_.Active then qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
    if qry_produto_.Active then qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
    if qry_unid_neg_.Active then qry_unid_neg_.Close;
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
    msk_cd_produto.Text  := str_cd_produto;
    msk_cd_produtoExit(nil);

    qry_priori_item_lista_.Close;
    qry_priori_item_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_priori_item_lista_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_priori_item_lista_.Prepare;
    qry_priori_item_lista_.Open;

    qry_priori_item_.Close;
    qry_priori_item_.ParamByName( 'CD_ITEM' ).AsString := qry_priori_item_lista_.FieldByName( 'P.CD_ITEM' ).AsString;
    qry_priori_item_.Prepare;
    qry_priori_item_.Open;

  end;

  a_str_indices[0] := 'P.CD_ITEM';
  a_str_indices[1] := 'NM_ITEM';
  a_str_indices[2] := 'NR_PRIORIDADE';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Item');
    Items.Add('Prioridade');
    ItemIndex := 0;
  end;

end;

procedure Tfrm_priori_item.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_priori_item.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_priori_item.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_priori_item do
  begin
    tbl_yesno_.Close;
    qry_item_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Close;
    qry_priori_item_lista_.Close;
    qry_priori_item_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_priori_item.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Grava then Exit;
end;

procedure Tfrm_priori_item.btn_cancelarClick(Sender: TObject);
begin
  btn_salvar.Enabled   := False;
  mi_salvar.Enabled    := False;
  btn_cancelar.Enabled := False;
  mi_cancelar.Enabled  := False;
  try
    if datm_priori_item.qry_priori_item_.State in [dsInsert, dsEdit] then
    begin
      datm_priori_item.qry_priori_item_.Cancel;
      pgctrl_priori_item.ActivePage := ts_lista;
      msk_cd_unid_neg.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_priori_item.dbnvgClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  datm_priori_item.qry_priori_item_.Cancel;
end;

procedure Tfrm_priori_item.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_priori_item.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_priori_item.qry_priori_item_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_priori_item.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_priori_item.qry_priori_item_lista_.FieldByName( 'P.CD_ITEM' ).AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_priori_item.qry_priori_item_lista_.Close;
  datm_priori_item.qry_priori_item_lista_.SQL[6] := a_str_indices[cb_ordem.ItemIndex];
  datm_priori_item.qry_priori_item_lista_.Open;
  Localiza(datm_priori_item.qry_priori_item_lista_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_priori_item.dbedt_cd_unidadeEnter(Sender: TObject);
begin
  datm_priori_item.ds_priori_item.AutoEdit := True;
end;

procedure Tfrm_priori_item.dbedt_cd_produtoEnter(Sender: TObject);
begin
  datm_priori_item.ds_priori_item.AutoEdit := True;
end;

procedure Tfrm_priori_item.btn_co_unidadeClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';

  datm_priori_item.ds_priori_item.AutoEdit := True;

  Application.CreateForm(Tfrm_unidade, frm_unidade);
  frm_unidade.Cons_OnLine := datm_priori_item.qry_priori_item_CD_UNID_NEG;
  With frm_unidade Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_priori_item.qry_priori_item_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_priori_item.qry_priori_item_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2228';

  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine.asString;

  with datm_priori_item do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
    if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive] ) then
      edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
  end;
  msk_cd_unid_negExit(nil);

  if st_modificar then datm_priori_item.ds_priori_item.AutoEdit := True
  else
  begin
    datm_priori_item.ds_priori_item.AutoEdit := False;
    datm_priori_item.qry_priori_item_.Cancel;
    btn_salvar.Enabled                       := False;
    btn_cancelar.Enabled                     := False;
  end;
end;

procedure Tfrm_priori_item.btn_co_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';

  datm_priori_item.ds_priori_item.AutoEdit := True;

  Application.CreateForm(Tfrm_produto, frm_produto);
  frm_produto.Cons_OnLine := datm_priori_item.qry_priori_item_CD_PRODUTO;
  With frm_produto Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_priori_item.qry_priori_item_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_priori_item.qry_priori_item_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2228';

  with datm_priori_item do
  begin
    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
  end;
  msk_cd_produtoExit(nil);

  if st_modificar then datm_priori_item.ds_priori_item.AutoEdit := True
  else
  begin
    datm_priori_item.ds_priori_item.AutoEdit := False;
    datm_priori_item.qry_priori_item_.Cancel;
    btn_salvar.Enabled                       := False;
    btn_cancelar.Enabled                     := False;
  end;
end;

function Tfrm_priori_item.Grava : Boolean;
var
  cd_unid, cd_prod : String;
  nr_priori_destino, Code : Integer;
begin
  Pesquisa := '';
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_priori_item.qry_priori_item_.State in [dsInsert, dsEdit] ) then
    begin
      with datm_priori_item do
      begin
        CloseStoredProc(sp_ordena_priori_item);
        sp_ordena_priori_item.ParamByName('@CD_UNID_NEG').AsString        := qry_priori_item_CD_UNID_NEG.AsString;
        sp_ordena_priori_item.ParamByName('@CD_PRODUTO').AsString         := qry_priori_item_CD_PRODUTO.AsString;
        sp_ordena_priori_item.ParamByName('@NR_PRIORI_ORIGEM').AsInteger  := Nr_Origem;
        Val( Trim(dbedt_nr_prioridade.Text), nr_priori_destino, Code);
        sp_ordena_priori_item.ParamByName('@NR_PRIORI_DESTINO').AsInteger := nr_priori_destino;
        ExecStoredProc(sp_ordena_priori_item);
        case sp_ordena_priori_item.ParamByName('Result').AsInteger of
        1 : begin
              BoxMensagem('A prioridade de destino não pode ser a prioridade de origem!', 2);
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              qry_priori_item_.Cancel;
              Grava := False;
              CloseStoredProc(sp_ordena_priori_item);
              pgctrl_priori_item.ActivePage := ts_dados_basicos;
              dbedt_nr_prioridade.SetFocus;
              btn_salvar.Enabled   := True;
              mi_salvar.Enabled    := True;
              btn_Cancelar.Enabled := True;
              mi_Cancelar.Enabled  := True;
              Exit;
            end;
        2 : begin
              BoxMensagem('A prioridade de destino não existe!', 2);
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              qry_priori_item_.Cancel;
              Grava := False;
              CloseStoredProc(sp_ordena_priori_item);
              pgctrl_priori_item.ActivePage := ts_dados_basicos;
              dbedt_nr_prioridade.SetFocus;
              btn_salvar.Enabled   := True;
              mi_salvar.Enabled    := True;
              btn_Cancelar.Enabled := True;
              mi_Cancelar.Enabled  := True;
              Exit;
            end;
        end;
        CloseStoredProc(sp_ordena_priori_item);
      end;

      cd_unid := datm_priori_item.qry_priori_item_CD_UNID_NEG.AsString;
      cd_prod := datm_priori_item.qry_priori_item_CD_PRODUTO.AsString;
      datm_priori_item.qry_priori_item_.Post;
      Pesquisa := datm_priori_item.qry_priori_item_CD_ITEM.AsString;
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_priori_item.qry_priori_item_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;

  with datm_priori_item do
  begin
    qry_priori_item_lista_.Close;
    qry_priori_item_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_priori_item_lista_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_priori_item_lista_.Prepare;
    qry_priori_item_lista_.Open;
    if Pesquisa <> '' then
    begin
      datm_priori_item.qry_priori_item_.Close;
      datm_priori_item.qry_priori_item_.ParamByName( 'CD_ITEM' ).AsString := datm_priori_item.qry_priori_item_lista_.FieldByName( 'P.CD_ITEM' ).AsString;
      datm_priori_item.qry_priori_item_.Prepare;
      datm_priori_item.qry_priori_item_.Open;
      Localiza(datm_priori_item.qry_priori_item_lista_, Pesquisa, a_str_indices[0] );
    end;
  end;

  btn_salvar.Enabled   := False;
  mi_salvar.Enabled    := False;
  btn_Cancelar.Enabled := False;
  mi_Cancelar.Enabled  := False;

end;

procedure Tfrm_priori_item.dbedt_nr_prioridadeChange(Sender: TObject);
begin
  if ( datm_priori_item.qry_priori_item_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_Salvar.Enabled   := True;
    mi_Salvar.Enabled    := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
  end
end;

procedure Tfrm_priori_item.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_priori_item.dbedt_cd_unidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unidadeClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
  end;
end;

procedure Tfrm_priori_item.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = st_cd_unid_neg then Exit;
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := '';
    Exit;
  end;

  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_priori_item do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive] ) then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        msk_cd_unid_neg.SetFocus;
      end;

      if msk_cd_produto.Text <> '' then
      begin
        {VERIFICAR SE O USUÁRIO TEM ACESSO A UNIDADExPRODUTO }
        qry_usuario_hab_.Close;
        qry_usuario_hab_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
        qry_usuario_hab_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_usuario_hab_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_usuario_hab_.Open;
        if qry_usuario_hab_OK.AsInteger <= 0 then {NÃO TEM ACESSO}
        begin
          BoxMensagem('Usuário não possui permissão para esta unidade/produto!', 2);
          qry_priori_item_lista_.Cancel;
          pgctrl_priori_item.ActivePage := ts_lista;
          msk_cd_unid_neg.SetFocus;
          Exit;
        end;

        qry_priori_item_lista_.Close;
        qry_priori_item_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_priori_item_lista_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_priori_item_lista_.Prepare;
        qry_priori_item_lista_.Open;
        if qry_priori_item_lista_.RecordCount = 0 then
        begin
          BoxMensagem('Não existem prioridades de itens para esta unidade/produto!', 2);
          qry_priori_item_lista_.Cancel;
          pgctrl_priori_item.ActivePage := ts_lista;
          msk_cd_unid_neg.SetFocus;
          Exit;
        end;
      end;
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_priori_item.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text = st_cd_prod then Exit;
  if msk_cd_produto.Text = '' then
  begin
    edt_nm_produto.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_priori_item do
    begin
      qry_produto_.Close;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive] ) then
      begin
        edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
      end
      else
      begin
        BoxMensagem('Produto não cadastrado!', 2);
        msk_cd_produto.SetFocus;
      end;

      if msk_cd_unid_neg.Text <> '' then
      begin
        {VERIFICAR SE O USUÁRIO TEM ACESSO A UNIDADE x PRODUTO }
        qry_usuario_hab_.Close;
        qry_usuario_hab_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
        qry_usuario_hab_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_usuario_hab_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_usuario_hab_.Open;
        if qry_usuario_hab_OK.AsInteger <= 0 then {NÃO TEM ACESSO}
        begin
          BoxMensagem('Usuário não possui permissão para esta unidade/produto!', 2);
          qry_priori_item_lista_.Cancel;
          pgctrl_priori_item.ActivePage := ts_lista;
          msk_cd_produto.SetFocus;
          Exit;
        end;

        qry_priori_item_lista_.Close;
        qry_priori_item_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_priori_item_lista_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_priori_item_lista_.Prepare;
        qry_priori_item_lista_.Open;
        if qry_priori_item_lista_.RecordCount = 0 then
        begin
          BoxMensagem('Não existem prioridades de itens para esta unidade/produto!', 2);
          qry_priori_item_lista_.Cancel;
          pgctrl_priori_item.ActivePage := ts_lista;
          msk_cd_produto.SetFocus;
          Exit;
        end;
      end;
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;
end;

procedure Tfrm_priori_item.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_cd_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_priori_item.msk_cd_produtoEnter(Sender: TObject);
begin
  st_cd_prod := msk_cd_produto.Text;
end;

function Tfrm_priori_item.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( pgctrl_priori_item.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_priori_item.qry_priori_item_.State in [dsEdit] ) and st_modificar ) or
       ( datm_priori_item.qry_priori_item_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Prioridade de Itens foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Grava then
        begin
          VerAlt := False;
          Exit;
        end;
      end
      else
        btn_cancelarClick(nil);
    end;
  end;
end;

procedure Tfrm_priori_item.pgctrl_priori_itemChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

end.
