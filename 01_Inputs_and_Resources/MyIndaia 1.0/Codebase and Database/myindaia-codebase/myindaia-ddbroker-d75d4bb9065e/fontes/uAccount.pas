unit uAccount;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, ComCtrls, DB, Buttons, ExtCtrls,
  RxDBComb, DBTables, Menus, Math, ppDB, ppStrtch, ppMemo, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppEndUsr, ppDBPipe, ppDBBDE,
  ppComm, ppRelatv, ppProd, ppReport;

type
  Tfrm_account = class(TForm)
    pnl_house: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    main_menu_proc: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    dbnavg: TDBNavigator;
    btn_bloc_proc: TSpeedButton;
    pgctrl_account: TPageControl;
    ts_lista: TTabSheet;
    DBGrid1: TDBGrid;
    ts_dados: TTabSheet;
    dbgrid_faturas: TDBGrid;
    Label7: TLabel;
    btn_aprovar_proc: TSpeedButton;
    btn_verif_acc: TSpeedButton;
    mi_verif_acc: TMenuItem;
    mi_aprov_proc: TMenuItem;
    mi_bloc_proc: TMenuItem;
    btn_emissao_fat: TSpeedButton;
    mi_emissao_fat: TMenuItem;
    btn_remessa: TSpeedButton;
    mi_remessa: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Panel1: TPanel;
    Label5: TLabel;
    btn_co_unid_pesq: TSpeedButton;
    Label6: TLabel;
    btn_co_prod_pesq: TSpeedButton;
    msk_unid_pesq: TMaskEdit;
    edt_nm_unid_pesq: TEdit;
    msk_prod_pesq: TMaskEdit;
    edt_nm_prod_pesq: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dbedt_nr_processo: TDBEdit;
    dbedt_vl_account: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    dbrgp_tp_fatura: TDBRadioGroup;
    dbedt_nr_fatura: TDBEdit;
    dbedt_dt_fatura: TDBEdit;
    dbedt_cre_agente: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btn_incluir: TSpeedButton;
    dbedt_deb_agente: TDBEdit;
    dbedt_cre_brasil: TDBEdit;
    dbedt_deb_brasil: TDBEdit;
    dbedt_ajuste: TDBEdit;
    btn_excluir: TSpeedButton;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    ts_lista_master: TTabSheet;
    dbgri_master: TDBGrid;
    Panel3: TPanel;
    Label17: TLabel;
    btn_co_unid_master: TSpeedButton;
    Label18: TLabel;
    btn_co_prod_master: TSpeedButton;
    msk_unid_master: TMaskEdit;
    edt_nm_unid_master: TEdit;
    msk_prod_master: TMaskEdit;
    edt_nm_prod_master: TEdit;
    ts_dados_master: TTabSheet;
    Panel4: TPanel;
    edt_nr_master: TDBEdit;
    Label19: TLabel;
    DBEdit8: TDBEdit;
    Label20: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label21: TLabel;
    DBEdit12: TDBEdit;
    Label22: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label23: TLabel;
    DBEdit16: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    dbedt_deb_br_master: TDBEdit;
    dbedt_ajuste_master: TDBEdit;
    dbedt_cre_ag_master: TDBEdit;
    dbedt_deb_ag_master: TDBEdit;
    dbedt_cre_br_master: TDBEdit;
    dbrdgp_tp_fat_master: TDBRadioGroup;
    dbedt_nr_fat_master: TDBEdit;
    dbedt_dt_fat_master: TDBEdit;
    DBGrid3: TDBGrid;
    ts_processos: TTabSheet;
    pgctrl_proc: TPageControl;
    ts_lista_proc: TTabSheet;
    ts_dados_proc: TTabSheet;
    DBGrid4: TDBGrid;
    Panel5: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBGrid5: TDBGrid;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    dbedt_deb_br_proc: TDBEdit;
    dbedt_ajuste_proc: TDBEdit;
    dbedt_cre_ag_proc: TDBEdit;
    dbedt_deb_ag_proc: TDBEdit;
    dbedt_cre_br_proc: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    pnl_master: TPanel;
    SpeedButton3: TSpeedButton;
    btn_salvar2: TSpeedButton;
    btn_Cancelar2: TSpeedButton;
    btn_bloc_proc2: TSpeedButton;
    btn_aprovar_proc2: TSpeedButton;
    btn_verif_acc2: TSpeedButton;
    btn_emissao_fat2: TSpeedButton;
    btn_remessa2: TSpeedButton;
    Label41: TLabel;
    Label42: TLabel;
    btn_incluir2: TSpeedButton;
    btn_excluir2: TSpeedButton;
    edt_chave2: TEdit;
    cb_ordem2: TComboBox;
    DBEdit39: TDBEdit;
    Label43: TLabel;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    Label44: TLabel;
    main_menu_master: TMainMenu;
    mi_salvar2: TMenuItem;
    mi_Cancelar2: TMenuItem;
    mi_verif_acc2: TMenuItem;
    mi_aprov_proc2: TMenuItem;
    mi_emissao_fat2: TMenuItem;
    mi_remessa2: TMenuItem;
    mi_bloc_proc2: TMenuItem;
    MenuItem8: TMenuItem;
    DBEdit7: TDBEdit;
    Label45: TLabel;
    lb_Contabililzada: TLabel;
    Label46: TLabel;
    rb_todos: TCheckBox;
    DBEdit17: TDBEdit;
    Label47: TLabel;
    btn_retorna_acc: TSpeedButton;
    Mi_retorna_acc: TMenuItem;
    Shape1: TShape;
    Shape2: TShape;
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure msk_unid_pesqExit(Sender: TObject);
    procedure msk_prod_pesqExit(Sender: TObject);
    procedure btn_co_prod_pesqClick(Sender: TObject);
    procedure btn_co_unid_pesqClick(Sender: TObject);
    procedure btn_bloc_procClick(Sender: TObject);
    procedure pgctrl_accountChange(Sender: TObject);
    procedure btn_verif_accClick(Sender: TObject);
    procedure btn_aprovar_procClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemChange(Sender: TObject);
    procedure btn_emissao_fatClick(Sender: TObject);
    procedure btn_remessaClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure dbrgp_tp_faturaChange(Sender: TObject);
    procedure dbedt_nr_faturaChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_unid_masterExit(Sender: TObject);
    procedure msk_prod_masterExit(Sender: TObject);
    procedure btn_co_unid_masterClick(Sender: TObject);
    procedure btn_co_prod_masterClick(Sender: TObject);
    procedure btn_incluir2Click(Sender: TObject);
    procedure pgctrl_procChange(Sender: TObject);
    procedure btn_excluir2Click(Sender: TObject);
    procedure dbrdgp_tp_fat_masterChange(Sender: TObject);
    procedure dbedt_nr_fat_masterChange(Sender: TObject);
    procedure btn_verif_acc2Click(Sender: TObject);
    procedure btn_aprovar_proc2Click(Sender: TObject);
    procedure btn_emissao_fat2Click(Sender: TObject);
    procedure btn_bloc_proc2Click(Sender: TObject);
    procedure rb_todosClick(Sender: TObject);
    procedure edt_chave2Change(Sender: TObject);
    procedure cb_ordem2Change(Sender: TObject);
    procedure btn_retorna_accClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_prod_pesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..9] Of String[60]; // trabalha c/ edt_chave
    st_modificar, st_incluir, st_excluir: Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    function Grava    :Boolean;
    function Consiste :Boolean;
//    function VerAlt   :Boolean;
  public
    in_master :Boolean;
    procedure valores_fatura(tp_fat:String);
  end;

var
  frm_account: Tfrm_account;

implementation

uses dAccount, GSMLIB, PGGP017, PGGP001, ConsOnLineEx, uGerarRemessa, uEmissaoFatura, Funcoes;

{$R *.DFM}

procedure Tfrm_account.Cancelar;
begin
  if datm_account.qry_fatura_ag_.State in [dsEdit, dsInsert]then
    datm_account.qry_fatura_ag_.Cancel;
  if datm_account.qry_master_fatura_ag_.State in [dsEdit, dsInsert]then
    datm_account.qry_master_fatura_ag_.Cancel;
  btn_mi(True, false, false, True);
//  btn_mi(st_incluir, false, false, st_excluir);
end;

function Tfrm_account.Consiste: Boolean;
begin
  consiste := true;
  if (pgctrl_account.ActivePage = ts_dados) then
  begin
    if dbedt_nr_fatura.text = '' then
    begin
      Boxmensagem('Deve ser inserido o Nr da Fatura',2);
      dbedt_nr_fatura.Setfocus;
      consiste := false;
      Exit;
    end;
    if dbedt_dt_fatura.text = '' then
    begin
      Boxmensagem('Deve ser inserido a Data da Fatura',2);
      dbedt_dt_fatura.Setfocus;
      consiste := false;
      Exit;
    end;
  end;
  if (pgctrl_account.ActivePage = ts_dados_master) then
  begin
    if dbedt_nr_fat_master.text = '' then
    begin
      Boxmensagem('Deve ser inserido o Nr da Fatura',2);
      dbedt_nr_fatura.Setfocus;
      consiste:= false;
      Exit;
    end;
    if dbedt_dt_fat_master.text = '' then
    begin
      Boxmensagem('Deve ser inserido a Data da Fatura',2);
      dbedt_dt_fat_master.Setfocus;
      consiste:= false;
      Exit;
    end;
  end;
end;

function Tfrm_account.Grava: Boolean;
var MASTER :TQuery;
begin
  if (pgctrl_account.ActivePage = ts_dados) then
  begin
    try
      if datm_account.qry_fatura_ag_.State in [dsedit,dsInsert] then
      begin
        datm_account.qry_fatura_ag_.Post;
        if datm_account.qry_processo_IN_ACCOUNT.AsString = '4' THEN
        begin
          if not(datm_account.qry_processo_.State in [dsEdit]) then
            datm_account.qry_processo_.Edit;
          datm_account.qry_processo_IN_ACCOUNT.AsString := '1';
          datm_account.qry_processo_.Post;
        end;
        MASTER := Tquery.Create(Application);
        MASTER.DataBasename:= 'DBBROKER';
        MASTER.Sql.Add('UPDATE TMASTER SET IN_ACCOUNT = "2" WHERE CD_MASTER = "'+datm_account.qry_processo_CD_MASTER.AsString+'"');
        MASTER.Sql.Add(' AND IN_ACCOUNT IN("1") ');
        MASTER.ExecSql;
        MASTER.Free;
      end;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        datm_account.qry_fatura_ag_.Cancel;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;

  if (pgctrl_account.ActivePage = ts_dados_master) then
  begin
    try
      if datm_account.qry_master_fatura_ag_.State in [dsedit,dsInsert] then
      begin
        datm_account.qry_master_fatura_ag_.Post;
        MASTER := Tquery.Create(Application);
        MASTER.DataBasename:= 'DBBROKER';
        MASTER.Sql.Add('UPDATE TPROCESSO SET IN_ACCOUNT = "8" ');
        MASTER.Sql.Add(' WHERE NR_PROCESSO IN (SELECT H.NR_PROCESSO FROM THOUSE H ');
        MASTER.Sql.Add(' WHERE  H.CD_MASTER = "'+datm_account.qry_master_CD_MASTER.AsString+'" ) ');
        MASTER.ExecSql;
        MASTER.Free;
      end;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        datm_account.qry_master_fatura_ag_.Cancel;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  btn_mi(True, false, false, True);
//  btn_mi(st_incluir, false, false, st_excluir);
end;

procedure Tfrm_account.FormCreate(Sender: TObject);
begin
  st_modificar := false;
  st_incluir   := false;
  st_excluir   := false;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  Application.CreateForm(Tdatm_account, datm_account);
  with datm_account do
  begin
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_traz_default_.Open;
    msk_unid_pesq.text      := qry_traz_default_CD_UNID_NEG.AsString;
    edt_nm_unid_pesq.text   := qry_traz_default_NM_UNID_NEG.AsString;
    msk_prod_pesq.text      := qry_traz_default_CD_PRODUTO.AsString;
    edt_nm_prod_pesq.text   := qry_traz_default_NM_PRODUTO.AsString;
    msk_unid_master.text    := qry_traz_default_CD_UNID_NEG.AsString;
    edt_nm_unid_master.text := qry_traz_default_NM_UNID_NEG.AsString;
    msk_prod_master.text    := qry_traz_default_CD_PRODUTO.AsString;
    edt_nm_prod_master.text := qry_traz_default_NM_PRODUTO.AsString;
    qry_tp_fatura_.Close;
    qry_tp_fatura_.Prepare;
    qry_tp_fatura_.Open;
  end;
  a_str_indices[0] := 'NR_MASTER';
  a_str_indices[1] := 'NR_HOUSE';
  a_str_indices[2] := 'NR_PROCESSO';
  a_str_indices[3] := 'NM_AGENTE';
  a_str_indices[4] := 'NM_CLIENTE';
  With cb_ordem do
  begin
    Clear;
    Items.Add('Master');
    Items.Add('House');
    Items.Add('Processo');
    Items.Add('Agente');
    Items.Add('Cliente');
    ItemIndex := 2;
  end;
  pgctrl_account.ActivePage := ts_lista;
  btn_mi(True, false, false, True);
//  btn_mi(st_incluir, false, false, st_excluir);
end;

procedure Tfrm_account.btn_sairClick(Sender: TObject);
begin
  datm_account.qry_fatura_ag_.close;
  datm_account.qry_master_fatura_ag_.close;
  datm_account.qry_processo_.close;
  datm_account.qry_master_.close;
  Close;
end;

procedure Tfrm_account.msk_unid_pesqExit(Sender: TObject);
begin
{  if msk_unid_pesq.Text <> '' then
  begin
    ValCodEdt( msk_unid_pesq );
    datm_account.qry_pesquisa_.Active:=false;
    datm_account.qry_pesquisa_.Sql.Clear;
    datm_account.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_pesq.Text+'"');
    datm_account.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_account.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_account.qry_pesquisa_.Active:=true;
    if datm_account.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_unid_pesq.text:= datm_account.qry_pesquisa_.Fields[0].AsString;
      datm_account.qry_pesquisa_.Close;
      datm_account.qry_processo_.Close;
      datm_account.qry_processo_.ParamByName('CD_PRODUTO').AsString:= msk_prod_pesq.text;
      datm_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
      datm_account.qry_processo_.Prepare;
      datm_account.qry_processo_.Open;
    end
    else
    begin
      datm_account.qry_pesquisa_.Close;
      edt_nm_unid_pesq.Text := '';
      BoxMensagem('Código da Unidade de Negócio inválido!', 2);
      msk_unid_pesq.SetFocus;
      Exit;
    end;
  end
  else
  begin
    Boxmensagem('A Unidade de Negócio deve ser informado!',2);
    msk_unid_pesq.SetFocus;
  end;  }

  if msk_unid_pesq.Text <> '' then begin
    msk_unid_pesq.Text := Copy('00', 1, 2 - Length( msk_unid_pesq.Text)) +  msk_unid_pesq.Text;
    edt_nm_unid_pesq.text := ConsultaLookUpSQL('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_pesq.Text+'" ' +
                                               ' AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG FROM TUSUARIO_HABILITACAO ' +
                                               '                     WHERE CD_USUARIO ="'+str_cd_usuario+'") ', 'NM_UNID_NEG');

    if edt_nm_unid_pesq.text = '' then begin
      edt_nm_unid_pesq.Text := '';
      ShowMessage('Código da Unidade de Negócio inválido!');
      msk_unid_pesq.SetFocus;
      Exit;
    end else begin
      datm_account.qry_processo_.Close;
      datm_account.qry_processo_.ParamByName('CD_PRODUTO').AsString:= msk_prod_pesq.text;
      datm_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
      datm_account.qry_processo_.Prepare;
      datm_account.qry_processo_.Open;
    end;
  end else begin
    ShowMessage('A Unidade de Negócio deve ser informado!');
    msk_unid_pesq.SetFocus;
  end;

end;

procedure Tfrm_account.msk_prod_pesqExit(Sender: TObject);
begin
 { if msk_prod_pesq.Text <> '' then
  begin
    ValCodEdt( msk_prod_pesq );
    datm_account.qry_pesquisa_.Active:=false;
    datm_account.qry_pesquisa_.Sql.Clear;
    datm_account.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_prod_pesq.Text+'"');
    datm_account.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_account.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_account.qry_pesquisa_.Active:=true;
    if datm_account.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_prod_pesq.text:= datm_account.qry_pesquisa_.Fields[0].AsString;
      datm_account.qry_pesquisa_.Close;
      datm_account.qry_processo_.Close;
      datm_account.qry_processo_.ParamByName('CD_PRODUTO').AsString:= msk_prod_pesq.text;
      datm_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
      datm_account.qry_processo_.Prepare;
      datm_account.qry_processo_.Open;
    end
    else
    begin
      datm_account.qry_pesquisa_.Close;
      edt_nm_prod_pesq.Text := '';
      BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
      msk_prod_pesq.SetFocus;
      Exit;
    end;
  end
  else
  begin
    Boxmensagem('O Produto deve ser informado!',2);
    msk_prod_pesq.SetFocus;
  end;  }

  if msk_prod_pesq.Text <> '' then begin
    msk_prod_pesq.Text := Copy('00', 1, 2 - Length( msk_prod_pesq.Text)) +  msk_prod_pesq.Text;
    edt_nm_prod_pesq.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_prod_pesq.Text+'" ' +
                                               ' AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO ' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'") ' , 'NM_PRODUTO');

    if edt_nm_prod_pesq.text = '' then begin
      edt_nm_prod_pesq.Text := '';
      ShowMessage('Código do Produto inválido ou não habilidado!');
      msk_prod_pesq.SetFocus;
      Exit;
    end else begin
      datm_account.qry_processo_.Close;
      datm_account.qry_processo_.ParamByName('CD_PRODUTO').AsString:= msk_prod_pesq.text;
      datm_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
      datm_account.qry_processo_.Prepare;
      datm_account.qry_processo_.Open;
    end;
  end else begin
    ShowMessage('O Produto deve ser informado!');
    msk_prod_pesq.SetFocus;
  end;
end;

procedure Tfrm_account.btn_co_prod_pesqClick(Sender: TObject);
//var produto :string;
begin
  if Sender is TSpeedButton then begin
    msk_prod_pesq.text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO', nil, 1, msk_prod_pesq.text);
    msk_prod_pesqExit(Sender);
  end else
    edt_nm_prod_pesq.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_prod_pesq.Text+'" ' +
                                               'AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'")' , 'NM_PRODUTO');


{  produto := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO');
  if produto <> '' then
  begin
    msk_prod_pesq.text :=produto;
    msk_prod_pesqExit(Sender);
  end; }
end;

procedure Tfrm_account.btn_co_unid_pesqClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    msk_unid_pesq.text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG', nil, 1, msk_unid_pesq.text);
    msk_unid_pesqExit(Sender);
  end else
    edt_nm_unid_pesq.text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_unid_pesq.text, 'NM_UNID_NEG' );


{  Cons_On_line_Texto( 'DBBROKER','TUNID_NEG',msk_unid_pesq,'Unidades de Negócio',52,'IN_ATIVO = 1' );
  msk_unid_pesqExit(Sender); }
end;

procedure Tfrm_account.btn_bloc_procClick(Sender: TObject);
var in_tada_consolidada: Boolean;
    nr_processo :String[18];
begin
  if dbedt_nr_processo.text = '' then exit;
  in_tada_consolidada := false;
  With Tquery.Create(application) do
  begin
    DataBasename:= 'DBBROKER';
    Sql.Add('SELECT COUNT(CD_MASTER) FROM THOUSE WHERE CD_MASTER = "'+datm_account.qry_processo_CD_MASTER.AsString+'"');
    Open;
    if Fields[0].AsInteger > 1 then
    begin
      Boxmensagem('Toda a Consolidada com '+ Fields[0].AsString + ' Processos será Tranferida! ',3);
      in_tada_consolidada := true;
    end;
    Free;
  end;
  nr_processo :=  datm_account.qry_processo_NR_PROCESSO.AsString;
  with TQuery.Create(Application) do
  begin
    DataBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add('UPDATE TPROCESSO SET IN_ACCOUNT = "7" ');
    Sql.Add('WHERE NR_PROCESSO IN (SELECT H.NR_PROCESSO FROM THOUSE H WHERE H.CD_MASTER = "'+datm_account.qry_processo_CD_MASTER.AsString+'")');
    ExecSql;
    Free;
  end;
  datm_account.qry_processo_.Close;
  datm_account.qry_processo_.ParamByName('CD_PRODUTO').AsString:= msk_prod_pesq.text;
  datm_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
  datm_account.qry_processo_.Prepare;
  datm_account.qry_processo_.Open;
  datm_account.qry_processo_.Locate('NR_PROCESSO', str_nr_processo, [loCaseInsensitive]);
  Boxmensagem('Processo sujeito a Liberação!',2);
end;

procedure Tfrm_account.pgctrl_accountChange(Sender: TObject);
begin
  edt_chave.Enabled           := (pgctrl_account.ActivePage = ts_lista);
  cb_ordem.Enabled            := (pgctrl_account.ActivePage = ts_lista);
  dbnavg.Enabled              := (pgctrl_account.ActivePage = ts_lista);
  btn_verif_acc.Enabled       := (pgctrl_account.ActivePage = ts_dados);
  mi_verif_acc.Enabled        := (pgctrl_account.ActivePage = ts_dados);
  btn_aprovar_proc.Enabled    := (pgctrl_account.ActivePage = ts_lista);
  mi_aprov_proc.Enabled       := (pgctrl_account.ActivePage = ts_lista);
  btn_bloc_proc.Enabled       := (pgctrl_account.ActivePage = ts_lista);
  mi_bloc_proc.Enabled        := (pgctrl_account.ActivePage = ts_lista);
  btn_emissao_fat.Enabled     := (pgctrl_account.ActivePage = ts_dados);
  mi_emissao_fat.Enabled      := (pgctrl_account.ActivePage = ts_dados);
  btn_remessa.Enabled         := (pgctrl_account.ActivePage = ts_lista);
  mi_remessa.Enabled          := (pgctrl_account.ActivePage = ts_lista);
  edt_chave2.Enabled          := (pgctrl_account.ActivePage = ts_lista_master);
  cb_ordem2.Enabled           := (pgctrl_account.ActivePage = ts_lista_master);
//  dbnavg2.Enabled             := (pgctrl_account.ActivePage = ts_lista_master);
  btn_verif_acc2.Enabled      := (pgctrl_account.ActivePage = ts_dados_master);
  mi_verif_acc2.Enabled       := (pgctrl_account.ActivePage = ts_dados_master);
  btn_aprovar_proc2.Enabled   := (pgctrl_account.ActivePage = ts_lista_master);
  mi_aprov_proc2.Enabled      := (pgctrl_account.ActivePage = ts_lista_master);
  btn_bloc_proc2.Enabled      := (pgctrl_account.ActivePage = ts_lista_master);
  mi_bloc_proc2.Enabled       := (pgctrl_account.ActivePage = ts_lista_master);
  btn_emissao_fat2.Enabled    := (pgctrl_account.ActivePage = ts_dados_master);
  mi_emissao_fat2.Enabled     := (pgctrl_account.ActivePage = ts_dados_master);
  btn_remessa2.Enabled        := (pgctrl_account.ActivePage = ts_lista_master);
  mi_remessa2.Enabled         := (pgctrl_account.ActivePage = ts_lista_master);
  btn_retorna_acc.Enabled     := (pgctrl_account.ActivePage = ts_lista_master) and (rb_todos.Checked);
  Mi_retorna_acc.Enabled      := (pgctrl_account.ActivePage = ts_lista_master) and (rb_todos.Checked);
  if pgctrl_account.ActivePage = ts_dados then
  begin
    datm_account.qry_fatura_ag_.Close;
    datm_account.qry_fatura_ag_.ParamByName('NR_PROCESSO').Asstring:=datm_account.qry_processo_NR_PROCESSO.AsString;
    datm_account.qry_fatura_ag_.Prepare;
    datm_account.qry_fatura_ag_.Open;
  end;
  if pgctrl_account.ActivePage = ts_dados_master then
  begin
    datm_account.qry_master_fatura_ag_.Close;
    datm_account.qry_master_fatura_ag_.ParamByName('CD_MASTER').Asstring:=datm_account.qry_master_CD_MASTER.AsString;
    datm_account.qry_master_fatura_ag_.Prepare;
    datm_account.qry_master_fatura_ag_.Open;
  end;
  if pgctrl_account.ActivePage = ts_processos then
  begin
    datm_account.qry_processo_.Close;
    datm_account.qry_processo_.ParamByName('CD_PRODUTO').AsString  := datm_account.qry_master_CD_PRODUTO.AsString;
    datm_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString := datm_account.qry_master_CD_UNID_NEG.AsString;
    datm_account.qry_processo_.ParamByName('CD_MASTER').AsString   := datm_account.qry_master_CD_MASTER.AsString;
    datm_account.qry_processo_.Prepare;
    datm_account.qry_processo_.Open;
  end;
end;

procedure Tfrm_account.btn_verif_accClick(Sender: TObject);
var vl_tarifa :Real;
    ACCOUNT   :Tquery;
begin
  if dbedt_nr_processo.text = '' then
    exit;
  if datm_account.qry_processo_IN_ACCOUNT.AsString = '6' then
  begin
    BoxMensagem( 'Este Processo está no Liberador. Verificação não permitida!', 2 );
    exit;
  end;
  ACCOUNT:= Tquery.Create(Application);
  ACCOUNT.DataBaseName := 'DBBROKER';
  ACCOUNT.Sql.Add(' SELECT (((ISNULL(SUM(VL_DEB_AGENTE),0) + ISNULL(SUM(VL_CRE_BRASIL),0)) - (ISNULL(SUM(VL_CRE_AGENTE),0)+ ISNULL(SUM(VL_DEB_BRASIL),0)))');
  ACCOUNT.Sql.Add(' + ISNULL(SUM( VL_AJUSTE),0)) AS TOTAL    FROM TPROCESSO_FATURA_AG ');
  ACCOUNT.Sql.Add(' WHERE NR_PROCESSO = "'+datm_account.qry_processo_NR_PROCESSO.AsString+'"');
  ACCOUNT.Open;
  vl_tarifa := ACCOUNT.Fields[0].AsFloat;
  ACCOUNT.Free;
  if ABS(ABS(datm_account.qry_processo_VL_ACCOUNT.AsFloat) - ABS(vl_tarifa)) < 0.009  then
  begin
    if not(datm_account.qry_processo_.State in [dsEdit]) then datm_account.qry_processo_.Edit;
    datm_account.qry_processo_IN_ACCOUNT.AsString := '4';//aprovado
  end
  else
  begin
    if not(datm_account.qry_processo_.State in [dsEdit]) then
      datm_account.qry_processo_.Edit;
    datm_account.qry_processo_IN_ACCOUNT.AsString := '3';//OutStanding
  end;
  try
    if not datm_main.db_broker.InTransaction then
      datm_main.db_broker.StartTransaction;
    datm_account.qry_processo_.Post;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  if datm_account.qry_processo_IN_ACCOUNT.AsString = '4' then
    boxmensagem('Processo Aprovado!',3);
  if datm_account.qry_processo_IN_ACCOUNT.AsString = '3' then
    boxmensagem('Processo em OutStading!',3);
end;

procedure Tfrm_account.btn_aprovar_procClick(Sender: TObject);
var REMESSA   :TQuery;
    in_fatura :String[1];
begin
  if (datm_account.qry_processo_IN_ACCOUNT.AsString <> '4') then
  begin
    Boxmensagem('Processo não esta Aprovado!',2);
    Exit;
  end;
  if datm_account.qry_processo_IN_ACCOUNT.AsString = '6' then
  begin
    BoxMensagem( 'Este Processo já está no Liberador!', 2 );
    exit;
  end;
  if not(datm_account.qry_processo_.State in[dsEdit]) then
    datm_account.qry_processo_.Edit;
  try
    if not datm_main.db_broker.InTransaction then
      datm_main.db_broker.StartTransaction;
    if (datm_account.qry_processo_calc_recebido.AsString = 'Não Recebido') then
    begin
     datm_account.qry_processo_IN_ACCOUNT.AsString:='6';
    end
    else
    begin
      datm_account.qry_processo_IN_SELECIONADO.AsString:='0';
      datm_account.qry_processo_IN_ACCOUNT.AsString:='5';
      if datm_account.qry_processo_VL_ACCOUNT.AsFloat > 0  then
        in_fatura := '3'
      else in_fatura := '4';
      REMESSA:= Tquery.Create(Application);
      REMESSA.DatabaseName:= 'DBBROKER';
      REMESSA.Sql.Add(' UPDATE TPROCESSO_FATURA_AG SET IN_FATURA = "'+in_fatura+'" , ');
      REMESSA.Sql.Add(' CD_VIA_TRANSP = "'+datm_account.qry_processo_CD_VIA_TRANSPORTE.AsString+'",');
      REMESSA.Sql.Add(' CD_MOEDA = "'+datm_account.qry_processo_CD_MOEDA_FRETE.AsString+'", ');
      REMESSA.Sql.Add(' CD_CLIENTE = "'+datm_account.qry_processo_CD_CLIENTE.AsString+'", ');
      REMESSA.Sql.Add(' CD_AGENTE = "'+datm_account.qry_processo_CD_AGENTE.AsString+'"');
      REMESSA.Sql.Add(' WHERE NR_PROCESSO = "'+datm_account.qry_processo_NR_PROCESSO.AsString+'"');
      REMESSA.ExecSql;
      REMESSA.Free;
    end;
    datm_account.qry_processo_.Post;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      exit;
    end;
  end;
  if datm_account.qry_processo_IN_ACCOUNT.AsString = '5' then
  begin
    datm_account.qry_processo_.Close;
    datm_account.qry_processo_.ParamByName('CD_PRODUTO').AsString  := msk_prod_pesq.text;
    datm_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString := msk_unid_pesq.text;
    datm_account.qry_processo_.Prepare;
    datm_account.qry_processo_.Open;
    Boxmensagem('Account Finalizado!',3)
  end
  else
    Boxmensagem('Processo Enviado para Liberador!',3);
end;

procedure Tfrm_account.edt_chaveChange(Sender: TObject);
begin
  if cb_ordem.ItemIndex = 2 then
    Localiza (datm_account.qry_processo_, msk_unid_pesq.text + msk_prod_pesq.text + edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
  else
    Localiza (datm_account.qry_processo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_account.cb_ordemChange(Sender: TObject);
begin
  edt_chave.Text := '';
  datm_account.qry_processo_.Close;
  if cb_ordem.ItemIndex = 0 then
    datm_account.qry_processo_.SQL[18] := 'TH.'+a_str_indices[cb_ordem.ItemIndex];
  if cb_ordem.ItemIndex = 1 then
    datm_account.qry_processo_.SQL[18] := 'TH.'+a_str_indices[cb_ordem.ItemIndex];
  if cb_ordem.ItemIndex = 2 then
    datm_account.qry_processo_.SQL[18] := 'TP.'+a_str_indices[cb_ordem.ItemIndex];
  if cb_ordem.ItemIndex = 3 then
    datm_account.qry_processo_.SQL[18] := a_str_indices[cb_ordem.ItemIndex];
  if cb_ordem.ItemIndex = 4 then
    datm_account.qry_processo_.SQL[18] := a_str_indices[cb_ordem.ItemIndex];
  datm_account.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
  datm_account.qry_processo_.ParamByName('CD_PRODUTO').AsString:=msk_prod_pesq.text;
  datm_account.qry_processo_.Prepare;
  datm_account.qry_processo_.Open;
  edt_chave.SetFocus;
end;

procedure Tfrm_account.btn_emissao_fatClick(Sender: TObject);
begin
  vstr_cd_modulo := '33';
  str_cd_rotina := '3302';
  Application.CreateForm(Tfrm_emissao_fatura, frm_emissao_fatura);
  with frm_emissao_fatura Do
  begin
    str_cd_chave:=datm_account.qry_processo_NR_PROCESSO.AsString;
    frm_emissao_fatura.tp_emissao := 0;
    ShowModal;
  end;
  vstr_cd_modulo := '31';
  str_cd_rotina := '3101';
  datm_account.qry_fatura_ag_.Close;
  datm_account.qry_fatura_ag_.ParamByName('NR_PROCESSO').Asstring:=datm_account.qry_processo_NR_PROCESSO.AsString;
  datm_account.qry_fatura_ag_.Prepare;
  datm_account.qry_fatura_ag_.Open;
end;

procedure Tfrm_account.btn_remessaClick(Sender: TObject);
begin
  vstr_cd_modulo := '33';
  str_cd_rotina := '3303';
  Application.CreateForm( Tfrm_gerar_remessa, frm_gerar_remessa );
  frm_gerar_remessa.ShowModal;
  vstr_cd_modulo := '31';
  str_cd_rotina := '3101';
end;

procedure Tfrm_account.btn_incluirClick(Sender: TObject);
begin
  if datm_account.qry_processo_IN_ACCOUNT.AsString = '6' then
  begin
    BoxMensagem( 'Este Processo está no Liberador. Inclusão não permitida!', 2 );
    exit;
  end;
  if datm_account.qry_processo_IN_ACCOUNT.AsString = '8' then
  begin
    BoxMensagem( 'A Fatura deve ser incluida pelo Master!', 2 );
    exit;
  end;
  with datm_account do
  begin
    qry_fatura_ag_.Open;
    qry_fatura_ag_.DisableControls;
    qry_fatura_ag_.Cancel;
    qry_fatura_ag_.Insert;
    qry_fatura_ag_.EnableControls;
    qry_fatura_ag_TP_FATURA.AsString := '0';
    valores_fatura(qry_fatura_ag_TP_FATURA.AsString);
  end;
  pgctrl_account.ActivePage := ts_dados;
  if dbedt_nr_fatura.CanFocus then
    dbedt_nr_fatura.Setfocus;
  btn_mi(false, True, True, false);
//  btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_account.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;  // mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;  // mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
  btn_incluir2.Enabled  := Inc;  // mi_incluir.Enabled   := Inc;
  btn_excluir2.Enabled  := Exc;  // mi_excluir.Enabled   := Exc;
  btn_salvar2.Enabled   := Salv;  mi_salvar2.Enabled    := Salv;
  btn_Cancelar2.Enabled := Canc;  mi_Cancelar2.Enabled  := Canc;
end;

procedure Tfrm_account.valores_fatura(tp_fat: String);
begin
  datm_account.ds_fatura_ag.AutoEdit     := ((tp_fat = '0') or (tp_fat = '1')) and (st_modificar);
  datm_account.ds_master_fat_ag.AutoEdit := ((tp_fat = '0') or (tp_fat = '1')) and (st_modificar);
  dbedt_ajuste.Visible         := (tp_fat = '4');
  dbedt_ajuste_master.Visible  := (tp_fat = '4');
  dbedt_ajuste_proc.Visible    := (tp_fat = '4');
  dbedt_cre_agente.Visible     := (tp_fat = '0');
  dbedt_cre_ag_master.Visible  := (tp_fat = '0');
  dbedt_cre_ag_proc.Visible    := (tp_fat = '0');
  dbedt_deb_agente.Visible     := (tp_fat = '1');
  dbedt_deb_ag_master.Visible  := (tp_fat = '1');
  dbedt_deb_ag_proc.Visible    := (tp_fat = '1');
  dbedt_cre_brasil.Visible     := (tp_fat = '2');
  dbedt_cre_br_proc.Visible    := (tp_fat = '2');
  dbedt_cre_br_master.Visible  := (tp_fat = '2');
  dbedt_deb_brasil.Visible     := (tp_fat = '3');
  dbedt_deb_br_proc.Visible    := (tp_fat = '3');
  dbedt_deb_br_master.Visible  := (tp_fat = '3');
  dbedt_dt_fatura.Color        := clWindow;
  dbedt_nr_fatura.Color        := clWindow;
  dbedt_dt_fat_master.Color    := clWindow;
  dbedt_nr_fat_master.Color    := clWindow;
  if tp_fat = '2' then
  begin
    dbedt_dt_fatura.Color      := clMenu;
    dbedt_nr_fatura.Color      := clMenu;
    dbedt_dt_fat_master.Color  := clMenu;
    dbedt_nr_fat_master.Color  := clMenu;
  end
  else
  if tp_fat = '3' then
  begin
    dbedt_dt_fatura.Color     := clMenu;
    dbedt_nr_fatura.Color     := clMenu;
    dbedt_dt_fat_master.Color := clMenu;
    dbedt_nr_fat_master.Color := clMenu;
  end;
  if datm_account.qry_processo_IN_ACCOUNT.AsString = '8' then
    datm_account.ds_fatura_ag.AutoEdit := false;
end;

procedure Tfrm_account.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then Exit;
  if not Grava then Exit;
end;

procedure Tfrm_account.dbrgp_tp_faturaChange(Sender: TObject);
begin
  dbedt_nr_faturaChange(nil);
  valores_fatura(dbrgp_tp_fatura.Value);
end;

procedure Tfrm_account.dbedt_nr_faturaChange(Sender: TObject);
begin
  if datm_account.qry_fatura_ag_.State in [dsEdit, dsInsert] then
    btn_mi(false, True, True, false);
//    btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_account.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_account.btn_excluirClick(Sender: TObject);
var MASTER :Tquery;
begin
  if pgctrl_account.ActivePage = ts_dados then
  begin
    if datm_account.qry_fatura_ag_.recordcount = 0 then
    begin
      BoxMensagem( 'Não existe Fatura para ser excluído!', 2 );
      exit;
    end;
    if strtoint(datm_account.qry_fatura_ag_TP_FATURA.AsString) in [2,3] then
    begin
      BoxMensagem( 'Esta Fatura já foi impressa. Exclusão não permitida!', 2 );
      exit;
    end;
    if datm_account.qry_processo_IN_ACCOUNT.AsString = '6' then
    begin
      BoxMensagem( 'Este Processo está no Liberador. Exclusão não permitida!', 2 );
      exit;
    end;
    if datm_account.qry_processo_IN_ACCOUNT.AsString = '8' then
    begin
      BoxMensagem( 'A Fatura deve ser incluida pelo Master!', 2 );
      exit;
    end;
    if BoxMensagem( 'Este Fatura será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      datm_account.qry_fatura_ag_.Delete;
      if datm_account.qry_processo_IN_ACCOUNT.AsString = '4' THEN
      begin
        if not(datm_account.qry_processo_.State in [dsEdit]) then
          datm_account.qry_processo_.Edit;
        datm_account.qry_processo_IN_ACCOUNT.AsString := '1';
        datm_account.qry_processo_.Post;
      end;
      if datm_account.qry_fatura_ag_.IsEmpty then
      begin
        MASTER := Tquery.Create(Application);
        MASTER.DataBasename:= 'DBBROKER';
        MASTER.Sql.Add('UPDATE TMASTER SET IN_ACCOUNT = "1" WHERE CD_MASTER = "'+datm_account.qry_processo_CD_MASTER.AsString+'"');
        MASTER.Sql.Add(' AND IN_ACCOUNT IN("2") ');
        MASTER.ExecSql;
        MASTER.Free;
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_account.qry_fatura_ag_.Cancel;
        datm_account.qry_processo_.cancel;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_account.FormShow(Sender: TObject);
begin
  Shape1.Brush.Color := clPnlClaroBroker;
  Shape2.Brush.Color := clPnlClaroBroker;
  pnl_master.Color   := clMenuBroker;
  pnl_house.Color    := clMenuBroker;

  if in_master then
  begin
    pnl_master.BringToFront;
    pnl_master.Align := alTop;
//    pnl_house.SendToBack;
    pnl_house.Visible := False;
    ts_lista.TabVisible        := false;
    ts_dados.TabVisible        := false;
    ts_lista_master.TabVisible := true;
    ts_dados_master.TabVisible := true;
    ts_processos.TabVisible    := true;
    a_str_indices[0] := 'CD_MASTER';
    a_str_indices[1] := 'NR_MASTER';
    a_str_indices[2] := 'CD_AGENTE';
    a_str_indices[3] := 'NM_AGENTE';
    With cb_ordem2 do
    begin
      Clear;
      Items.Add('Registro');
      Items.Add('Master');
      Items.Add('Cód.Agente');
      Items.Add('Agente');
      ItemIndex := 0;
    end;
    with datm_account do
    begin
      qry_master_.Close;
      qry_master_.ParamByName('CD_PRODUTO').AsString:= qry_traz_default_CD_PRODUTO.AsString;
      qry_master_.ParamByName('CD_UNID_NEG').AsString:=qry_traz_default_CD_UNID_NEG.AsString;
      qry_master_.Prepare;
      qry_master_.Open;
      qry_processo_.Sql[14] :=  'AND TH.CD_MASTER = :CD_MASTER '
    end;
  end
  else
  begin
    pnl_house.BringToFront;
    pnl_house.Align := alTop;
//    pnl_master.SendToBack;
    pnl_master.Visible := False;
    ts_lista.TabVisible        := true;
    ts_dados.TabVisible        := true;
    ts_lista_master.TabVisible := false;
    ts_dados_master.TabVisible := false;
    ts_processos.TabVisible    := false;
    with datm_account do
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('CD_PRODUTO').AsString:= qry_traz_default_CD_PRODUTO.AsString;
      qry_processo_.ParamByName('CD_UNID_NEG').AsString:=qry_traz_default_CD_UNID_NEG.AsString;
      qry_processo_.Prepare;
      qry_processo_.Open;
    end;
  end;
end;

procedure Tfrm_account.msk_unid_masterExit(Sender: TObject);
begin
{  if msk_unid_master.Text <> '' then
  begin
    ValCodEdt( msk_unid_master );
    datm_account.qry_pesquisa_.Active:=false;
    datm_account.qry_pesquisa_.Sql.Clear;
    datm_account.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_master.Text+'"');
    datm_account.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_account.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_account.qry_pesquisa_.Active:=true;
    if datm_account.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_unid_master.text:= datm_account.qry_pesquisa_.Fields[0].AsString;
      datm_account.qry_pesquisa_.Close;
      datm_account.qry_master_.Close;
      datm_account.qry_master_.ParamByName('CD_PRODUTO').AsString  := msk_prod_master.text;
      datm_account.qry_master_.ParamByName('CD_UNID_NEG').AsString := msk_unid_master.text;
      datm_account.qry_master_.Prepare;
      datm_account.qry_master_.Open;
    end
    else
    begin
      datm_account.qry_pesquisa_.Close;
      edt_nm_unid_master.Text := '';
      BoxMensagem('Código da Unidade de Negócio inválido!', 2);
      msk_unid_master.SetFocus;
      Exit;
    end;
  end
  else
  begin
    Boxmensagem('A Unidade de Negócio deve ser informado!',2);
    msk_unid_master.SetFocus;
  end; }

  if msk_unid_master.Text <> '' then begin
    msk_unid_master.Text := Copy('00', 1, 2 - Length( msk_unid_master.Text)) +  msk_unid_master.Text;
    edt_nm_unid_master.text := ConsultaLookUpSQL('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_master.Text+'" ' +
                                               ' AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG FROM TUSUARIO_HABILITACAO ' +
                                               '                     WHERE CD_USUARIO ="'+str_cd_usuario+'") ', 'NM_UNID_NEG');

    if edt_nm_unid_master.text = '' then begin
      edt_nm_unid_master.Text := '';
      ShowMessage('Código da Unidade de Negócio inválido!');
      msk_unid_master.SetFocus;
      Exit;
    end else begin
      datm_account.qry_master_.Close;
      datm_account.qry_master_.ParamByName('CD_PRODUTO').AsString:= msk_prod_master.text;
      datm_account.qry_master_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_master.text;
      datm_account.qry_master_.Prepare;
      datm_account.qry_master_.Open;
    end;
  end else begin
    ShowMessage('A Unidade de Negócio deve ser informado!');
    msk_unid_master.SetFocus;
  end;

end;

procedure Tfrm_account.msk_prod_masterExit(Sender: TObject);
begin
{  if msk_prod_master.Text <> '' then
  begin
    ValCodEdt( msk_prod_master );
    datm_account.qry_pesquisa_.Active:=false;
    datm_account.qry_pesquisa_.Sql.Clear;
    datm_account.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_prod_master.Text+'"');
    datm_account.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_account.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_account.qry_pesquisa_.Active:=true;
    if datm_account.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_prod_master.text:= datm_account.qry_pesquisa_.Fields[0].AsString;
      datm_account.qry_pesquisa_.Close;
      datm_account.qry_master_.Close;
      datm_account.qry_master_.ParamByName('CD_PRODUTO').AsString  := msk_prod_master.text;
      datm_account.qry_master_.ParamByName('CD_UNID_NEG').AsString := msk_unid_master.text;
      datm_account.qry_master_.Prepare;
      datm_account.qry_master_.Open;
    end
    else
    begin
      datm_account.qry_pesquisa_.Close;
      edt_nm_prod_master.Text := '';
      BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
      msk_prod_master.SetFocus;
      Exit;
    end;
  end
  else
  begin
    Boxmensagem('O Produto deve ser informado!',2);
    msk_prod_master.SetFocus;
  end; }

  if msk_prod_master.Text <> '' then begin
    msk_prod_master.Text := Copy('00', 1, 2 - Length( msk_prod_master.Text)) +  msk_prod_master.Text;
    edt_nm_prod_master.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_prod_master.Text+'" ' +
                                               ' AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO ' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'") ' , 'NM_PRODUTO');

    if edt_nm_prod_master.text = '' then begin
      edt_nm_prod_master.Text := '';
      ShowMessage('Código do Produto inválido ou não habilidado!');
      msk_prod_master.SetFocus;
      Exit;
    end else begin
      datm_account.qry_master_.Close;
      datm_account.qry_master_.ParamByName('CD_PRODUTO').AsString:= msk_prod_master.text;
      datm_account.qry_master_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_master.text;
      datm_account.qry_master_.Prepare;
      datm_account.qry_master_.Open;
    end;
  end else begin
    ShowMessage('O Produto deve ser informado!');
    msk_prod_master.SetFocus;
  end;

end;

procedure Tfrm_account.btn_co_unid_masterClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    msk_unid_master.text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG', nil, 1, msk_unid_master.text);
    msk_unid_masterExit(Sender);
  end else
    edt_nm_unid_master.text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_unid_master.text, 'NM_UNID_NEG' );


{  Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',msk_unid_pesq, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );
  msk_unid_masterExit(Sender); }
end;

procedure Tfrm_account.btn_co_prod_masterClick(Sender: TObject);
var produto :String;
begin
  if Sender is TSpeedButton then begin
    msk_prod_master.text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO', nil, 1, msk_prod_master.text);
    msk_prod_masterExit(Sender);
  end else
    edt_nm_prod_master.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_prod_master.Text+'" ' +
                                               'AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'")' , 'NM_PRODUTO');


  {produto := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO');
  if produto <> '' then
  begin
    msk_prod_master.text:=produto;
    msk_prod_masterExit(Sender);
  end; }
end;

procedure Tfrm_account.btn_incluir2Click(Sender: TObject);
begin
  if datm_account.qry_master_IN_ACCOUNT.AsString = '2' then
  begin
    BoxMensagem( 'Master esta na Remessa!', 2 );
    exit;
  end;
  with datm_account do
  begin
    qry_master_fatura_ag_.Open;
    qry_master_fatura_ag_.DisableControls;
    qry_master_fatura_ag_.Cancel;
    qry_master_fatura_ag_.Insert;
    qry_master_fatura_ag_.EnableControls;
    qry_master_fatura_ag_TP_FATURA.AsString := '0';
    valores_fatura(qry_master_fatura_ag_TP_FATURA.AsString);
  end;
  if dbedt_nr_fat_master.CanFocus then
    dbedt_nr_fat_master.Setfocus;
  btn_mi(false, True, True, false);
//  btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_account.pgctrl_procChange(Sender: TObject);
begin
  if pgctrl_proc.ActivePage = ts_dados_proc then
  begin
    datm_account.qry_fatura_ag_.Close;
    datm_account.qry_fatura_ag_.ParamByName('NR_PROCESSO').Asstring := datm_account.qry_processo_NR_PROCESSO.AsString;
    datm_account.qry_fatura_ag_.Prepare;
    datm_account.qry_fatura_ag_.Open;
  end;
end;

procedure Tfrm_account.btn_excluir2Click(Sender: TObject);
var MASTER :Tquery;
begin
  if datm_account.qry_master_IN_ACCOUNT.AsString = '2' then
  begin
    BoxMensagem( 'Master esta na Remessa!', 2 );
    exit;
  end;
  if BoxMensagem( 'Este Fatura será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_account.qry_master_fatura_ag_.Delete;
    if datm_account.qry_master_fatura_ag_.IsEmpty then
    begin
      MASTER := Tquery.Create(Application);
      MASTER.DataBasename := 'DBBROKER';
      MASTER.Sql.Add('UPDATE TPROCESSO SET IN_ACCOUNT = "1" ');
      MASTER.Sql.Add('WHERE NR_PROCESSO IN(SELECT H.NR_PROCESSO FROM THOUSE H ');
      MASTER.Sql.Add('WHERE H.CD_MASTER = "'+datm_account.qry_master_CD_MASTER.AsString+'" )');
      MASTER.ExecSql;
      MASTER.Free;
    end;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      datm_account.qry_fatura_ag_.Cancel;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_account.dbrdgp_tp_fat_masterChange(Sender: TObject);
begin
  dbedt_nr_faturaChange(nil);
  valores_fatura(dbrdgp_tp_fat_master.Value);
end;

procedure Tfrm_account.dbedt_nr_fat_masterChange(Sender: TObject);
begin
  if datm_account.qry_master_fatura_ag_.State in [dsEdit,dsinsert] then
    btn_mi(false, True, True, false);
//    btn_mi(false, st_modificar, st_modificar, false);
end;
                                                                                            
procedure Tfrm_account.btn_verif_acc2Click(Sender: TObject);
var vl_tarifa :real;
    ACCOUNT   :Tquery;
begin
  if edt_nr_master.text = '' then
    exit;
  if datm_account.qry_master_IN_ACCOUNT.AsString = '6' then
  begin
    BoxMensagem( 'Os Processos desse Master estão no Liberador. Verificação não permitida!', 2 );
    exit;
  end;
  if datm_account.qry_master_IN_ACCOUNT.AsString = '2' then
  begin
    BoxMensagem( 'Master esta na Remessa!', 2 );
    exit;
  end;
  ACCOUNT := Tquery.Create(Application);
  ACCOUNT.DataBaseName := 'DBBROKER';
  ACCOUNT.Sql.Add(' SELECT (((ISNULL(SUM(VL_DEB_AGENTE),0) + ISNULL(SUM(VL_CRE_BRASIL),0)) - (ISNULL(SUM(VL_CRE_AGENTE),0)+ ISNULL(SUM(VL_DEB_BRASIL),0)))');
  ACCOUNT.Sql.Add(' + ISNULL(SUM( VL_AJUSTE),0)) AS TOTAL    FROM TMASTER_FATURA_AG ');
  ACCOUNT.Sql.Add(' WHERE CD_MASTER = "'+datm_account.qry_master_CD_MASTER.AsString+'"');
  ACCOUNT.Sql.Add(' AND IN_FATURA = "0" ');
  ACCOUNT.Open;
  vl_tarifa := ACCOUNT.Fields[0].AsFloat;
  ACCOUNT.Free;
  if ABS(ABS(datm_account.qry_master_VL_ACCOUNT.AsFloat) - ABS(vl_tarifa)) < 0.009  then
  begin
    if not(datm_account.qry_master_.State in [dsEdit]) then
      datm_account.qry_master_.Edit;
      datm_account.qry_master_IN_ACCOUNT.AsString := '4';//aprovado
  end
  else
  begin
    if not(datm_account.qry_master_.State in [dsEdit]) then
      datm_account.qry_master_.Edit;
    datm_account.qry_master_IN_ACCOUNT.AsString := '3';//OutStanding
  end;
  if ((datm_account.qry_master_VL_ACCOUNT.AsFloat > 0) and (vl_tarifa < 0)) or ((datm_account.qry_master_VL_ACCOUNT.AsFloat > 0) and (vl_tarifa < 0)) then
  begin
    if not(datm_account.qry_master_.State in [dsEdit]) then
      datm_account.qry_master_.Edit;
    datm_account.qry_master_IN_ACCOUNT.AsString := '3';//OutStanding
  end;
  try
    if not datm_main.db_broker.InTransaction then
      datm_main.db_broker.StartTransaction;
    datm_account.qry_master_.Post;
    with datm_account do
    begin
      CloseStoredProc( sp_calculo_fatura_master );
      sp_calculo_fatura_master.ParamByName('@CD_MASTER').AsString     := qry_master_CD_MASTER.AsString;
      sp_calculo_fatura_master.ParamByName('@cd_via_transp').AsString := qry_master_CD_VIA_TRANSP.AsString;
      sp_calculo_fatura_master.ParamByName('@vl_acc_master').AsFloat  := qry_master_VL_ACCOUNT.AsFloat;
      sp_calculo_fatura_master.ParamByName('@in_account').AsString    := qry_master_IN_ACCOUNT.AsString;
      ExecStoredProc(sp_calculo_fatura_master);
      CloseStoredProc( sp_calculo_fatura_master );
    end;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      datm_account.qry_master_.cancel;
      TrataErro(E);
    end;
  end;
  if datm_account.qry_master_IN_ACCOUNT.AsString = '4' then
    boxmensagem('Master Aprovado!',3);
  if datm_account.qry_master_IN_ACCOUNT.AsString = '3' then
    boxmensagem('Master em OutStading!',3);
end;

procedure Tfrm_account.btn_aprovar_proc2Click(Sender: TObject);
var Qtde  :Integer;
   Tarifa :TQuery;
   Data   :String;
begin

  if datm_account.qry_master_IN_ACCOUNT.AsString = '2' then
  begin
    BoxMensagem( 'Master esta na Remessa!', 2 );
    exit;
  end;
  if (datm_account.qry_master_IN_ACCOUNT.AsString  <> '4') then
  begin
    Boxmensagem('Master não esta Aprovado!',2);
    Exit;
  end;
  Tarifa := Tquery.Create(application);
  Tarifa.DataBaseName := 'DBBROKER';   //TARIFA PARA EXP AEREA
  if (datm_account.qry_master_TP_PRODUTO.AsString = '02') and (datm_account.qry_master_CD_VIA_TRANSP.AsString = '04')then
  begin
    Tarifa.Sql.Add('SELECT COUNT(*) FROM TTAXA_IATA WHERE CD_MOEDA = "'+datm_account.qry_master_CD_MOEDA.AsString+'"');
    Tarifa.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datetimetostr(datm_account.qry_master_DT_EMISSAO_DTA.AsDatetime)+'",103)  ')
  end
  else
  begin
    if (datm_account.qry_master_TP_PRODUTO.AsString = '02')then
      Data := datm_account.qry_master_DT_EMBARQUE.AsString  //DATA PARA EXP MARITIMA
    else
      Data := datm_account.qry_master_DT_CHEGADA.AsString;//DATA PARA IMP AEREA E MARITIMA
    Tarifa.Sql.Add('SELECT COUNT(*) FROM TTAXA_FRETE WHERE CD_MOEDA = "'+datm_account.qry_master_CD_MOEDA.AsString+'"');
    Tarifa.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+Data+'",103)  ')
  end;
  Tarifa.Open;
  if Tarifa.Fields[0].AsInteger = 0 then
  begin
    BoxMensagem('Não existe Tarifa para a Moeda',2);
    Tarifa.Free;
    Exit;
  end;
  Tarifa.Free;
  if not(datm_account.qry_master_.State in[dsEdit]) then
    datm_account.qry_master_.Edit;
  try
    if not datm_main.db_broker.InTransaction then
      datm_main.db_broker.StartTransaction;
    datm_account.qry_master_IN_ACCOUNT.AsString:='2';
    with datm_account do
    begin
      CloseStoredProc( sp_aprova_fat_master );
      sp_aprova_fat_master.ParamByName('@CD_MASTER').AsString     := qry_master_CD_MASTER.AsString;
      sp_aprova_fat_master.ParamByName('@cd_via_transp').AsString := qry_master_CD_VIA_TRANSP.AsString;
      sp_aprova_fat_master.ParamByName('@cd_moeda').AsString      := qry_master_CD_MOEDA.AsString;
      sp_aprova_fat_master.ParamByName('@cd_agente').AsString     := qry_master_CD_AGENTE.AsString;
      sp_aprova_fat_master.ParamByName('@Qtde_proc').AsInteger    := 0;
      ExecStoredProc(sp_aprova_fat_master);
      Qtde := sp_aprova_fat_master.ParamByName('@Qtde_proc').AsInteger;
      CloseStoredProc( sp_aprova_fat_master );
      qry_master_.Post;
      if in_integracao_contabil = '1' then
      begin
        CloseStoredProc( sp_contabiliza_fat );
        sp_contabiliza_fat.ParamByName('@CD_MASTER').AsString       := qry_master_CD_MASTER.AsString;
        sp_contabiliza_fat.ParamByName('@dt_aprovacao').AsDateTime  := dt_server;
        sp_contabiliza_fat.ParamByName('@nr_docto').AsString        := '';
        ExecStoredProc(sp_contabiliza_fat);
        CloseStoredProc( sp_contabiliza_fat );
      end;
    end;
    datm_main.db_broker.Commit;
    if qtde > 0 then
    begin
      Boxmensagem('Existe '+inttostr(Qtde)+' Processo(s) desse Master que esta(m) no Liberador por falta de Recebimento!',2);
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      TrataErro(E);
      exit;
    end;
  end;
  if datm_account.qry_master_IN_ACCOUNT.AsString='2' then
  begin
    datm_account.qry_master_.Close;
    datm_account.qry_master_.ParamByName('CD_PRODUTO').AsString  := msk_unid_master.text;
    datm_account.qry_master_.ParamByName('CD_UNID_NEG').AsString :=msk_prod_master.text;
    datm_account.qry_master_.Prepare;
    datm_account.qry_master_.Open;
    Boxmensagem('Fatura Internacional Aprovada!',3)
  end;
end;

procedure Tfrm_account.btn_emissao_fat2Click(Sender: TObject);
begin
  vstr_cd_modulo := '33';
  str_cd_rotina := '3302';
  Application.CreateForm(Tfrm_emissao_fatura, frm_emissao_fatura);
  with frm_emissao_fatura Do
  begin
    str_cd_chave := datm_account.qry_master_CD_MASTER.AsString;
    frm_emissao_fatura.tp_emissao := 1;
    frm_emissao_fatura.msk_unid_master.Text:= frm_account.msk_unid_master.text;
    frm_emissao_fatura.msk_prod_master.Text:= frm_account.msk_prod_master.text;
    ShowModal;
  end;
  vstr_cd_modulo := '31';
  str_cd_rotina := '3108';
  datm_account.qry_master_fatura_ag_.Close;
  datm_account.qry_master_fatura_ag_.ParamByName('CD_MASTER').Asstring := datm_account.qry_master_CD_MASTER.AsString;
  datm_account.qry_master_fatura_ag_.Prepare;
  datm_account.qry_master_fatura_ag_.Open;
end;

procedure Tfrm_account.btn_bloc_proc2Click(Sender: TObject);
var master :String[20];
begin
  if datm_account.qry_master_IN_ACCOUNT.AsString = '2' then
  begin
    BoxMensagem( 'Master esta na Remessa!', 2 );
    exit;
  end;
  if not boxmensagem('Deseja retornar a Consolidada para o Operacional',1) then
    exit;
  with TQuery.Create(Application) do
  begin
    DataBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add('UPDATE TPROCESSO SET IN_ACCOUNT = "7" ');
    Sql.Add('WHERE NR_PROCESSO IN (SELECT H.NR_PROCESSO FROM THOUSE H WHERE H.CD_MASTER = "'+datm_account.qry_master_CD_MASTER.AsString+'") ');
    ExecSql;
    Free;
  end;
  if not(datm_account.qry_master_.State in [dsEdit])then
    datm_account.qry_master_.Edit;
  datm_account.qry_master_IN_ACCOUNT.AsString := '6';
  datm_account.qry_master_.Post;
  master := datm_account.qry_master_CD_MASTER.AsString;
  datm_account.qry_master_.Close;
  datm_account.qry_master_.ParamByName('CD_PRODUTO').AsString  := msk_prod_pesq.text;
  datm_account.qry_master_.ParamByName('CD_UNID_NEG').AsString := msk_unid_pesq.text;
  datm_account.qry_master_.Prepare;
  datm_account.qry_master_.Open;
  datm_account.qry_master_.Locate('CD_MASTER', master, [loCaseInsensitive]);
  Boxmensagem('Processos Consolidados sujeito a Liberação!',2);
end;

procedure Tfrm_account.rb_todosClick(Sender: TObject);
begin
  if rb_todos.Checked then
  begin
    datm_account.qry_master_.Close;
    datm_account.qry_master_.ParamByName('CD_PRODUTO').AsString  := msk_prod_master.text;
    datm_account.qry_master_.ParamByName('CD_UNID_NEG').AsString := msk_unid_master.text;
    datm_account.qry_master_.SQL[30] := '  AND M.IN_ACCOUNT IN ("1","2","3","4","5", "6")';
    datm_account.qry_master_.Prepare;
    datm_account.qry_master_.Open;
    datm_account.qry_processo_.SQL[12] :=' AND TP.IN_ACCOUNT in ("1","2","3","4","6","7","8")';
    btn_retorna_acc.Enabled := true;
    Mi_retorna_acc.Enabled  := true;
  end
  else
  begin
    datm_account.qry_master_.Close;
    datm_account.qry_master_.ParamByName('CD_PRODUTO').AsString  := msk_prod_master.text;
    datm_account.qry_master_.ParamByName('CD_UNID_NEG').AsString := msk_unid_master.text;
    datm_account.qry_master_.SQL[30] := '  AND M.IN_ACCOUNT IN ("1","3","4","5", "6")';
    datm_account.qry_master_.Prepare;
    datm_account.qry_master_.Open;
    datm_account.qry_processo_.SQL[12] :=' AND TP.IN_ACCOUNT in ("1","3","4","6","7","8")';
    btn_retorna_acc.Enabled := false;
    Mi_retorna_acc.Enabled  := false;
  end;
end;

procedure Tfrm_account.edt_chave2Change(Sender: TObject);
begin
  Localiza (datm_account.qry_master_, edt_chave2.Text, a_str_indices[cb_ordem2.ItemIndex] );
end;

procedure Tfrm_account.cb_ordem2Change(Sender: TObject);
begin
  edt_chave2.Text := '';
  datm_account.qry_master_.Close;
  datm_account.qry_master_.SQL[32] := a_str_indices[cb_ordem.ItemIndex];
  datm_account.qry_master_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_master.text;
  datm_account.qry_master_.ParamByName('CD_PRODUTO').AsString:=msk_prod_master.text;
  datm_account.qry_master_.Prepare;
  datm_account.qry_master_.Open;
  edt_chave2.SetFocus;
end;

procedure Tfrm_account.btn_retorna_accClick(Sender: TObject);
var
  pesquisa :String;
  RESTAURA :TQuery;
begin
  Pesquisa := datm_account.qry_master_CD_MASTER.AsString;
  RESTAURA := tQuery.Create(Application);
  RESTAURA.DataBaseName := 'DBBROKER';
  RESTAURA.Sql.Add(' SELECT COUNT(*) FROM TPROCESSO_FATURA_AG P, THOUSE H ');
  RESTAURA.Sql.Add(' WHERE H.CD_MASTER = '''+Pesquisa+''' AND H.NR_PROCESSO = P.NR_PROCESSO AND P.IN_FATURA = ''5''');
  RESTAURA.Open;
  if RESTAURA.Fields[0].AsInteger > 0 then
  begin
   BoxMensagem('Foi gerado uma Remessa. Restaurar Master não permitido!',2);
   RESTAURA.Free;
   Exit;
  end;
  RESTAURA.Sql.Clear;
  RESTAURA.Sql.Add('UPDATE TMASTER SET IN_ACCOUNT = "1" WHERE CD_MASTER = "'+Pesquisa+'"');
  RESTAURA.ExecSql;
  RESTAURA.Sql.Clear;
  RESTAURA.Sql.Add('UPDATE TPROCESSO SET IN_ACCOUNT = "1" FROM THOUSE H, TPROCESSO P  ');
  RESTAURA.Sql.Add(' WHERE H.CD_MASTER = "'+Pesquisa+'" AND H.NR_PROCESSO = P.NR_PROCESSO ');
  RESTAURA.ExecSql;
  RESTAURA.Sql.Free;
  rb_todosClick(nil);
  datm_account.qry_master_.Locate('CD_MASTER',pesquisa,[]);
end;

procedure Tfrm_account.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_account.Free;
  Action := caFree;
end;

procedure Tfrm_account.msk_prod_pesqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then begin
    if Sender = msk_prod_pesq   then btn_co_prod_pesqClick(btn_co_prod_pesq);
    if Sender = msk_unid_pesq   then btn_co_unid_pesqClick(btn_co_unid_pesq);
    if Sender = msk_prod_master then btn_co_prod_masterClick(btn_co_prod_master);
    if Sender = msk_unid_master then btn_co_unid_masterClick(btn_co_unid_master);
  end;
end;

procedure Tfrm_account.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

end.
