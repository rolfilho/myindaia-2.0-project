unit uFaturaComplementar;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ExtCtrls, Menus, StdCtrls, DBCtrls, Grids, DB, DBTables, DBGrids, ComCtrls,
  Buttons;

type
  Tfrm_fat_Itl_complementar = class(TForm)
    pnl_master: TPanel;
    SpeedButton3: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_Cancelar: TSpeedButton;
    Label41: TLabel;
    Label42: TLabel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    pgctrl_fat_compl: TPageControl;
    ts_lista: TTabSheet;
    DBGrid1: TDBGrid;
    ts_dados_basicos: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbedt_nr_fatura: TDBEdit;
    Label3: TLabel;
    dbedt_dt_fatura: TDBEdit;
    Label4: TLabel;
    dbedt_vl_cre_ag: TDBEdit;
    Label5: TLabel;
    DBEdit8: TDBEdit;
    Label6: TLabel;
    dbedt_nr_master: TDBEdit;
    Label7: TLabel;
    DBEdit10: TDBEdit;
    Label8: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label9: TLabel;
    DBEdit13: TDBEdit;
    Label10: TLabel;
    MainMenu1: TMainMenu;
    mi_Incluir: TMenuItem;
    mi_Salvar: TMenuItem;
    mi_Cancelar: TMenuItem;
    mi_Excluir: TMenuItem;
    mi_Sair: TMenuItem;
    Panel3: TPanel;
    Label21: TLabel;
    btn_uni_neg: TSpeedButton;
    Label51: TLabel;
    btn_co_produto: TSpeedButton;
    msk_cd_unid: TMaskEdit;
    edt_nm_unid: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid2: TMaskEdit;
    edt_nm_unid2: TEdit;
    msk_cd_produto2: TMaskEdit;
    edt_nm_produto2: TEdit;
    btn_co_master: TSpeedButton;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    dbedt_vl_deb_ag: TDBEdit;
    dbedt_vl_cre_br: TDBEdit;
    dbedt_vl_deb_br: TDBEdit;
    Panel4: TPanel;
    rb_cre_agente: TRadioButton;
    rb_deb_agente: TRadioButton;
    rb_cre_brasil: TRadioButton;
    rb_deb_brasil: TRadioButton;
    pnl_item: TPanel;
    Panel5: TPanel;
    btn_salvar1: TSpeedButton;
    btn_cancelar1: TSpeedButton;
    btn_incluir1: TSpeedButton;
    btn_excluir1: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Bevel1: TBevel;
    btn_co_item: TSpeedButton;
    dbedt_nm_item: TDBEdit;
    dbedt_cd_item: TDBEdit;
    DBEdit16: TDBEdit;
    DBGrid2: TDBGrid;
    DBMemo1: TDBMemo;
    Label14: TLabel;
    btn_aprovar: TSpeedButton;
    btn_imprimir: TSpeedButton;
    DBText1: TDBText;
    shp1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_unidExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_uni_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure abre_fatura;
    procedure pgctrl_fat_complChange(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_co_masterClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure dbedt_nr_masterExit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure dbr_tp_faturaChange(Sender: TObject);
    procedure rb_cre_agenteClick(Sender: TObject);
    procedure btn_incluir1Click(Sender: TObject);
    procedure dbedt_cd_itemChange(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure btn_aprovarClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_excluir1Click(Sender: TObject);
    procedure cb_ordemChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    a_str_indices : Array[0..4] Of String[60]; // trabalha c/ edt_chave
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir: Boolean;
    in_ctrl_edit :Boolean;

    procedure Cancelar;
    function Consiste : Boolean;
    function Grava    : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure btn_mi1( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    function VerAlt   : Boolean;
  public
    { Public declarations }
    procedure habilita_tp_fatura;
    procedure habilita_campos(Hab :Boolean);
  end;

var
  frm_fat_Itl_complementar: Tfrm_fat_Itl_complementar;

implementation

uses PGGP001, GSMLIB, ConsOnLineEx, PGGP017, PGSM990, dFaturaComplementar;

{$R *.DFM}

procedure Tfrm_fat_Itl_complementar.FormCreate(Sender: TObject);
begin

  st_modificar := false;
  st_incluir   := false;
  st_excluir   := false;

  Application.CreateForm(Tdatm_fat_Itl_complementar, datm_fat_Itl_complementar);
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  with datm_fat_Itl_complementar do
  begin
   qry_traz_default_.Close;
   qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
   qry_traz_default_.Open;

   msk_cd_unid.text    := qry_traz_default_CD_UNID_NEG.AsString;
   edt_nm_unid.text    := qry_traz_default_NM_UNID_NEG.AsString;

   msk_cd_produto.text := qry_traz_default_CD_PRODUTO.AsString;
   edt_nm_produto.text := qry_traz_default_NM_PRODUTO.AsString;

   pgctrl_fat_compl.ActivePage := ts_lista;
   abre_fatura;
   btn_mi(st_incluir, false, false, st_excluir);
  end;


  a_str_indices[0] := 'CD_MASTER';
  a_str_indices[1] := 'NR_MASTER';
  a_str_indices[2] := 'NR_FATURA';
  a_str_indices[3] := 'CD_AGENTE';
  a_str_indices[4] := 'NM_AGENTE';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Registro');
    Items.Add('Master');
    Items.Add('Nº Fatura');
    Items.Add('Cód.Agente');
    Items.Add('Agente');
    ItemIndex := 0;
  end;


end;

procedure Tfrm_fat_Itl_complementar.msk_cd_unidExit(Sender: TObject);
var Qry:TQuery;
begin
{ if msk_cd_unid.Text <> '' then
  begin
    ValCodEdt( msk_cd_unid );
    Qry := TQuery.Create(Application);
    Qry.DataBaseName := 'DBBROKER';
    Qry.Sql.Clear;
    Qry.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_cd_unid.Text+'"');
    Qry.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    Qry.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    Qry.Open;
    if Qry.RecordCount > 0 then
     begin
      edt_nm_unid.text:= Qry.Fields[0].AsString;
      abre_fatura;
     end
    else
     begin
      edt_nm_unid.Text := '';
      BoxMensagem('Código da Unidade de Negócio inválido!', 2);
      msk_cd_unid.SetFocus;
     end;
     Qry.Free;
    end
 else
  begin
   Boxmensagem('A Unidade de Negócio deve ser informado!',2);
   msk_cd_unid.SetFocus;
  end; }

  if msk_cd_unid.Text <> '' then begin
    msk_cd_unid.Text := Copy('00', 1, 2 - Length( msk_cd_unid.Text)) +  msk_cd_unid.Text;
    edt_nm_unid.text := ConsultaLookUpSQL('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_cd_unid.Text+'" ' +
                                               ' AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG FROM TUSUARIO_HABILITACAO ' +
                                               '                     WHERE CD_USUARIO ="'+str_cd_usuario+'") ', 'NM_UNID_NEG');

    if edt_nm_unid.text = '' then begin
      edt_nm_unid.Text := '';
      ShowMessage('Código da Unidade de Negócio inválido!');
      msk_cd_unid.SetFocus;
      Exit;
    end else begin
      abre_fatura;
    end;
  end else begin
    ShowMessage('A Unidade de Negócio deve ser informado!');
    msk_cd_unid.SetFocus;
  end;
  
end;

procedure Tfrm_fat_Itl_complementar.msk_cd_produtoExit(Sender: TObject);
var Qry:TQuery;
begin
{ if msk_cd_produto.Text <> '' then
  begin
    ValCodEdt( msk_cd_produto );
    Qry := TQuery.Create(Application);
    Qry.DataBaseName := 'DBBROKER';
    Qry.Sql.Clear;
    Qry.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_cd_produto.Text+'"');
    Qry.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    Qry.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    Qry.Open;

    if Qry.RecordCount > 0 then
    begin
     edt_nm_produto.text:= Qry.Fields[0].AsString;
     abre_fatura;
    end
    else
     begin
      edt_nm_produto.Text := '';
      BoxMensagem('Código do Produto inválido!', 2);
      msk_cd_produto.SetFocus;
     end;
     Qry.Free;
    end
 else
  begin
   Boxmensagem('O Produto deve ser informado!',2);
   msk_cd_produto.SetFocus;
  end; }

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
      abre_fatura
    end;
  end else begin
    ShowMessage('O Produto deve ser informado!');
    msk_cd_produto.SetFocus;
  end;

end;

procedure Tfrm_fat_Itl_complementar.btn_uni_negClick(Sender: TObject);
//var unidade:string;
begin
{unidade:=ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG');
 if unidade <>'' then
   begin
    msk_cd_unid.text:=UNIDADE;
    msk_cd_unidExit(Sender);
   end; }

  if Sender is TSpeedButton then begin
    msk_cd_unid.text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG', nil, 1, msk_cd_unid.text);
    msk_cd_unidExit(Sender);
  end else
    edt_nm_unid.text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid.text, 'NM_UNID_NEG' );


end;

procedure Tfrm_fat_Itl_complementar.btn_co_produtoClick(Sender: TObject);
//var produto:string;
begin
{produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Unidade'],'CD_PRODUTO');
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

procedure Tfrm_fat_Itl_complementar.abre_fatura;
begin

with datm_fat_Itl_complementar do
 begin
  qry_fatura_compl_.close;
  qry_fatura_compl_.ParamBYname('CD_UNID_NEG').AsString := msk_cd_unid.Text;
  qry_fatura_compl_.ParamBYname('CD_PRODUTO').AsString  := msk_cd_produto.Text;
  qry_fatura_compl_.Prepare;
  qry_fatura_compl_.Open;
 end;

end;

procedure Tfrm_fat_Itl_complementar.pgctrl_fat_complChange(Sender: TObject);
begin
edt_chave.Enabled := (pgctrl_fat_compl.ActivePage = ts_lista);
cb_ordem.Enabled  := (pgctrl_fat_compl.ActivePage = ts_lista);


btn_imprimir.Enabled  := (pgctrl_fat_compl.ActivePage = ts_dados_basicos);
btn_aprovar.Enabled   := (pgctrl_fat_compl.ActivePage = ts_dados_basicos);

if pgctrl_fat_compl.ActivePage = ts_dados_basicos then
 begin
   msk_cd_unid2.text    := msk_cd_unid.text;
   edt_nm_unid2.text    := edt_nm_unid.text;

   msk_cd_produto2.text := msk_cd_produto.text;
   edt_nm_produto2.text := edt_nm_produto.text;
   in_ctrl_edit := false;
   habilita_tp_fatura;
   in_ctrl_edit := true;

   with datm_fat_Itl_complementar do
   begin
   qry_fatura_item_.Close;
   qry_fatura_item_.ParamByName('CD_MASTER').AsString := qry_fatura_compl_CD_MASTER.AsString;
   qry_fatura_item_.ParamByName('NR_FATURA').AsString := qry_fatura_compl_NR_FATURA.AsString;
   qry_fatura_item_.Prepare;
   qry_fatura_item_.Open;
   if qry_fatura_compl_IN_FATURA.AsString <> '0' then btn_mi1(st_incluir, false, false, st_excluir);
   end;
 end;
end;

procedure Tfrm_fat_Itl_complementar.btn_incluirClick(Sender: TObject);
begin

 with datm_fat_Itl_complementar do
  begin
   qry_fatura_compl_.DisableControls;
   qry_fatura_compl_.Cancel;
   qry_fatura_compl_.Append;
   qry_fatura_compl_.EnableControls;
   qry_fatura_compl_IN_COMPLEMENTAR.AsString := '1';
   qry_fatura_compl_IN_FATURA.AsString       := '1';
   qry_fatura_compl_VL_CRE_BRASIL.AsFloat := 0;
   qry_fatura_compl_VL_DEB_BRASIL.AsFloat := 0;
   qry_fatura_compl_VL_CRE_AGENTE.AsFloat := 0;
   qry_fatura_compl_VL_DEB_AGENTE.AsFloat := 0;
  end;
 pgctrl_fat_compl.ActivePage := ts_dados_basicos;
 pgctrl_fat_complChange(NIL);
 dbedt_nr_master.Color       := clWindow;
 dbedt_nr_master.ReadOnly    := false;
 btn_co_master.Enabled       := true;
 dbedt_nr_master.Setfocus;

 btn_mi(false, st_modificar, st_modificar, false);


end;

procedure Tfrm_fat_Itl_complementar.btn_co_masterClick(Sender: TObject);
var master:string;
begin

 master:=ConsultaOnLineExSQL('SELECT M.CD_MASTER, M.NR_MASTER, M.CD_AGENTE, '+
                             '(SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_AGENTE = M.CD_AGENTE)NM_AGENTE,'+
                             '(SELECT B.AP_MOEDA FROM TMOEDA_BROKER B WHERE B.CD_MOEDA = M.CD_MOEDA) AP_MOEDA,'+
                             ' CASE '+
                             ' WHEN  M.CD_VIA_TRANSP = "01" THEN '+
                             ' (SELECT P.CD_SIGLA_CIDADE FROM TPORTO P WHERE P.CD_PORTO = M.CD_ORIGEM) '+
                             'ELSE (SELECT P.CD_SIGLA FROM TPORTO P WHERE P.CD_PORTO = M.CD_ORIGEM) END AS NM_ORIGEM,'+
                             ' CASE '+
                             ' WHEN  M.CD_VIA_TRANSP = "01" THEN '+
                             ' (SELECT P.CD_SIGLA_CIDADE FROM TPORTO P WHERE P.CD_PORTO = M.CD_DESTINO) '+
                             'ELSE (SELECT P.CD_SIGLA FROM TPORTO P WHERE P.CD_PORTO = M.CD_DESTINO) END AS NM_DESTINO'+
                             ' FROM TMASTER M ' +
                             ' WHERE M.CD_UNID_NEG = "'+msk_cd_unid2.text+'" '+
                             '   AND M.CD_PRODUTO  = "'+msk_cd_produto2.text+'" ',
                             //'   AND M.IN_ACCOUNT IN ("1","2","3","4","5", "6")',
                             'Master',['CD_MASTER','NR_MASTER', 'CD_AGENTE', 'NM_AGENTE', 'AP_MOEDA', 'NM_ORIGEM', 'NM_DESTINO'],
                             ['Registro','Nº Master', 'Cód.', 'Agente', 'Moeda', 'Origem', 'Destino'],'CD_MASTER');
 if master <>'' then
   begin
    dbedt_nr_master.text:=MASTER;
    dbedt_nr_masterExit(Sender);
   end;



end;

procedure Tfrm_fat_Itl_complementar.SpeedButton3Click(Sender: TObject);
begin
datm_fat_Itl_complementar.Free;
close;
end;

procedure Tfrm_fat_Itl_complementar.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_fat_Itl_complementar.Cancelar;
begin

 if datm_fat_Itl_complementar.qry_fatura_item_.State in [dsEdit, dsInsert] then
  begin
  datm_fat_Itl_complementar.qry_fatura_item_.Cancel;
  btn_mi1(st_incluir, false, false, st_excluir);
  end;

 if datm_fat_Itl_complementar.qry_fatura_compl_.State in [dsEdit, dsInsert] then
  begin
  datm_fat_Itl_complementar.qry_fatura_compl_.Cancel;
  btn_mi(st_incluir, false, false, st_excluir);
  dbedt_nr_master.Color       := clmenu;
  dbedt_nr_master.ReadOnly    := true;
  btn_co_master.Enabled       := false;
  end;
end;

function Tfrm_fat_Itl_complementar.Consiste: Boolean;
begin
Consiste := true;

with datm_fat_Itl_complementar do
begin
if ((qry_fatura_compl_TP_FATURA.AsString = '0') or (qry_fatura_compl_TP_FATURA.AsString = '1')) and (dbedt_nr_fatura.text = '') then
 begin
  BoxMensagem('Deve ser preenchido o Numero da Fatura',2);
  dbedt_nr_fatura.SetFocus;
  consiste := false;
  Exit;
 end;

if (qry_fatura_item_.State in [dsEdit, dsInsert]) and (dbedt_cd_item.text = '') then
 begin
  BoxMensagem('Deve ser preenchido o Item',2);
  dbedt_cd_item.Setfocus;
  consiste := false;
  Exit;
 end;



end;
end;

function Tfrm_fat_Itl_complementar.Grava: Boolean;
begin
  try
   datm_main.db_broker.StartTransaction;

   if ( datm_fat_Itl_complementar.qry_fatura_item_.State in [dsInsert, dsEdit] ) then
   begin
   datm_fat_Itl_complementar.qry_fatura_item_.Post;
   end;

   if ( datm_fat_Itl_complementar.qry_fatura_compl_.State in [dsInsert, dsEdit] ) then
   begin
   datm_fat_Itl_complementar.qry_fatura_compl_.Post;
   dbedt_nr_master.Color       := clWindow;
   dbedt_nr_master.ReadOnly    := false;
   btn_co_master.Enabled       := false
   end;
   
   datm_main.db_broker.Commit;
   habilita_tp_fatura;
   Grava := True;

   except
     on E: Exception do
     begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_fat_Itl_complementar.qry_fatura_compl_.Cancel;
        TrataErro(E);
        Grava := False;
     end;
   end;

Btn_Mi(st_incluir, False, False, st_excluir );
Btn_Mi1(st_incluir, False, False, st_excluir );
end;

function Tfrm_fat_Itl_complementar.VerAlt: Boolean;
begin

end;

procedure Tfrm_fat_Itl_complementar.dbedt_nr_masterExit(Sender: TObject);
var Qry:TQuery;
begin
 if not(datm_fat_Itl_complementar.qry_fatura_compl_.State in [dsInsert]) then exit;

 if dbedt_nr_master.text <> '' then
 begin
 Qry := TQuery.Create(application);
 Qry.DataBaseName := 'DBBROKER';
 Qry.Sql.Add('SELECT M.CD_MASTER, M.NR_MASTER, M.CD_AGENTE, (SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_AGENTE = M.CD_AGENTE)NM_AGENTE,');
 Qry.Sql.Add('(SELECT B.AP_MOEDA FROM TMOEDA_BROKER B WHERE B.CD_MOEDA = M.CD_MOEDA) AP_MOEDA,');
 Qry.Sql.Add(' CASE ');
 Qry.Sql.Add(' WHEN  M.CD_VIA_TRANSP = "1" THEN  (SELECT P.CD_SIGLA_CIDADE FROM TPORTO P WHERE P.CD_PORTO = M.CD_ORIGEM) ' );
 Qry.Sql.Add(' ELSE (SELECT P.CD_SIGLA FROM TPORTO P WHERE P.CD_PORTO = M.CD_ORIGEM) END AS NM_ORIGEM,');
 Qry.Sql.Add(' CASE ');
 Qry
 .Sql.Add(' WHEN  M.CD_VIA_TRANSP = "1" THEN ' );
 Qry.Sql.Add(' (SELECT P.CD_SIGLA_CIDADE FROM TPORTO P WHERE P.CD_PORTO = M.CD_DESTINO) ');
 Qry.Sql.Add(' ELSE (SELECT P.CD_SIGLA FROM TPORTO P WHERE P.CD_PORTO = M.CD_DESTINO) END AS NM_DESTINO');
 Qry.Sql.Add(' FROM TMASTER M ' );
 Qry.Sql.Add(' WHERE M.CD_MASTER   = "'+dbedt_nr_master.Text+'"');
 Qry.Sql.Add('   AND M.CD_UNID_NEG = "'+msk_cd_unid2.text+'" ');
 Qry.Sql.Add('   AND M.CD_PRODUTO  = "'+msk_cd_produto2.text+'" ');
 Qry.Sql.Add('   AND M.IN_ACCOUNT IN ("1","2","3","4","5", "6")');
 Qry.Open;                                                        

 if Qry.Recordcount > 0 then
  begin
   datm_fat_Itl_complementar.qry_fatura_compl_NR_MASTER.AsString  := Qry.FieldByName('NR_MASTER').AsString;
   datm_fat_Itl_complementar.qry_fatura_compl_CD_AGENTE.AsString  := Qry.FieldByName('CD_AGENTE').AsString;
   datm_fat_Itl_complementar.qry_fatura_compl_NM_AGENTE.AsString  := Qry.FieldByName('NM_AGENTE').AsString;
   datm_fat_Itl_complementar.qry_fatura_compl_AP_MOEDA.AsString   := Qry.FieldByName('AP_MOEDA').AsString;
   datm_fat_Itl_complementar.qry_fatura_compl_NM_ORIGEM.AsString  := Qry.FieldByName('NM_ORIGEM').AsString;
   datm_fat_Itl_complementar.qry_fatura_compl_NM_DESTINO.AsString := Qry.FieldByName('NM_DESTINO').AsString;
  end
 else
  begin
   BoxMensagem('Master Inválido ou não Finalizado a Remessa!',2);
   dbedt_nr_master.SetFocus;
  end;
 Qry.Free;
 end
 else
 begin
  BoxMensagem('Deve ser informado o Registro do Master',2);
  dbedt_nr_master.SetFocus;
  Exit;
 end;
end;

procedure Tfrm_fat_Itl_complementar.btn_salvarClick(Sender: TObject);
begin
 if not consiste then exit;
 if not Grava then exit;
end;

procedure Tfrm_fat_Itl_complementar.btn_CancelarClick(Sender: TObject);
begin
Cancelar;
end;

procedure Tfrm_fat_Itl_complementar.habilita_tp_fatura;
begin
with datm_fat_Itl_complementar do
begin
 rb_cre_agente.Visible := (qry_fatura_compl_TP_FATURA.AsString = '') or
                           (qry_fatura_compl_TP_FATURA.AsString = '0') or
                            (qry_fatura_compl_TP_FATURA.AsString = '1') ;
 rb_deb_agente.Visible := (qry_fatura_compl_TP_FATURA.AsString = '') or
                           (qry_fatura_compl_TP_FATURA.AsString = '0') or
                            (qry_fatura_compl_TP_FATURA.AsString = '1') ;
 rb_cre_brasil.Visible := (qry_fatura_compl_TP_FATURA.AsString = '') or
                           (qry_fatura_compl_TP_FATURA.AsString = '2') or
                            (qry_fatura_compl_TP_FATURA.AsString = '3') ;
 rb_deb_brasil.Visible := (qry_fatura_compl_TP_FATURA.AsString = '') or
                           (qry_fatura_compl_TP_FATURA.AsString = '2') or
                            (qry_fatura_compl_TP_FATURA.AsString = '3') ;


 pnl_item.Enabled      := (qry_fatura_compl_TP_FATURA.AsString = '2') or
                            (qry_fatura_compl_TP_FATURA.AsString = '3') ;

 rb_cre_agente.Checked := (qry_fatura_compl_TP_FATURA.AsString = '0');
 rb_deb_agente.Checked := (qry_fatura_compl_TP_FATURA.AsString = '1');
 rb_cre_brasil.Checked := (qry_fatura_compl_TP_FATURA.AsString = '2');
 rb_deb_brasil.Checked := (qry_fatura_compl_TP_FATURA.AsString = '3');

 if (qry_fatura_compl_TP_FATURA.AsString = '') then
  begin
   rb_cre_agente.Left := 8;
   rb_cre_agente.Top  := 8;

   rb_deb_agente.Left := 8;
   rb_deb_agente.Top  := 30;

   rb_deb_brasil.Left := 125;
   rb_deb_brasil.Top  := 30;

   rb_cre_brasil.Left := 125;
   rb_cre_brasil.Top  := 8;
  end
 else
  begin
   rb_cre_agente.Left := 8;
   rb_cre_agente.Top  := 18;

   rb_deb_agente.Left := 125;
   rb_deb_agente.Top  := 18;

   rb_cre_brasil.Left := 8;
   rb_cre_brasil.Top  := 18;

   rb_deb_brasil.Left := 125;
   rb_deb_brasil.Top  := 18;
  end;
 end;
end;
procedure Tfrm_fat_Itl_complementar.dbr_tp_faturaChange(Sender: TObject);
begin
  if datm_fat_Itl_complementar.qry_fatura_compl_.State in [dsEdit, dsInsert] then
    Btn_Mi(false, st_modificar, st_modificar,False );

end;

procedure Tfrm_fat_Itl_complementar.rb_cre_agenteClick(Sender: TObject);
begin
 dbedt_vl_deb_br.Visible := (rb_deb_brasil.Checked);
 dbedt_vl_cre_br.Visible := (rb_cre_brasil.Checked);
 dbedt_vl_deb_ag.Visible := (rb_deb_agente.Checked);
 dbedt_vl_cre_ag.Visible := (rb_cre_agente.Checked);

 dbedt_nr_fatura.Color   := clMenu;
 dbedt_dt_fatura.Color   := clMenu;

 dbedt_nr_fatura.ReadOnly:= (rb_cre_brasil.Checked) or (rb_deb_brasil.Checked);
 dbedt_dt_fatura.ReadOnly:= (rb_cre_brasil.Checked) or (rb_deb_brasil.Checked);

 if (rb_deb_agente.Checked) or (rb_cre_agente.Checked) then
  begin
   dbedt_nr_fatura.Color   := clWindow;
   dbedt_dt_fatura.Color   := clWindow;
  end;

 pnl_item.Enabled        := (datm_fat_Itl_complementar.qry_fatura_compl_TP_FATURA.AsString = '2') or
                             (datm_fat_Itl_complementar.qry_fatura_compl_TP_FATURA.AsString = '3') ;



 if not in_ctrl_edit then exit;

 if not(datm_fat_Itl_complementar.qry_fatura_compl_.State in [dsEdit, dsInsert]) then
    datm_fat_Itl_complementar.qry_fatura_compl_.Edit;

 if rb_cre_agente.Checked then datm_fat_Itl_complementar.qry_fatura_compl_TP_FATURA.AsString := '0' else
 if rb_deb_agente.Checked then datm_fat_Itl_complementar.qry_fatura_compl_TP_FATURA.AsString := '1' else
 if rb_cre_brasil.Checked then datm_fat_Itl_complementar.qry_fatura_compl_TP_FATURA.AsString := '2' else
 if rb_deb_brasil.Checked then datm_fat_Itl_complementar.qry_fatura_compl_TP_FATURA.AsString := '3';




 btn_mi(false, st_modificar, st_modificar, false);

end;

procedure Tfrm_fat_Itl_complementar.btn_incluir1Click(Sender: TObject);
begin
 with datm_fat_Itl_complementar do
  begin
   qry_fatura_item_.DisableControls;
   qry_fatura_item_.Cancel;
   qry_fatura_item_.Append;
   qry_fatura_item_.EnableControls;
   qry_fatura_item_VL_ITEM.AsFloat := 0;
   dbedt_cd_item.SetFocus;
   btn_mi1(false, st_modificar, st_modificar, false);
  end;

end;

procedure Tfrm_fat_Itl_complementar.btn_mi1(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir1.Enabled  := Inc;
  btn_excluir1.Enabled  := Exc;
  btn_salvar1.Enabled   := Salv;
  btn_Cancelar1.Enabled := Canc;
end;

procedure Tfrm_fat_Itl_complementar.dbedt_cd_itemChange(Sender: TObject);
begin
 if datm_fat_Itl_complementar.qry_fatura_item_.State in [dsEdit, dsInsert] then
    btn_mi1(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_fat_Itl_complementar.btn_co_itemClick(Sender: TObject);
begin
 with datm_fat_Itl_complementar do
 begin
 if not(qry_fatura_item_.State in [dsEdit, dsInsert]) then
   qry_fatura_item_.Edit;

  qry_fatura_item_CD_ITEM.AsString := ConsultaOnLineExSQL('SELECT I.NM_ITEM, I.CD_ITEM ' +
                                                          'FROM TITEM I ' +
                                                          'WHERE I.CD_TIPO_ITEM = "D" AND '+
                                                          'I.IN_ATIVO = "1" AND  TP_ITEM IN( "0", "1","2") '+
                                                          ' ORDER BY I.NM_ITEM ','Item', ['NM_ITEM' ,'CD_ITEM'],
                                                          ['Item', 'Codigo'],'CD_ITEM');
 dbedt_cd_item.SetFocus;
 dbedt_cd_itemExit(nil);


 end;
end;

procedure Tfrm_fat_Itl_complementar.dbedt_cd_itemExit(Sender: TObject);
begin
 if not(datm_fat_Itl_complementar.qry_fatura_item_.State in [dsEdit, dsInsert]) then exit;

 if dbedt_cd_item.text <> '' then
  begin
   if dbedt_nm_item.text = '' then
    begin
     BoxMensagem('Código do Item Inválido',2);
     dbedt_cd_item.SetFocus;
    end;
  end;
end;

procedure Tfrm_fat_Itl_complementar.btn_aprovarClick(
  Sender: TObject);
var
  in_fatura, Data :String;
  Tarifa :Tquery;
begin
with  datm_fat_Itl_complementar do
begin
 if (qry_fatura_compl_IN_FATURA.AsString <> '0') and ((rb_cre_brasil.Checked) or (rb_deb_brasil.Checked)) then
  begin
   BoxMensagem('Esta Fatura deve ser impressa',2);
   Exit;
  end;

 if not(qry_fatura_compl_DT_CONTABILIZACAO.IsNull) then
  begin
   BoxMensagem('Fatura já Enviada para Financeiro',2);
   Exit;
  end;


  //********VERIFICA TARIFARIO PARA CONVERSAO DE VALORES

 Tarifa := Tquery.Create(application);
 Tarifa.DataBaseName := 'DBBROKER';
 IF (qry_fatura_compl_TP_PRODUTO.AsString = '02')and (qry_fatura_compl_CD_VIA_TRANSP.AsString = '04')then
 begin
  Tarifa.Sql.Add('SELECT COUNT(*) FROM TTAXA_IATA WHERE CD_MOEDA = "'+qry_fatura_compl_CD_MOEDA.AsString+'"');
  Tarifa.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datetimetostr(qry_fatura_compl_DT_EMISSAO_DTA.AsDatetime)+'",103)  ')
 end
 else
 begin
  IF (qry_fatura_compl_TP_PRODUTO.AsString = '02')then Data  := qry_fatura_compl_DT_EMBARQUE.AsString  //DATA PARA EXP MARITIMA
  ELSE Data  := qry_fatura_compl_DT_CHEGADA.AsString;//DATA PARA IMP AEREA E MARITIMA
  Tarifa.Sql.Add('SELECT COUNT(*) FROM TTAXA_FRETE WHERE CD_MOEDA = "'+qry_fatura_compl_CD_MOEDA.AsString+'"');
  Tarifa.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+Data+'",103)  ')
 end;

 Tarifa.Open;
 if  Tarifa.Fields[0].AsInteger = 0 then
 begin
  BoxMensagem('Não existe Tarida para a Moeda',2);
  Tarifa.Free;
  Exit;
 end;
Tarifa.Free;


 if (qry_fatura_compl_TP_FATURA.AsString = '0') or (qry_fatura_compl_TP_FATURA.AsString = '3') then  in_fatura := '4';
 if (qry_fatura_compl_TP_FATURA.AsString = '1') or (qry_fatura_compl_TP_FATURA.AsString = '2') then  in_fatura := '3';


 try
 datm_main.db_broker.StartTransaction;

 if not(qry_fatura_compl_.State in [dsEdit]) then  qry_fatura_compl_.Edit;
 qry_fatura_compl_DT_CONTABILIZACAO.AsdateTime := dt_server;
 qry_fatura_compl_IN_FATURA.AsString           := '0';
 qry_fatura_compl_.Post;

 CloseStoredProc( sp_calc_fat_master_compl );
 sp_calc_fat_master_compl.ParamByName('@CD_MASTER').AsString     := qry_fatura_compl_CD_MASTER.AsString;
 sp_calc_fat_master_compl.ParamByName('@cd_fatura').AsString     := qry_fatura_compl_CD_FATURA.AsString;
 sp_calc_fat_master_compl.ParamByName('@cd_via_transp').AsString := qry_fatura_compl_CD_VIA_TRANSP.AsString;
 sp_calc_fat_master_compl.ParamByName('@in_fatura').AsString     := in_fatura;
 ExecStoredProc(sp_calc_fat_master_compl);
 CloseStoredProc( sp_calc_fat_master_compl );



 if in_integracao_contabil= '1' then
 begin
 CloseStoredProc( sp_cont_Fat_itl_master_compl );
 sp_cont_Fat_itl_master_compl.ParamByName('@CD_MASTER').AsString      := qry_fatura_compl_CD_MASTER.AsString;
 sp_cont_Fat_itl_master_compl.ParamByName('@cd_fatura').AsString      := qry_fatura_compl_CD_FATURA.AsString;
 sp_cont_Fat_itl_master_compl.ParamByName('@dt_aprovacao').AsDateTime := dt_server;
 ExecStoredProc(sp_cont_Fat_itl_master_compl);
 CloseStoredProc( sp_cont_Fat_itl_master_compl );
 end;
 datm_main.db_broker.Commit;
 habilita_campos(qry_fatura_compl_IN_FATURA.AsString = '0');
 except
   on E: Exception do
   begin
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    qry_fatura_compl_.Cancel;
    TrataErro(E);
   end;
 end;            
end;
end;

procedure Tfrm_fat_Itl_complementar.btn_imprimirClick(Sender: TObject);
begin
if (rb_cre_agente.Checked) or (rb_deb_agente.Checked) then
 begin
 BoxMensagem('Apenas pode ser impressa as Faturas Originados no País!',2);
 Exit;
 end;

with datm_fat_Itl_complementar do
  begin
  qry_rel_imp_fat_.Close;
  qry_rel_imp_fat_.ParamByname('CD_MASTER').AsString := qry_fatura_compl_CD_MASTER.AsString;
  qry_rel_imp_fat_.ParamByname('NR_FATURA').AsString := qry_fatura_compl_NR_FATURA.AsString;
  qry_rel_imp_fat_.Prepare;
  qry_rel_imp_fat_.Open;

  qry_rel_imp_fat_item_.Close;
  qry_rel_imp_fat_item_.Prepare;
  qry_rel_imp_fat_item_.Open;

  Application.CreateForm(TFrm_impressao, Frm_impressao );

  Frm_impressao.cd_agente     := qry_fatura_compl_CD_AGENTE.AsString;
  Frm_impressao.cd_unid_neg   := msk_cd_unid2.text;
  Frm_impressao.cd_produto    := msk_cd_produto2.text;
  Frm_impressao.cd_modulo     := '3310';
  Frm_impressao.ShowModal;

  if not(BoxMensagem('Impressão realizada com Sucesso?',1)) then exit;
  if not(qry_fatura_compl_.State in [dsEdit]) then  qry_fatura_compl_.Edit;
  qry_fatura_compl_IN_FATURA.AsString := '0';
  qry_fatura_compl_.Post;
  habilita_campos(qry_fatura_compl_IN_FATURA.AsString = '0');

 end;
end;

procedure Tfrm_fat_Itl_complementar.habilita_campos(Hab: Boolean);
var I:Integer;
begin
for i := 0 to ComponentCount - 1 do
begin
 if ( Components[i] is TDBGrid ) then
 begin
  if TDBGrid( Components[i] ).Parent <> ts_lista then TDBGrid( Components[i] ).ReadOnly := (hab);
 end;

 if ( Components[i] is TDBEdit ) then
 begin
  if TDBGrid( Components[i] ).Color <> clMenu then    TDBEdit( Components[i] ).ReadOnly := hab;
 end;

 if ( Components[i] is TSpeedButton ) and (TSpeedButton( Components[i] ).Parent = Panel5)then
  TSpeedButton( Components[i] ).Enabled := not hab;

 if ( Components[i] is TRadioGroup ) then
  TDBRadioGroup( Components[i] ).REadOnly := hab;

 if ( Components[i] is TDBMemo ) then TDBMemo( Components[i] ).ReadOnly := hab;
end;
end;

procedure Tfrm_fat_Itl_complementar.btn_excluir1Click(Sender: TObject);
begin
if datm_fat_Itl_complementar.qry_fatura_item_.IsEmpty then
begin
 BoxMensagem( 'Não existe Item para ser excluído!', 2 );
 exit;
end;

try
 datm_main.db_broker.StartTransaction;
 datm_fat_Itl_complementar.qry_fatura_item_.Delete;
 datm_main.db_broker.Commit;
except
 on E: Exception do
  begin
   if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
   datm_fat_Itl_complementar.qry_fatura_item_.Cancel;
   TrataErro(E);
  end;
end;


end;

procedure Tfrm_fat_Itl_complementar.cb_ordemChange(Sender: TObject);
begin
edt_chave.Text := '';
edt_chave.SetFocus;
datm_fat_Itl_complementar.qry_fatura_compl_.Close;
CASE cb_ordem.ItemIndex OF
 0: datm_fat_Itl_complementar.qry_fatura_compl_.SQL[23]:=' M.CD_MASTER';
 1: datm_fat_Itl_complementar.qry_fatura_compl_.SQL[23]:=' M.NR_MASTER';
 2: datm_fat_Itl_complementar.qry_fatura_compl_.SQL[23]:=' F.NR_FATURA';
 3: datm_fat_Itl_complementar.qry_fatura_compl_.SQL[23]:=' M.CD_AGENTE';
 4: datm_fat_Itl_complementar.qry_fatura_compl_.SQL[23]:=' NM_AGENTE';
end;
datm_fat_Itl_complementar.qry_fatura_compl_.Prepare;
datm_fat_Itl_complementar.qry_fatura_compl_.Open;
end;

procedure Tfrm_fat_Itl_complementar.edt_chaveChange(Sender: TObject);
begin
 localiza (datm_fat_Itl_complementar.qry_fatura_compl_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_fat_Itl_complementar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_fat_Itl_complementar.qry_fatura_compl_.Close;
  Action := caFree;
end;

procedure Tfrm_fat_Itl_complementar.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then close;
end;

procedure Tfrm_fat_Itl_complementar.FormShow(Sender: TObject);
begin
  pnl_master.Color := clMenuBroker;
  shp1.Brush.Color := clPnlClaroBroker;
end;

procedure Tfrm_fat_Itl_complementar.msk_cd_unidKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then begin
    if Sender = msk_cd_unid     then btn_uni_negClick(btn_uni_neg);
    if Sender = msk_cd_produto  then btn_co_produtoClick(btn_co_produto);
    if Sender = dbedt_nr_master then btn_co_masterClick(btn_co_master);
    if Sender = dbedt_cd_item   then btn_co_itemClick(btn_co_item);
  end;

end;

end.

