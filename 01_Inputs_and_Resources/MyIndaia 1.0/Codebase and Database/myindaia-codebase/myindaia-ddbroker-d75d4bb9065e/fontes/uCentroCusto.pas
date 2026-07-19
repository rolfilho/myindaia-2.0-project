unit uCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, dbtables;

type
  Tfrm_centro_custo = class(TForm)
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_ct_custo: TPageControl;
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
    tvContas: TTreeView;
    PopupInc: TPopupMenu;
    mnuIncluirConta: TMenuItem;
    N1: TMenuItem;
    mnuExcluirConta: TMenuItem;
    pnlIncConta: TPanel;
    lbl_ct_gerencial: TLabel;
    btnSalvarEtapa: TSpeedButton;
    btnCancelarEtapa: TSpeedButton;
    shp46: TShape;
    Label2: TLabel;
    lblTipoConta: TLabel;
    EditConta: TDBEdit;
    EditContaPai: TEdit;
    procedure dbedt_nm_centro_custoChange(Sender: TObject);
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
    procedure pgctrl_ct_custoChange(Sender: TObject);
    procedure pgctrl_ct_custoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mnuIncluirContaClick(Sender: TObject);
    procedure btnSalvarEtapaClick(Sender: TObject);
    procedure btnCancelarEtapaClick(Sender: TObject);
  private
    pContaPrincipal : Boolean;
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    function  IncCodCusto(const tipo : string) : string;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure MontaTreeView;
    procedure ApagaContaCusto;
  public
    lRecDesp, lRec : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_centro_custo: Tfrm_centro_custo;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, dCentroCusto, PGSM173, Funcoes;

procedure Tfrm_centro_custo.dbedt_nm_centro_custoChange(Sender: TObject);
begin
  if ( datm_centro_custo.qry_centro_custo_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_centro_custo.FormCreate(Sender: TObject);
begin
  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;
  pContaPrincipal := False;

  // Habilita menu conforme direitos do cargo do usuário
  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  // Inicializa o Data Module para Contas Gerenciais
  Application.CreateForm( Tdatm_centro_custo, datm_centro_custo );

  with datm_centro_custo do
  begin
    ds_centro_custo.AutoEdit := st_modificar;

    qry_centro_custo_.Close;
    qry_centro_custo_.SQL[3] := 'CD_CT_CUSTO';
    qry_centro_custo_.Prepare;
    qry_centro_custo_.Open;
  end;

  a_str_indices[0] := 'CD_CT_CUSTO';
  a_str_indices[1] := 'NM_CT_CUSTO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_mi(st_incluir, false, false, st_incluir);
{  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir; }
end;

procedure Tfrm_centro_custo.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_ct_custo.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_centro_custo do
  begin
    qry_centro_custo_.Close;
    qry_centro_custo_.SQL[3] := 'CD_CT_CUSTO';
    qry_centro_custo_.Prepare;
    qry_centro_custo_.Open;
  end;
end;

procedure Tfrm_centro_custo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_centro_custo do
    begin
      qry_centro_custo_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_centro_custo.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_centro_custo.qry_centro_custo_CD_CT_CUSTO2.AsString;
    except
      try
        Cons_OnLine_Texto := datm_centro_custo.qry_centro_custo_CD_CT_CUSTO2.AsString;
      except
        BoxMensagem('Não consegui retornar Código do Centro de Custo!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_centro_custo.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_centro_custo.btn_incluirClick(Sender: TObject);
begin
  ActiveControl := nil;

  btn_mi(False, False, False, False);


{  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;}

  with datm_centro_custo do
  begin
    qry_centro_custo_.DisableControls;
    qry_centro_custo_.Cancel;
    qry_centro_custo_.Append;
    qry_centro_custo_.EnableControls;
    pnlIncConta.Visible     := True;
    pgctrl_ct_custo.Enabled := False;
    pnl_cadastro.Enabled    := False;
    datm_centro_custo.qry_centro_custo_CD_CT_CUSTO2.AsString := IncCodCusto('P');
    EditContaPai.Text := 'Conta Principal';
    pContaPrincipal := True;
  end;
  pgctrl_ct_custo.ActivePage := ts_dados_basicos;
  EditConta.SetFocus;
end;

procedure Tfrm_centro_custo.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_centro_custo.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_centro_custo.Cancelar;
begin
  try
    if datm_centro_custo.qry_centro_custo_.State in [dsInsert, dsEdit] then
    begin
      datm_centro_custo.qry_centro_custo_.Cancel;
      pgctrl_ct_custo.ActivePage := ts_dados_basicos;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_centro_custo.ApagaContaCusto;
begin
  if not SelectSql(datm_centro_custo.SqlAux,'select CD_RATEIO from TRATEIO_CONTAS ' +
                                            'where  CD_CT_CUSTO = ''' + datm_centro_custo.qry_centro_custo_.FieldByName('CD_CT_CUSTO').AsString + '''')then
  begin
    if BoxMensagem( 'A Conta Custo "' + datm_centro_custo.qry_centro_custo_CD_CT_CUSTO2.AsString + ' - ' +
                                        datm_centro_custo.qry_centro_custo_NM_CT_CUSTO.AsString + '"' +
                                       ' será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) Then
    begin
        try
          datm_main.db_broker.StartTransaction;
          datm_centro_custo.qry_centro_custo_.Delete;
          datm_main.db_broker.Commit;
          MontaTreeView;
        except
          on E: Exception do
          begin
            datm_centro_custo.qry_centro_custo_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end
    end;
  end
  else
    BoxMensagem('Esta conta é utilizada em rateios e não poderá ser apagada!',2);
end;

procedure Tfrm_centro_custo.btn_excluirClick(Sender: TObject);
begin
  if pgctrl_ct_custo.ActivePage = ts_lista then
    ApagaContaCusto
  else
  begin
    if tvContas.Selected <> nil then
    begin
      datm_centro_custo.qry_centro_custo_.Locate('CD_CT_CUSTO',ExtractWord(1,tvContas.Selected.Text,'-'),[]);
      ApagaContaCusto;
    end
    else
      BoxMensagem('Selecione uma conta !!',2);
  end;
end;

procedure Tfrm_centro_custo.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_centro_custo.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_centro_custo.qry_centro_custo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_centro_custo.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_centro_custo.qry_centro_custo_CD_CT_CUSTO2.AsString;
  //  Apaga o campo de pesquisa
  edt_chave.Text := '';

  datm_centro_custo.qry_centro_custo_.Close;
  datm_centro_custo.qry_centro_custo_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_centro_custo.qry_centro_custo_.Prepare;
  datm_centro_custo.qry_centro_custo_.Open;
  Localiza(datm_centro_custo.qry_centro_custo_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_centro_custo.Consiste : Boolean;
begin
  Consiste := True;
end;
function Tfrm_centro_custo.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_centro_custo.qry_centro_custo_.State in [dsInsert, dsEdit] ) then
    begin
      datm_centro_custo.qry_centro_custo_.Post;
      Pesquisa := datm_centro_custo.qry_centro_custo_CD_CT_CUSTO2.AsString;
      datm_centro_custo.qry_centro_custo_.Close;
      datm_centro_custo.qry_centro_custo_.Prepare;
      datm_centro_custo.qry_centro_custo_.Open;
      Localiza(datm_centro_custo.qry_centro_custo_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_centro_custo.qry_centro_custo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_centro_custo.pgctrl_ct_custoChange(Sender: TObject);
begin
  if (pgctrl_ct_custo.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
  end
  else
  begin
    MontaTreeView;
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;
  end;
end;

procedure Tfrm_centro_custo.pgctrl_ct_custoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_centro_custo.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_centro_custo.qry_centro_custo_.State in [dsEdit] ) and st_modificar ) or
     ( datm_centro_custo.qry_centro_custo_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Centro de Custo foi alterado.' + #13#10 +
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

procedure Tfrm_centro_custo.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_centro_custo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_centro_custo.mnuIncluirContaClick(Sender: TObject);
begin
  EditContaPai.Text := tvContas.Selected.Text;
  datm_centro_custo.qry_centro_custo_.Insert;
  datm_centro_custo.qry_centro_custo_CD_CT_CUSTO2.AsString := IncCodCusto('S');
  pnlIncConta.Visible := True;
  pgctrl_ct_custo.Enabled := False;
  pnl_cadastro.Enabled    := False;
  EditConta.SetFocus;                                                                
end;

procedure Tfrm_centro_custo.btnSalvarEtapaClick(Sender: TObject);
begin
  if Trim(EditConta.Text) <> '' then
  begin
    if not pContaPrincipal then
    begin
      pnlIncConta.Visible := False;
      pgctrl_ct_custo.Enabled := True;
      pnl_cadastro.Enabled    := True;

      datm_centro_custo.qry_centro_custo_.Post;
      datm_centro_custo.qry_centro_custo_.Close;
      datm_centro_custo.qry_centro_custo_.Open;
      MontaTreeView;
    end
    else
    begin
      datm_centro_custo.qry_centro_custo_.Post;
      MontaTreeView;
      pnlIncConta.Visible := False;
      pgctrl_ct_custo.Enabled := True;
      pnl_cadastro.Enabled    := True;
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end
  else
  begin
    BoxMensagem('O campo conta precisa ser preenchido', 2);
    EditConta.SetFocus;
  end;
end;

procedure Tfrm_centro_custo.btnCancelarEtapaClick(Sender: TObject);
var
  I : Integer;
begin
  pnlIncConta.Visible := False;
  pgctrl_ct_custo.Enabled := True;
  pnl_cadastro.Enabled    := True;

  datm_centro_custo.qry_centro_custo_.Cancel;

  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_centro_custo.MontaTreeView;
var
  contaPai1, contaPai2, contaPai3, contaPai4, contaPai5 : TTreeNode;
  codContaPai : string;
  Cod, I : Integer;
begin
  tvContas.Items.Clear;
  with TQuery.Create(Application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('select * from TCONTABIL_CUSTO');
    SQL.Add('where  IN_ATIVO = ''1''');
    SQL.Add('  ORDER BY CD_CT_CUSTO');
    Open;

    codContaPai := '0';

    while not Eof do
    begin
      if ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.') = 1 then
        contaPai1 := tvContas.Items.Add(nil, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString);

      if ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.') = 2 then
        contaPai2 := tvContas.Items.AddChild( contaPai1, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString);

      if ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.') = 3 then
        contaPai3 := tvContas.Items.AddChild( contaPai2, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString);

      if ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.') = 4 then
        contaPai4 := tvContas.Items.AddChild( contaPai3, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString);

      if ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.') = 5 then
        tvContas.Items.AddChild( contaPai4, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString);

      Next;
    end;
    tvContas.FullExpand;  //Abre todo o TreeView
    Free;
  end;
end;

function Tfrm_centro_custo.IncCodCusto(const tipo  : string) : string;
var
  codPrincipal, codNovo : string;
  cod : Integer;
begin
  Result := '';
  if tipo = 'P' then  //codigo principal
  begin
    with TQuery.Create(Application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT max(cd_ct_custo) CODIGO FROM TCONTABIL_CUSTO ');
      SQL.Add('WHERE IN_ATIVO = ''1'' and LEN(CD_CT_CUSTO) = 2'); //principal
      Open;
      CodPrincipal := FieldByName('CODIGO').AsString;
      CodPrincipal := ExtractWord(1,codPrincipal,'.');
      CodPrincipal := IntToStr(StrToInt(FNullToZero(codPrincipal))+1) + '.';
      Result := CodPrincipal;
    end;
  end
  else
  begin
    with TQuery.Create(Application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT cd_ct_custo CODIGO FROM TCONTABIL_CUSTO ');
      SQL.Add('WHERE IN_ATIVO = ''1'' and CD_CT_CUSTO like ''' + ExtractWord(1,AllTrim(EditContaPai.Text),'-') + '%'' ');
      SQL.Add('and CD_CT_CUSTO <> ''' + ExtractWord(1,AllTrim(EditContaPai.Text),'-') + '''');
      Open;
      Cod := 0;
      while not EOF do
      begin
        if StrToInt(ExtractWord(ContaOcorrencias(ExtractWord(1,AllTrim(EditContaPai.Text),'-'),'.')+1, FieldByName('CODIGO').AsString, '.')) > Cod then
          Cod := StrToInt(ExtractWord(ContaOcorrencias(ExtractWord(1,AllTrim(EditContaPai.Text),'-'),'.')+1, FieldByName('CODIGO').AsString, '.'));
        Next;
      end;
      Result := ExtractWord(1,AllTrim(EditContaPai.Text),'-') + IntToStr(Cod+1) + '.';
      Free;
    end;
  end;
end;

end.
