unit PGSM170;

interface              

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, DbTables;

type
  Tfrm_ct_gerencial = class(TForm)
    pgctrl_ct_gerencial: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_item: TLabel;
    lbl_cd_item: TLabel;
    dbedt_nm_ct_gerencial: TDBEdit;
    dbedt_cd_ct_gerencial: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
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
    PopupCCustos: TPopupMenu;
    mnuIncCusto: TMenuItem;
    N1: TMenuItem;
    mnuApagaCusto: TMenuItem;
    mnuAltCusto: TMenuItem;
    btnCheck: TSpeedButton;
    lblAtivo: TLabel;
    bevelAtivo: TBevel;
    pnlIncConta: TPanel;
    lbl_ct_gerencial: TLabel;
    btn_co_ct_gerencial: TSpeedButton;
    Label5: TLabel;
    btnSalvarEtapa: TSpeedButton;
    btnCancelarEtapa: TSpeedButton;
    shp46: TShape;
    lblTitulo: TLabel;
    lblTipoConta: TLabel;
    EditConta: TDBEdit;
    dbedt_vl_porcentagem: TDBEdit;
    edt_nm_ct_gerencial: TEdit;
    EditContaPai: TEdit;
    procedure dbedt_nm_ct_gerencialChange(Sender: TObject);
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
    procedure pgctrl_ct_gerencialChange(Sender: TObject);
    procedure pgctrl_ct_gerencialChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mnuIncCustoClick(Sender: TObject);
    procedure EditContaChange(Sender: TObject);
    procedure EditContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarEtapaClick(Sender: TObject);
    procedure btnSalvarEtapaClick(Sender: TObject);
    procedure mnuApagaCustoClick(Sender: TObject);
    procedure mnuAltCustoClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure PopupCCustosPopup(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    pContaPrincipal, st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    function ConsistRateio(const CodRateio: string): Boolean;
    procedure AtivaDesativaRateio(const CodRateio : string; const StatusRateio : string);
    procedure MostraPnlContas(const pEstado : Boolean; const plblTitulo : string; const pTipo : string);
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;

    procedure MontaTreeView;
  end;

var
  frm_ct_gerencial: Tfrm_ct_gerencial;

implementation

uses PGSM171, GSMLIB, PGGP001, PGGP017, ConsOnLineEx,
  dCentroCusto;

{$R *.DFM}


procedure Tfrm_ct_gerencial.dbedt_nm_ct_gerencialChange(Sender: TObject);
begin
  if ( datm_ct_gerencial.qry_rateios.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_ct_gerencial.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Contas Gerenciais}
  Application.CreateForm( Tdatm_ct_gerencial, datm_ct_gerencial );

  with datm_ct_gerencial do
  begin
    ds_ct_gerencial.AutoEdit := st_modificar;

    qry_rateios.Close;
//    qry_rateios.SQL[3] := 'NM_RATEIO';
    qry_rateios.Prepare;
    qry_rateios.Open;
  end;

  a_str_indices[0] := 'CD_RATEIO';
  a_str_indices[1] := 'NM_RATEIO';

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
  mi_excluir.Enabled  := st_excluir;
 }
end;

procedure Tfrm_ct_gerencial.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_ct_gerencial.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_ct_gerencial do
  begin
    qry_rateios.Close;
//  qry_rateios.SQL[3] := 'NM_RATEIO';
    qry_rateios.Prepare;
    qry_rateios.Open;
  end;
  MontaTreeView;
end;

procedure Tfrm_ct_gerencial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_ct_gerencial do
    begin
      qry_rateios.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_ct_gerencial.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_ct_gerencial.qry_rateiosCD_RATEIO.AsString;
    except
      try
        Cons_OnLine_Texto := datm_ct_gerencial.qry_rateiosCD_RATEIO.AsString;
      except
        BoxMensagem('Não consegui retornar Código da Conta Gerencial!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_ct_gerencial.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_ct_gerencial.btn_incluirClick(Sender: TObject);
begin
  if (pgctrl_ct_gerencial.ActivePage = ts_lista) or (datm_ct_gerencial.qry_rateios.IsEmpty) then
  begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;
    btnCheck.Enabled    := False;

    tvContas.Items.Clear;
    with datm_ct_gerencial do
    begin
      qry_rateios.DisableControls;
      qry_rateios.Cancel;
      qry_rateios.Append;
      qry_rateiosCD_RATEIO.AsString  := UltCod( qry_ult_rateios, qry_ult_rateiosULTIMO );
      qry_rateios.EnableControls;
    end;
    pgctrl_ct_gerencial.ActivePage := ts_dados_basicos;
    dbedt_nm_ct_gerencial.SetFocus;
  end
  else
  begin
    MostraPnlContas(True,'Incluindo conta em : ','I');
    EditContaPai.Text := 'Conta Principal';
    pContaPrincipal   := True;
  end;
end;

procedure Tfrm_ct_gerencial.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_ct_gerencial.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ct_gerencial.Cancelar;
begin
  try
    if datm_ct_gerencial.qry_rateios.State in [dsInsert, dsEdit] then
    begin
      datm_ct_gerencial.qry_rateios.Cancel;
      pgctrl_ct_gerencial.ActivePage := ts_dados_basicos;
      dbedt_nm_ct_gerencial.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_ct_gerencial.btn_excluirClick(Sender: TObject);
var
  cd_ct_gerencial : String[4];

  procedure ApagaRateio;
  begin
    try
      datm_main.db_broker.StartTransaction;
      cd_ct_gerencial := datm_ct_gerencial.qry_rateiosCD_RATEIO.AsString;

      datm_ct_gerencial.qry_rateio_contas.First;
      while not datm_ct_gerencial.qry_rateio_contas.Eof do
        datm_ct_gerencial.qry_rateio_contas.Delete;

      datm_ct_gerencial.qry_rateios.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_ct_gerencial.qry_rateios.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
begin
  if tvContas.Items.Count > 0 then
  begin
    if BoxMensagem( 'Este rateio contém contas relacionadas a ele !' + #13#10 + 'Confirma exclusão?', 1 ) Then
    begin
      ApagaRateio;
    end;
  end
  else
  begin
    if BoxMensagem( 'Confirma exclusão do rateio?', 1 ) Then
      ApagaRateio;
  end;
  pgctrl_ct_gerencial.ActivePage := ts_lista;
end;

procedure Tfrm_ct_gerencial.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ct_gerencial.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_ct_gerencial.qry_rateios, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_ct_gerencial.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_ct_gerencial.qry_rateiosCD_RATEIO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_ct_gerencial.qry_rateios.Close;
  datm_ct_gerencial.qry_rateios.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_ct_gerencial.qry_rateios.Prepare;
  datm_ct_gerencial.qry_rateios.Open;
  Localiza(datm_ct_gerencial.qry_rateios, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_ct_gerencial.Consiste : Boolean;
begin
  Consiste := True;

  {Código}
{  if dbedt_cd_ct_gerencial.Text = '' then
  begin
    BoxMensagem('Campo Código deve ser preenchido!', 2);
    pgctrl_ct_gerencial.ActivePage := ts_dados_basicos;
    dbedt_nm_ct_gerencial.SetFocus;
    Consiste := False;
    Exit;
  end;}

  {Descrição}

  if dbedt_nm_ct_gerencial.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_ct_gerencial.ActivePage := ts_dados_basicos;
    dbedt_nm_ct_gerencial.SetFocus;
    Consiste := False;
    Exit;
  end;
end;

function Tfrm_ct_gerencial.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_ct_gerencial.qry_rateios.State in [dsInsert, dsEdit] ) then
    begin
      datm_ct_gerencial.qry_rateios.Post;
      Pesquisa := datm_ct_gerencial.qry_rateiosCD_RATEIO.AsString;
      datm_ct_gerencial.qry_rateios.Close;
      datm_ct_gerencial.qry_rateios.Prepare;
      datm_ct_gerencial.qry_rateios.Open;
      Localiza(datm_ct_gerencial.qry_rateios, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_ct_gerencial.qry_rateios.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_ct_gerencial.pgctrl_ct_gerencialChange(Sender: TObject);
begin
  dbnvg.Enabled       := pgctrl_ct_gerencial.ActivePage = ts_lista;
  edt_chave.Enabled   := pgctrl_ct_gerencial.ActivePage = ts_lista;
  cb_ordem.Enabled    := pgctrl_ct_gerencial.ActivePage = ts_lista;
  btn_excluir.Enabled := pgctrl_ct_gerencial.ActivePage = ts_lista;
//  btnCheck.Enabled    := pgctrl_ct_gerencial.ActivePage = ts_lista;
end;

procedure Tfrm_ct_gerencial.pgctrl_ct_gerencialChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_ct_gerencial.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_ct_gerencial.qry_rateios.State in [dsEdit] ) and st_modificar ) or
     ( datm_ct_gerencial.qry_rateios.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Contas Gerenciais foi alterado.' + #13#10 +
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

procedure Tfrm_ct_gerencial.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;

  btnCheck.Enabled     := Inc;
end;

procedure Tfrm_ct_gerencial.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    if not pnlIncConta.Visible then
      Close
    else
      btnCancelarEtapa.Click;
  end;
end;

procedure Tfrm_ct_gerencial.MontaTreeView;
var
  contaAnterior, contaPai1, contaPai2, contaPai3, contaPai4 : TTreeNode;
  guardaValorPai, guardaValorAnt : string;

  vGrauAtual, vGrauAnt : Integer;
begin
  tvContas.Items.Clear;
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('select A.PERC, B.CD_CT_CUSTO, B.NM_CT_CUSTO from TRATEIO_CONTAS A, TCONTABIL_CUSTO B');
    SQL.Add('where A.CD_RATEIO =:CD_RATEIO');
    SQL.Add('and B.CD_CT_CUSTO = A.CD_CT_CUSTO');
    SQL.Add('order by A.CD_CT_CUSTO');
    ParamByName('CD_RATEIO').AsString := datm_ct_gerencial.qry_rateiosCD_RATEIO.AsString;
    Open;
    guardaValorPai := '';
    guardaValorAnt := '';

    while not Eof do
    begin
{      vGrauAtual := ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.');
      if vGrauAtual = 1 then
      begin
        contaPai1 := tvContas.Items.Add(nil, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ');
        guardaValorPai := FieldByName('CD_CT_CUSTO').AsString;
        contaAnterior := contaPai1;
        vGrauAnt := vGrauAtual;
      end
      else
      begin
        if vGrauAtual > vGrauAnt then
        begin
          contaPai1 := contaAnterior;
          contaAnterior := tvContas.Items.AddChild( contaPai1, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ');
          vGrauAnt := vGrauAtual;
        end
        else
        begin
          if vGrauAtual = vGrauAnt then
          begin
            contaAnterior := tvContas.Items.Add( contaAnterior, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ');
            guardaValorPai := FieldByName('CD_CT_CUSTO').AsString;
          end
          else
          begin
            contaAnterior := tvContas.Items.Add( contaPai1, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ');
            vGrauAnt := vGrauAtual;
          end;
        end;
        guardaValorAnt :=  FieldByName('CD_CT_CUSTO').AsString;
      end;}

      if ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.') = 1 then
        contaPai1 := tvContas.Items.Add(nil, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ');

      if ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.') = 2 then
      begin
        if contaPai1 <> nil then
          contaPai2 := tvContas.Items.AddChild( contaPai1, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ')
        else
          contaPai2 := tvContas.Items.Add( nil, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ')
      end;

      if ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.') = 3 then
      begin
        if contaPai2 <> nil then
          contaPai3 := tvContas.Items.AddChild( contaPai2, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ')
        else
          contaPai3 := tvContas.Items.Add( nil, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ')
      end;

      if ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.') = 4 then
      begin
        if contaPai3 <> nil then
          contaPai4 := tvContas.Items.AddChild( contaPai3, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ')
        else
          contaPai4 := tvContas.Items.Add( nil, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ')
      end;

      if ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.') = 5 then
      begin
        if contaPai4 <> nil then
          tvContas.Items.AddChild( contaPai4, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ')
        else
          tvContas.Items.Add( nil, FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('NM_CT_CUSTO').AsString + ' - ( ' + FieldByName('PERC').AsString + ' % ) ')
      end;
      Next;
    end;
    Free;
  end;
  tvContas.FullExpand;  //Abre todo o TreeView
end;

procedure Tfrm_ct_gerencial.mnuIncCustoClick(Sender: TObject);
begin
  MostraPnlContas(True,'Incluindo conta em : ','I');
  pContaPrincipal     := False;
  AtivaDesativaRateio(datm_ct_gerencial.qry_rateiosCD_RATEIO.AsString,'0'); //desativa
  EditContaPai.Text   := tvContas.Selected.Text;
end;

procedure Tfrm_ct_gerencial.EditContaChange(Sender: TObject);
var
  vListAux : TStringList;
begin
  if Sender is TSpeedButton then
  begin
    if pContaPrincipal then
    begin     //traz somente as contas principais, que tenham 2 caracteres ( 1. ) por exemplo
      vListAux := TStringList.Create;
      vListAux.Add('select CD_CT_CUSTO, NM_CT_CUSTO from TCONTABIL_CUSTO where ');      //tamanho das contas PAI
      vListAux.Add('IN_ATIVO = ''1'' and LEN(CD_CT_CUSTO) = 2 ');
      EditConta.Text := ConsultaOnLineExSQLList(vListAux,'Contas',['CD_CT_CUSTO', 'NM_CT_CUSTO'],['Conta', 'Descrição'],'CD_CT_CUSTO',nil);
      vListAux.Free;
    end
    else
    begin // select que traz apenas as contas que são filhas da conta que está selecionada.
          //Ex. Se tiver clicado em 1., vai trazer todos que começam com 1. do próximo nível
      vListAux := TStringList.Create;
      vListAux.Add('select CD_CT_CUSTO, NM_CT_CUSTO from TCONTABIL_CUSTO where ');
      vListAux.Add('IN_ATIVO = ''1'' and CD_CT_CUSTO like ''' + AllTrim(ExtractWord(1,EditContaPai.Text,'-')) + '%''');
      vListAux.Add(' AND CD_CT_CUSTO <> ''' + AllTrim(ExtractWord(1,EditContaPai.Text,'-')) + '''');
      vListAux.Add(' AND LEN(CD_CT_CUSTO) = ' + IntToStr(Length(AllTrim(ExtractWord(1,EditContaPai.Text,'-'))) + 2));
      EditConta.Text := ConsultaOnLineExSQLList(vListAux,'Contas',['CD_CT_CUSTO', 'NM_CT_CUSTO'],['Conta', 'Descrição'],'CD_CT_CUSTO',nil);
      vListAux.Free;
    end;
  end
  else
  begin
    with datm_ct_gerencial.sqlAux do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT CD_CT_CUSTO, NM_CT_CUSTO FROM TCONTABIL_CUSTO ');
      Sql.Add('WHERE IN_ATIVO = ''1'' AND '); //CD_CT_CUSTO <> ''' + AllTrim(ExtractWord(1,EditContaPai.Text,'-')) + ''' AND');
      if pContaPrincipal then   //se for conta principal, então traz somente os que tiverem 2 caracteres
        Sql.Add('LEN(CD_CT_CUSTO) = 2 ')
      else
      begin
        Sql.Add('CD_CT_CUSTO like ''' + AllTrim(ExtractWord(1,EditContaPai.Text,'-')) + '%''');
        if EditConta.Enabled then //se estiver desabilitado é pq está em modo de edição 
          Sql.Add('AND LEN(CD_CT_CUSTO) = ' + IntToStr(Length(AllTrim(ExtractWord(1,EditContaPai.Text,'-'))) + 2));
      end;

      Sql.Add('AND CD_CT_CUSTO =:CD_CT_CUSTO');

      ParamByName('CD_CT_CUSTO').AsString := EditConta.Text;

      Open;
      edt_nm_ct_gerencial.Text := FieldByName('NM_CT_CUSTO').AsString;
    end;
  end;
end;

procedure Tfrm_ct_gerencial.EditContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_ct_gerencial then
      btn_co_ct_gerencial.Click;
  end;
end;

procedure Tfrm_ct_gerencial.btnCancelarEtapaClick(Sender: TObject);
begin
  MostraPnlContas(False,'','B');
  datm_ct_gerencial.qry_rateio_Contas.Cancel;
end;

procedure Tfrm_ct_gerencial.btnSalvarEtapaClick(Sender: TObject);
var
  pCodRateio : string;
begin
  if edt_nm_ct_gerencial.Text <> '' then
  begin
    if dbedt_vl_porcentagem.Text <> '' then
    begin
      datm_ct_gerencial.qry_rateio_Contas.Post;
      pCodRateio := datm_ct_gerencial.qry_rateios.FieldByName('CD_RATEIO').AsString;
      datm_ct_gerencial.qry_rateios.Close;
      datm_ct_gerencial.qry_rateios.Open;
      datm_ct_gerencial.qry_rateios.Locate('CD_RATEIO',pCodRateio,[]);

      MostraPnlContas(False,'','B');

      MontaTreeView;
    end
    else
    begin
      BoxMensagem('Campo Porcentagem deve ser preenchido !', 2);
      dbedt_vl_porcentagem.SetFocus;
    end;
  end
  else
  begin
    BoxMensagem('Campo Conta Gerencial deve ser preenchido!', 2);
    EditConta.SetFocus;
  end;
end;

procedure Tfrm_ct_gerencial.mnuApagaCustoClick(Sender: TObject);
var
  pCodRateio : string;
begin
  if datm_ct_gerencial.qry_rateio_contas.Locate('CD_CT_CUSTO',ExtractWord(1,tvContas.Selected.Text,'-'),[]) then
  begin
    if BoxMensagem( 'A Conta Custo "' + tvContas.Selected.Text + '" será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) Then
    begin
      try
        pCodRateio := datm_ct_gerencial.qry_rateios.FieldByName('CD_RATEIO').AsString;
        datm_main.db_broker.StartTransaction;
        datm_ct_gerencial.qry_rateio_contas.Delete;
        AtivaDesativaRateio(datm_ct_gerencial.qry_rateiosCD_RATEIO.AsString,'0'); //desativa
        datm_main.db_broker.Commit;
        MontaTreeView;

        datm_ct_gerencial.qry_rateios.Close;
        datm_ct_gerencial.qry_rateios.Open;
        datm_ct_gerencial.qry_rateios.Locate('CD_RATEIO',pCodRateio,[]);
      except
        on E: Exception do
        begin
          datm_ct_gerencial.qry_rateio_contas.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end
    end;
  end;
end;

procedure Tfrm_ct_gerencial.mnuAltCustoClick(Sender: TObject);
begin
  pContaPrincipal     := False;
  EditContaPai.Text := tvContas.Selected.Text;
  EditConta.Enabled := False;
  EditConta.OnChange(Self);
  btn_co_ct_gerencial.Enabled := False;

  AtivaDesativaRateio(datm_ct_gerencial.qry_rateiosCD_RATEIO.AsString,'0');  //desativa
  datm_ct_gerencial.qry_rateio_contas.Locate('CD_CT_CUSTO',ExtractWord(1,tvContas.Selected.Text,'-'),[]);

  MostraPnlContas(True,'Alterando conta em : ','A');
end;

procedure Tfrm_ct_gerencial.btnCheckClick(Sender: TObject);
var
  pCodRateio : string;
begin
  if tvContas.Items.Count <> 0 then
  begin
    if ConsistRateio(datm_ct_gerencial.qry_rateiosCD_RATEIO.AsString) then
    begin
      if datm_ct_gerencial.qry_rateiosIN_ATIVO.AsString = '0' then
      begin
        if BoxMensagem( 'Deseja ativa o rateio para utilização ?', 1 ) Then
        begin
          pCodRateio := datm_ct_gerencial.qry_rateios.FieldByName('CD_RATEIO').AsString;
          AtivaDesativaRateio(datm_ct_gerencial.qry_rateiosCD_RATEIO.AsString,'1'); //ativa
          datm_ct_gerencial.qry_rateios.Close;
          datm_ct_gerencial.qry_rateios.Open;
          datm_ct_gerencial.qry_rateios.Locate('CD_RATEIO', pCodRateio, []);
        end;
      end
      else
        BoxMensagem('Rateio já está ativado', 2)
    end;
  end
  else
    BoxMensagem('Rateio não possui contas relacionadas', 2)
end;

function Tfrm_ct_gerencial.ConsistRateio(const CodRateio : string) : Boolean;
//Função que faz a consistência nas contas para saber se a somatória delas, dá 100% em todos os níveis
var
  cod : string;
begin
  Result := True;
  datm_ct_gerencial.sqlAux.Close;
  datm_ct_gerencial.sqlAux.Sql.Clear;
  datm_ct_gerencial.sqlAux.Sql.Add('select');
  datm_ct_gerencial.sqlAux.Sql.Add('   B.CD_CT_CUSTO, B.NM_CT_CUSTO');
  datm_ct_gerencial.sqlAux.Sql.Add('from TRATEIO_CONTAS A, TCONTABIL_CUSTO B');
  datm_ct_gerencial.sqlAux.Sql.Add('where   ');
  datm_ct_gerencial.sqlAux.Sql.Add('   B.CD_CT_CUSTO = A.CD_CT_CUSTO and ');
  datm_ct_gerencial.sqlAux.Sql.Add('   A.CD_RATEIO =:CD_RATEIO ');
  datm_ct_gerencial.sqlAux.ParamByName('CD_RATEIO').AsString := CodRateio;
  datm_ct_gerencial.sqlAux.Open;
  while not datm_ct_gerencial.sqlAux.EOF do
  begin
    if Length(datm_ct_gerencial.sqlAux.FieldByName('CD_CT_CUSTO').AsString) > 2 then
    begin
      with TQuery.Create(Application) do
      begin
        Databasename := 'DBBROKER';
        Close;
        Sql.Clear;
        Sql.Add('select ISNULL(sum(PERC),0) TOTAL from TRATEIO_CONTAS');
        Sql.Add('where CD_CT_CUSTO like ''' + datm_ct_gerencial.sqlAux.FieldByName('CD_CT_CUSTO').AsString + '%''' +
                ' And CD_RATEIO =:CD_RATEIO and CD_CT_CUSTO <> :CD_CT_CUSTO');
        ParamByName('CD_RATEIO').AsString    := CodRateio;
        ParamByName('CD_CT_CUSTO').AsString := datm_ct_gerencial.sqlAux.FieldByName('CD_CT_CUSTO').AsString;
        Open;

        while not EOF do
        begin
          if FieldByName('TOTAL').AsFloat > 0 then
          begin
            if (FieldByName('TOTAL').AsFloat <> 100) then //or (FieldByName('TOTAL').AsFloat > 100)then
            begin

              BoxMensagem('Existe inconsistências na conta "' +
                            datm_ct_gerencial.sqlAux.FieldByName('CD_CT_CUSTO').AsString + ' - ' +
                            datm_ct_gerencial.sqlAux.FieldByName('NM_CT_CUSTO').AsString +
                            '" onde a soma dos valoes é de ' + FieldByName('TOTAL').AsString + '%', 2);      //showmessage(datm_ct_gerencial.sqlAux.FieldByName('CD_CT_CUSTO').AsString + ' - ' + FieldByName('TOTAL').AsString);

              Result := False;
            end;
          end;
          Next;
        end;
      end;
    end
    else
    begin
      with TQuery.Create(Application) do
      begin
        Databasename := 'DBBROKER';
        Close;
        Sql.Clear;
        Sql.Add('select ISNULL(sum(PERC),0) TOTAL from TRATEIO_CONTAS');
        Sql.Add('where CD_CT_CUSTO like ''' + datm_ct_gerencial.sqlAux.FieldByName('CD_CT_CUSTO').AsString + '%''' +
                ' And CD_RATEIO =:CD_RATEIO and CD_CT_CUSTO <> :CD_CT_CUSTO  and LEN(CD_CT_CUSTO) = ' + IntToStr(Length(datm_ct_gerencial.sqlAux.FieldByName('CD_CT_CUSTO').AsString) * 2));
        ParamByName('CD_RATEIO').AsString    := CodRateio;
        ParamByName('CD_CT_CUSTO').AsString := datm_ct_gerencial.sqlAux.FieldByName('CD_CT_CUSTO').AsString;
        Open;

        if FieldByName('TOTAL').AsFloat > 0 then
        begin
          if (FieldByName('TOTAL').AsFloat <> 100) then
          begin
            BoxMensagem('Existe inconsistências na conta "' +
                          datm_ct_gerencial.sqlAux.FieldByName('CD_CT_CUSTO').AsString + ' - ' +
                          datm_ct_gerencial.sqlAux.FieldByName('NM_CT_CUSTO').AsString +
                          '" onde a soma dos valoes é de ' + FieldByName('TOTAL').AsString + '%', 2);
            Result := False;
          end;
        end;
      end;
    end;
    datm_ct_gerencial.sqlAux.Next;
  end;
end;

procedure Tfrm_ct_gerencial.AtivaDesativaRateio(const CodRateio : string;
  const StatusRateio : string);
begin
  with TQuery.Create(Application) do
  begin
    Databasename := 'DBBROKER';
    Close;
    Sql.Clear;
    Sql.Add('update TRATEIO SET IN_ATIVO =:IN_ATIVO');
    Sql.Add('where');
    Sql.Add('  CD_RATEIO =:CD_RATEIO');
    ParamByName('CD_RATEIO').AsString := CodRateio;
    ParamByName('IN_ATIVO').AsString := StatusRateio;
    ExecSQL;
    Free;
  end;
end;

procedure Tfrm_ct_gerencial.PopupCCustosPopup(Sender: TObject);
begin
  mnuIncCusto.Enabled   := tvContas.Items.Count <> 0;
  mnuAltCusto.Enabled   := tvContas.Items.Count <> 0;
  mnuApagaCusto.Enabled := tvContas.Items.Count <> 0;
end;

procedure TFrm_Ct_gerencial.MostraPnlContas(const pEstado : Boolean; const plblTitulo : string; const pTipo : string);
begin
  lblTipoConta.Caption         := pLblTitulo;
  pnlIncConta.Visible          := pEstado;
  pnl_cadastro.Enabled         := not pEstado;
  pnl_entrada_de_dados.Enabled := not pEstado;

  pgctrl_ct_gerencial.Enabled  := not pEstado;


  btn_mi(not pEstado, False, False, not pEstado);
  mi_sair.Enabled := not pEstado;

  if pTipo = 'I' then  //inclusão
  begin
    lblTitulo.Caption           := 'Inclusão de Conta';
    EditConta.Enabled           := True;
    btn_co_ct_gerencial.Enabled := True;
    EditConta.SetFocus;
    datm_ct_gerencial.qry_rateio_Contas.Insert;
  end
  else if pTipo = 'A' then
  begin
    lblTitulo.Caption           := 'Alteração de Conta';
    datm_ct_gerencial.qry_rateio_Contas.Edit;
    EditConta.Enabled           := False;
    btn_co_ct_gerencial.Enabled := False;
    dbedt_vl_porcentagem.SetFocus;
    datm_ct_gerencial.qry_rateio_Contas.Edit;
  end;
end;

end.


