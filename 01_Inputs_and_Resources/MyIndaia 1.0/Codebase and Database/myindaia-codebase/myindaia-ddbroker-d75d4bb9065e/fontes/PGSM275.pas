unit PGSM275;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Menus, RxDBComb, ExtCtrls, Mask, Grids,
  DBGrids, Db, DBTables, ComCtrls;

type
  Tfrm_item_contabil = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    pgctrl_item_contabil: TPageControl;
    ts_lista: TTabSheet;
    ts_contabilizacao: TTabSheet;
    dbgrid_item_contabil: TDBGrid;
    MainMenu1: TMainMenu;
    mi_Incluir: TMenuItem;
    mi_Salvar: TMenuItem;
    mi_Cancelar: TMenuItem;
    mi_Excluir: TMenuItem;
    mi_Sair: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    rd7: TDBRadioGroup;
    bdedt_outro_receb_deb_baixa: TDBEdit;
    rd8: TDBRadioGroup;
    bdedt_outro_receb_cre_baixa: TDBEdit;
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    dbedt_nm_item: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    rd1: TDBRadioGroup;
    rd2: TDBRadioGroup;
    bdedt_outro_pagto_deb_prov: TDBEdit;
    bdedt_outro_pagto_cre_prov: TDBEdit;
    DBEdit10: TDBEdit;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    Label16: TLabel;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    rd3: TDBRadioGroup;
    bdedt_outro_pagto_deb_baixa: TDBEdit;
    bdedt_outro_pagto_cre_baixa: TDBEdit;
    DBEdit12: TDBEdit;
    Label17: TLabel;
    DBEdit13: TDBEdit;
    Label18: TLabel;
    rd4: TDBRadioGroup;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    rd5: TDBRadioGroup;
    bdedt_outro_receb_deb_prov: TDBEdit;
    rd6: TDBRadioGroup;
    bdedt_outro_receb_cre_prov: TDBEdit;
    DBEdit14: TDBEdit;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    Label20: TLabel;
    DBEdit16: TDBEdit;
    Label21: TLabel;
    DBEdit17: TDBEdit;
    Label22: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbgrid_item_contabilDblClick(Sender: TObject);
    procedure dbgrid_item_contabilKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_nm_itemChange(Sender: TObject);
    procedure rd1Click(Sender: TObject);
    procedure rd2Click(Sender: TObject);
    procedure rd3Click(Sender: TObject);
    procedure rd4Click(Sender: TObject);
    procedure rd5Click(Sender: TObject);
    procedure rd6Click(Sender: TObject);
    procedure rd7Click(Sender: TObject);
    procedure rd8Click(Sender: TObject);
    procedure pgctrl_item_contabilChange(Sender: TObject);
    procedure pgctrl_item_contabilChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa, st_modulo, st_rotina : String;
    cd_acesso, cd_aux : String[1];
    st_modificar, st_incluir, st_excluir : Boolean;
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
  frm_item_contabil: Tfrm_item_contabil;

implementation

uses GSMLIB, PGGP017, PGSM320;



{$R *.DFM}

procedure Tfrm_item_contabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
datm_item_contabil.qry_item_contabil_.Close;
datm_item_contabil.Free;
//  Action := caFree;
end;

procedure Tfrm_item_contabil.btn_incluirClick(
  Sender: TObject);
begin
  pgctrl_item_contabil.ActivePage := ts_contabilizacao;
  dbedt_nm_item.SetFocus;

//  datm_item_contabil.qry_item_contabil_.DisableControls;
//  datm_item_contabil.qry_item_contabil_.Cancel;
  datm_item_contabil.qry_item_contabil_.Insert;
//  datm_item_contabil.qry_item_contabil_.EnableControls;
  datm_item_contabil.qry_item_contabil_IN_CONTABILIZA.AsString := '1';

  datm_item_contabil.qry_item_contabil_IN_PAGTO_DEB_PROVISAO.AsString := '7';
  datm_item_contabil.qry_item_contabil_IN_PAGTO_CRE_PROVISAO.AsString := '7';
  datm_item_contabil.qry_item_contabil_IN_PAGTO_DEB_BAIXA.AsString    := '7';
  datm_item_contabil.qry_item_contabil_IN_PAGTO_CRE_BAIXA.AsString    := '7';
  datm_item_contabil.qry_item_contabil_IN_RECEB_DEB_PROVISAO.AsString := '7';
  datm_item_contabil.qry_item_contabil_IN_RECEB_CRE_PROVISAO.AsString := '7';
  datm_item_contabil.qry_item_contabil_IN_RECEB_DEB_BAIXA.AsString    := '7';
  datm_item_contabil.qry_item_contabil_IN_RECEB_CRE_BAIXA.AsString    := '7';
  
  btn_mi(false, st_modificar, st_modificar, false);

end;

procedure Tfrm_item_contabil.btn_mi(Inc, Salv, Canc,
  Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;

end;

procedure Tfrm_item_contabil.Cancelar;
begin
 if datm_item_contabil.qry_item_contabil_.State in[dsEdit,dsInsert] then
    datm_item_contabil.qry_item_contabil_.Cancel;

btn_mi(st_incluir,false,false,st_excluir);    
end;

function Tfrm_item_contabil.Consiste: Boolean;
begin
 Consiste := true;

 if dbedt_nm_item.text = '' then
  begin
   BoxMensagem('Descrição do Item Contábil deve ser preenchida!', 2);
   pgctrl_item_contabil.ActivePage := ts_contabilizacao;
   dbedt_nm_item.SetFocus;
   Consiste := False;
   Exit;
  end;

end;

function Tfrm_item_contabil.Grava: Boolean;
begin

  try
   datm_main.db_broker.StartTransaction;
   if datm_item_contabil.qry_item_contabil_.State in [dsEdit,dsInsert] then
      datm_item_contabil.qry_item_contabil_.Post;

    datm_main.db_broker.Commit;
    Grava := True;
//    datm_item_contabil.qry_item_contabil_.Close;
//    datm_item_contabil.qry_item_contabil_.Open;
    
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_item_contabil.qry_item_contabil_.Cancel;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_item_contabil.VerAlt: Boolean;
begin

  VerAlt := True;
  if ( ( datm_item_contabil.qry_item_contabil_.State in [dsEdit] ) and st_modificar ) or
     ( datm_item_contabil.qry_item_contabil_.State in [dsInsert] ) then
    begin
    if BoxMensagem('O Cadastro de Evento Contábil foi alterado.' + #13#10 +
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


procedure Tfrm_item_contabil.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);
  Application.CreateForm(Tdatm_item_contabil, datm_item_contabil);

  a_str_indices[0] := 'CD_ITEM_CONTABIL';
  a_str_indices[1] := 'NM_ITEM_CONTABIL';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;


  datm_item_contabil.qry_item_contabil_.Close;
  datm_item_contabil.qry_item_contabil_.Prepare;
  datm_item_contabil.qry_item_contabil_.Open;

  pgctrl_item_contabil.ActivePage := ts_lista;

  btn_mi(st_incluir,false,false,st_excluir);
end;

procedure Tfrm_item_contabil.btn_salvarClick(
  Sender: TObject);
begin
if not Consiste then exit;
if not Grava then exit;
end;

procedure Tfrm_item_contabil.btn_cancelarClick(
  Sender: TObject);
begin
Cancelar;
end;

procedure Tfrm_item_contabil.btn_sairClick(Sender: TObject);
begin

Close;
end;

procedure Tfrm_item_contabil.btn_excluirClick(
  Sender: TObject);
begin
 if BoxMensagem( 'Este item será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;

    datm_item_contabil.qry_item_contabil_.Delete;

    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_item_contabil.qry_item_contabil_.Cancel;
      TrataErro(E);
    end;
  end;

  pgctrl_item_contabil.ActivePage := ts_lista;

end;

procedure Tfrm_item_contabil.edt_chaveChange(
  Sender: TObject);
begin
 Localiza(datm_item_contabil.qry_item_contabil_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
end;

procedure Tfrm_item_contabil.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_item_contabil.qry_item_contabil_CD_ITEM_CONTABIL.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_item_contabil.qry_item_contabil_.Close;
  datm_item_contabil.qry_item_contabil_.SQL[8] := a_str_indices[cb_ordem.ItemIndex];
  datm_item_contabil.qry_item_contabil_.Open;
  Localiza(datm_item_contabil.qry_item_contabil_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;

end;

procedure Tfrm_item_contabil.dbgrid_item_contabilDblClick(Sender: TObject);
begin
if lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_item_contabil.qry_item_contabil_CD_ITEM_CONTABIL.AsString;
    except
      try
        Cons_Online_Texto := datm_item_contabil.qry_item_contabil_CD_ITEM_CONTABIL.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Item Contabil !', 2);
      end;
    end;
    Close;
  end;

end;

procedure Tfrm_item_contabil.dbgrid_item_contabilKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key = #13 then dbgrid_item_contabilDblClick(Sender);
end;

procedure Tfrm_item_contabil.edt_chaveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key = 13 then dbgrid_item_contabilDblClick(Sender);
end;

procedure Tfrm_item_contabil.dbedt_nm_itemChange(Sender: TObject);
begin
  if datm_item_contabil.qry_item_contabil_.State in [dsEdit, dsInsert] then
    btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_item_contabil.rd1Click(Sender: TObject);
begin
  if rd1.ItemIndex = 5 then
    bdedt_outro_pagto_deb_prov.Enabled  :=true
  else
    bdedt_outro_pagto_deb_prov.Enabled  :=false;

// if (datm_item_contabil.qry_item_contabil_.State in [dsEdit, dsInsert]) and (rd1.ItemIndex = 5) then
//    datm_item_contabil.qry_item_contabil_NR_OUTRO_PAGTO_DEB_PROVISAO.AsString := '';

end;

procedure Tfrm_item_contabil.rd2Click(Sender: TObject);
begin
 if rd2.ItemIndex = 5 then
    bdedt_outro_pagto_cre_prov.Enabled  :=true
  else
    bdedt_outro_pagto_cre_prov.Enabled  :=false;

// if (datm_item_contabil.qry_item_contabil_.State in [dsEdit, dsInsert]) and (rd2.ItemIndex = 5) then
//    datm_item_contabil.qry_item_contabil_NR_OUTRO_PAGTO_CRE_PROVISAO.AsString := '';
end;

procedure Tfrm_item_contabil.rd3Click(Sender: TObject);
begin
 if rd3.ItemIndex = 5 then
    bdedt_outro_pagto_deb_baixa.Enabled  :=true
  else
    bdedt_outro_pagto_deb_baixa.Enabled  :=false;

// if (datm_item_contabil.qry_item_contabil_.State in [dsEdit, dsInsert]) and (rd3.ItemIndex = 5) then
//    datm_item_contabil.qry_item_contabil_NR_OUTRO_PAGTO_DEB_BAIXA.AsString := '';
end;

procedure Tfrm_item_contabil.rd4Click(Sender: TObject);
begin
 if rd4.ItemIndex = 5 then
    bdedt_outro_pagto_cre_baixa.Enabled  :=true
  else
    bdedt_outro_pagto_cre_baixa.Enabled  :=false;

// if (datm_item_contabil.qry_item_contabil_.State in [dsEdit, dsInsert]) and (rd4.ItemIndex = 5) then
//    datm_item_contabil.qry_item_contabil_NR_OUTRO_PAGTO_CRE_BAIXA.AsString := '';
end;

procedure Tfrm_item_contabil.rd5Click(Sender: TObject);
begin
 if rd5.ItemIndex = 5 then
    bdedt_outro_receb_deb_prov.Enabled  :=true
  else
    bdedt_outro_receb_deb_prov.Enabled  :=false;

// if (datm_item_contabil.qry_item_contabil_.State in [dsEdit, dsInsert]) and (rd5.ItemIndex = 5) then
//    datm_item_contabil.qry_item_contabil_NR_OUTRO_RECEB_DEB_PROVISAO.AsString := '';

end;

procedure Tfrm_item_contabil.rd6Click(Sender: TObject);
begin
 if rd6.ItemIndex = 5 then
    bdedt_outro_receb_cre_prov.Enabled  := true
  else
    bdedt_outro_receb_cre_prov.Enabled  :=false;

 //if (datm_item_contabil.qry_item_contabil_.State in [dsEdit, dsInsert]) and (rd6.ItemIndex = 5) then
 //   datm_item_contabil.qry_item_contabil_NR_OUTRO_RECEB_CRE_PROVISAO.AsString := '';
end;

procedure Tfrm_item_contabil.rd7Click(Sender: TObject);
begin
 if rd7.ItemIndex = 5 then
    bdedt_outro_receb_deb_baixa.Enabled  :=true
  else
    bdedt_outro_receb_deb_baixa.Enabled  :=false;

// if (datm_item_contabil.qry_item_contabil_.State in [dsEdit, dsInsert]) and (rd7.ItemIndex = 5) then
//    datm_item_contabil.qry_item_contabil_NR_OUTRO_RECEB_DEB_BAIXA.AsString := '';
end;

procedure Tfrm_item_contabil.rd8Click(Sender: TObject);
begin
 if rd8.ItemIndex = 5 then
    bdedt_outro_receb_cre_baixa.Enabled  :=true
  else
    bdedt_outro_receb_cre_baixa.Enabled  :=false;
// if (datm_item_contabil.qry_item_contabil_.State in [dsEdit, dsInsert]) and (rd8.ItemIndex = 5) then
//    datm_item_contabil.qry_item_contabil_NR_OUTRO_RECEB_CRE_BAIXA.AsString := '';
end;

procedure Tfrm_item_contabil.pgctrl_item_contabilChange(Sender: TObject);
begin
 rd1Click(nil);
 rd2Click(nil);
 rd3Click(nil);
 rd4Click(nil);
 rd5Click(nil);
 rd6Click(nil);
 rd7Click(nil);
 rd8Click(nil);
end;

procedure Tfrm_item_contabil.pgctrl_item_contabilChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 AllowChange := VerAlt;
end;

end.
