unit PGSM088;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, DB, Funcoes, DBTables;

type
  Tfrm_emb = class(TForm)
    pgctrl_emb: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedt_cd_emb: TDBEdit;
    dbedt_nm_emb: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label6: TLabel;
    dblckp_ativo: TDBLookupComboBox;
    dblckp_roro: TDBLookupComboBox;
    Label7: TLabel;
    dbedt_cd_embarcacao: TDBEdit;
    dbedt_nm_embarcacao: TDBEdit;
    btn_co_bandeira: TSpeedButton;
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
    procedure pgctrl_embChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_nm_embChange(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure pgctrl_embChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_bandeiraClick(Sender: TObject);
    procedure dbedt_cd_embarcacaoExit(Sender: TObject);
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
    procedure dbedt_cd_embarcacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    OnChanging : Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lnm_emb : Boolean ;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function consist  : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_emb: Tfrm_emb;

implementation

{$R *.DFM}

uses PGGP001, PGGP017, PGSM087, GSMLIB, PGSM096, PGSM148,ConsOnLineEx;

procedure Tfrm_emb.btn_incluirClick(Sender: TObject);
begin
         btn_incluir.Enabled := False;
         mi_incluir.Enabled  := False;
         btn_excluir.Enabled := False;
         mi_excluir.Enabled  := False;
         with datm_emb do
         begin
           qry_emb_.DisableControls;
           qry_emb_.Cancel;
           qry_emb_.Append;
           qry_emb_.EnableControls;
           qry_ult_emb_.Open;
           pgctrl_emb.ActivePage:=ts_dados_basicos;
           qry_emb_.FieldByName('CD_EMBARCACAO').AsString := UltCod( qry_ult_emb_, qry_ult_emb_ULTIMO );
           qry_emb_.FieldByName('IN_ATIVO').AsString  := '1';
           qry_emb_.FieldByName('IN_RORO').AsString  := '0';

         end;

        dbedt_nm_emb.SetFocus;

        end;

procedure Tfrm_emb.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Consist then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_emb.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_emb.Cancelar;
begin
  try
    if datm_emb.qry_emb_.State in [dsInsert, dsEdit] then
    begin
      datm_emb.qry_emb_.Cancel;
      pgctrl_emb.ActivePage := ts_dados_basicos;
      dbedt_nm_emb.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_emb.btn_excluirClick(Sender: TObject);
begin
        if BoxMensagem( 'Esta embarcação será excluída! Confirma exclusão?', 1 ) Then
        try
          datm_main.db_broker.StartTransaction;
          datm_emb.qry_emb_.Delete;
          datm_main.db_broker.Commit;

          with TQuery.Create(application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add(' DELETE FROM MYINDAIA.DBO.TEMBARCACAO WHERE CD_EMBARCACAO = ''' + Pesquisa  + ''' ');
            ExecSQL;
            Free;
          end;

          pgctrl_emb.ActivePage:=ts_lista;
        except
          on E: Exception do
          begin
            datm_emb.qry_emb_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
end;

procedure Tfrm_emb.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_emb.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_emb.qry_emb_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_emb.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_emb.qry_emb_CD_EMBARCACAO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_emb.qry_emb_.Close;
  datm_emb.qry_emb_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_emb.qry_emb_.Open;
  Localiza(datm_emb.qry_emb_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_emb.Grava;
begin
  try
    Pesquisa := datm_emb.qry_emb_CD_EMBARCACAO.AsString;
    datm_main.db_broker.StartTransaction;
    if ( datm_emb.qry_emb_.State in [dsInsert, dsEdit] ) then
    begin
      datm_emb.qry_emb_.Post;
    end;
    datm_main.db_broker.Commit;

    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' DELETE FROM MYINDAIA.DBO.TEMBARCACAO WHERE CD_EMBARCACAO = ''' + Pesquisa  + ''' ');
      ExecSQL;
      SQL.Clear;
      SQL.Add(' INSERT INTO MYINDAIA.DBO.TEMBARCACAO ( ');
      SQL.Add(' CD_EMBARCACAO, NM_EMBARCACAO, CD_BANDEIRA ) ');
      SQL.Add(' SELECT CD_EMBARCACAO, NM_EMBARCACAO, CD_BANDEIRA ');
      SQL.Add(' FROM TEMBARCACAO ( NOLOCK ) WHERE IN_ATIVO = ''1''  AND CD_EMBARCACAO = ''' + Pesquisa + ''' ');
      ExecSQL;
      Free;
    end;

    Grava:=True;
  except
    on E: Exception do
    begin
      datm_emb.qry_emb_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_emb.Consiste;
begin
  if dbedt_nm_emb.Text = '' then
  begin
    BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
    dbedt_nm_emb.SetFocus;
    lnm_emb := True;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

//FERNANDA 30/01/12 (Ocorrência 0940-12 Isaac)

function Tfrm_emb.Consist;
begin
  if dbedt_nm_embarcacao.Text = '' then
  begin
    BoxMensagem('Campo ''Bandeira'' deve ser preenchido!', 2);
    dbedt_nm_embarcacao.SetFocus;
    lnm_emb := True;
    Consist := False;
    Exit;
  end;
  Consist := True;
end;

procedure Tfrm_emb.pgctrl_embChange(Sender: TObject);
begin
  OnChanging := False;

  if lnm_emb then
  begin
    lnm_emb := False;
    pgctrl_emb.ActivePage := ts_dados_basicos;
    dbedt_nm_emb.SetFocus;
    Exit;
  end;

  if (pgctrl_emb.ActivePage = ts_lista ) then
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

procedure Tfrm_emb.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_emb.FormCreate(Sender: TObject);
begin
  { Cria o DataModule do Embarcação }

  Application.CreateForm(Tdatm_emb, datm_emb );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;


  with datm_emb do
  begin
    tbl_yesno_.Open;

    qry_pais_.Close;
    qry_pais_.Prepare;
    qry_pais_.Open;

    qry_emb_.SQL[2] := 'NM_EMBARCACAO';
    qry_emb_.Prepare;
    qry_emb_.Open;
  end;

  a_str_indices[0] := 'CD_EMBARCACAO';
  a_str_indices[1] := 'NM_EMBARCACAO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;
  vStr_cd_modulo:='22';
  str_cd_rotina:='2225';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_emb.ds_emb.AutoEdit                    := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;

end;

procedure Tfrm_emb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_emb.qry_emb_.Close;
  datm_emb.tbl_yesno_.Close;
//  datm_emb.destroy;
  datm_emb.Free;
  Action := caFree;
end;

procedure Tfrm_emb.dbedt_nm_embChange(Sender: TObject);
begin
  if ( datm_emb.qry_emb_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_emb.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      if Cons_OnLine <> nil then
        Cons_OnLine.AsString := datm_emb.qry_emb_CD_EMBARCACAO.AsString
      else
        Cons_Online_Texto := datm_emb.qry_emb_CD_EMBARCACAO.AsString;
    except
      BoxMensagem('Não foi possível retornar o Código da Embarcação!', 2);
    end;
    Close;
  end;
end;

procedure Tfrm_emb.pgctrl_embChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_emb.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_emb.qry_emb_.State in [dsEdit] ) and st_modificar ) or
     ( datm_emb.qry_emb_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Embarcação foi alterado.' + #13#10 +
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

procedure Tfrm_emb.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_emb.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_emb.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_emb.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_emb.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_emb.btn_co_bandeiraClick(Sender: TObject);
var
  S: String;                 //OCORRÊNCIA 0940-12 FERNANDA 30/01/12
begin
  S := ConsultaOnLineEx('TPAIS', 'País', ['CODIGO', 'DESCRICAO'], ['Codigo', 'Nome'], 'CODIGO', nil, 1, datm_emb.qry_emb_CD_BANDEIRA.AsString);
  if (S <> '') and (S <> datm_emb.qry_emb_CD_BANDEIRA.AsString) then
  begin
    if PoeEmEdicao(datm_emb.qry_emb_) then
      datm_emb.qry_emb_CD_BANDEIRA.AsString := S;
  end;
  //Consulta_On_line( 'TPAIS', datm_emb.qry_emb_CD_BANDEIRA, 'Pais', 1 );
  dbedt_cd_embarcacaoExit(nil);
end;

procedure Tfrm_emb.dbedt_cd_embarcacaoExit(Sender: TObject);
begin
  if datm_emb.qry_emb_.State in [ dsInsert,dsEdit ] then
    ValidCodigo( dbedt_cd_embarcacao );
end;

procedure Tfrm_emb.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine       := fCampo;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_emb.dbedt_cd_embarcacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    btn_co_bandeiraClick(nil);
  end;
end;

end.
