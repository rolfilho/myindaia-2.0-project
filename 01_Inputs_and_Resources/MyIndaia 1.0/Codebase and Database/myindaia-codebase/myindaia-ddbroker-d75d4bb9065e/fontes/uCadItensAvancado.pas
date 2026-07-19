(**********************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGSM059.PAS - FrmItem

AUTOR: BYSOFT

DATA: dd/mm/yyyy

Manutenção: Ricardo Giacomi Lopes

Data: 16/05/2002 - ADBC-0003 - Cadastro de Itens

**********************************************************************************)

unit uCadItensAvancado;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, RxDBComb, Funcoes;

type
  Tfrm_Caditens_Avancado = class(TForm)
    pgctrl_item: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_item: TLabel;
    lbl_cd_item: TLabel;
    dbedt_nm_item: TDBEdit;
    dbedt_cd_item: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dblckbox_tipo_item: TDBLookupComboBox;
    lbl_tipo_item: TLabel;
    Label1: TLabel;
    dbedt_nm_ingles: TDBEdit;
    Label2: TLabel;
    dbedt_nm_apelido: TDBEdit;
    lbl_ct_contabil: TLabel;
    btn_co_ct_contabil: TSpeedButton;
    dbedt_cd_ct_contabil: TDBEdit;
    dbedt_nm_ct_contabil: TDBEdit;
    lbl_nr_ordem_fat: TLabel;
    dbedt_nr_ordem_fat: TDBEdit;
    dbedt_cd_ct_gerencial: TDBEdit;
    btn_co_ct_gerencial: TSpeedButton;
    dbedt_nm_ct_gerencial: TDBEdit;
    lbl_ct_gerencial: TLabel;
    grp_box_ag: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    lb_sigla_iata: TLabel;
    dbluckup_tipo_base_calculo: TDBLookupComboBox;
    grp_class_item: TGroupBox;
    dbcheck_cpmf: TDBCheckBox;
    dbcheck_calcula_ir: TDBCheckBox;
    dbcheck_despesa_di: TDBCheckBox;
    dbradiogroup_ativo: TDBRadioGroup;
    dbcombo_via_transp: TRxDBComboBox;
    SpeedButton1: TSpeedButton;
    rdbgoup_tp_item: TDBRadioGroup;
    dbedt_sigla_iata: TDBEdit;
    dbluckup_tipo_frete: TRxDBComboBox;
    pnl_contabil: TPanel;
    dbedt_nm_item_contabil1: TDBEdit;
    SpeedButton2: TSpeedButton;
    dbedt_cd_item_contabil: TDBEdit;
    Label11: TLabel;
    pnl_cadastro: TPanel;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    procedure dbedt_nm_itemChange(Sender: TObject);
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
    procedure pgctrl_itemChange(Sender: TObject);
    procedure pgctrl_itemChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_ct_contabilExit(Sender: TObject);
    procedure dbedt_cd_ct_contabilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_ct_contabilClick(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_ct_gerencialExit(Sender: TObject);
    procedure btn_co_ct_gerencialClick(Sender: TObject);
    procedure dbcheck_despesa_diClick(Sender: TObject);
    procedure rdbgoup_tp_itemChange(Sender: TObject);
    procedure dbcombo_via_transpChange(Sender: TObject);
    procedure dbedt_nm_item_contabilChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure dbedt_cd_item_contabilExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
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
    lRecDesp, lRec, lRecDe1, in_contabil, in_desembaraco, in_agenciamento : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_Caditens_Avancado: Tfrm_Caditens_Avancado;

implementation

{$R *.DFM}

uses
  GSMLIB, PGGP001, PGGP017, PGSM060, PGSM168, PGSM170, PGSM048, ConsOnLineEx,
  PGSM275, dCadItensAvancado;

procedure Tfrm_Caditens_Avancado.dbedt_nm_itemChange(Sender: TObject);
begin
  if ( datm_CadItens_avancado.qry_item_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_Caditens_Avancado.FormCreate(Sender: TObject);
begin
  st_modulo    := VStr_cd_modulo;
  st_rotina    := str_cd_rotina;


  st_modificar    := False;
  st_incluir      := False;
  st_excluir      := False;
  lRecDesp        := False;
  lRec            := False;
  lRecDe1         := False;
  in_contabil     := false;
  in_desembaraco  := false;
  in_agenciamento := false;
  
  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Itens}
  Application.CreateForm( Tdatm_CadItens_avancado, datm_CadItens_avancado );

  with datm_CadItens_avancado do
  begin
    ds_item.AutoEdit := st_modificar;
    tbl_tipo_item.Open;

   { qry_item_.Close;
    qry_item_.SQL[3] := 'NM_ITEM';
    if lRecDesp then qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "D") OR (CD_TIPO_ITEM = "R" ) OR (CD_TIPO_ITEM = "X" ) OR (CD_TIPO_ITEM = "V" ) OR (CD_TIPO_ITEM = "N" )';
    if lRec     then qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "R" )';
    if lRecDe1  then qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "D" )';
    qry_item_.Prepare;
    qry_item_.Open;}

    qry_ttp_frete_.Close;
    qry_ttp_frete_.Prepare;
    qry_ttp_frete_.Open;

    qry_ttp_base_calc_frete.Close;
    qry_ttp_base_calc_frete.Prepare;
    qry_ttp_base_calc_frete.Open;

    qry_torigem_despesa.Close;
    qry_torigem_despesa.Prepare;
    qry_torigem_despesa.Open;

    qry_moeda_broker_.Close;
    qry_moeda_broker_.Prepare;
    qry_moeda_broker_.Open;

  end;

  a_str_indices[0] := 'CD_ITEM';
  a_str_indices[1] := 'NM_ITEM';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_Caditens_Avancado.FormShow(Sender: TObject);
begin
  pgctrl_item.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_CadItens_avancado do
  begin
    qry_item_.Close;
//    qry_item_.SQL[3] := 'NM_ITEM';
{    qry_item_.Prepare;  comentado em 22-07  a pedido do Wagner
    if lRecDesp then qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "D") OR (CD_TIPO_ITEM = "R" ) OR (CD_TIPO_ITEM = "X" ) OR (CD_TIPO_ITEM = "V" ) OR (CD_TIPO_ITEM = "N" )';
    if lRec     then qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "R" )';
    if lRecDe1  then qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "D" )';
    if in_contabil then
      begin
       if qry_item_.SQL[1] = ' ' then
          qry_item_.SQL[1] := ' WHERE ((TP_ITEM = "0") OR (TP_ITEM = "1") OR (TP_ITEM = "2") OR (TP_ITEM = "3")) '
       else qry_item_.SQL[1] := qry_item_.SQL[1] + ' AND ((TP_ITEM = "0") OR (TP_ITEM = "1") OR (TP_ITEM = "2") OR (TP_ITEM = "3")) ' ;
      end
    else
     begin
      if qry_item_.SQL[1] = ' ' then
          qry_item_.SQL[1] := ' WHERE ((TP_ITEM = "0") OR (TP_ITEM = "1") OR (TP_ITEM = "2")) '
       else qry_item_.SQL[1] := qry_item_.SQL[1] + ' AND ((TP_ITEM = "0") OR (TP_ITEM = "1") OR (TP_ITEM = "2")) ' ;
     end;

    if in_desembaraco then
     begin
      if qry_item_.SQL[1] = ' ' then
          qry_item_.SQL[1] := ' WHERE ((TP_ITEM = "0") OR (TP_ITEM = "2")) '
       else qry_item_.SQL[1] := qry_item_.SQL[1] + ' AND ( (TP_ITEM = "0") OR (TP_ITEM = "2")) '  ;
     end; }
    qry_item_.Open;

    qry_ct_contabilRM_.Close;
    qry_ct_contabilRM_.Prepare;
    qry_ct_contabilRM_.Open;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    if qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then {RM Saldus}
    begin

      {Conta Contábil}

      //dbedt_nm_ct_contabil.Width              := dbedt_nm_ct_contabil.Width + 90;
      dbedt_nm_ct_contabil.DataField          := 'LookCtContabilRM';
      dbedt_nm_ct_gerencial.DataField         := 'LookCtGerencialRM';
      qry_item_.FieldByName('CD_CT_CONTABIL').EditMask := '';
    end
    else
    begin {ContMaster/SI}

      {Conta Contábil}
      dbedt_nm_ct_contabil.DataField          := 'LookCtContabil';
      dbedt_nm_ct_gerencial.DataField         := 'LookCtGerencial';
      qry_item_.FieldByName('CD_CT_CONTABIL').EditMask := '999.99.99999;0;_';
    end;
  end;

 if in_contabil then
  begin
   pnl_contabil.Visible         := true;

   rdbgoup_tp_item.Items.Add('Financeiro');
   rdbgoup_tp_item.values.Add('3');

   datm_CadItens_avancado.qry_item_contabil_.Close;
   datm_CadItens_avancado.qry_item_contabil_.Prepare;
   datm_CadItens_avancado.qry_item_contabil_.Open;
  end
 else
  begin
   pnl_contabil.Visible         := false;
  end;


end;

procedure Tfrm_Caditens_Avancado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_CadItens_avancado do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabilRM_.Close;
      tbl_tipo_item.Close;
      qry_item_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_Caditens_Avancado.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_CadItens_avancado.qry_item_CD_ITEM.AsString;
    except
      try
        Cons_OnLine_Texto := datm_CadItens_avancado.qry_item_CD_ITEM.AsString;
      except
        BoxMensagem('Não consegui retornar Código do Item!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_Caditens_Avancado.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_Caditens_Avancado.btn_incluirClick(Sender: TObject);
begin

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_CadItens_avancado do
   begin
    qry_item_.DisableControls;
    qry_item_.Cancel;
    qry_item_.Append;
    qry_item_.EnableControls;
    qry_item_CD_ITEM.AsString  := UltCod( qry_ult_item_, qry_ult_item_ULTIMO );
    qry_item_IN_ATIVO.AsString := '1';
    qry_item_IN_ITEM_DI.AsString := '0';
    qry_item_IN_CPMF.AsString := '0';
    qry_item_IN_CALCULA_IR.AsString := '0';
    qry_item_TP_ITEM.AsString:='0';//desembaraco
   end;
  pgctrl_item.ActivePage := ts_dados_basicos;
  dbedt_nm_item.SetFocus;
  btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_Caditens_Avancado.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := dbedt_nm_item;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_Caditens_Avancado.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_Caditens_Avancado.Cancelar;
begin
  try
    if datm_CadItens_avancado.qry_item_.State in [dsInsert, dsEdit] then
    begin
      datm_CadItens_avancado.qry_item_.Cancel;
      pgctrl_item.ActivePage := ts_dados_basicos;
      dbedt_nm_item.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_Caditens_Avancado.btn_excluirClick(Sender: TObject);
var
  nr_item : String;
begin
  if BoxMensagem( 'Este item será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    nr_item := datm_CadItens_avancado.qry_item_CD_ITEM.AsString;
    datm_CadItens_avancado.qry_item_.Delete;

    {Apagando as prioridades de todas as Unidades X Produtos }
    datm_CadItens_avancado.qry_deleta_priori_.ParamByName('CD_ITEM').AsString := nr_item;
    datm_CadItens_avancado.qry_deleta_priori_.Prepare;
    datm_CadItens_avancado.qry_deleta_priori_.ExecSQL;

    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_CadItens_avancado.qry_item_.Cancel;
      TrataErro(E);
    end;
  end;

  pgctrl_item.ActivePage := ts_lista;



end;

procedure Tfrm_Caditens_Avancado.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Caditens_Avancado.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_CadItens_avancado.qry_item_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
end;

procedure Tfrm_Caditens_Avancado.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_CadItens_avancado.qry_item_CD_ITEM.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_CadItens_avancado.qry_item_.Close;
  datm_CadItens_avancado.qry_item_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  if lRecDesp then datm_CadItens_avancado.qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "D") OR (CD_TIPO_ITEM = "R" ) OR (CD_TIPO_ITEM = "X" ) OR (CD_TIPO_ITEM = "V" ) OR (CD_TIPO_ITEM = "N" )';
  if lRec     then datm_CadItens_avancado.qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "R" )';
  datm_CadItens_avancado.qry_item_.Open;
  Localiza(datm_CadItens_avancado.qry_item_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;  
end;

function Tfrm_Caditens_Avancado.Consiste : Boolean;
begin
  Consiste := True;
  if dbedt_cd_item.Text = '' then
  begin
    BoxMensagem('Campo Cód. Item deve ser preenchido!', 2);
    pgctrl_item.ActivePage := ts_dados_basicos;
    dbedt_cd_item.SetFocus;
    Consiste := False;
    Exit;
  end;

  if dbedt_nm_item.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_item.ActivePage := ts_dados_basicos;
    dbedt_nm_item.SetFocus;
    Consiste := False;
    Exit;
  end;

 if ((rdbgoup_tp_item.ItemIndex = 1 )or(rdbgoup_tp_item.ItemIndex = 2) ) and (dbcombo_via_transp.Text = '') then
  begin
    BoxMensagem('Campo Via de Transporte deve preenchido!', 2);
    pgctrl_item.ActivePage := ts_dados_basicos;
    dbcombo_via_transp.SetFocus;
    Consiste := False;
    Exit;
  end;

 if ((rdbgoup_tp_item.ItemIndex = 1 )or(rdbgoup_tp_item.ItemIndex = 2) ) and (dbluckup_tipo_frete.Text = '') then
  begin
    BoxMensagem('Campo Tipo do Frete deve preenchido!', 2);
    pgctrl_item.ActivePage := ts_dados_basicos;
    dbluckup_tipo_frete.SetFocus;
    Consiste := False;
    Exit;
  end;

 { if ((rdbgoup_tp_item.ItemIndex = 1 )or(rdbgoup_tp_item.ItemIndex = 2) ) and (dbluckup_tipo_base_calculo.Text = '') then
  begin
    BoxMensagem('Campo Tipo de Base de Cálculo deve preenchido!', 2);
    pgctrl_item.ActivePage := ts_dados_basicos;
    dbluckup_tipo_base_calculo.SetFocus;
    Consiste := False;
    Exit;
  end;}

  if datm_CadItens_avancado.qry_item_CD_TIPO_ITEM.IsNull then
  begin
    BoxMensagem('Selecione o Tipo do Item!', 2);
    pgctrl_item.ActivePage := ts_dados_basicos;
    dblckbox_tipo_item.SetFocus;
    Consiste := False;
    Exit;
  end;
  if (str_cd_usuario <> '0001') then begin
    if (datm_CadItens_avancado.qry_item_Look_TP_ITEM_ATIVO.AsString <> '1') then
    begin
      BoxMensagem('Esse Tipo de Item não esta disponível para o usuário corrente!', 2);
      pgctrl_item.ActivePage := ts_dados_basicos;
      dblckbox_tipo_item.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  {Conta Contábil}
{  if ( Trim( dbedt_cd_ct_contabil.Text ) = '' ) then
  begin
    BoxMensagem('Campo Conta Contábil deve ser preenchido!', 2);
    pgctrl_item.ActivePage := ts_dados_basicos;
    dbedt_cd_ct_contabil.SetFocus;
    Consiste := False;
    Exit;
  end;}

  if ( Trim( dbedt_cd_ct_contabil.Text ) <> '' ) and
     ( Trim( dbedt_nm_ct_contabil.Text ) = '' ) then
  begin
    if datm_CadItens_avancado.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then {RM Saldus}
       BoxMensagem( 'Conta inválida!', 2 )
    else {ContMaster/SI}
       BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
    pgctrl_item.ActivePage := ts_dados_basicos;
    dbedt_cd_ct_contabil.SetFocus;
    Consiste := False;
    Exit;
  end;

  if ( Trim( dbedt_cd_ct_gerencial.Text ) <> '' ) and
     ( Trim( dbedt_nm_ct_gerencial.Text ) = '' ) then
  begin
    BoxMensagem( 'Conta Gerencial inválida!', 2 );
    pgctrl_item.ActivePage := ts_dados_basicos;
    dbedt_cd_ct_gerencial.SetFocus;
    Consiste := False;
    Exit;
  end;


end;

function Tfrm_Caditens_Avancado.Grava : Boolean;
var
  nr_item, Code : integer;
begin
  try
    datm_main.db_broker.StartTransaction;
    If ( datm_CadItens_avancado.qry_item_.State in [dsInsert, dsEdit] ) then
    begin
      if datm_CadItens_avancado.qry_item_.State in [dsInsert] then
      begin
        {Inserindo a prioridade do item para todas as Unidades X Produto}
        with datm_CadItens_avancado do
        begin
          if qry_unid_neg_prod_.Active then qry_unid_neg_prod_.Close;
          qry_unid_neg_prod_.Prepare;
          qry_unid_neg_prod_.Open;
          while Not qry_unid_neg_prod_.EOF do
          begin
            if qry_priori_item_.Active then qry_priori_item_.Close;
            qry_priori_item_.Prepare;
            qry_priori_item_.Open;
            qry_priori_item_.Append;
            qry_priori_item_CD_UNID_NEG.AsString := qry_unid_neg_prod_CD_UNID_NEG.AsString;
            qry_priori_item_CD_PRODUTO.AsString := qry_unid_neg_prod_CD_PRODUTO.AsString;
            qry_priori_item_CD_ITEM.AsString := qry_item_CD_ITEM.AsString;
            {Verificando número da última prioridade}
            Val(qry_item_CD_ITEM.AsString, nr_item, Code );
            qry_priori_item_NR_PRIORIDADE.AsInteger := nr_item;
            qry_priori_item_.Post;
            qry_unid_neg_prod_.Next;
          end;
        end;
      end;
      datm_CadItens_avancado.qry_item_.Post;
      Pesquisa := datm_CadItens_avancado.qry_item_CD_ITEM.AsString;
      datm_CadItens_avancado.qry_item_.Close;
      if lRecDesp then datm_CadItens_avancado.qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "D") OR (CD_TIPO_ITEM = "R" ) OR (CD_TIPO_ITEM = "X" ) OR (CD_TIPO_ITEM = "V" ) OR (CD_TIPO_ITEM = "N" )';
      if lRec     then datm_CadItens_avancado.qry_item_.SQL[1] := 'WHERE (CD_TIPO_ITEM = "R" )';

{      if in_contabil then
      begin
       if datm_CadItens_avancado.qry_item_.SQL[1] = ' ' then
          datm_CadItens_avancado.qry_item_.SQL[1] := ' WHERE ((TP_ITEM = "0") OR (TP_ITEM = "1") OR (TP_ITEM = "2" OR (TP_ITEM = "3")) '
       else datm_CadItens_avancado.qry_item_.SQL[1] := datm_CadItens_avancado.qry_item_.SQL[1] + ' AND ((TP_ITEM = "0") OR (TP_ITEM = "1") OR (TP_ITEM = "2") OR (TP_ITEM = "3")) ' ;
      end
      else
      begin
       if datm_CadItens_avancado.qry_item_.SQL[1] = ' ' then
          datm_CadItens_avancado.qry_item_.SQL[1] := ' WHERE ((TP_ITEM = "0") OR (TP_ITEM = "1") OR (TP_ITEM = "2" OR (TP_ITEM = "3")) '
       else datm_CadItens_avancado.qry_item_.SQL[1] := datm_CadItens_avancado.qry_item_.SQL[1] + ' AND ((TP_ITEM = "0") OR (TP_ITEM = "1") OR (TP_ITEM = "2")) ' ;
      end;}
      datm_CadItens_avancado.qry_item_.Prepare;
      datm_CadItens_avancado.qry_item_.Open;
      Localiza(datm_CadItens_avancado.qry_item_, Pesquisa, a_str_indices[0] );
    end;

    if datm_CadItens_avancado.qry_item_contabil_.State in [dsEdit,dsInsert] then
       datm_CadItens_avancado.qry_item_contabil_.Post;

    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_CadItens_avancado.qry_item_.Cancel;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_Caditens_Avancado.pgctrl_itemChange(Sender: TObject);
begin

  if (pgctrl_item.ActivePage = ts_lista )  then
  begin
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
    dbnvg.DataSource  := datm_CadItens_avancado.ds_item;
    a_str_indices[0] := 'CD_ITEM';
    a_str_indices[1] := 'NM_ITEM';

  end
  else
  begin
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;
  end;

end;

procedure Tfrm_Caditens_Avancado.pgctrl_itemChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_Caditens_Avancado.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_CadItens_avancado.qry_item_.State in [dsEdit] ) and st_modificar ) or
     ( datm_CadItens_avancado.qry_item_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Itens foi alterado.' + #13#10 +
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

 if ( ( datm_CadItens_avancado.qry_item_contabil_.State in [dsEdit] ) and st_modificar ) or
     ( datm_CadItens_avancado.qry_item_contabil_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Itens foi alterado.' + #13#10 +
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

procedure Tfrm_Caditens_Avancado.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_Caditens_Avancado.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;




procedure Tfrm_Caditens_Avancado.dbedt_cd_ct_contabilExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_Caditens_Avancado.dbedt_cd_ct_contabilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_ct_gerencial then btn_co_ct_gerencialClick(nil);
    if Sender = dbedt_cd_ct_contabil then btn_co_ct_contabilClick(nil);
  end;
end;

procedure Tfrm_Caditens_Avancado.btn_co_ct_contabilClick(Sender: TObject);
begin
  if datm_CadItens_avancado.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_CadItens_avancado.qry_item_CD_CT_CONTABIL,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '"',
                  'TQuery' );
  end
  else
  begin
    Cons_On_line( 'DBBROKER', 'TCT_CONTABIL',
                  datm_CadItens_avancado.qry_item_CD_CT_CONTABIL,
                  'Contas Contábeis', 37, '' ,'TTable');
  end;
  dbedt_cd_ct_contabilExit(nil);
end;

procedure Tfrm_Caditens_Avancado.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil)
end;
procedure Tfrm_Caditens_Avancado.dbedt_cd_ct_gerencialExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_Caditens_Avancado.btn_co_ct_gerencialClick(Sender: TObject);
begin
  with datm_CadItens_avancado do
  begin
    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    if qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
    begin
      Cons_On_line( 'DBBROKER', 'TCONTABIL_GERENCIAL', qry_item_CD_CT_GERENCIAL,
                    'Contas Gerenciais', 13,
                    'SELECT CD_COLIGADA, CD_CT_GERENCIAL, NM_CT_GERENCIAL FROM TCONTABIL_GERENCIAL ',
                    'TQuery' );
    end
    else
    begin
      Application.CreateForm(Tfrm_ct_gerencial, frm_ct_gerencial);
      frm_ct_gerencial.Cons_OnLine := qry_item_CD_CT_GERENCIAL;
      with frm_ct_gerencial do
      begin
        Caption := Caption + ' [Consulta On-Line]';
        lCons_OnLine := True;
        if Not ( qry_item_.State in [dsEdit, dsInsert] ) and
           ( st_modificar ) then
          qry_item_.Edit;
        ShowModal;
        lCons_OnLine := False;
      end;
      qry_ct_gerencial_.Close;
      qry_ct_gerencial_.Prepare;
      qry_ct_gerencial_.Open;
    end;
    dbedt_cd_ct_gerencialExit(Sender);
  end;
end;

procedure Tfrm_Caditens_Avancado.dbcheck_despesa_diClick(Sender: TObject);
begin
if ( datm_CadItens_avancado.qry_item_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, st_modificar, st_modificar, False );
end;

procedure Tfrm_Caditens_Avancado.rdbgoup_tp_itemChange(Sender: TObject);
var aux:Boolean;
begin
  if ( datm_CadItens_avancado.qry_item_.State in [ dsInsert, dsEdit ] ) then
      btn_mi( False, st_modificar, st_modificar, False );

  if (rdbgoup_tp_item.ItemIndex = 0) then
     aux:=true;
//  if (rdbgoup_tp_item.ItemIndex = 1) then
//     aux:=false;

  if (rdbgoup_tp_item.ItemIndex = 1) Or (rdbgoup_tp_item.ItemIndex = 2) then
  begin
    aux:=true;
    grp_box_ag.Visible           := aux;
  end
  else
    grp_box_ag.Visible           := not aux;

    lbl_ct_contabil.Visible      := aux;
    dbedt_cd_ct_contabil.Visible := aux;
    dbedt_nm_ct_contabil.Visible := aux;
    btn_co_ct_contabil.Visible   := aux;
    lbl_ct_gerencial.Visible     := aux;
    dbedt_cd_ct_gerencial.Visible:= aux;
    dbedt_nm_ct_gerencial.Visible:= aux;
    btn_co_ct_gerencial.Visible  := aux;
    grp_class_item.Visible       := aux;
    dbedt_nr_ordem_fat.Visible   := aux;
    lbl_nr_ordem_fat.Visible     := aux;
    dbcombo_via_transpChange(NIL);
    dbcheck_despesa_di.Visible := Not(rdbgoup_tp_item.ItemIndex = 1) and Not(rdbgoup_tp_item.ItemIndex = 3);
    // or Not(rdbgoup_tp_item.ItemIndex = 3);
    dbcheck_calcula_ir.Visible := Not(rdbgoup_tp_item.ItemIndex = 3);
    grp_box_ag.Visible         := Not(rdbgoup_tp_item.ItemIndex = 3);
end;

procedure Tfrm_Caditens_Avancado.dbcombo_via_transpChange(Sender: TObject);
begin
  if ( datm_CadItens_avancado.qry_item_.State in [ dsInsert, dsEdit ] ) then
      btn_mi( False, st_modificar, st_modificar, False );

  if ((rdbgoup_tp_item.ItemIndex = 1) or (rdbgoup_tp_item.ItemIndex = 2)) and
      ((dbcombo_via_transp.ItemIndex = 0 ) or (dbcombo_via_transp.ItemIndex = 2))then
    begin
        dbedt_sigla_iata.Visible:=true;
        lb_sigla_iata.Visible:=true;
    end
   else
    begin
        dbedt_sigla_iata.Visible:=false;
        lb_sigla_iata.Visible:=false;
    end;

end;

procedure Tfrm_Caditens_Avancado.dbedt_nm_item_contabilChange(Sender: TObject);
begin
if datm_CadItens_avancado.qry_item_contabil_.State in [dsEdit, dsInsert] then
  btn_mi(false, st_modificar, st_modificar, false);

end;

procedure Tfrm_Caditens_Avancado.DBGrid1DblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_CadItens_avancado.qry_item_contabil_CD_ITEM_CONTABIL.AsString;
    except
      try
        Cons_OnLine_Texto := datm_CadItens_avancado.qry_item_contabil_CD_ITEM_CONTABIL.AsString;
      except
        BoxMensagem('Não consegui retornar Código do Item!', 2);
      end;
    end;
    Close;
  end;

end;

procedure Tfrm_Caditens_Avancado.dbedt_cd_item_contabilExit(Sender: TObject);
begin
 if not(datm_CadItens_avancado.qry_item_.State in[dsEdit, dsInsert]) then exit;
 if dbedt_cd_item_contabil.text <> '' then
   begin
    ValidCodigo(dbedt_cd_item_contabil);
    if dbedt_nm_item_contabil1.text = '' then
     begin
      Boxmensagem('Evento Contabil inválido',2);
      dbedt_cd_item_contabil.Setfocus;
      Exit;
     end;
   end;
end;

procedure Tfrm_Caditens_Avancado.SpeedButton2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2285';
  Application.CreateForm(Tfrm_item_contabil, frm_item_contabil);
  with frm_item_contabil Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_item_contabil.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_CadItens_avancado.qry_item_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_CadItens_avancado.qry_item_.Edit;
    datm_CadItens_avancado.qry_item_CD_ITEM_CONTABIL.AsString :=frm_item_contabil.Cons_OnLine_Texto;
    dbedt_cd_item_contabil.SetFocus;
    datm_CadItens_avancado.qry_item_contabil_.Close;
    datm_CadItens_avancado.qry_item_contabil_.Prepare;
    datm_CadItens_avancado.qry_item_contabil_.Open;
  end;
 dbedt_cd_item_contabilExit(Sender);
end;

end.
