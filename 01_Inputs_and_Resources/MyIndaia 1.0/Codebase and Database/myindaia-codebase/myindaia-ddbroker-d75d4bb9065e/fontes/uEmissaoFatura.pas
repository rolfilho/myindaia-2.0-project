unit uEmissaoFatura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Mask, ComCtrls, StdCtrls, Buttons, ExtCtrls,DB, Menus, Grids,
  DBGrids, RxDBComb,DBTables, ppCtrls, ppBands, ppClass, ppPrnabl, ppCache,
  ppDB, ppDBPipe, ppDBBDE, ppEndUsr, ppComm, ppRelatv, ppProd, ppReport;

type
  Tfrm_emissao_fatura = class(TForm)
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    pgctrl_emissao_fat: TPageControl;
    ts_lista: TTabSheet;
    SpeedButton12: TSpeedButton;
    SpeedButton21: TSpeedButton;
    Label89: TLabel;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    btn_imprimir: TSpeedButton;
    dbnvg: TDBNavigator;
    mi_sair: TMenuItem;
    ts_dados_basicos: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Panel1: TPanel;
    Label31: TLabel;
    btn_co_unid: TSpeedButton;
    Label33: TLabel;
    btn_co_produto: TSpeedButton;
    msk_unid: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    Panel3: TPanel;
    dbrdgp_tp_fat: TDBRadioGroup;
    dbedt_nr_fatura: TDBEdit;
    Label10: TLabel;
    dbedt_dt_fatura: TDBEdit;
    Label11: TLabel;
    dbedt_vl_cre_br: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit14: TDBEdit;
    msk_unid2: TMaskEdit;
    edt_nm_unid_neg2: TEdit;
    msk_cd_produto2: TMaskEdit;
    edt_nm_produto2: TEdit;
    msk_processo: TMaskEdit;
    btn_co_processo: TSpeedButton;
    dbedt_vl_deb_br: TDBEdit;
    dbedt_vl_deb_ag: TDBEdit;
    dbedt_vl_cre_ag: TDBEdit;
    dbedt_vl_ajuste: TDBEdit;
    DBEdit1: TDBEdit;
    Label14: TLabel;
    DBEdit2: TDBEdit;
    Label15: TLabel;
    ts_lista_master: TTabSheet;
    ts_dados_master: TTabSheet;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    Label16: TLabel;
    btn_co_unid_master: TSpeedButton;
    Label17: TLabel;
    btn_co_prod_master: TSpeedButton;
    msk_unid_master: TMaskEdit;
    edt_nm_unid_master: TEdit;
    msk_prod_master: TMaskEdit;
    edt_nm_prod_master: TEdit;
    Panel5: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    btn_co_master: TSpeedButton;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    msk_unid_master2: TMaskEdit;
    edt_nm_unid_master2: TEdit;
    msk_prod_master2: TMaskEdit;
    edt_nm_prod_master2: TEdit;
    msk_nr_master: TMaskEdit;
    Panel6: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    dbedt_nr_fat_master: TDBEdit;
    dbedt_dt_fat_master: TDBEdit;
    dbedt_vl_cre_br_master: TDBEdit;
    dbedt_vl_deb_br_master: TDBEdit;
    dbedt_vl_deb_ag_master: TDBEdit;
    dbedt_vl_cre_ag_master: TDBEdit;
    dbedt_vl_ajuste_master: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    ts_reemissao: TTabSheet;
    Panel7: TPanel;
    Label32: TLabel;
    btn_co_unid_reemissao: TSpeedButton;
    Label34: TLabel;
    btn_co_prod_reemissao: TSpeedButton;
    msk_cd_unid_reemissao: TMaskEdit;
    edt_nm_unid_reemissao: TEdit;
    msk_cd_prod_reemissao: TMaskEdit;
    edt_nm_prod_reemissao: TEdit;
    DBGrid3: TDBGrid;
    DBMemo1: TDBMemo;
    Label35: TLabel;
    shp1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure msk_unidExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unidClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_ordemChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_emissao_fatChange(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_processoExit(Sender: TObject);
    procedure dbedt_nr_faturaChange(Sender: TObject);
    procedure abre_processo;
    procedure abre_master;
    procedure msk_unid_masterExit(Sender: TObject);
    procedure msk_prod_masterExit(Sender: TObject);
    procedure dbedt_nr_fat_masterChange(Sender: TObject);
    procedure btn_co_unid_masterClick(Sender: TObject);
    procedure btn_co_prod_masterClick(Sender: TObject);
    procedure btn_co_masterClick(Sender: TObject);
    procedure msk_nr_masterExit(Sender: TObject);
    procedure btn_co_unid_reemissaoClick(Sender: TObject);
    procedure btn_co_prod_reemissaoClick(Sender: TObject);
    procedure msk_cd_prod_reemissaoExit(Sender: TObject);
    procedure msk_cd_unid_reemissaoExit(Sender: TObject);
    procedure msk_cd_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


 private
    { Private declarations }
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..4] Of String[60]; // trabalha c/ edt_chave
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir: Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
  public
    { Public declarations }
    str_cd_chave:String[20];
    tp_emissao        :Integer;
    procedure valores_fatura(tp_fat, in_account:String);
  end;

var
  frm_emissao_fatura: Tfrm_emissao_fatura;
implementation
uses GSMLIB, PGGP017, PGGP001,ConsOnLineEx, PGSM990, dEmissaoFatura;

{$R *.DFM}



procedure Tfrm_emissao_fatura.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin

  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_emissao_fatura.Cancelar;
begin
if datm_emissao_fatura.qry_emissao_fatura_.State in [dsEdit, dsInsert] then
 datm_emissao_fatura.qry_emissao_fatura_.Cancel;

if datm_emissao_fatura.qry_master_.State in [dsEdit, dsInsert] then
 datm_emissao_fatura.qry_master_.Cancel;


msk_processo.text := datm_emissao_fatura.qry_emissao_fatura_calc_processo.Asstring;
msk_processo.ReadOnly         := true;
msk_processo.Color            := clmenu;
btn_co_processo.Enabled       := false;

msk_nr_master.text := datm_emissao_fatura.qry_master_NR_MASTER.Asstring;
msk_nr_master.ReadOnly        := true;
msk_nr_master.Color           := clmenu;
btn_co_master.Enabled         := false;


btn_mi(st_incluir, false, false, st_excluir);

end;

function Tfrm_emissao_fatura.Consiste: Boolean;
begin
consiste:= true;
if (pgctrl_emissao_fat.ActivePage = ts_dados_basicos) then
begin
  {if dbedt_nr_fatura.text = '' then
   begin
    Boxmensagem('Deve ser inseriddo o Nr da Fatura',2);
    dbedt_nr_fatura.Setfocus;
    consiste:= false;
    Exit;
   end;}

  if dbedt_dt_fatura.text = '' then
   begin
    Boxmensagem('Deve ser inseriddo a Data da Fatura',2);
    dbedt_dt_fatura.Setfocus;
    consiste:= false;
    Exit;
   end;
end
else
 begin
  {if dbedt_nr_fat_master.text = '' then
   begin
    Boxmensagem('Deve ser inseriddo o Nr da Fatura',2);
    dbedt_nr_fat_master.Setfocus;
    consiste:= false;
    Exit;
   end;}

  if dbedt_dt_fat_master.text = '' then
   begin
    Boxmensagem('Deve ser inseriddo a Data da Fatura',2);
    dbedt_dt_fat_master.Setfocus;
    consiste:= false;
    Exit;
   end;


 end;
end;


function Tfrm_emissao_fatura.Grava: Boolean;
begin
if (pgctrl_emissao_fat.ActivePage = ts_dados_basicos) then
begin
 try
  if datm_emissao_fatura.qry_emissao_fatura_.State in [dsedit,dsInsert] then
    datm_emissao_fatura.qry_emissao_fatura_.Post;
 except
  on E: Exception do
   begin
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    datm_emissao_fatura.qry_emissao_fatura_.Cancel;
    TrataErro(E);
    Grava := False;
   end;
 end;
end
else
 begin
 try
  if datm_emissao_fatura.qry_master_.State in [dsedit,dsInsert] then
    datm_emissao_fatura.qry_master_.Post;
 except
  on E: Exception do
   begin
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    datm_emissao_fatura.qry_master_.Cancel;
    TrataErro(E);
    Grava := False;
   end;
 end;

end;

msk_processo.ReadOnly         := true;
msk_processo.Color            := clmenu;
btn_co_processo.Enabled       := false;

msk_nr_master.ReadOnly        := true;
msk_nr_master.Color           := clmenu;
btn_co_master.Enabled         := false;

btn_mi(st_incluir, false, false, st_excluir);
end;

function Tfrm_emissao_fatura.VerAlt: Boolean;
begin
end;




procedure Tfrm_emissao_fatura.FormCreate(Sender: TObject);
begin
   st_modificar:=false;
   st_incluir:=false;
   st_excluir:=false;
   AtribuiDireitos(st_modificar, st_incluir, st_excluir);
   Application.CreateForm(Tdatm_emissao_fatura, datm_emissao_fatura);
   str_cd_chave:='';

    btn_mi(st_incluir, false, false, st_excluir);
end;

procedure Tfrm_emissao_fatura.msk_unidExit(Sender: TObject);
begin
{ if msk_unid.Text <> '' then
  begin
    ValCodEdt( msk_unid );
    datm_emissao_fatura.qry_pesquisa_.Active:=false;
    datm_emissao_fatura.qry_pesquisa_.Sql.Clear;
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid.Text+'"');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_emissao_fatura.qry_pesquisa_.Active:=true;
    if datm_emissao_fatura.qry_pesquisa_.RecordCount > 0 then
        begin
          edt_nm_unid_neg.text:= datm_emissao_fatura.qry_pesquisa_.Fields[0].AsString;
          datm_emissao_fatura.qry_pesquisa_.Close;

          datm_emissao_fatura.qry_emissao_fatura_.Close;
          datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_PRODUTO').AsString:= msk_cd_produto.text;
          datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_UNID_NEG').AsString:=msk_unid.text;
          datm_emissao_fatura.qry_emissao_fatura_.Prepare;
          datm_emissao_fatura.qry_emissao_fatura_.Open;


        end
        else
        begin
          datm_emissao_fatura.qry_pesquisa_.Close;
          edt_nm_unid_neg.Text := '';
          BoxMensagem('Código da Unidade de Negócio inválido!', 2);
          msk_unid.SetFocus;
          Exit;
        end;
    end
   else
     begin
      Boxmensagem('A Unidade de Negócio deve ser informado!',2);
      msk_unid.SetFocus;
     end; }

  if msk_unid.Text <> '' then begin
    msk_unid.Text := Copy('00', 1, 2 - Length( msk_unid.Text)) +  msk_unid.Text;
    edt_nm_unid_neg.text := ConsultaLookUpSQL('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid.Text+'" ' +
                                               ' AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG FROM TUSUARIO_HABILITACAO ' +
                                               '                     WHERE CD_USUARIO ="'+str_cd_usuario+'") ', 'NM_UNID_NEG');

    if edt_nm_unid_neg.text = '' then begin
      edt_nm_unid_neg.Text := '';
      ShowMessage('Código da Unidade de Negócio inválido!');
      msk_unid.SetFocus;
      Exit;
    end else begin
      datm_emissao_fatura.qry_emissao_fatura_.Close;
      datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_PRODUTO').AsString:=  msk_cd_produto.text;
      datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_UNID_NEG').AsString:= msk_unid.text;
      datm_emissao_fatura.qry_emissao_fatura_.Prepare;
      datm_emissao_fatura.qry_emissao_fatura_.Open;
    end;
  end else begin
    ShowMessage('A Unidade de Negócio deve ser informado!');
    msk_unid.SetFocus;
  end;

end;

procedure Tfrm_emissao_fatura.msk_cd_produtoExit(Sender: TObject);
begin
{ if msk_cd_produto.Text <> '' then
  begin
    ValCodEdt( msk_cd_produto );
    datm_emissao_fatura.qry_pesquisa_.Active:=false;
    datm_emissao_fatura.qry_pesquisa_.Sql.Clear;
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_cd_produto.Text+'"');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_emissao_fatura.qry_pesquisa_.Active:=true;
    if datm_emissao_fatura.qry_pesquisa_.RecordCount > 0 then
        begin
           edt_nm_produto.text:= datm_emissao_fatura.qry_pesquisa_.Fields[0].AsString;
           datm_emissao_fatura.qry_pesquisa_.Close;
           datm_emissao_fatura.qry_emissao_fatura_.Close;
           datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_PRODUTO').AsString:= msk_cd_produto.text;
           datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_UNID_NEG').AsString:=msk_unid.text;
           datm_emissao_fatura.qry_emissao_fatura_.Prepare;
           datm_emissao_fatura.qry_emissao_fatura_.Open;
        end
        else
        begin
          datm_emissao_fatura.qry_pesquisa_.Close;
          edt_nm_produto.Text := '';
          BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
          msk_cd_produto.SetFocus;
          Exit;
        end;
    end
   else
     begin
      Boxmensagem('O Produto deve ser informado!',2);
      msk_cd_produto.SetFocus;
     end;  }

  if msk_cd_produto.Text <> '' then begin
    msk_cd_produto.Text := Copy('00', 1, 2 - Length( msk_cd_produto.Text)) +  msk_cd_produto.Text;
    edt_nm_produto.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_cd_produto.Text+'" ' +
                                               ' AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO ' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'") ' , 'NM_PRODUTO');

    if edt_nm_produto.text = '' then begin
      edt_nm_produto.Text := '';
      ShowMessage('Código do Produto inválido ou não habilidado!');
      msk_cd_produto.SetFocus;
      Exit;
    end else begin
      datm_emissao_fatura.qry_emissao_fatura_.Close;
      datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_PRODUTO').AsString:= msk_cd_produto.text;
      datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_UNID_NEG').AsString:=msk_unid.text;
      datm_emissao_fatura.qry_emissao_fatura_.Prepare;
      datm_emissao_fatura.qry_emissao_fatura_.Open;
    end;
  end else begin
    ShowMessage('O Produto deve ser informado!');
    msk_cd_produto.SetFocus;
  end;

end;

procedure Tfrm_emissao_fatura.btn_co_unidClick(Sender: TObject);
begin
{Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',
                msk_unid, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );


 msk_unidExit(Sender); }

  if Sender is TSpeedButton then begin
    msk_unid.text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG', nil, 1, msk_unid.text);
    msk_unidExit(Sender);
  end else
    edt_nm_unid_neg.text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_unid.text, 'NM_UNID_NEG' );


end;

procedure Tfrm_emissao_fatura.btn_co_produtoClick(Sender: TObject);
var produto:string;
begin
{produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO');
 if produto <>'' then
   begin
    msk_cd_produto.text:=produto;
    msk_cd_produtoExit(Sender);
   end; }

  if Sender is TSpeedButton then begin
    msk_cd_produto.text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO', nil, 1, msk_cd_produto.text);
    msk_cd_produtoExit(Sender);
  end else
    edt_nm_produto.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_cd_produto.Text+'" ' +
                                               'AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'")' , 'NM_PRODUTO');



end;

procedure Tfrm_emissao_fatura.btn_sairClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_emissao_fatura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
datm_emissao_fatura.qry_emissao_fatura_.Close;
datm_emissao_fatura.Free;
end;

procedure Tfrm_emissao_fatura.cb_ordemChange(Sender: TObject);
begin
    edt_chave.Text := '';
    edt_chave.SetFocus;

if pgctrl_emissao_fat.ActivePage = ts_lista then
 begin
    datm_emissao_fatura.qry_emissao_fatura_.Close;
    datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_UNID_NEG').AsString:=msk_unid.text;
    datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_PRODUTO').AsString:=msk_cd_produto.Text;

    if cb_ordem.itemindex = 0 then
      begin
        datm_emissao_fatura.qry_emissao_fatura_.Sql[23]:=' TP.NR_PROCESSO';
      end;

    if cb_ordem.itemindex = 1 then
      begin
       datm_emissao_fatura.qry_emissao_fatura_.Sql[23]:='TF.NR_FATURA';
      end;
    if cb_ordem.itemindex = 2 then
      begin
        datm_emissao_fatura.qry_emissao_fatura_.Sql[23]:='NM_AGENTE';
      end;
     datm_emissao_fatura.qry_emissao_fatura_.Prepare;
     datm_emissao_fatura.qry_emissao_fatura_.Open;
   end;

if pgctrl_emissao_fat.ActivePage = ts_lista_master then
 begin

     datm_emissao_fatura.qry_master_.Close;
     datm_emissao_fatura.qry_master_.ParamByName('CD_PRODUTO').AsString:= msk_prod_master.text;
     datm_emissao_fatura.qry_master_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_master.text;

    if cb_ordem.itemindex = 0 then
      begin
        datm_emissao_fatura.qry_master_.Sql[25]:=' NR_MASTER';
      end;

    if cb_ordem.itemindex = 1 then
      begin
       datm_emissao_fatura.qry_master_.Sql[25]:='NM_AGENTE';
      end;

     datm_emissao_fatura.qry_master_.Prepare;
     datm_emissao_fatura.qry_master_.Open;

 end;
if pgctrl_emissao_fat.ActivePage = ts_reemissao then
begin
   datm_emissao_fatura.qry_reemissao_fatura_.Close;
   datm_emissao_fatura.qry_reemissao_fatura_.ParamByName('CD_PRODUTO').AsString := msk_cd_prod_reemissao.text;
   datm_emissao_fatura.qry_reemissao_fatura_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid_reemissao.text;
   case cb_ordem.itemindex  of
   0: datm_emissao_fatura.qry_reemissao_fatura_.Sql[28] := 'M.CD_MASTER';
   1: datm_emissao_fatura.qry_reemissao_fatura_.Sql[28] := 'NR_MASTER';
   2: datm_emissao_fatura.qry_reemissao_fatura_.Sql[28] := 'NR_FATURA';
   end;
   datm_emissao_fatura.qry_reemissao_fatura_.Prepare;
   datm_emissao_fatura.qry_reemissao_fatura_.Open;
end;



end;

procedure Tfrm_emissao_fatura.edt_chaveChange(Sender: TObject);
begin
if pgctrl_emissao_fat.ActivePage = ts_lista then
begin
if cb_ordem.ItemIndex = 0 then
  Localiza (datm_emissao_fatura.qry_emissao_fatura_,msk_unid.text + msk_cd_produto.text +  edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
 else Localiza (datm_emissao_fatura.qry_emissao_fatura_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
end;

if pgctrl_emissao_fat.ActivePage = ts_lista_master then
begin
 Localiza (datm_emissao_fatura.qry_master_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
end;

if pgctrl_emissao_fat.ActivePage = ts_reemissao then
begin
 Localiza (datm_emissao_fatura.qry_reemissao_fatura_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
end;


end;

procedure Tfrm_emissao_fatura.btn_imprimirClick(Sender: TObject);
begin

if pgctrl_emissao_fat.ActivePage = ts_lista then
begin
if BoxMensagem('Impressão realizada com Sucesso?',1)then
  begin
     if not(datm_emissao_fatura.qry_emissao_fatura_.State in [dsEdit]) then
        datm_emissao_fatura.qry_emissao_fatura_.Edit;
     datm_emissao_fatura.qry_emissao_fatura_IN_FATURA.AsString:='1';
     datm_emissao_fatura.qry_emissao_fatura_.Post;

     datm_emissao_fatura.qry_emissao_fatura_.Close;
     datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_PRODUTO').AsString:= msk_cd_produto.text;
     datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_UNID_NEG').AsString:=msk_unid.text;
     datm_emissao_fatura.qry_emissao_fatura_.Prepare;
     datm_emissao_fatura.qry_emissao_fatura_.Open;
  end;
end;

if pgctrl_emissao_fat.ActivePage = ts_dados_master then
  begin
  datm_emissao_fatura.qry_rel_imp_fat_.Close;
  datm_emissao_fatura.qry_rel_imp_fat_.ParamByname('CD_MASTER').AsString := datm_emissao_fatura.qry_master_CD_MASTER.AsString;
  datm_emissao_fatura.qry_rel_imp_fat_.ParamByname('NR_FATURA').AsString := datm_emissao_fatura.qry_master_NR_FATURA.AsString;
  datm_emissao_fatura.qry_rel_imp_fat_.Prepare;
  datm_emissao_fatura.qry_rel_imp_fat_.Open;

  datm_emissao_fatura.qry_rel_imp_fat_item_.Close;
  datm_emissao_fatura.qry_rel_imp_fat_item_.Prepare;
  datm_emissao_fatura.qry_rel_imp_fat_item_.Open;

  Application.CreateForm(TFrm_impressao, Frm_impressao );

  Frm_impressao.cd_agente     := datm_emissao_fatura.qry_master_CD_AGENTE.AsString;
  Frm_impressao.cd_unid_neg   := msk_unid_master2.text;
  Frm_impressao.cd_produto    := msk_prod_master2.text;
  Frm_impressao.cd_modulo     := '3308';
  Frm_impressao.ShowModal;

  if BoxMensagem('Impressão realizada com Sucesso?',1)then
    begin
     if not(datm_emissao_fatura.qry_master_.State in [dsEdit]) then
        datm_emissao_fatura.qry_master_.Edit;
     datm_emissao_fatura.qry_master_IN_FATURA.AsString:='0';
     datm_emissao_fatura.qry_master_.Post;

     datm_emissao_fatura.qry_master_.Close;
     datm_emissao_fatura.qry_master_.ParamByName('CD_PRODUTO').AsString:= msk_prod_master.text;
     datm_emissao_fatura.qry_master_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_master.text;
     datm_emissao_fatura.qry_master_.Prepare;
     datm_emissao_fatura.qry_master_.Open;
    end;
  end;

 if pgctrl_emissao_fat.ActivePage = ts_reemissao then
  begin
  datm_emissao_fatura.qry_rel_imp_fat_.Close;
  datm_emissao_fatura.qry_rel_imp_fat_.ParamByname('CD_MASTER').AsString := datm_emissao_fatura.qry_reemissao_fatura_CD_MASTER.AsString;
  datm_emissao_fatura.qry_rel_imp_fat_.ParamByname('NR_FATURA').AsString := datm_emissao_fatura.qry_reemissao_fatura_NR_FATURA.AsString;
  datm_emissao_fatura.qry_rel_imp_fat_.Prepare;
  datm_emissao_fatura.qry_rel_imp_fat_.Open;

  datm_emissao_fatura.qry_rel_imp_fat_item_.Close;
  datm_emissao_fatura.qry_rel_imp_fat_item_.Prepare;
  datm_emissao_fatura.qry_rel_imp_fat_item_.Open;

  Application.CreateForm(TFrm_impressao, Frm_impressao );

  Frm_impressao.cd_agente     := datm_emissao_fatura.qry_reemissao_fatura_CD_AGENTE.AsString;
  Frm_impressao.cd_unid_neg   := msk_cd_unid_reemissao.text;
  Frm_impressao.cd_produto    := msk_cd_prod_reemissao.text;
  Frm_impressao.cd_modulo     := '3308';
  Frm_impressao.ShowModal;

 end;
end;

procedure Tfrm_emissao_fatura.FormShow(Sender: TObject);
begin
  shp1.Brush.Color := clPnlClaroBroker;
  pnl_manut_proc.Color := clMenuBroker;

 ts_dados_master.TabVisible  := (tp_emissao = 1);
 ts_lista_master.TabVisible  := (tp_emissao = 1);
 ts_dados_basicos.TabVisible := (tp_emissao = 0);
 ts_lista.TabVisible         := (tp_emissao = 0);
 ts_reemissao.TabVisible     := (tp_emissao = 2);

 case tp_emissao of
  0 :begin
      abre_processo;
      a_str_indices[0] := 'NR_PROCESSO';
      a_str_indices[1] := 'NR_FATURA';
      a_str_indices[2] := 'NM_AGENTE';
      With cb_ordem do
       begin
        Clear;
        Items.Add('Processo');
        Items.Add('Nr Fatura');
        Items.Add('Agente');
        ItemIndex := 0;
       end;
     end;
  1 :begin
      abre_master;
      a_str_indices[0] := 'NR_MASTER';
      a_str_indices[1] := 'NM_AGENTE';
      With cb_ordem do
       begin
        Clear;
        Items.Add('Master');
        Items.Add('Agente');
        ItemIndex := 0;
       end;
     end;
  2 :begin
      btn_mi(false, false, false, false);
      datm_emissao_fatura.qry_traz_default_.Close;
      datm_emissao_fatura.qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      datm_emissao_fatura.qry_traz_default_.Open;

       msk_cd_unid_reemissao.text := datm_emissao_fatura.qry_traz_default_CD_UNID_NEG.AsString;
       edt_nm_unid_reemissao.text  := datm_emissao_fatura.qry_traz_default_NM_UNID_NEG.AsString;

       msk_cd_prod_reemissao.text := datm_emissao_fatura.qry_traz_default_CD_PRODUTO.AsString;
       edt_nm_prod_reemissao.text := datm_emissao_fatura.qry_traz_default_NM_PRODUTO.AsString;


      datm_emissao_fatura.qry_reemissao_fatura_.Close;
      datm_emissao_fatura.qry_reemissao_fatura_.ParamByName('CD_PRODUTO').AsString := msk_cd_prod_reemissao.text;
      datm_emissao_fatura.qry_reemissao_fatura_.ParamByName('CD_UNID_NEG').AsString:= msk_cd_unid_reemissao.text;
      datm_emissao_fatura.qry_reemissao_fatura_.Prepare;
      datm_emissao_fatura.qry_reemissao_fatura_.Open;

      a_str_indices[0] := 'CD_MASTER';
      a_str_indices[1] := 'NR_MASTER';
      a_str_indices[2] := 'NR_FATURA';
      With cb_ordem do
       begin
        Clear;
        Items.Add('Registro');
        Items.Add('Master');
        Items.Add('Nº Fatura');
        ItemIndex := 0;
       end;
     end;
   end;
end;

procedure Tfrm_emissao_fatura.btn_incluirClick(Sender: TObject);
begin
if (pgctrl_emissao_fat.ActivePage = ts_dados_basicos) or
     (pgctrl_emissao_fat.ActivePage = ts_lista)then
 begin
  with datm_emissao_fatura do
   begin
    qry_emissao_fatura_.DisableControls;
    qry_emissao_fatura_.Cancel;
    qry_emissao_fatura_.Append;
    qry_emissao_fatura_.EnableControls;

    qry_emissao_fatura_TP_FATURA.AsString := '2';
    qry_emissao_fatura_IN_FATURA.AsString := '3';

    valores_fatura(qry_emissao_fatura_TP_FATURA.AsString, qry_emissao_fatura_IN_ACCOUNT.AsString);
   end;

   msk_unid2.text        := msk_unid.text;
   edt_nm_unid_neg2.text := edt_nm_unid_neg.text;
   msk_cd_produto2.text  := msk_cd_produto.text;
   edt_nm_produto2.text  := edt_nm_produto.text;

   pgctrl_emissao_fat.ActivePage := ts_dados_basicos;
   msk_processo.text             := '';
   msk_processo.ReadOnly         := false;
   msk_processo.Color            := clWindow;
   btn_co_processo.Enabled       := true;
   msk_processo.Setfocus;
 end
else
 begin
  with datm_emissao_fatura do
   begin
    qry_master_.DisableControls;
    qry_master_.Cancel;
    qry_master_.Append;
    qry_master_.EnableControls;

    qry_master_TP_FATURA.AsString := '2';
    qry_master_IN_FATURA.AsString := '1';

    valores_fatura(qry_master_TP_FATURA.AsString, qry_master_IN_ACCOUNT.AsString);
   end;

   msk_unid_master2.text    := msk_unid_master.text;
   edt_nm_unid_master2.text := edt_nm_unid_master.text;
   msk_prod_master2.text    := msk_prod_master.text;
   edt_nm_prod_master2.text := edt_nm_prod_master.text;

   pgctrl_emissao_fat.ActivePage := ts_dados_master;
   msk_nr_master.text            := '';
   msk_nr_master.ReadOnly        := false;
   msk_nr_master.Color           := clWindow;
   btn_co_master.Enabled         := true;
   msk_nr_master.Setfocus;
 end;

 btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_emissao_fatura.btn_salvarClick(Sender: TObject);
begin
if not consiste then exit;
if not grava then exit;
end;

procedure Tfrm_emissao_fatura.btn_cancelarClick(Sender: TObject);
begin
Cancelar;
end;

procedure Tfrm_emissao_fatura.btn_excluirClick(Sender: TObject);
begin
if (pgctrl_emissao_fat.ActivePage = ts_dados_basicos) or
   (pgctrl_emissao_fat.ActivePage = ts_lista) then
  begin
   if BoxMensagem( 'Este Fatura será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
     try
        datm_main.db_broker.StartTransaction;
        datm_emissao_fatura.qry_emissao_fatura_.Delete;

        datm_main.db_broker.Commit;
     except
      on E: Exception do
        begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_emissao_fatura.qry_emissao_fatura_.Cancel;
        TrataErro(E);
        end;
     end;
  end
else
 begin
 if BoxMensagem( 'Este Fatura será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
     try
        datm_main.db_broker.StartTransaction;
        datm_emissao_fatura.qry_master_.Delete;

        datm_main.db_broker.Commit;
     except
      on E: Exception do
        begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_emissao_fatura.qry_master_.Cancel;
        TrataErro(E);
        end;
     end;
 end;
end;

procedure Tfrm_emissao_fatura.pgctrl_emissao_fatChange(Sender: TObject);
begin
if pgctrl_emissao_fat.ActivePage = ts_dados_basicos then
begin
 msk_unid2.text        := msk_unid.text;
 edt_nm_unid_neg2.text := edt_nm_unid_neg.text;
 msk_cd_produto2.text  := msk_cd_produto.text;
 edt_nm_produto2.text  := edt_nm_produto.text;

 datm_emissao_fatura.qry_soma_fat_.Close;
 datm_emissao_fatura.qry_soma_fat_.ParamByName('NR_PROCESSO').AsString:=datm_emissao_fatura.qry_emissao_fatura_NR_PROCESSO.AsString;
 datm_emissao_fatura.qry_soma_fat_.Prepare;
 datm_emissao_fatura.qry_soma_fat_.Open;
end;

if pgctrl_emissao_fat.ActivePage = ts_dados_master then
begin
 msk_unid_master2.text    := msk_unid_master.text;
 edt_nm_unid_master2.text := edt_nm_unid_master.text;
 msk_prod_master2.text    := msk_prod_master.text;
 edt_nm_prod_master2.text := edt_nm_prod_master.text;

 datm_emissao_fatura.qry_soma_fat_master_.Close;
 datm_emissao_fatura.qry_soma_fat_master_.ParamByName('CD_MASTER').AsString:=datm_emissao_fatura.qry_master_CD_MASTER.AsString;
 datm_emissao_fatura.qry_soma_fat_master_.Prepare;
 datm_emissao_fatura.qry_soma_fat_master_.Open;
end;

end;

procedure Tfrm_emissao_fatura.btn_co_processoClick(Sender: TObject);
begin
 msk_processo.Text :=ConsultaOnLineExSQL('SELECT SUBSTRING(P.NR_PROCESSO, 5,12) AS NR_PROCESSO, ' +
                      'P.CD_AGENTE, (SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_AGENTE = P.CD_AGENTE)NM_AGENTE, ' +
                      'P.CD_CLIENTE, (SELECT E.NM_EMPRESA FROM TEMPRESA_NAC E WHERE E.CD_EMPRESA = P.CD_CLIENTE )NM_EMPRESA '+
                      ' FROM TPROCESSO P WHERE P.CD_UNID_NEG = "'+msk_unid2.text+'" AND '+
                       ' P.CD_PRODUTO = "'+msk_cd_produto2.text+'" AND P.IN_ACCOUNT IN ("1","3","6", "7")','Processos',
                      ['NR_PROCESSO' ,'CD_AGENTE', 'NM_AGENTE', 'CD_CLIENTE', 'NM_EMPRESA'],
                      ['Processos','Cód.', 'Agente', 'Cód', 'Cliente'],
                      'NR_PROCESSO');

 msk_processoExit(nil);

end;

procedure Tfrm_emissao_fatura.msk_processoExit(Sender: TObject);
begin

if not(datm_emissao_fatura.qry_emissao_fatura_.State in [dsInsert]) then exit;

if  msk_processo.text <> '' then
 begin
  with datm_emissao_fatura do
   begin
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add(' SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO, P.CD_AGENTE, ');
    qry_pesquisa_.Sql.Add(' (SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_AGENTE = P.CD_AGENTE) NM_AGENTE, ');
    qry_pesquisa_.Sql.Add(' (SELECT V.NM_VIA_TRANSP FROM TVIA_TRANSP_BROKER V WHERE V.CD_VIA_transp = S.CD_VIA_TRANSPORTE) NM_VIA_TRANSP, ');
    qry_pesquisa_.Sql.Add(' CASE S.CD_VIA_TRANSPORTE ');
    qry_pesquisa_.Sql.Add('  WHEN "04" THEN (SELECT O.CD_SIGLA FROM TPORTO O WHERE O.CD_PORTO = P.CD_ORIGEM) ');
    qry_pesquisa_.Sql.Add('  ELSE (SELECT O.CD_SIGLA_CIDADE FROM TPORTO O WHERE O.CD_PORTO = P.CD_ORIGEM)  ');
    qry_pesquisa_.Sql.Add(' END AS AP_ORIGEM, ');
    qry_pesquisa_.Sql.Add(' CASE S.CD_VIA_TRANSPORTE ');
    qry_pesquisa_.Sql.Add(' WHEN "04" THEN (SELECT D.CD_SIGLA FROM TPORTO D WHERE D.CD_PORTO = P.CD_DESTINO)');
    qry_pesquisa_.Sql.Add(' ELSE (SELECT D.CD_SIGLA_CIDADE FROM TPORTO D WHERE D.CD_PORTO = P.CD_DESTINO)');
    qry_pesquisa_.Sql.Add(' END AS AP_DESTINO, ');
    qry_pesquisa_.Sql.Add(' (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M WHERE M.CD_MOEDA = P.CD_MOEDA_FRETE)AP_MOEDA, P.VL_ACCOUNT ');
    qry_pesquisa_.Sql.Add(' FROM TPROCESSO P, TSERVICO S ');
    qry_pesquisa_.Sql.Add(' WHERE P.NR_PROCESSO = "'+msk_unid2.text + msk_cd_produto2.text + msk_processo.text+'"' );
    qry_pesquisa_.Sql.Add(' AND  P.IN_ACCOUNT IN ("1", "3", "6", "7" ) ') ;
    qry_pesquisa_.Sql.Add(' AND P.CD_SERVICO = S.CD_SERVICO ' );
    qry_pesquisa_.Open;
    if qry_pesquisa_.Recordcount > 0 then
     begin

      qry_emissao_fatura_CD_AGENTE.AsString     := qry_pesquisa_.Fields[3].AsString;
      qry_emissao_fatura_NM_AGENTE.AsString     := qry_pesquisa_.Fields[4].AsString;
      qry_emissao_fatura_NM_VIA_TRANSP.AsString := qry_pesquisa_.Fields[5].AsString;
      qry_emissao_fatura_AP_ORIGEM.AsString     := qry_pesquisa_.Fields[6].AsString;
      qry_emissao_fatura_AP_DESTINO.AsString    := qry_pesquisa_.Fields[7].AsString;
      qry_emissao_fatura_AP_MOEDA.AsString      := qry_pesquisa_.Fields[8].AsString;
      qry_emissao_fatura_VL_ACCOUNT.AsFloat     := qry_pesquisa_.Fields[9].AsFloat;

      qry_soma_fat_.Close;
      qry_soma_fat_.ParamByName('NR_PROCESSO').AsString:=msk_unid2.text + msk_cd_produto2.text + msk_processo.text;
      qry_soma_fat_.Prepare;
      qry_soma_fat_.Open;

      qry_pesquisa_.Close;
     end
    else
     begin
      Boxmensagem('Processo Inválido ou não liberado p/ Account',2);
      msk_processo.setFocus;
      Exit;
     end;

   end;
 end;
end;

procedure Tfrm_emissao_fatura.valores_fatura(tp_fat, in_account: String);
begin
  dbrdgp_tp_fat.ReadOnly   := (in_account = '2');
 // dbedt_nr_fatura.ReadOnly := (in_account = '2');
  dbedt_dt_fatura.ReadOnly := (in_account = '2');
  dbedt_vl_deb_br.ReadOnly := (in_account = '2');
  dbedt_vl_cre_br.ReadOnly := (in_account = '2');

if in_account = '2' then
 begin
 // dbedt_nr_fatura.Color    := clMenu;
  dbedt_dt_fatura.Color    := clMenu;
  dbedt_vl_deb_br.Color    := clMenu;
  dbedt_vl_cre_br.Color    := clMenu;
 end
else
 begin
 // dbedt_nr_fatura.Color    := clWindow;
  dbedt_dt_fatura.Color    := clWindow;
  dbedt_vl_deb_br.Color    := clWindow;
  dbedt_vl_cre_br.Color    := clWindow;
 end;

dbedt_vl_cre_ag.Visible    := (tp_fat = '0');
dbedt_vl_deb_ag.Visible    := (tp_fat = '1');
dbedt_vl_cre_br.Visible    := (tp_fat = '2');
dbedt_vl_deb_br.Visible    := (tp_fat = '3');
dbedt_vl_ajuste.Visible    := (tp_fat = '4');


dbedt_vl_cre_ag_master.Visible    := (tp_fat = '0');
dbedt_vl_deb_ag_master.Visible    := (tp_fat = '1');
dbedt_vl_cre_br_master.Visible    := (tp_fat = '2');
dbedt_vl_deb_br_master.Visible    := (tp_fat = '3');
dbedt_vl_ajuste_master.Visible    := (tp_fat = '4');
end;

procedure Tfrm_emissao_fatura.dbedt_nr_faturaChange(Sender: TObject);
begin
 if datm_emissao_fatura.qry_emissao_fatura_.State in [dsEdit, dsInsert]then
   btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_emissao_fatura.abre_processo;
begin
  pgctrl_emissao_fat.ActivePage:= ts_lista;

 if (str_cd_chave <> '' ) then
 begin
    msk_unid.Text      :=copy(str_cd_chave,1,2);
    msk_cd_produto.Text:=copy(str_cd_chave,3,2);

    datm_emissao_fatura.qry_pesquisa_.Active:=false;
    datm_emissao_fatura.qry_pesquisa_.Sql.Clear;
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid.Text+'"');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_emissao_fatura.qry_pesquisa_.Active:=true;

    if datm_emissao_fatura.qry_pesquisa_.Recordcount = 0 then
      begin
       BoxMensagem('Usuário não tem Habilitação para esta Unidade!',2);
       Exit;
      end;
     edt_nm_unid_neg.text:= datm_emissao_fatura.qry_pesquisa_.Fields[0].AsString;

    datm_emissao_fatura.qry_pesquisa_.Active:=false;
    datm_emissao_fatura.qry_pesquisa_.Sql.Clear;
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_cd_produto.Text+'"');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_emissao_fatura.qry_pesquisa_.Active:=true;

    if datm_emissao_fatura.qry_pesquisa_.Recordcount = 0 then
      begin
       BoxMensagem('Usuário não tem Habilitação para este Produto!',2);
       Exit;
      end;
     edt_nm_produto.text:= datm_emissao_fatura.qry_pesquisa_.Fields[0].AsString;

     datm_emissao_fatura.qry_emissao_fatura_.Close;
     datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
     datm_emissao_fatura.qry_emissao_fatura_.ParamByName('CD_UNID_NEG').AsString := msk_unid.Text;
     datm_emissao_fatura.qry_emissao_fatura_.Prepare;
     datm_emissao_fatura.qry_emissao_fatura_.Open;

     datm_emissao_fatura.qry_emissao_fatura_.Locate('NR_PROCESSO', str_cd_chave, [loCaseInsensitive, loPartialKey]);
 end
else
 begin
   with datm_emissao_fatura do
   begin
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_traz_default_.Open;

    msk_unid.text         := qry_traz_default_CD_UNID_NEG.AsString;
    edt_nm_unid_neg.text  := qry_traz_default_NM_UNID_NEG.AsString;

    msk_cd_produto.text  := qry_traz_default_CD_PRODUTO.AsString;
    edt_nm_produto.text  := qry_traz_default_NM_PRODUTO.AsString;

   qry_emissao_fatura_.Close;
   qry_emissao_fatura_.ParamByName('CD_PRODUTO').AsString  := qry_traz_default_CD_PRODUTO.AsString;
   qry_emissao_fatura_.ParamByName('CD_UNID_NEG').AsString := qry_traz_default_CD_UNID_NEG.AsString;
   qry_emissao_fatura_.Sql[21]:='';
   qry_emissao_fatura_.Prepare;
   qry_emissao_fatura_.Open;
  end;
 end;

end;

procedure Tfrm_emissao_fatura.msk_unid_masterExit(Sender: TObject);
begin
{ if msk_unid_master.Text <> '' then
  begin
    ValCodEdt( msk_unid_master );
    datm_emissao_fatura.qry_pesquisa_.Active:=false;
    datm_emissao_fatura.qry_pesquisa_.Sql.Clear;
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_master.Text+'"');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_emissao_fatura.qry_pesquisa_.Active:=true;
    if datm_emissao_fatura.qry_pesquisa_.RecordCount > 0 then
        begin
          edt_nm_unid_master.text:= datm_emissao_fatura.qry_pesquisa_.Fields[0].AsString;
          datm_emissao_fatura.qry_pesquisa_.Close;

          datm_emissao_fatura.qry_master_.Close;
          datm_emissao_fatura.qry_master_.ParamByName('CD_PRODUTO').AsString:= msk_prod_master.text;
          datm_emissao_fatura.qry_master_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_master.text;
          datm_emissao_fatura.qry_master_.Prepare;
          datm_emissao_fatura.qry_master_.Open;
        end
        else
        begin
          datm_emissao_fatura.qry_pesquisa_.Close;
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
      datm_emissao_fatura.qry_master_.Close;
      datm_emissao_fatura.qry_master_.ParamByName('CD_PRODUTO').AsString:=  msk_prod_master.text;
      datm_emissao_fatura.qry_master_.ParamByName('CD_UNID_NEG').AsString:= msk_unid_master.text;
      datm_emissao_fatura.qry_master_.Prepare;
      datm_emissao_fatura.qry_master_.Open;
    end;
  end else begin
    ShowMessage('A Unidade de Negócio deve ser informado!');
    msk_unid_master.SetFocus;
  end;

end;

procedure Tfrm_emissao_fatura.msk_prod_masterExit(Sender: TObject);
begin
{ if msk_prod_master.Text <> '' then
  begin
    ValCodEdt( msk_prod_master );
    datm_emissao_fatura.qry_pesquisa_.Active:=false;
    datm_emissao_fatura.qry_pesquisa_.Sql.Clear;
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_prod_master.Text+'"');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_emissao_fatura.qry_pesquisa_.Active:=true;
    if datm_emissao_fatura.qry_pesquisa_.RecordCount > 0 then
        begin
           edt_nm_prod_master.text:= datm_emissao_fatura.qry_pesquisa_.Fields[0].AsString;
           datm_emissao_fatura.qry_pesquisa_.Close;
           datm_emissao_fatura.qry_master_.Close;
           datm_emissao_fatura.qry_master_.ParamByName('CD_PRODUTO').AsString:= msk_prod_master.text;
           datm_emissao_fatura.qry_master_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_master.text;
           datm_emissao_fatura.qry_master_.Prepare;
           datm_emissao_fatura.qry_master_.Open;
        end
        else
        begin
          datm_emissao_fatura.qry_pesquisa_.Close;
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
     end;  }

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
      datm_emissao_fatura.qry_master_.Close;
      datm_emissao_fatura.qry_master_.ParamByName('CD_PRODUTO').AsString:= msk_prod_master.text;
      datm_emissao_fatura.qry_master_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_master.text;
      datm_emissao_fatura.qry_master_.Prepare;
      datm_emissao_fatura.qry_master_.Open;
    end;
  end else begin
    ShowMessage('O Produto deve ser informado!');
    msk_prod_master.SetFocus;
  end;


end;

procedure Tfrm_emissao_fatura.dbedt_nr_fat_masterChange(Sender: TObject);
begin
if datm_emissao_fatura.qry_master_.State in [dsEdit, dsInsert] then
  btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_emissao_fatura.btn_co_unid_masterClick(Sender: TObject);
begin
{Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',
                msk_unid_master, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );

  msk_unid_masterExit(Sender); }

  if Sender is TSpeedButton then begin
    msk_unid_master.text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG', nil, 1, msk_unid_master.text);
    msk_unid_masterExit(Sender);
  end else
    edt_nm_unid_master.text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_unid_master.text, 'NM_UNID_NEG' );


end;

procedure Tfrm_emissao_fatura.btn_co_prod_masterClick(Sender: TObject);
//var produto:string;
begin
{produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO');
 if produto <>'' then
   begin
    msk_prod_master.text:=produto;
    msk_prod_masterExit(Sender);
   end;  }

  if Sender is TSpeedButton then begin
    msk_prod_master.text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO', nil, 1, msk_prod_master.text);
    msk_prod_masterExit(Sender);
  end else
    edt_nm_prod_master.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_prod_master.Text+'" ' +
                                               'AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'")' , 'NM_PRODUTO');



end;

procedure Tfrm_emissao_fatura.btn_co_masterClick(Sender: TObject);
begin
 msk_nr_master.Text :=ConsultaOnLineExSQL('SELECT  NR_MASTER, ' +
                      'M.CD_AGENTE, (SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_AGENTE = M.CD_AGENTE)NM_AGENTE, ' +
                      'M.CD_VIA_TRANSP, (SELECT V.NM_VIA_TRANSP FROM TVIA_TRANSP_BROKER V WHERE V.CD_VIA_TRANSP = M.CD_VIA_TRANSP )NM_VIA_TRANSP '+
                      ' FROM TMASTER M WHERE M.CD_UNID_NEG = "'+msk_unid_master2.text+'" AND '+
                       ' M.CD_PRODUTO = "'+msk_prod_master2.text+'" AND M.IN_ACCOUNT IN ("1", "3", "4", "6")','Master',
                      ['NR_MASTER' ,'CD_AGENTE', 'NM_AGENTE', 'CD_VIA_TRANSP', 'NM_VIA_TRANSP'],
                      ['Processos','Cód.', 'Agente', 'Cód', 'Via Transporte'],
                      'NR_MASTER');

 msk_nr_masterExit(nil);

end;

procedure Tfrm_emissao_fatura.msk_nr_masterExit(Sender: TObject);
begin
if not(datm_emissao_fatura.qry_master_.State in [dsInsert]) then exit;

if  msk_nr_master.text <> '' then
 begin
  with datm_emissao_fatura do
   begin
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add(' SELECT M.CD_MASTER, M.CD_UNID_NEG, M.CD_PRODUTO, M.CD_AGENTE, ');
    qry_pesquisa_.Sql.Add(' (SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_AGENTE = M.CD_AGENTE) NM_AGENTE, ');
    qry_pesquisa_.Sql.Add(' (SELECT V.NM_VIA_TRANSP FROM TVIA_TRANSP_BROKER V WHERE V.CD_VIA_transp = M.CD_VIA_TRANSP) NM_VIA_TRANSP, ');
    qry_pesquisa_.Sql.Add(' CASE M.CD_VIA_TRANSP ');
    qry_pesquisa_.Sql.Add('  WHEN "04" THEN (SELECT O.CD_SIGLA FROM TPORTO O WHERE O.CD_PORTO = M.CD_ORIGEM) ');
    qry_pesquisa_.Sql.Add('  ELSE (SELECT O.CD_SIGLA_CIDADE FROM TPORTO O WHERE O.CD_PORTO = M.CD_ORIGEM)  ');
    qry_pesquisa_.Sql.Add(' END AS AP_ORIGEM, ');
    qry_pesquisa_.Sql.Add(' CASE M.CD_VIA_TRANSP ');
    qry_pesquisa_.Sql.Add(' WHEN "04" THEN (SELECT D.CD_SIGLA FROM TPORTO D WHERE D.CD_PORTO = M.CD_DESTINO)');
    qry_pesquisa_.Sql.Add(' ELSE (SELECT D.CD_SIGLA_CIDADE FROM TPORTO D WHERE D.CD_PORTO = M.CD_DESTINO)');
    qry_pesquisa_.Sql.Add(' END AS AP_DESTINO, ');
    qry_pesquisa_.Sql.Add(' (SELECT MO.AP_MOEDA FROM TMOEDA_BROKER MO WHERE MO.CD_MOEDA = M.CD_MOEDA)AP_MOEDA, ');
    qry_pesquisa_.Sql.Add(' (SELECT SUM(P.VL_ACCOUNT) FROM TPROCESSO P, THOUSE H ');
    qry_pesquisa_.Sql.Add(' WHERE H.CD_MASTER = M.CD_MASTER AND H.NR_PROCESSO = P.NR_PROCESSO )AS VL_ACCOUNT ');
    qry_pesquisa_.Sql.Add(' FROM TMASTER M  ');
    qry_pesquisa_.Sql.Add(' WHERE M.NR_MASTER = "'+msk_nr_master.text+'"' );
    qry_pesquisa_.Sql.Add(' AND  M.IN_ACCOUNT IN ("1", "3", "4", "6", "7") ') ;
    qry_pesquisa_.Open;
    if qry_pesquisa_.Recordcount > 0 then
     begin
      qry_master_NR_MASTER.AsString     := msk_nr_master.text;
      qry_master_CD_MASTER.AsString     := qry_pesquisa_.Fields[0].AsString;
      qry_master_CD_AGENTE.AsString     := qry_pesquisa_.Fields[3].AsString;
      qry_master_NM_AGENTE.AsString     := qry_pesquisa_.Fields[4].AsString;
      qry_master_NM_VIA_TRANSP.AsString := qry_pesquisa_.Fields[5].AsString;
      qry_master_AP_ORIGEM.AsString     := qry_pesquisa_.Fields[6].AsString;
      qry_master_AP_DESTINO.AsString    := qry_pesquisa_.Fields[7].AsString;
      qry_master_AP_MOEDA.AsString      := qry_pesquisa_.Fields[8].AsString;
      qry_master_VL_ACCOUNT.AsFloat     := qry_pesquisa_.Fields[9].AsFloat;

      qry_soma_fat_master_.Close;
      qry_soma_fat_master_.ParamByName('CD_MASTER').AsString:= qry_pesquisa_.Fields[0].AsString;
      qry_soma_fat_master_.Prepare;
      qry_soma_fat_master_.Open;

      qry_pesquisa_.Close;
     end
    else
     begin
      Boxmensagem('Master Inválido ou não liberado p/ Account',2);
      msk_nr_master.setFocus;
      Exit;
     end;

   end;
 end;

end;

procedure Tfrm_emissao_fatura.abre_master;
begin
  pgctrl_emissao_fat.ActivePage:= ts_lista_master;
  if (str_cd_chave <> '' ) then
 begin

    datm_emissao_fatura.qry_pesquisa_.Active:=false;
    datm_emissao_fatura.qry_pesquisa_.Sql.Clear;
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_master.Text+'"');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_emissao_fatura.qry_pesquisa_.Active:=true;

    if datm_emissao_fatura.qry_pesquisa_.Recordcount = 0 then
      begin
       BoxMensagem('Usuário não tem Habilitação para esta Unidade!',2);
       Exit;
      end;
     edt_nm_unid_master.text:= datm_emissao_fatura.qry_pesquisa_.Fields[0].AsString;

    datm_emissao_fatura.qry_pesquisa_.Active:=false;
    datm_emissao_fatura.qry_pesquisa_.Sql.Clear;
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_prod_master.Text+'"');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_emissao_fatura.qry_pesquisa_.Active:=true;

    if datm_emissao_fatura.qry_pesquisa_.Recordcount = 0 then
      begin
       BoxMensagem('Usuário não tem Habilitação para este Produto!',2);
       Exit;
      end;
     edt_nm_prod_master.text:= datm_emissao_fatura.qry_pesquisa_.Fields[0].AsString;

     datm_emissao_fatura.qry_master_.Close;
     datm_emissao_fatura.qry_master_.ParamByName('CD_PRODUTO').AsString  := msk_prod_master.Text;
     datm_emissao_fatura.qry_master_.ParamByName('CD_UNID_NEG').AsString := msk_unid_master.Text;
     datm_emissao_fatura.qry_master_.Prepare;
     datm_emissao_fatura.qry_master_.Open;

     datm_emissao_fatura.qry_master_.Locate('CD_MASTER', str_cd_chave, [loCaseInsensitive, loPartialKey]);
 end
else
 begin
   with datm_emissao_fatura do
   begin
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_traz_default_.Open;

    msk_unid_master.text         := qry_traz_default_CD_UNID_NEG.AsString;
    edt_nm_unid_master.text  := qry_traz_default_NM_UNID_NEG.AsString;

    msk_prod_master.text  := qry_traz_default_CD_PRODUTO.AsString;
    edt_nm_prod_master.text  := qry_traz_default_NM_PRODUTO.AsString;

   qry_master_.Close;
   qry_master_.ParamByName('CD_PRODUTO').AsString  := qry_traz_default_CD_PRODUTO.AsString;
   qry_master_.ParamByName('CD_UNID_NEG').AsString := qry_traz_default_CD_UNID_NEG.AsString;
   qry_master_.Prepare;
   qry_master_.Open;
  end;
 end;

end;

procedure Tfrm_emissao_fatura.btn_co_unid_reemissaoClick(Sender: TObject);
begin
{Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',
                msk_cd_unid_reemissao, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );
 msk_cd_unid_reemissaoExit(Sender); }

  if Sender is TSpeedButton then begin
    msk_cd_unid_reemissao.text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG', nil, 1, msk_cd_unid_reemissao.text);
    msk_cd_unid_reemissaoExit(Sender);
  end else
    edt_nm_unid_reemissao.text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_reemissao.text, 'NM_UNID_NEG' );

end;

procedure Tfrm_emissao_fatura.btn_co_prod_reemissaoClick(Sender: TObject);
//var produto:string;
begin
{produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO');
 if produto <>'' then
   begin
    msk_cd_prod_reemissao.text:=produto;
    msk_cd_prod_reemissaoExit(Sender);
   end;  }

  if Sender is TSpeedButton then begin
    msk_cd_prod_reemissao.text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO', nil, 1, msk_cd_prod_reemissao.text);
    msk_cd_prod_reemissaoExit(Sender);
  end else
    edt_nm_prod_reemissao.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_cd_prod_reemissao.Text+'" ' +
                                               'AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'")' , 'NM_PRODUTO');


end;

procedure Tfrm_emissao_fatura.msk_cd_prod_reemissaoExit(Sender: TObject);
begin
{ if msk_cd_prod_reemissao.Text <> '' then
  begin
    ValCodEdt( msk_cd_prod_reemissao );
    datm_emissao_fatura.qry_pesquisa_.Active:=false;
    datm_emissao_fatura.qry_pesquisa_.Sql.Clear;
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_cd_prod_reemissao.Text+'"');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_emissao_fatura.qry_pesquisa_.Active:=true;
    if datm_emissao_fatura.qry_pesquisa_.RecordCount > 0 then
        begin
           edt_nm_prod_reemissao.text:= datm_emissao_fatura.qry_pesquisa_.Fields[0].AsString;
           datm_emissao_fatura.qry_pesquisa_.Close;
           datm_emissao_fatura.qry_reemissao_fatura_.Close;
           datm_emissao_fatura.qry_reemissao_fatura_.ParamByName('CD_PRODUTO').AsString:= msk_cd_prod_reemissao.text;
           datm_emissao_fatura.qry_reemissao_fatura_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid_reemissao.text;
           datm_emissao_fatura.qry_reemissao_fatura_.Prepare;
           datm_emissao_fatura.qry_reemissao_fatura_.Open;
        end
        else
        begin
          datm_emissao_fatura.qry_pesquisa_.Close;
          edt_nm_prod_reemissao.Text := '';
          BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
          msk_cd_prod_reemissao.SetFocus;
          Exit;
        end;
    end
   else
     begin
      Boxmensagem('O Produto deve ser informado!',2);
      msk_cd_prod_reemissao.SetFocus;
     end; }


  if msk_cd_prod_reemissao.Text <> '' then begin
    msk_cd_prod_reemissao.Text := Copy('00', 1, 2 - Length( msk_cd_prod_reemissao.Text)) +  msk_cd_prod_reemissao.Text;
    edt_nm_prod_reemissao.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_cd_prod_reemissao.Text+'" ' +
                                               ' AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO ' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'") ' , 'NM_PRODUTO');

    if edt_nm_prod_reemissao.text = '' then begin
      edt_nm_prod_reemissao.Text := '';
      ShowMessage('Código do Produto inválido ou não habilidado!');
      msk_cd_prod_reemissao.SetFocus;
      Exit;
    end else begin
      datm_emissao_fatura.qry_reemissao_fatura_.Close;
      datm_emissao_fatura.qry_reemissao_fatura_.ParamByName('CD_PRODUTO').AsString:= msk_cd_prod_reemissao.text;
      datm_emissao_fatura.qry_reemissao_fatura_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid_reemissao.text;
      datm_emissao_fatura.qry_reemissao_fatura_.Prepare;
      datm_emissao_fatura.qry_reemissao_fatura_.Open;
    end;
  end else begin
    ShowMessage('O Produto deve ser informado!');
    msk_cd_prod_reemissao.SetFocus;
  end;



end;

procedure Tfrm_emissao_fatura.msk_cd_unid_reemissaoExit(Sender: TObject);
begin
{ if msk_cd_unid_reemissao.Text <> '' then
  begin
    ValCodEdt( msk_cd_unid_reemissao );
    datm_emissao_fatura.qry_pesquisa_.Active:=false;
    datm_emissao_fatura.qry_pesquisa_.Sql.Clear;
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_cd_unid_reemissao.Text+'"');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_emissao_fatura.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_emissao_fatura.qry_pesquisa_.Active:=true;
    if datm_emissao_fatura.qry_pesquisa_.RecordCount > 0 then
        begin
          edt_nm_unid_reemissao.text:= datm_emissao_fatura.qry_pesquisa_.Fields[0].AsString;
          datm_emissao_fatura.qry_pesquisa_.Close;

          datm_emissao_fatura.qry_reemissao_fatura_.Close;
          datm_emissao_fatura.qry_reemissao_fatura_.ParamByName('CD_PRODUTO').AsString := msk_cd_prod_reemissao.text;
          datm_emissao_fatura.qry_reemissao_fatura_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid_reemissao.text;
          datm_emissao_fatura.qry_reemissao_fatura_.Prepare;
          datm_emissao_fatura.qry_reemissao_fatura_.Open;
        end
        else
        begin
          datm_emissao_fatura.qry_pesquisa_.Close;
          edt_nm_unid_reemissao.Text := '';
          BoxMensagem('Código da Unidade de Negócio inválido!', 2);
          msk_unid_master.SetFocus;
          Exit;
        end;
    end
   else
     begin
      Boxmensagem('A Unidade de Negócio deve ser informado!',2);
      msk_cd_unid_reemissao.SetFocus;
     end; }

  if msk_cd_unid_reemissao.Text <> '' then begin
    msk_cd_unid_reemissao.Text := Copy('00', 1, 2 - Length( msk_cd_unid_reemissao.Text)) +  msk_cd_unid_reemissao.Text;
    edt_nm_unid_reemissao.text := ConsultaLookUpSQL('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_cd_unid_reemissao.Text+'" ' +
                                               ' AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG FROM TUSUARIO_HABILITACAO ' +
                                               '                     WHERE CD_USUARIO ="'+str_cd_usuario+'") ', 'NM_UNID_NEG');

    if edt_nm_unid_reemissao.text = '' then begin
      edt_nm_unid_reemissao.Text := '';
      ShowMessage('Código da Unidade de Negócio inválido!');
      msk_cd_unid_reemissao.SetFocus;
      Exit;
    end else begin
      datm_emissao_fatura.qry_reemissao_fatura_.Close;
      datm_emissao_fatura.qry_reemissao_fatura_.ParamByName('CD_PRODUTO').AsString:=  msk_cd_prod_reemissao.text;
      datm_emissao_fatura.qry_reemissao_fatura_.ParamByName('CD_UNID_NEG').AsString:= msk_cd_unid_reemissao.text;
      datm_emissao_fatura.qry_reemissao_fatura_.Prepare;
      datm_emissao_fatura.qry_reemissao_fatura_.Open;
    end;
  end else begin
    ShowMessage('A Unidade de Negócio deve ser informado!');
    msk_cd_unid_reemissao.SetFocus;
  end;

end;

procedure Tfrm_emissao_fatura.msk_cd_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then begin
    if Sender = msk_cd_produto then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_unid then btn_co_unidClick(btn_co_unid);
    if Sender = msk_processo then btn_co_processoClick(btn_co_processo);
    if Sender = msk_unid_master then btn_co_unid_masterClick(btn_co_unid_master);
    if Sender = msk_prod_master then btn_co_prod_masterClick(btn_co_prod_master);
    if Sender = msk_nr_master then btn_co_masterClick(btn_co_master);
    if Sender = msk_cd_unid_reemissao then btn_co_unid_reemissaoClick(btn_co_unid_reemissao);
    if Sender = msk_cd_prod_reemissao then btn_co_prod_reemissaoClick(btn_co_prod_reemissao);
  end;
end;

procedure Tfrm_emissao_fatura.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

end.
