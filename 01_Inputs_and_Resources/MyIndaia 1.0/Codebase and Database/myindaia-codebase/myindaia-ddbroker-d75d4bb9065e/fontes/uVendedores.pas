(*******************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGSM257.PAS - frm_vendedores

AUTOR: Ricardo Giacomi Lopes

DATA: 29/05/2002

Manutenção: Ricardo Giacomi Lopes
Atualizada por: José Roberto N. Bueno

Data: 01/07/2002 - XXXXXXXX - Cadastro de Vendedores

********************************************************************************)

unit uVendedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Menus, Spin, Mask, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, ToolEdit, RXDBCtrl,DBTables, Funcoes;


type
  Tfrm_vendedores = class(TForm)
    pgctrl_vendedores: TPageControl;
    ts_lista: TTabSheet;
    dbg_vendedores: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_ag: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    btn_co_cidade: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dbedt_cd_vendedor: TDBEdit;
    dbedt_nm_vendedor: TDBEdit;
    dbedt_look_nm_pais: TDBEdit;
    dbedt_nr_cep: TDBEdit;
    dbedt_cd_cidade: TDBEdit;
    dbedt_look_nm_cidade: TDBEdit;
    dbedt_nm_uf: TDBEdit;
    dbedt_nr_fax: TDBEdit;
    dbedt_ds_email: TDBEdit;
    dbedt_ds_homepage: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_btn_ag: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    Label6: TLabel;
    dbedt_ds_endereco: TDBEdit;
    Label9: TLabel;
    dbedt_nr_complem: TDBEdit;
    Label10: TLabel;
    dbedt_nm_bairro: TDBEdit;
    dbedt_cd_pais: TDBEdit;
    btn_co_pais: TSpeedButton;
    ts_contato: TTabSheet;
    dbg_contato: TDBGrid;
    btn_co_uni_neg: TSpeedButton;
    Label54: TLabel;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    GroupBox1: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    DBLookupComboBox8: TDBLookupComboBox;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Panel1: TPanel;
    btn_co_unid_neg: TSpeedButton;
    Label55: TLabel;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    Panel2: TPanel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    dbedt_nm_contato: TDBEdit;
    dbedt_cd_contato: TDBEdit;
    dbedt_nr_fone_contato: TDBEdit;
    dbedt_ds_email_contato: TDBEdit;
    dbedt_ds_cargo_contato: TDBEdit;
    dbedt_ds_depto_contato: TDBEdit;
    procedure mi_sairClick(Sender: TObject);
    procedure mi_excluirClick(Sender: TObject);
    procedure mi_cancelarClick(Sender: TObject);
    procedure mi_salvarClick(Sender: TObject);
    procedure mi_incluirClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_nm_vendedorChange(Sender: TObject);
    procedure btn_co_cidadeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pgctrl_vendedoresChange(Sender: TObject);
    procedure pgctrl_vendedoresChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbg_vendedoresDblClick(Sender: TObject);
    procedure dbg_vendedoresKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_paisClick(Sender: TObject);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure dbedt_cd_paisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_cidadeExit(Sender: TObject);
    procedure dbedt_cd_cidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure dbg_contatoDblClick(Sender: TObject);
    procedure dbg_contatoKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_contatoChange(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure btn_co_uni_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);


  private
    { Private declarations }
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60]; // trabalha c/ edt_chave
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir: Boolean;

    procedure Cancelar;
    function Consiste : Boolean;
    function Grava    : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    function VerAlt   : Boolean;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );

  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_vendedores: Tfrm_vendedores;

implementation

uses GSMLIB, PGGP001, PGGP017, dVendedores, PGSM014, PGSM096, PGSM148, PGSM108, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_vendedores.mi_sairClick(Sender: TObject);
begin
  VerAlt;
  close;
end;

procedure Tfrm_vendedores.mi_excluirClick(Sender: TObject);
begin
  { para o botao excluir no campo compromisso não possue execução}
  if (pgctrl_vendedores.ActivePage = ts_dados_basicos) or (pgctrl_vendedores.ActivePage = ts_lista) then
  begin
    if datm_vendedores.qry_vendedor_.IsEmpty then
    begin
      BoxMensagem( 'Não existe Vendedor para ser excluído!', 2 );
      exit;
    end;
    if BoxMensagem( 'Este vendedor será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_vendedores.qry_vendedor_.Delete;
        datm_main.db_broker.Commit;
      except
      on E: Exception do
        begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_vendedores.qry_vendedor_.Cancel;
        TrataErro(E);
        end;
      end;
    pgctrl_vendedores.ActivePage := ts_lista;
  end;


  if pgctrl_vendedores.ActivePage = ts_contato then
  begin
    if BoxMensagem( 'Este Contato será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_vendedores.qry_contato_.Delete;
        datm_main.db_broker.Commit;
     except
      on E: Exception do
        begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_vendedores.qry_contato_.Cancel;
        TrataErro(E);
        end;
     end;
   pgctrl_vendedores.ActivePage := ts_contato;
  end;


end;

procedure Tfrm_vendedores.mi_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

function Tfrm_vendedores.VerAlt: Boolean;
begin
  VerAlt := True;
  if ( ( datm_vendedores.qry_vendedor_.State in [dsEdit] ) and st_modificar ) or
     ( datm_vendedores.qry_vendedor_.State in [dsInsert] ) then
    begin
    if BoxMensagem('O Cadastro de Vendedor foi alterado.' + #13#10 +
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

procedure Tfrm_vendedores.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
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

procedure Tfrm_vendedores.Cancelar;
begin
 if (pgctrl_vendedores.ActivePage = ts_dados_basicos)then
    begin
       try
         if datm_vendedores.qry_vendedor_.State in [dsInsert, dsEdit] then
          begin
            datm_vendedores.qry_vendedor_.Cancel;
            VerificaCamposTag(frm_vendedores, [pnl_ag], false);
            pgctrl_vendedores.ActivePage := ts_dados_basicos;
            dbedt_nm_vendedor.SetFocus;
          end;
      except
         BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente!', 2 );
      end;
     Btn_Mi(st_incluir, False, False, st_excluir );
    end;
 if (pgctrl_vendedores.ActivePage = ts_contato)then
     begin
       try
         if datm_vendedores.qry_contato_.State in [dsInsert, dsEdit] then
          begin
            datm_vendedores.qry_contato_.Cancel;
            pgctrl_vendedores.ActivePage := ts_contato;
            VerificaCamposTag(frm_vendedores, [panel2], false);
            dbedt_nm_contato.SetFocus;
          end;
      except
         BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente!', 2 );
      end;
   Btn_Mi(st_incluir, False, False, st_excluir );
    end;

end;

procedure Tfrm_vendedores.mi_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;

end;

function Tfrm_vendedores.Consiste : Boolean; //usado para campos que não
begin                                          //devem ficar em branco
 { Consiste := False;

  if dbedt_cd_unid_neg.text = '' then
   begin
         BoxMensagem('Deve ser inserido o Código da Unidade!', 2);
         exit;
   end;

  if pgctrl_vendedores.ActivePage = ts_dados_basicos then
    if (dbedt_nm_vendedor.Text = '') and (dbedt_nm_vendedor.Enabled= true)then
      begin
        BoxMensagem('Campo Nome deve ser preenchido!', 2);
        pgctrl_vendedores.ActivePage := ts_dados_basicos;
        dbedt_nm_vendedor.SetFocus;
        Consiste := False;
        Exit;
      end;


  if pgctrl_vendedores.ActivePage = ts_contato then
     if dbedt_nm_contato.Text = '' then
         begin
        BoxMensagem('Campo Nome deve ser preenchido!', 2);
        pgctrl_vendedores.ActivePage := ts_contato;
        dbedt_nm_contato.SetFocus;
        Consiste := False;
        Exit;
      end;
  Consiste := True; }

  Consiste := True;
  if pgctrl_vendedores.ActivePage = ts_dados_basicos then
    if not VerificaCamposTag(frm_vendedores, [pnl_ag], true) then
      Consiste := False;
  if pgctrl_vendedores.ActivePage = ts_contato then
    if not VerificaCamposTag(frm_vendedores, [Panel2], true) then
      Consiste := False;


end;

function Tfrm_vendedores.Grava : Boolean;     //USAR

begin
  if (pgctrl_vendedores.ActivePage = ts_contato) then
    begin
      // P/ query_contato_
         try
                datm_main.db_broker.StartTransaction;
                if ( datm_vendedores.qry_contato_.State in [dsInsert, dsEdit] ) then
                   begin
                        datm_vendedores.qry_contato_.Post;
                        Pesquisa := datm_vendedores.qry_contato_CD_VENDEDOR.AsString;
                        datm_vendedores.qry_contato_.Close;
                        datm_vendedores.qry_contato_.Prepare;
                        datm_vendedores.qry_contato_.Open;
                        Localiza(datm_vendedores.qry_contato_, Pesquisa, a_str_indices[0] );
                   end;
                   datm_main.db_broker.Commit;
                   Grava := True;

                   except
                     on E: Exception do
                     begin
                        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                        datm_vendedores.qry_contato_.Cancel;
                        TrataErro(E);
                        Grava := False;
                     end;
         end;
       Btn_Mi(st_incluir, False, False, st_excluir );
    end
  else
    begin
// P/ query_vendedor_
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_vendedores.qry_vendedor_.State in [dsInsert, dsEdit] ) then
    begin
      datm_vendedores.qry_vendedor_.Post;
      Pesquisa := datm_vendedores.qry_vendedor_CD_VENDEDOR.AsString;
      datm_vendedores.qry_vendedor_.Close;
      datm_vendedores.qry_vendedor_.Prepare;
      datm_vendedores.qry_vendedor_.Open;
      Localiza(datm_vendedores.qry_vendedor_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_vendedores.qry_vendedor_.Cancel;
      TrataErro(E);
      Grava := False;
    end;
  end;
 Btn_Mi(st_incluir, False, False, st_excluir );
  end;

end;

procedure Tfrm_vendedores.mi_incluirClick(Sender: TObject);
begin

 if (pgctrl_vendedores.ActivePage = Ts_dados_basicos)or(pgctrl_vendedores.ActivePage = ts_lista) then
   begin
    with datm_vendedores do
     begin
        qry_vendedor_.DisableControls;
        qry_vendedor_.Cancel;
        qry_vendedor_.Append;
        qry_vendedor_.EnableControls;
        qry_vendedor_CD_UNID_NEG.AsString:=msk_cd_unid_neg.text;
        qry_vendedor_NM_UNID_NEG.AsString:=edt_nm_unid_neg.text;
     end;
    pgctrl_vendedores.ActivePage := ts_dados_basicos;
    dbedt_nm_vendedor.SetFocus;
   end;

   if pgctrl_vendedores.ActivePage = Ts_contato then
   begin
    with datm_vendedores do
     begin
        qry_contato_.DisableControls;
        qry_contato_.Cancel;
        qry_contato_.Append;
        qry_contato_.EnableControls;
        qry_contato_.FieldByName('CD_CONTATO').AsString := UltCod( qry_ult_contato_, qry_ult_contato_ULTIMO );
     end;
    pgctrl_vendedores.ActivePage := ts_contato;
    dbedt_nm_contato.SetFocus;
   end;

   
  Btn_Mi(False, true, true, False);
end;

procedure Tfrm_vendedores.edt_chaveChange(Sender: TObject);
begin
   if (pgctrl_vendedores.ActivePage = ts_lista ) then
     Localiza (datm_vendedores.qry_vendedor_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );

   if (pgctrl_vendedores.ActivePage = ts_contato ) then
     Localiza (datm_vendedores.qry_contato_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_vendedores.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (pgctrl_vendedores.ActivePage = ts_lista ) then
  begin
    if Key = 13 then dbg_vendedoresDblClick(nil); // trabalha c/ dbgrid
  end;
  if (pgctrl_vendedores.ActivePage = ts_contato ) then
  begin
    if Key = 13 then dbg_vendedoresDblClick(nil); // trabalha c/ dbgrid
  end;

end;

procedure Tfrm_vendedores.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;


procedure Tfrm_vendedores.cb_ordemClick(Sender: TObject);
begin
  if (pgctrl_vendedores.ActivePage = ts_lista ) then
  begin
    Pesquisa := datm_vendedores.qry_vendedor_CD_VENDEDOR.AsString;
    { Apaga o campo de pesquisa }
    edt_chave.Text := '';
    datm_vendedores.qry_vendedor_.Close;
    datm_vendedores.qry_vendedor_.SQL[18] := a_str_indices[cb_ordem.ItemIndex];
    datm_vendedores.qry_vendedor_.Prepare;
    datm_vendedores.qry_vendedor_.Open;
    Localiza(datm_vendedores.qry_vendedor_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
  end;

  if (pgctrl_vendedores.ActivePage = ts_contato ) then
  begin
    Pesquisa := datm_vendedores.qry_contato_CD_CONTATO.AsString;
    { Apaga o campo de pesquisa }
    edt_chave.Text := '';
    datm_vendedores.qry_contato_.Close;
    datm_vendedores.qry_contato_.SQL[4] := a_str_indices[cb_ordem.ItemIndex];
    datm_vendedores.qry_contato_.Prepare;
    datm_vendedores.qry_contato_.Open;
    Localiza(datm_vendedores.qry_contato_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
  end;


end;

procedure Tfrm_vendedores.dbedt_nm_vendedorChange(Sender: TObject);
begin
  if ( datm_vendedores.qry_vendedor_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_vendedores.btn_co_cidadeClick(Sender: TObject);
begin
  if not (datm_vendedores.qry_vendedor_.State in [dsEdit, dsInsert]) then
    datm_vendedores.qry_vendedor_.Edit;
  datm_vendedores.qry_vendedor_CD_CIDADE.Value := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',NIL);
  dbedt_cd_cidade.Text := datm_vendedores.qry_vendedor_CD_CIDADE.AsString;
  dbedt_cd_cidadeExit(nil);
end;

procedure Tfrm_vendedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_vendedores.qry_local_embarque_.Close;
  datm_vendedores.qry_vendedor_.Close;
  datm_vendedores.qry_ult_vend_.Close;
  datm_vendedores.qry_pais_BROKER.Close;
  datm_vendedores.qry_contato_.Close;
  //datm_vendedores.qry_tp_comissao_.Close;
  datm_vendedores.free;

  action:= cafree;

end;

procedure Tfrm_vendedores.FormCreate(Sender: TObject);
begin

  {st_modificar := False;
  st_incluir   := False;
  st_excluir   := False; }

  Application.CreateForm(Tdatm_vendedores, datm_vendedores);
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  datm_vendedores.ds_vendedor.AutoEdit     := st_modificar;

  datm_vendedores.qry_traz_default_.Close;
  datm_vendedores.qry_traz_default_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
  datm_vendedores.qry_traz_default_.Prepare;
  datm_vendedores.qry_traz_default_.Open;
  msk_cd_unid_neg.text:=datm_vendedores.qry_traz_default_CD_UNID_NEG.AsString;
  edt_nm_unid_neg.text:=datm_vendedores.qry_traz_default_NM_UNID_NEG.AsString;


  datm_vendedores.qry_local_embarque_.Close;
  datm_vendedores.qry_local_embarque_.Prepare;
  datm_vendedores.qry_local_embarque_.Open;

  datm_vendedores.qry_vendedor_.Close;
   datm_vendedores.qry_vendedor_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid_neg.text;
  datm_vendedores.qry_vendedor_.Prepare;
  datm_vendedores.qry_vendedor_.Open;

  datm_vendedores.qry_pais_BROKER.Close;
  datm_vendedores.qry_pais_BROKER.Prepare;
  datm_vendedores.qry_pais_BROKER.Open;

  //datm_vendedores.qry_tp_comissao_.Close;
  //datm_vendedores.qry_tp_comissao_.Prepare;
  //datm_vendedores.qry_tp_comissao_.Open;

  datm_vendedores.qry_contato_.Close;
  datm_vendedores.qry_contato_.Prepare;
  datm_vendedores.qry_contato_.Open;


   datm_vendedores.qry_base_calc_.Close;
   datm_vendedores.qry_base_calc_.Prepare;
   datm_vendedores.qry_base_calc_.Open;

  btn_incluir.Enabled   := st_incluir;
  btn_excluir.Enabled   := st_excluir;
  mi_incluir.Enabled    := st_incluir;
  mi_excluir.Enabled    := st_excluir;
  Btn_Mi(st_incluir, False, False, st_excluir );
  a_str_indices[0] := 'CD_VENDEDOR';
  a_str_indices[1] := 'NM_VENDEDOR';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 1;
  end;
 ts_contato.TabVisible:=false;
end;

procedure Tfrm_vendedores.pgctrl_vendedoresChange(Sender: TObject);
begin
  if (pgctrl_vendedores.ActivePage = ts_lista ) or
     (pgctrl_vendedores.ActivePage = ts_dados_basicos) then
     dbnvg.DataSource := datm_vendedores.ds_vendedor
  else
     dbnvg.DataSource := datm_vendedores.ds_contato;

  if (pgctrl_vendedores.ActivePage = ts_lista ) then
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

  if (pgctrl_vendedores.ActivePage = ts_dados_basicos) then
    dbedt_nm_vendedor.SetFocus; 

end;

procedure Tfrm_vendedores.pgctrl_vendedoresChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_vendedores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   VerAlt;
end;

procedure Tfrm_vendedores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;

  if (pgctrl_vendedores.ActivePage = ts_lista ) then
    if key = #13 then dbg_vendedoresDblClick(Sender);

  if (pgctrl_vendedores.ActivePage = ts_contato ) then
    if key = #13 then dbg_contatoDblClick(Sender);

end;

procedure Tfrm_vendedores.FormShow(Sender: TObject);
begin
  pgctrl_vendedores.ActivePage:= ts_lista;
  edt_chave.setfocus;

end;

procedure Tfrm_vendedores.dbg_vendedoresDblClick(Sender: TObject);
begin
if lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_vendedores.qry_vendedor_CD_VENDEDOR.AsString;
    except
      try
        Cons_Online_Texto := datm_vendedores.qry_vendedor_CD_VENDEDOR.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Vendedor !', 2);
      end;
    end;
    Close;
  end;

end;

procedure Tfrm_vendedores.dbg_vendedoresKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key = #13 then dbg_vendedoresDblClick(Sender);
end;

procedure Tfrm_vendedores.btn_co_paisClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_vendedores.qry_vendedor_) then exit;
    datm_vendedores.qry_vendedor_CD_PAIS.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil)
  end;
  dbedt_cd_cidadeExit(Sender);
end;

procedure Tfrm_vendedores.dbedt_cd_paisExit(Sender: TObject);
begin
with datm_vendedores do
  begin
  if not(qry_vendedor_.State in [dsEdit, dsInsert]) then exit;

  if dbedt_cd_pais.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_pais );
    if dbedt_look_nm_pais.Text = '' then
     begin
        BoxMensagem('Código da Cidade inválido!', 2);
        dbedt_cd_pais.SetFocus;
        Exit;

     end;
   end
  else  dbedt_look_nm_pais.Text := '';
 end;

end;

procedure Tfrm_vendedores.dbedt_cd_paisKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_pais then  btn_co_paisClick (btn_co_pais);
    if Sender = dbedt_cd_unid_neg then btn_co_uni_negClick(btn_co_uni_neg);
  end;
end;

procedure Tfrm_vendedores.dbedt_cd_cidadeExit(Sender: TObject);
begin
  with datm_vendedores do
  begin
    if not(qry_vendedor_.State in [dsEdit, dsInsert]) then exit;
    if dbedt_cd_cidade.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_cidade );
      if dbedt_look_nm_cidade.Text = '' then
      begin
        BoxMensagem('Código da Cidade inválido!', 2);
        dbedt_cd_cidade.SetFocus;
        Exit;
      end;
    end
    else dbedt_look_nm_cidade.Text := '';
  end;
end;

procedure Tfrm_vendedores.dbedt_cd_cidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_cidade then  btn_co_cidadeClick (btn_co_cidade);
    if Sender = msk_cd_unid_neg then  btn_co_unid_negClick (btn_co_unid_neg);
  end;

end;

procedure Tfrm_vendedores.dbnvgBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  datm_vendedores.qry_vendedor_.Cancel;
  datm_vendedores.qry_contato_.Cancel;

end;

procedure Tfrm_vendedores.dbg_contatoDblClick(Sender: TObject);
begin
if lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_vendedores.qry_contato_CD_VENDEDOR.AsString;
    except
      try
        Cons_Online_Texto := datm_vendedores.qry_contato_CD_VENDEDOR.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Vendedor !', 2);
      end;
    end;
    Close;
  end;
end;


procedure Tfrm_vendedores.dbg_contatoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key = #13 then dbg_contatoDblClick(Sender);
end;

procedure Tfrm_vendedores.dbedt_cd_contatoChange(Sender: TObject);
begin
  if ( datm_vendedores.qry_contato_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );

end;

procedure Tfrm_vendedores.dbedt_cd_unid_negExit(Sender: TObject);
begin
  with datm_vendedores do
  begin
  
  if dbedt_cd_unid_neg.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_unid_neg );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG');
    qry_pesquisa_.Sql.Add('WHERE IN_ATIVO = "1" AND CD_UNID_NEG="'+ dbedt_cd_unid_neg.text +'"');
    qry_pesquisa_.Sql.Add(' AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG');
    qry_pesquisa_.Sql.Add(' from TUSUARIO_HABILITACAO where CD_USUARIO ="'+str_cd_usuario+'")');
    qry_pesquisa_.Active:=true;
    if qry_pesquisa_.RecordCount > 0 then
        begin
 //         qry_vendedor_NM_UNID_NEG.AsString := qry_pesquisa_.Fields[0].AsString;
          dbedt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG',dbedt_cd_unid_neg.text , 'NM_UNID_NEG');
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_unid_neg.Text := '';
          BoxMensagem('Código da Unidade de Negócio inválido!', 2);
          dbedt_cd_unid_neg.SetFocus;
          Exit;
        end;
    end
   else dbedt_nm_unid_neg.Text := '';
  end;

end;

procedure Tfrm_vendedores.btn_co_uni_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_vendedores.qry_vendedor_) then exit;
    datm_vendedores.qry_vendedor_CD_UNID_NEG.AsString := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil);
  end;
  dbedt_cd_unid_negExit(nil);
end;

procedure Tfrm_vendedores.msk_cd_unid_negExit(Sender: TObject);
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName:='DBBROKER';
    if msk_cd_unid_neg.text <> '' then
     begin
       ValCodEdt( msk_cd_unid_neg );

       Sql.Clear;
       Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG');
       Sql.Add('WHERE IN_ATIVO = "1" AND CD_UNID_NEG="'+ msk_cd_unid_neg.text +'"');
       Sql.Add(' AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG');
       Sql.Add(' from TUSUARIO_HABILITACAO where CD_USUARIO ="'+str_cd_usuario+'")');
       Open;

      if RecordCount > 0  then
        begin
         edt_nm_unid_neg.text:=Fields[0].AsString;
         datm_vendedores.qry_vendedor_.Close;
         datm_vendedores.qry_vendedor_.ParamByName('CD_UNID_NEG').AsString:= msk_cd_unid_neg.text;
         datm_vendedores.qry_vendedor_.Prepare;
         datm_vendedores.qry_vendedor_.Open;
        end
       else
        begin
         edt_nm_unid_neg.text:='';
         BoxMensagem('Unidade não Habilitada ou Código Inválido!',2);
         msk_cd_unid_neg.SetFocus;
        end;
     end
    else edt_nm_unid_neg.text:='';
    Free;
 end;

end;

procedure Tfrm_vendedores.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'NM_UNID_NEG');
//  msk_cd_unid_negExit(nil);
end;

end.
