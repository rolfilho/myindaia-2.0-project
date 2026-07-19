unit uProcComerc;
(*******************************************************************************
SISTEMA: Broker - Cargo
PROGRAMA: PGSM253.PAS - frm_proc_comerc
AUTOR: Paulo do Amaral Costa
DATA: 05/07/2002
MANUTENÇÃO:  -
DATA: -
NÚMERO DOCUMENTO - ADBCEC-0011
ANALISTAS RESPONSÁVEIS: Claudemir Lopes  &  Renato Ribeiro
CLIENTE: Ecotrans / Sr. Hélio
********************************************************************************)

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001, RXDBCtrl, ToolEdit, ActnList,
  DBActns, RxDBComb, Funcoes;

type
  Tfrm_proc_comerc = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_proc_comerc: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    dbg_cadastro: TDBGrid;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label4: TLabel;
    dbedt_dt_abertura: TDBEdit;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    Label8: TLabel;
    dbedt_email: TDBEdit;
    Label13: TLabel;
    dbedt_cd_empresa: TDBEdit;
    dbedt_look_nm_empresa: TDBEdit;
    btn_co_cd_empresa: TSpeedButton;
    dbedt_look_nm_unid_neg: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    Label6: TLabel;
    dbedt_contato: TDBEdit;
    Label7: TLabel;
    dbedt_look_nr_telefone: TDBEdit;
    Label9: TLabel;
    dbedt_look_nr_fax: TDBEdit;
    Label10: TLabel;
    dbedt_look_end_cidade: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    dbedt_look_end_cep: TDBEdit;
    dbedt_look_nm_pais: TDBEdit;
    dbedt_look_end_empresa: TDBEdit;
    dbedt_look_end_numero: TDBEdit;
    dbedt_look_end_bairro: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    dbedt_look_uf: TDBEdit;
    ts_historico: TTabSheet;
    dbg_historico: TDBGrid;
    dbedt_lookup_grupo: TDBEdit;
    Label32: TLabel;
    ts_proposta: TTabSheet;
    DBGrid1: TDBGrid;
    btn_gera_proposta: TSpeedButton;
    ts_vendedores: TTabSheet;
    DBGrid2: TDBGrid;
    edt_chave: TEdit;
    Label1: TLabel;
    cb_ordem: TComboBox;
    Label2: TLabel;
    Panel1: TPanel;
    btn_co_unid_neg1: TSpeedButton;
    Label19: TLabel;
    Label23: TLabel;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    msk_dt_abertura: TMaskEdit;
    Panel3: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    dbedt_nm_grupo: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbedt_cd_cliente: TDBEdit;
    Panel4: TPanel;
    Label27: TLabel;
    dbedt_dt_historico: TDBEdit;
    dbedt_hr_historico: TDBEdit;
    Label30: TLabel;
    dbedt_nm_contato: TDBEdit;
    Label28: TLabel;
    dbedt_nm_historico: TRxDBComboBox;
    Label29: TLabel;
    Label25: TLabel;
    Panel5: TPanel;
    Label22: TLabel;
    Label24: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Panel6: TPanel;
    Label5: TLabel;
    btn_co_cd_vendedor: TSpeedButton;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label3: TLabel;
    Label50: TLabel;
    Label53: TLabel;
    Label52: TLabel;
    Label51: TLabel;
    Label21: TLabel;
    dbedt_cd_vendedor: TDBEdit;
    dbedt_look_nm_vendedor: TDBEdit;
    dblkup_tp_calc_imp_ae: TDBLookupComboBox;
    dblkup_tp_calc_desemb: TDBLookupComboBox;
    dblkup_tp_calc_exp_ma: TDBLookupComboBox;
    dblkup_tp_calc_exp_ae: TDBLookupComboBox;
    dblkup_tp_calc_imp_ma: TDBLookupComboBox;
    vl_desemb: TDBEdit;
    vl_exp_ma: TDBEdit;
    vl_exp_ae: TDBEdit;
    vl_imp_ma: TDBEdit;
    vl_imp_ae: TDBEdit;
    dbmemo_tx_obs_historico: TDBMemo;
    pnlAgendaCliente: TPanel;
    dbg_agenda: TDBGrid;
    Panel8: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label26: TLabel;
    Label31: TLabel;
    Label35: TLabel;
    Shape4: TShape;
    Shape6: TShape;
    Label36: TLabel;
    Label37: TLabel;
    Panel9: TPanel;
    Panel2: TPanel;
    Shape5: TShape;
    Label18: TLabel;
    btn_incluir_agenda: TSpeedButton;
    btn_editar_agenda: TSpeedButton;
    btn_cancelar_agenda: TSpeedButton;
    DBText1: TDBText;
    Panel10: TPanel;
    Shape7: TShape;
    SpeedButton1: TSpeedButton;
    Shape8: TShape;
    chkRetroativo: TCheckBox;
    btnGera: TSpeedButton;
    pmGera: TPopupMenu;
    Proposta: TMenuItem;
    cotacao: TMenuItem;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure pgctrl_proc_comercChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_cd_empresaClick(Sender: TObject);
    procedure pgctrl_proc_comercChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbedt_cd_empresaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure btn_co_cd_vendedorClick(Sender: TObject);
    procedure dbedt_cd_vendedorExit(Sender: TObject);
    procedure dbg_agendaEnter(Sender: TObject);
    procedure dbedt_cd_unid_negChange(Sender: TObject);
    procedure btn_co_unid_neg1Click(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure dbedt_cd_empresaExit(Sender: TObject);
    procedure dbedt_cd_hist_proc_comercChange(Sender: TObject);
    procedure btn_incluir_agendaClick(Sender: TObject);
    procedure btn_editar_agendaClick(Sender: TObject);
    procedure btn_cancelar_agendaClick(Sender: TObject);
    procedure executa_busca_lista;
    procedure msk_dt_aberturaExit(Sender: TObject);
    procedure btn_gera_propostaClick(Sender: TObject);
    procedure dblkup_tp_calc_imp_aeClick(Sender: TObject);
    procedure dbg_agendaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbg_agendaDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure chkRetroativoClick(Sender: TObject);
    procedure PropostaClick(Sender: TObject);
    procedure cotacaoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    a_str_indices : Array[0..4] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure MenuOnCLick(Sender: TObject);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;

  public
    ctrl_tab_sheet, in_avancado:Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    procedure Get_DataHora_Servidor;
  end;

var
  frm_proc_comerc: Tfrm_proc_comerc;
  BookMark : TBookMark;

implementation

uses GSMLIB, PGGP017, PGSM210, dProcComerc, PGSM024, uProcComercAgendVisita,
     uVendedores, uProposta, ConsOnLineEx, uCotacao;

{$R *.DFM}

procedure Tfrm_proc_comerc.btn_sairClick(Sender: TObject);
begin
  //if Not VerAlt then Exit;  by Paulo - coloquei no onclosequery
  Close;
end;

procedure Tfrm_proc_comerc.btn_incluirClick(Sender: TObject);
begin
  if (datm_proc_comerc.qry_proc_comerc_.IsEmpty) and
     (pgctrl_proc_comerc.ActivePage <> ts_lista) and
     (pgctrl_proc_comerc.ActivePage <> ts_dados_basicos) then begin
    ShowMessage('Inclua um registro válido na manutenção antes de incluir outros dados!');
    Exit;
  end;

  BookMark := datm_proc_comerc.qry_proc_comerc_lista_.GetBookMark;
  // Consiste;
  if (pgctrl_proc_comerc.ActivePage = ts_lista) or
     (pgctrl_proc_comerc.ActivePage = ts_dados_basicos) then
  begin
    with datm_proc_comerc do
    begin
      if qry_proc_comerc_.State in [dsInactive] then
      begin
        qry_proc_comerc_.Close;
        qry_proc_comerc_.Prepare;
        qry_proc_comerc_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_lista_NR_PROC_COMERC.AsString;
        qry_proc_comerc_.Open;
      end;
      qry_agenda_comerc_lista_.Close;

      qry_proc_comerc_.DisableControls;
      qry_proc_comerc_.Cancel;
      qry_proc_comerc_.Append;
      qry_proc_comerc_.EnableControls;
    end;
    pgctrl_proc_comerc.ActivePage := ts_dados_basicos;
    dbedt_cd_empresa.SetFocus;
    btn_mi(false, st_modificar, st_modificar, false);

    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
  end
  else
  if (pgctrl_proc_comerc.ActivePage = ts_historico) then
  begin
    with datm_proc_comerc do
    begin
      if (qry_proc_comerc_historico_.State in [dsInsert,dsEdit]) then
        qry_proc_comerc_historico_.Cancel;
        dbg_historico.Enabled :=False;  //<-- desabilita temporariamente o grid para impedir navegação com o mouse durante a inclusão

        qry_proc_comerc_historico_.Append;  //<--- local correto
        qry_proc_comerc_historico_NR_PROC_COMERC.Value  := qry_proc_comerc_NR_PROC_COMERC.Value;
        qry_proc_comerc_historico_NM_CONTATO.Value      := qry_proc_comerc_NM_CONTATO.Value;

        qry_ult_proc_comerc_historico_.Close;

        Get_DataHora_Servidor;

        qry_proc_comerc_historico_DT_HISTORICO.AsString := formatDatetime('dd/mm/yyyy',dt_server);
      end;
    dbedt_dt_historico.SetFocus;
    btn_mi(false,st_modificar, st_modificar, false);
    dbnvg.Enabled := False;
  end
   else
  if (pgctrl_proc_comerc.ActivePage = ts_vendedores) then
  begin
    with datm_proc_comerc do
    begin
      if (qry_proc_vendedor_.State in [dsInsert,dsEdit]) then
        qry_proc_vendedor_.Cancel;

        qry_proc_vendedor_.Append;  //<--- local correto
        qry_proc_vendedor_NR_PROC_COMERC.Value  := qry_proc_comerc_NR_PROC_COMERC.Value;

    end;
    dbedt_cd_vendedor.SetFocus;
    btn_mi(false,st_modificar, st_modificar, false);
    dbnvg.Enabled := False;
  end;
end;

procedure Tfrm_proc_comerc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //if Not VerAlt then Exit;
  datm_proc_comerc.qry_traz_default_.Close;
  datm_proc_comerc.qry_proc_comerc_.Close;
  datm_proc_comerc.qry_empresa_.Close;
  datm_proc_comerc.qry_unid_neg_.Close;
  datm_proc_comerc.qry_vendedor_.Close;
  datm_proc_comerc.qry_tp_sales_.Close;
  datm_proc_comerc.qry_pais_broker_.Close;
  datm_proc_comerc.qry_proc_comerc_historico_.Close;
  datm_proc_comerc.qry_agenda_comerc_lista_.Close;
  datm_proc_comerc.Free;
  Action := caFree;
end;

procedure Tfrm_proc_comerc.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_proc_comerc.qry_proc_comerc_NR_PROC_COMERC.AsString;
    except
      try
        Cons_OnLine_Texto := datm_proc_comerc.qry_proc_comerc_NR_PROC_COMERC.AsString;
      except
        BoxMensagem('Não foi possível retornar o Número do Processo !', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_proc_comerc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 27 then Close;
  If Key = 13 then
  begin
    dbg_cadastroDblClick(Sender);
  end;
end;

procedure Tfrm_proc_comerc.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de Frete }

  Application.CreateForm(Tdatm_proc_comerc, datm_proc_comerc );
  in_avancado  := false;
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  ctrl_tab_sheet:=false;
  with datm_proc_comerc do
  begin
    {traz a unidade padrao do usuario}
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_traz_default_.Open;

    {traz somente todas as Unidades de Negócio habilitadas para o usuario corrente}
    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_unid_neg_.Open;

    if qry_traz_default_.IsEmpty then     //testa e emite alerta referente ao resultado das consultas
    begin                                 // qry_traz_default  e  qry_unid_neg
      BoxMensagem('O usuário não possui Unidade de Negócio padrão!', 2);
      msk_cd_unid_neg.Text := '';

    end
    else
    begin
      msk_cd_unid_neg.Text := qry_traz_default_CD_UNID_NEG.AsString;
      edt_nm_unid_neg.text := qry_traz_default_NM_UNID_NEG.AsString;
      pgctrl_proc_comerc.ActivePage := ts_lista;
      Consiste;
    end;

    if qry_unid_neg_.IsEmpty then
    begin
      BoxMensagem('Não existem Unidades de Negócio habilitadas para' + #13
                  + 'o usuário!', 2);
      msk_cd_unid_neg.Text := '';
    end;

    {abre o cadastro de processo comercial fitrado pela Unidade de Negócio default do usuario }
    qry_proc_comerc_lista_.Close;
    qry_proc_comerc_lista_.ParamByName('CD_UNID_NEG').AsString := qry_traz_default_CD_UNID_NEG.AsString;
    qry_proc_comerc_lista_.Open;


    {traz o processo comercial para edição no tabsheet dados básicos}
    qry_proc_comerc_.Close;
    qry_proc_comerc_.Prepare;
    qry_proc_comerc_.Open;

    qry_vendedor_.Close;   //tabela de lookup
    qry_vendedor_.ParamByName('CD_UNID_NEG').AsString:= msk_cd_unid_neg.Text;
    qry_vendedor_.Prepare;
    qry_vendedor_.Open;

    {qry_tp_sales_.Close;   //tabela de lookup
    qry_tp_sales_.Prepare;
    qry_tp_sales_.Open;}

    qry_pais_broker_.Close;  //tabela de lookup
    qry_pais_broker_.Prepare;
    qry_pais_broker_.Open;

    {qry_proc_comerc_historico_.Close;
    qry_proc_comerc_historico_.Prepare;
    qry_proc_comerc_historico_.Open;}

    qry_base_calc_vendedor_.close;
    qry_base_calc_vendedor_.Prepare;
    qry_base_calc_vendedor_.Open;

  end;

  a_str_indices[0] := 'CD_EMPRESA';
  a_str_indices[1] := 'NM_EMPRESA';
  a_str_indices[2] := 'NM_CONTATO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código Cliente');
    Items.Add('Cliente');
    Items.Add('Contato');
    ItemIndex := 1;
  end;

//  str_cd_modulo:='23';
//  str_cd_rotina:='2301';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_proc_comerc.ds_proc_comerc.AutoEdit := st_modificar;
  datm_proc_comerc.ds_proc_comerc_historico.AutoEdit := st_modificar;
  datm_proc_comerc.ds_agenda_comerc.AutoEdit := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
  //btn_gera_proposta.Enabled        := st_incluir;
end;

procedure Tfrm_proc_comerc.btn_excluirClick(Sender: TObject);
var
  vProcComerc : string;
begin
{--- Pergunta antes de excluir ------------------------------------------------}
  if Application.MessageBox('Este registro será Excluído! Confirma Exclusão?', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrNo then
    Exit;
{--- Utiliza o data module da Manutenção (local das qurys) --------------------}
  with datm_proc_comerc do begin

{--- deleção do histórico (início) --------------------------------------------}
    if (pgctrl_proc_comerc.ActivePage = ts_historico) then begin
      try
        Screen.Cursor := crHourGlass;
        if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
{--- cancela registros da agenda comercial, se existir ------------------------}
        qry_agenda_comerc_lista_.DisableControls;
        qry_agenda_comerc_lista_.Close;
        qry_agenda_comerc_lista_.SQL.Clear;
        qry_agenda_comerc_lista_.SQL.Add('select * from TAGENDA_COMERC where CD_AGENDA in (select TPCH.CD_AGENDA ' +
                                         'from TPROC_COMERC_HISTORICO TPCH where TPCH.CD_AGENDA IS NOT NULL and ' +
                                         'TPCH.NR_PROC_COMERC=:NR_PROC_COMERC)');
        qry_agenda_comerc_lista_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_lista_NR_PROC_COMERC.Value;;
        qry_agenda_comerc_lista_.Open;

        //verifica se existe
        if not qry_agenda_comerc_lista_.IsEmpty then
        begin
          if qry_agenda_comerc_lista_.Locate('CD_AGENDA', qry_proc_comerc_historico_CD_AGENDA.Value,[]) then
          begin
            //edita e põe como cancelado
            qry_agenda_comerc_lista_.Edit;
            qry_agenda_comerc_lista_IN_CANCELADO.Value := '1';
            qry_agenda_comerc_lista_OBS_AGENDA.Value := '(** HisDEL - HISTORICO DELETADO **)' + #13 +
                                                        '(** OBS.: Há possibilidade do processo também ter sido deletado **)' + #13#10 +
                                                        qry_agenda_comerc_lista_OBS_AGENDA.Value;
            qry_agenda_comerc_lista_.Post;
          end;
        end;
{--- apaga histórico selecionado ----------------------------------------------}
        qry_proc_comerc_historico_.Delete;

        datm_main.db_broker.Commit;
        Screen.Cursor := crArrow;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          datm_proc_comerc.qry_proc_comerc_historico_.cancel;
          TrataErro(E);
        end;
      end;
    end;
{--- deleção do histórico (fim) -----------------------------------------------}

{--- deleção do Vendedor (início) ---------------------------------------------}
    if (pgctrl_proc_comerc.ActivePage = ts_vendedores) then begin
      try
        Screen.Cursor := crHourGlass;
        if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
        qry_proc_vendedor_.Delete;
        datm_main.db_broker.Commit;
        Screen.Cursor := crArrow;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          datm_proc_comerc.qry_proc_vendedor_.cancel;
          TrataErro(E);
        end;
      end;
    end;

{--- deleção do Vendedor (Fim) ------------------------------------------------}

{--- deleção do processo comercial (início) -----------------------------------}
    if (pgctrl_proc_comerc.ActivePage = ts_lista) or
       (pgctrl_proc_comerc.ActivePage = ts_dados_basicos) then begin
      try
        Screen.Cursor := crHourGlass;
        if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
{--- exclui agenda do processo ------------------------------------------------}
        qry_agenda_comerc_lista_.DisableControls;
        qry_agenda_comerc_lista_.Close;
        qry_agenda_comerc_lista_.SQL.Clear;
        qry_agenda_comerc_lista_.SQL.Add('select * from TAGENDA_COMERC where CD_AGENDA in (select TPCH.CD_AGENDA ' +
                                         'from TPROC_COMERC_HISTORICO TPCH where TPCH.CD_AGENDA IS NOT NULL and ' +
                                         'TPCH.NR_PROC_COMERC=:NR_PROC_COMERC)');
        qry_agenda_comerc_lista_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_lista_NR_PROC_COMERC.Value;;
        qry_agenda_comerc_lista_.Open;

        //verifica se existe
        if not qry_agenda_comerc_lista_.IsEmpty then
        begin
          if qry_agenda_comerc_lista_.Locate('CD_AGENDA', qry_proc_comerc_historico_CD_AGENDA.Value,[]) then
          begin
            //edita e põe como cancelado
            qry_agenda_comerc_lista_.Edit;
            qry_agenda_comerc_lista_IN_CANCELADO.Value := '1';
            qry_agenda_comerc_lista_OBS_AGENDA.Value := '(** ProDEL - PROCESSO E HISTÓRICOS DELETADOS **)' + #13#10 +
                                                        qry_agenda_comerc_lista_OBS_AGENDA.Value;
            qry_agenda_comerc_lista_.Post;
          end;
        end;
{--- exclui histórico do processo ---------------------------------------------}
        qry_proc_comerc_historico_.DisableControls;
        qry_proc_comerc_historico_.Close;
        qry_proc_comerc_historico_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_lista_NR_PROC_COMERC.value;
        qry_proc_comerc_historico_.Open;
        if not qry_proc_comerc_historico_.IsEmpty then
        begin
          while not qry_proc_comerc_historico_.EOF do
          begin
            qry_proc_comerc_historico_.Delete;
          end;
        end;
{--- exclui vendedor do processo ----------------------------------------------}
        qry_proc_vendedor_.DisableControls;
        qry_proc_vendedor_.Close;
        qry_proc_vendedor_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_lista_NR_PROC_COMERC.value;
        qry_proc_vendedor_.Open;
        if not qry_proc_vendedor_.IsEmpty then
        begin
          while not qry_proc_vendedor_.EOF do
          begin
            qry_proc_vendedor_.Delete;
          end;
        end;

{--- exclui processo master ---------------------------------------------------}
        if not qry_proc_comerc_.IsEmpty then
          qry_proc_comerc_.Delete;
        datm_main.db_broker.Commit;
        Screen.Cursor := crArrow;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          datm_proc_comerc.qry_proc_comerc_.cancel;
          TrataErro(E);
        end;
      end;
    end;

{--- deleção do processo comercial (Fim) --------------------------------------}

{--- Reabre todas as tabelas do Form ------------------------------------------}
    //tabela principal
    qry_proc_comerc_.DisableControls;
    qry_proc_comerc_.Close;
    qry_proc_comerc_.Prepare;
    qry_proc_comerc_.Open;
    qry_proc_comerc_.EnableControls;
    //lista
    qry_proc_comerc_lista_.DisableControls;
    qry_proc_comerc_lista_.Close;
    qry_proc_comerc_lista_.ParamByName('CD_UNID_NEG').AsString := qry_traz_default_CD_UNID_NEG.AsString;
    qry_proc_comerc_lista_.Prepare;
    qry_proc_comerc_lista_.Open;
    qry_proc_comerc_lista_.EnableControls;
    //vendedores
    qry_proc_vendedor_.DisableControls;
    qry_proc_vendedor_.Close;
    qry_proc_vendedor_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_lista_NR_PROC_COMERC.Value;;
    qry_proc_vendedor_.Prepare;
    qry_proc_vendedor_.Open;
    qry_proc_vendedor_.EnableControls;
    //histórico
    qry_proc_comerc_historico_.DisableControls;
    qry_proc_comerc_historico_.Close;
    qry_proc_comerc_historico_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_lista_NR_PROC_COMERC.Value;;
    qry_proc_comerc_historico_.Prepare;
    qry_proc_comerc_historico_.Open;
    qry_proc_comerc_historico_.EnableControls;
    //agenda
    qry_agenda_comerc_lista_.Close;
    qry_agenda_comerc_lista_.SQL.Clear;
    qry_agenda_comerc_lista_.SQL.Add('select * from TAGENDA_COMERC');
    qry_agenda_comerc_lista_.SQL.Add('where CD_AGENDA in (select TPCH.CD_AGENDA  from TPROC_COMERC_HISTORICO TPCH');
    qry_agenda_comerc_lista_.SQL.Add('where TPCH.CD_AGENDA IS NOT NULL and TPCH.NR_PROC_COMERC=:NR_PROC_COMERC)');
    if chkRetroativo.Checked then
      qry_agenda_comerc_lista_.SQL.Add('and IN_CANCELADO = 0   ')
    else
      qry_agenda_comerc_lista_.SQL.Add('and IN_CANCELADO = 0   AND (DT_AGENDA > :DT_AGENDA OR DT_AGENDA = :DT_AGENDA)');
    
    qry_agenda_comerc_lista_.SQL.Add('ORDER BY DT_AGENDA DESC');
    qry_agenda_comerc_lista_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_lista_NR_PROC_COMERC.Value;;
    if not chkRetroativo.Checked then qry_agenda_comerc_lista_.ParamByName('DT_AGENDA').AsDate := dt_server-1;
    qry_agenda_comerc_lista_.Prepare;
    qry_agenda_comerc_lista_.Open;
    qry_agenda_comerc_lista_.EnableControls;
  end;
end;

procedure Tfrm_proc_comerc.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_proc_comerc.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_proc_comerc.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_proc_comerc.qry_proc_comerc_lista_NR_PROC_COMERC.AsString;
  edt_chave.Text := '';
  datm_proc_comerc.qry_proc_comerc_lista_.DisableControls;
  datm_proc_comerc.qry_proc_comerc_lista_.Close;
  if cb_ordem.ItemIndex = 1 then
  datm_proc_comerc.qry_proc_comerc_lista_.SQL[4] := 'TE.' + a_str_indices[cb_ordem.ItemIndex]
  else datm_proc_comerc.qry_proc_comerc_lista_.SQL[4] := 'TPC.' + a_str_indices[cb_ordem.ItemIndex];
  datm_proc_comerc.qry_proc_comerc_lista_.Open;
  datm_proc_comerc.qry_proc_comerc_lista_.EnableControls;
  //Localiza(datm_proc_comerc.qry_proc_comerc_lista_, Pesquisa, a_str_indices[cb_ordem.ItemIndex] );
  edt_chave.SetFocus;
end;

procedure Tfrm_proc_comerc.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_proc_comerc.qry_proc_comerc_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_proc_comerc.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_proc_comerc.ActivePage := ts_lista; //não adianta -> tem que deixar, no design, o tabsheet em dados básicos
  edt_chave.SetFocus;
  if str_cd_rotina = '3105' then
  begin
    in_avancado := true;
  end;
end;

procedure Tfrm_proc_comerc.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

function Tfrm_proc_comerc.Consiste : Boolean;
begin
  Consiste:=True;
//********************************************************************//
//**************  {Consistência para a Tabsheet Lista} ***************//
  if pgctrl_proc_comerc.ActivePage = ts_lista then
  begin
    {Unidade de Negócio }

  end;

//********************************************************************//
//*********  {Consistência para a Tabsheet Dados Básicos} ************//
  if (pgctrl_proc_comerc.ActivePage=ts_dados_basicos) then
  begin
    if Not ( datm_proc_comerc.qry_proc_comerc_.State in [dsEdit, dsInsert] ) then Exit;
    {if dbedt_nr_proc_comerc.Text = '' then  ** RETIRADO, POIS RENATO SOLICITOU QUE O CÓDIGO FOSSE GERADO
    begin                                    ** NO MOMENTO DA GRAVAÇÃO (BEFORE POST)
      BoxMensagem('Campo "Processo Comercial" com valor nulo! Você tentou salvar um novo processo' + #13 +
                  'sem antes solicitar inclusão. Cancele a operação e solicite nova inclusão.', 2);
      pgctrl_proc_comerc.ActivePage := ts_dados_basicos;
      dbedt_cd_vendedor.SetFocus;
      Consiste := False;
      Exit;
    end;}

    if dbedt_cd_empresa.Text = '' then
    begin
      Consiste := False;
      BoxMensagem('Campo Cliente deve ser preenchido!', 2);
      pgctrl_proc_comerc.ActivePage := ts_dados_basicos;
      dbedt_cd_empresa.SetFocus;
      Exit;
    end;

    if dbedt_dt_abertura.Text = '' then
    begin
      Consiste := False;
      BoxMensagem('Campo "Data Abertura" deve ser preenchido!', 2);
      pgctrl_proc_comerc.ActivePage := ts_dados_basicos;
      dbedt_dt_abertura.SetFocus;
      Exit;
    end;
    if dbedt_dt_abertura.Text <> '  /  /    ' then
    begin
      try  //valida o conteúdo de dbedt_dt_abertura
        dbedt_dt_abertura.Text := DateToStr(StrToDate(dbedt_dt_abertura.Text));
      except
        Consiste := False;
        BoxMensagem('Data de Abertura inválida!    ', 2);
        dbedt_dt_abertura.SetFocus;
        //Exit;
        SysUtils.Abort;
      end;
    end;



 end;



//********************************************************************//
//*********  {Consistência para a Tabsheet Histórico} ************//
  if (pgctrl_proc_comerc.ActivePage=ts_historico) then
  begin
    if Not ( datm_proc_comerc.qry_proc_comerc_historico_.State in [dsEdit, dsInsert] ) then Exit;
    if (datm_proc_comerc.qry_proc_comerc_historico_DT_HISTORICO.IsNull )then
    begin
      Consiste := False;
      BoxMensagem('Campo "Data Histórico" deve ser preenchido!', 2);
      pgctrl_proc_comerc.ActivePage := ts_historico;
      dbedt_dt_historico.SetFocus;
      SysUtils.Abort;
      //Exit;
    end;
    {if dbedt_dt_historico.Text <> '  /  /       :  ' then
    begin
      try  //valida o conteúdo de dbedt_dt_historico
        dbedt_dt_historico.Text := FormatDateTime('dd/mm/yyyy hh:nn',(StrToDateTime(dbedt_dt_historico.Text)));
      except
        Consiste := False;
        BoxMensagem('Data de Histórico inválida!    ', 2);
        pgctrl_proc_comerc.ActivePage := ts_historico;
        dbedt_dt_historico.SetFocus;
        SysUtils.Abort;
        //Exit;
      end;
    end;}

    if dbedt_hr_historico.Text <> '  :  ' then
    begin
      try  //valida o conteúdo de dbedt_hr_historico
        dbedt_hr_historico.Text := FormatDateTime('hh:nn',(StrToDateTime(dbedt_hr_historico.Text)));
      except
        Consiste := False;
        BoxMensagem('Horário de Histórico inválido!    ', 2);
        pgctrl_proc_comerc.ActivePage := ts_historico;
        dbedt_hr_historico.SetFocus;
        SysUtils.Abort;
        //Exit;
      end;
    end;

    if dbedt_nm_contato.Text = '' then
    begin
      Consiste := False;
      BoxMensagem('Campo "Contato" deve ser preenchido!', 2);
      pgctrl_proc_comerc.ActivePage := ts_historico;
      dbedt_nm_contato.SetFocus;
      Exit;
    end;

    if dbedt_nm_historico.Text = '' then
    begin
      Consiste := False;
      BoxMensagem('Campo "Assunto" deve ser preenchido!', 2);
      pgctrl_proc_comerc.ActivePage := ts_historico;
      dbedt_nm_historico.SetFocus;
      Exit;
    end;
  end;

 if (pgctrl_proc_comerc.ActivePage=ts_vendedores) then
 begin
    if dbedt_cd_vendedor.Text = '' then
    begin
      Consiste := False;
      BoxMensagem('Campo "Vendedor" deve ser preenchido!', 2);
      pgctrl_proc_comerc.ActivePage := ts_vendedores;
      dbedt_cd_vendedor.SetFocus;
      Exit;
    end;
    if (dbedt_cd_vendedor.Text <> '') and (dbedt_look_nm_vendedor.Text = '') then begin
      Consiste := False;
      ShowMessage('Este Vendedor já está cadastrado ou está preenchido incorretamente!');
      pgctrl_proc_comerc.ActivePage := ts_vendedores;
      dbedt_cd_vendedor.SetFocus;
      Exit;
     end;
 end;


  Consiste := True;

end;

function Tfrm_proc_comerc.Grava : Boolean;
var
  tdss_state: TDataSetState;   //by Paulo
begin
  if (pgctrl_proc_comerc.ActivePage = ts_dados_basicos) then
  begin
    try
      if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
      if ( datm_proc_comerc.qry_proc_comerc_.State in [dsInsert, dsEdit] ) then
        begin
        tdss_state:=datm_proc_comerc.qry_proc_comerc_.State;    //by Paulo
         datm_proc_comerc.qry_proc_comerc_.Post;
        end;
       datm_main.db_broker.Commit;
       Grava := True;

        Pesquisa := datm_proc_comerc.qry_proc_comerc_CD_EMPRESA.AsString;
        datm_proc_comerc.qry_proc_comerc_lista_.Close;

        if ( tdss_state = dsEdit ) and (msk_dt_abertura.Text <> '  /  /    ') then
        begin
          datm_proc_comerc.qry_proc_comerc_lista_.SQL[2] := 'WHERE TPC.CD_UNID_NEG=:CD_UNID_NEG AND TPC.DT_ABERTURA =:DT_ABERTURA AND TPC.CD_EMPRESA = TE.CD_EMPRESA ';
          datm_proc_comerc.qry_proc_comerc_lista_.ParamByName('DT_ABERTURA').AsString := msk_dt_abertura.Text;
          datm_proc_comerc.qry_proc_comerc_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        end
        else
        begin
          msk_dt_abertura.Text := '  /  /    ';
          datm_proc_comerc.qry_proc_comerc_lista_.SQL[2] := 'WHERE TPC.CD_UNID_NEG=:CD_UNID_NEG AND TPC.CD_EMPRESA = TE.CD_EMPRESA ';
          datm_proc_comerc.qry_proc_comerc_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        end;

        datm_proc_comerc.qry_proc_comerc_lista_.Open;
        Localiza(datm_proc_comerc.qry_proc_comerc_lista_, Pesquisa, a_str_indices[0] );

    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_proc_comerc.qry_proc_comerc_.cancel;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end
  else
  if (pgctrl_proc_comerc.ActivePage = ts_historico) then
  begin
    try
      if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
      if ( datm_proc_comerc.qry_proc_comerc_historico_.State in [dsInsert, dsEdit] ) then
      begin
        datm_proc_comerc.qry_proc_comerc_historico_.Post;
        pesquisa:=datm_proc_comerc.qry_proc_comerc_historico_CD_HIST_PROC_COMERC.AsString;
      end;
      datm_main.db_broker.Commit;

      datm_proc_comerc.qry_proc_comerc_historico_.Close;
      datm_proc_comerc.qry_proc_comerc_historico_.Prepare;
      datm_proc_comerc.qry_proc_comerc_historico_.ParamByName('NR_PROC_COMERC').AsString := datm_proc_comerc.qry_proc_comerc_NR_PROC_COMERC.AsString;
      datm_proc_comerc.qry_proc_comerc_historico_.Open;

      datm_proc_comerc.qry_proc_comerc_historico_.Locate('CD_HIST_PROC_COMERC',Pesquisa, [loCaseInsensitive, loPartialKey]);
      Grava := True;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_proc_comerc.qry_proc_comerc_historico_.cancel;
        TrataErro(E);
        Grava := False;
      end;
    end;
    dbnvg.Enabled := True;
    dbg_historico.Enabled :=True;
  end
  else
  if (pgctrl_proc_comerc.ActivePage = ts_vendedores) then
  begin
    try
      if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
      if ( datm_proc_comerc.qry_proc_vendedor_.State in [dsInsert, dsEdit] ) then
           datm_proc_comerc.qry_proc_vendedor_.Post;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_proc_comerc.qry_proc_vendedor_.cancel;
        TrataErro(E);
        Grava := False;
      end;
    end;
    dbnvg.Enabled := True;
    dbg_historico.Enabled :=True;
  end;

  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_proc_comerc.VerAlt : Boolean;
begin
  VerAlt := True;
  if (pgctrl_proc_comerc.ActivePage = ts_dados_basicos) then
  begin
    if ( ( datm_proc_comerc.qry_proc_comerc_.State in [dsEdit] ) and st_modificar ) or
       ( datm_proc_comerc.qry_proc_comerc_.State in [dsInsert] ) then
    begin
      if BoxMensagem('O cadastro de Processo Comercial foi alterado.' + #13#10 +
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
  end
  else
  if (pgctrl_proc_comerc.ActivePage = ts_historico) then
  begin
    if ( ( datm_proc_comerc.qry_proc_comerc_historico_.State in [dsEdit] ) and st_modificar ) or
       ( datm_proc_comerc.qry_proc_comerc_historico_.State in [dsInsert] ) then
    begin
      if BoxMensagem('O cadastro de Histórico do Processo Comercial foi alterado.' + #13#10 +
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
end;

procedure Tfrm_proc_comerc.Cancelar;
begin
  if (pgctrl_proc_comerc.ActivePage = ts_dados_basicos) then
  begin
    try
      if datm_proc_comerc.qry_proc_comerc_.State in [dsInsert, dsEdit] then
      begin
        datm_proc_comerc.qry_proc_comerc_.Cancel;
        if BookMark <> nil then
        begin
          datm_proc_comerc.qry_proc_comerc_lista_.GotoBookMark(BookMark); //by Paulo
          datm_proc_comerc.qry_proc_comerc_lista_.FreeBookMark(BookMark); //
          BookMark := nil;
        end;
        datm_proc_comerc.qry_proc_comerc_lista_AfterScroll(nil);
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end
  else
  if (pgctrl_proc_comerc.ActivePage = ts_historico) then
  begin
    try
      if datm_proc_comerc.qry_proc_comerc_historico_.State in [dsInsert, dsEdit] then
      begin
        datm_proc_comerc.qry_proc_comerc_historico_.Cancel;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
    dbnvg.Enabled := True;
    dbg_historico.Enabled :=True;
  end
   else
 if (pgctrl_proc_comerc.ActivePage = ts_vendedores) then
  begin
    try
      if datm_proc_comerc.qry_proc_vendedor_.State in [dsInsert, dsEdit] then
      begin
        datm_proc_comerc.qry_proc_vendedor_.Cancel;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
    dbnvg.Enabled := True;
    dbg_historico.Enabled :=True;
  end;

  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_proc_comerc.pgctrl_proc_comercChange(Sender: TObject);
begin
  btn_gera_proposta.Enabled:=false;
  btnGera.Enabled := False;
  if (ctrl_tab_sheet) and (pgctrl_proc_comerc.ActivePage <> ts_lista)then
  begin
    with datm_proc_comerc do
    begin
      qry_proc_comerc_.Close;
      qry_proc_comerc_.Prepare;
      qry_proc_comerc_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_lista_NR_PROC_COMERC.AsString;
      qry_proc_comerc_.Open;

      qry_proc_comerc_historico_.Close;
      qry_proc_comerc_historico_.Prepare;
      qry_proc_comerc_historico_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_NR_PROC_COMERC.AsString;
      qry_proc_comerc_historico_.Open;


      qry_agenda_comerc_lista_.Close;
      qry_agenda_comerc_lista_.ParamByName('NR_PROC_COMERC').AsString:= qry_proc_comerc_NR_PROC_COMERC.AsString;
      if not chkRetroativo.Checked then qry_agenda_comerc_lista_.ParamByName('DT_AGENDA').asdatetime   := dt_server-1;
      qry_agenda_comerc_lista_.Prepare;
      qry_agenda_comerc_lista_.Open;

      qry_proposta_.close;
      qry_proposta_.ParamByName('CD_EMPRESA').AsString  := qry_proc_comerc_CD_EMPRESA.AsString;
      qry_proposta_.ParamByName('CD_UNID_NEG').AsString := qry_proc_comerc_CD_UNID_NEG.AsString;
      qry_proposta_.Prepare;
      qry_proposta_.Open;
      if qry_proc_comerc_IN_RESTRICAO.AsString ='1' then
           BoxMensagem('Este Cliente tem uma Restrição Financeira.'+
                       #13#10+ 'Por Favor entre em contanto com o Dept. Financeiro.',2);



      qry_proc_vendedor_.close;
      qry_proc_vendedor_.paramByName('NR_PROC_COMERC').AsString:=qry_proc_comerc_NR_PROC_COMERC.AsString;
      qry_proc_vendedor_.Prepare;
      qry_proc_vendedor_.Open;
    end;
    ctrl_tab_sheet:=false;
  end;
  if (pgctrl_proc_comerc.ActivePage = ts_vendedores ) then
  begin
    vl_imp_ae.ReadOnly:= not in_avancado;
    vl_imp_ma.ReadOnly:= not in_avancado;
    vl_exp_ae.ReadOnly:= not in_avancado;
    vl_exp_ma.ReadOnly:= not in_avancado;
    vl_desemb.ReadOnly:= not in_avancado;

    dblkup_tp_calc_imp_ae.ReadOnly:= not in_avancado;
    dblkup_tp_calc_imp_ma.ReadOnly:= not in_avancado;
    dblkup_tp_calc_exp_ae.ReadOnly:= not in_avancado;
    dblkup_tp_calc_exp_ma.ReadOnly:= not in_avancado;
    dblkup_tp_calc_desemb.ReadOnly:= not in_avancado;
    btn_mi(True, false, false, not datm_proc_comerc.qry_proc_vendedor_.IsEmpty);
    dbnvg.DataSource := datm_proc_comerc.ds_proc_vendedor;
    dbnvg.Enabled := True;
  end else
  if (pgctrl_proc_comerc.ActivePage = ts_lista ) then
  begin
    dbnvg.DataSource := datm_proc_comerc.ds_proc_comerc_lista;
    dbnvg.Enabled := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := True;
    btn_mi(True, False, false, not datm_proc_comerc.qry_proc_comerc_.IsEmpty);
  end else
  if (pgctrl_proc_comerc.ActivePage = ts_historico) then
  begin
    dbnvg.DataSource := datm_proc_comerc.ds_proc_comerc_historico;
    dbnvg.Enabled := True;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
    dbedt_dt_historico.SetFocus;
    btn_mi(true, false, false, not datm_proc_comerc.qry_proc_comerc_historico_.IsEmpty);

  end else
  if (pgctrl_proc_comerc.ActivePage =ts_dados_basicos) then
  begin
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
   // dbedt_cd_vendedor.SetFocus;
    btn_gera_proposta.Enabled:=true;
    btnGera.Enabled := True;
    btn_mi(True, False, false, not datm_proc_comerc.qry_proc_comerc_.IsEmpty);
  end else
  if (pgctrl_proc_comerc.ActivePage =ts_proposta) then begin
    btn_mi(False, False, false, false);
    dbnvg.DataSource := datm_proc_comerc.ds_proposta;
    dbnvg.Enabled := True;
  end;

end;

procedure Tfrm_proc_comerc.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
  btn_incluir_agenda.Enabled := Inc;
  btn_editar_agenda.Enabled := Inc;
  btn_cancelar_agenda.Enabled := Inc;
  if (pgctrl_proc_comerc.ActivePage =ts_dados_basicos) then begin
    btn_gera_proposta.Enabled:=Inc;
    btnGera.Enabled := Inc;
  end;
end;

procedure Tfrm_proc_comerc.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_proc_comerc.btn_co_cd_empresaClick(Sender: TObject);
var vClickCliente: TMenuItem;
begin
  vClickCliente := TMenuItem.Create(application);
  vClickCliente.Visible := false;
  vClickCliente.name := 'mi_cad_emp_nac';
  vClickCliente.OnClick := MenuOnClick;


  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_proc_comerc.qry_proc_comerc_) then exit;
      datm_proc_comerc.qry_proc_comerc_CD_EMPRESA.Value := ConsultaOnLineEx('TEMPRESA_NAC','Comprado',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA', vClickCliente)
  end;
  dbedt_cd_empresaExit(Sender);

  vClickCliente.Free;
end;

procedure Tfrm_proc_comerc.MenuOnCLick(Sender: TObject);
begin
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Cliente, frm_Cliente);
  frm_Cliente.bl_proc_comerc := True;
  frm_Cliente.st_modificar := True;
  frm_Cliente.st_incluir   := True;
  frm_Cliente.st_excluir   := True;

  frm_Cliente.ShowModal;
  frm_Cliente.bl_proc_comerc := False;
end;

procedure Tfrm_proc_comerc.pgctrl_proc_comercChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_proc_comerc.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  VerAlt;
end;

procedure Tfrm_proc_comerc.dbedt_cd_empresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg   then btn_co_unid_neg1Click(btn_co_unid_neg1);
    if Sender = dbedt_cd_vendedor then btn_co_cd_vendedorClick(btn_co_cd_vendedor);
    if Sender = dbedt_cd_empresa  then btn_co_cd_empresaClick(btn_co_cd_empresa);
  end;
end;

procedure Tfrm_proc_comerc.btn_co_cd_vendedorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_proc_comerc.qry_proc_vendedor_) then Exit;
      datm_proc_comerc.qry_proc_vendedor_CD_VENDEDOR.Value := ConsultaOnLineEx('TVENDEDOR','Vendedores',['CD_VENDEDOR','NM_VENDEDOR'],['Código','Nome'],'CD_VENDEDOR',nil);
  end;
  dbedt_cd_vendedorExit(Sender);
end;

procedure Tfrm_proc_comerc.dbedt_cd_vendedorExit(Sender: TObject);
begin
 with datm_proc_comerc do
  begin
   if Not ( qry_proc_vendedor_.State in [dsEdit, dsInsert] ) then Exit;

   if dbedt_cd_vendedor.Text <> '' then
   begin
    ValidCodigo( dbedt_cd_vendedor );
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT CD_VENDEDOR FROM TPROC_VENDEDOR WHERE NR_PROC_COMERC = "'+qry_proc_comerc_NR_PROC_COMERC.AsString+'" AND CD_VENDEDOR ="'+dbedt_cd_vendedor.text+'"');
    qry_pesquisa_.Open;

    if qry_pesquisa_.recordcount > 0 then
     begin
      BoxMensagem('Este vendedor já esta cadastrado para esse Cliente!',2);
      dbedt_cd_vendedor.Text := '';
      dbedt_cd_vendedor.SetFocus;
      Exit;
     end
    else
     begin
     qry_pesquisa_.Close;
     qry_pesquisa_.Sql.Clear;
     qry_pesquisa_.Sql.Add('SELECT CD_VENDEDOR, NM_VENDEDOR, TP_CALC_COMIS_IMP_AEREA, TP_CALC_COMIS_IMP_MARITIMA,');
     qry_pesquisa_.Sql.Add('TP_CALC_COMIS_EXP_AEREA, TP_CALC_DESEMBARACO, TP_CALC_COMIS_EXP_MARITIMA, ');
     qry_pesquisa_.Sql.Add('VL_CALC_IMP_AEREA, VL_CALC_IMP_MARITIMA, VL_CALC_EXP_AEREA, VL_CALC_EXP_MARITIMA, VL_CALC_DESEMBARACO');
     qry_pesquisa_.Sql.Add(' FROM TVENDEDOR WHERE CD_VENDEDOR = "'+dbedt_cd_vendedor.text+'" AND CD_UNID_NEG = "'+datm_proc_comerc.qry_proc_comerc_CD_UNID_NEG.aSsTRING+'"');
     qry_pesquisa_.Open;
     if qry_pesquisa_.recordcount > 0 then
      begin
       qry_proc_vendedor_TP_CALC_COMIS_IMP_AEREA.AsSTring    := qry_pesquisa_.Fields[2].AsString;
       qry_proc_vendedor_TP_CALC_COMIS_IMP_MARITIMA.AsSTring := qry_pesquisa_.Fields[3].AsString;
       qry_proc_vendedor_TP_CALC_COMIS_EXP_AEREA.AsSTring    := qry_pesquisa_.Fields[4].AsString;
       qry_proc_vendedor_TP_CALC_COMIS_EXP_MARITIMA.AsSTring := qry_pesquisa_.Fields[6].AsString;
       qry_proc_vendedor_TP_CALC_DESEMBARACO.AsSTring        := qry_pesquisa_.Fields[5].AsString;
       qry_proc_vendedor_VL_CALC_IMP_AEREA.AsFloat           := qry_pesquisa_.Fields[7].AsFloat;
       qry_proc_vendedor_VL_CALC_IMP_MARITIMA.AsFloat        := qry_pesquisa_.Fields[8].AsFloat;
       qry_proc_vendedor_VL_CALC_EXP_AEREA.AsFloat           := qry_pesquisa_.Fields[9].AsFloat;
       qry_proc_vendedor_VL_CALC_DESEMBARACO.AsFloat         := qry_pesquisa_.Fields[11].AsFloat;
       qry_proc_vendedor_VL_CALC_EXP_MARITIMA.AsFloat        := qry_pesquisa_.Fields[10].AsFloat;
       qry_proc_vendedor_NM_VENDEDOR.AsString                := qry_pesquisa_.Fields[1].AsString;
      end
      else
       begin
        BoxMensagem('Código do Vendedor Inválido ou não Habilitado para a Unidade de Negócio!',2);
        dbedt_cd_vendedor.SetFocus;
        Exit;
       end;
    end;
   end;
  end;//with
end;

procedure Tfrm_proc_comerc.dbg_agendaEnter(Sender: TObject);
begin
//  VerAlt;
end;

procedure Tfrm_proc_comerc.dbedt_cd_unid_negChange(Sender: TObject);
begin
  If ( datm_proc_comerc.qry_proc_comerc_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_proc_comerc.btn_co_unid_neg1Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'NM_UNID_NEG');
  msk_cd_unid_negExit(nil);
  msk_cd_unid_neg.Setfocus;
end;

procedure Tfrm_proc_comerc.msk_cd_unid_negExit(Sender: TObject);
begin
 if msk_cd_unid_neg.Text = ''  then
    begin
      edt_nm_unid_neg.Text := '';
      BoxMensagem('Campo "Unidade de Negócio" deve ser preenchido!', 2);
      msk_cd_unid_neg.SetFocus;
      pgctrl_proc_comerc.ActivePage := ts_lista;
      //Exit;
      SysUtils.Abort;
    end;
    if msk_cd_unid_neg.Text <> '' then
    begin
      ValCodEdt( msk_cd_unid_neg );
      with datm_proc_comerc do
      begin
        if ( qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive]) ) then
        begin
          edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        end
        else
        begin
          edt_nm_unid_neg.Text := '';
          BoxMensagem('Unidade de Negócio não cadastrada ou' + #13 +
                      'não habilitada para o usuário!  ', 2);
          msk_cd_unid_neg.SetFocus;
          //Exit;
          SysUtils.Abort;
        end;
      executa_busca_lista;
    end;
  end;
end;

procedure Tfrm_proc_comerc.dbedt_cd_unid_negExit(Sender: TObject);
begin
  if Not ( datm_proc_comerc.qry_proc_comerc_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_unid_neg );
  if dbedt_cd_unid_neg.Text <> '' then
  begin
    if dbedt_look_nm_unid_neg.Text = '' then
    begin
      BoxMensagem('Unidade de Negócio inválida ou não' + #13 +
                  'habilitada para o usuário!  ', 2);
      pgctrl_proc_comerc.ActivePage := ts_dados_basicos;
      dbedt_cd_unid_neg.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_proc_comerc.dbedt_cd_empresaExit(Sender: TObject);
begin
 with datm_proc_comerc do
  begin
  if not(qry_proc_comerc_.state in [dsedit, dsInsert]) then exit;
   if dbedt_cd_empresa.text <>'' then
    begin
      ValidCodigo(dbedt_cd_empresa);

      with TQuery.Create(Application) do
       begin
         DataBaseName:='DBBROKER';
          Sql.Clear;
          Sql.Add('SELECT CD_EMPRESA FROM TPROC_COMERC WHERE CD_EMPRESA="'+dbedt_cd_empresa.text+'"');
          open;
          if RecordCount > 0 then
            begin
             BoxMensagem('Já existe um registro aberto para este Cliente!',2);
             dbedt_cd_empresa.Setfocus;
             exit;
            end;
         Free;
       end;



      qry_empresa_.close;
      with Tquery.Create(Application) do //verifica se o cliente é apenas comercial
        begin
          DataBaseName:='DBBROKER';
          Sql.Clear;
          Sql.Add('SELECT TE.CD_EMPRESA, TE.IN_COMERCIAL');
          Sql.Add(' FROM TEMPRESA_NAC TE WHERE TE.IN_COMERCIAL = 1');
          Sql.Add(' AND TE.CD_EMPRESA = "'+(dbedt_cd_empresa.text)+'"');
          open;
          if recordCount > 0 then //se o clinte for comercial, faz uma validação para ver
            begin          //se já existe um processo comercial para este cliente
               qry_empresa_.Sql[18]:=' ';
               with Tquery.Create(Application) do
                 begin
                    DataBaseName:='DBBROKER';
                    Sql.Clear;
                    Sql.Add('SELECT TP.CD_EMPRESA, (SELECT TU.NM_UNID_NEG FROM TUNID_NEG TU WHERE TU.CD_UNID_NEG = TP.CD_UNID_NEG) NM_UNID_NEG ');
                    Sql.Add(' FROM TPROC_COMERC  TP WHERE TP.CD_UNID_NEG <>"'+(dbedt_cd_unid_neg.text)+'"');
                    Sql.Add(' AND TP.CD_EMPRESA = "'+(dbedt_cd_empresa.text)+'"');
                    Open;
                    if recordCount > 0 then
                      begin
                       Boxmensagem('A Unidade '+fields[1].AsString +' já esta Operando com este Cliente!',2);
                       dbedt_cd_empresa.SetFocus;
                       Exit;
                      end;
                    Free;
                 end;
             end
            else  qry_empresa_.Sql[18]:= ' AND TH.CD_UNID_NEG ="'+(dbedt_cd_unid_neg.text)+'"';

          qry_empresa_.ParamByName('CD_EMPRESA').AsString:=dbedt_cd_empresa.text;
          qry_empresa_.Prepare;
          qry_empresa_.Open;


          Free;
        end;

      if qry_empresa_.RecordCount > 0 then
      begin
        if qry_empresa_IN_RESTRICAO.AsString = '1' then
        begin
          if not(BoxMensagem('Este Cliente está com Restricão Financeira! Deseja incluir mesmo assim? ',1)) then
            exit;
        end;
        qry_proc_comerc_NM_EMPRESA.AsString:=qry_empresa_NM_EMPRESA.AsString;
        qry_proc_comerc_END_EMPRESA.AsString:=qry_empresa_END_EMPRESA.AsString;
        qry_proc_comerc_END_NUMERO.AsString:=qry_empresa_END_NUMERO.AsString;
        qry_proc_comerc_END_CIDADE.AsString:=qry_empresa_END_CIDADE.AsString;
        qry_proc_comerc_END_BAIRRO.AsString:=qry_empresa_END_BAIRRO.AsString;
        qry_proc_comerc_END_UF.AsString:=qry_empresa_END_UF.AsString;
        qry_proc_comerc_END_CEP.AsString:=qry_empresa_END_CEP.AsString;
        qry_proc_comerc_NR_TELEFONE.AsString:= qry_empresa_NR_TELEFONE.AsString;
        qry_proc_comerc_NR_FAX.AsString:= qry_empresa_NR_FAX.AsString;
        qry_proc_comerc_NM_PAIS.AsString:=qry_empresa_NM_PAIS.AsString;
        qry_proc_comerc_NM_GRUPO.AsString:=qry_empresa_NM_GRUPO.AsString;
      end
      else
      begin
        qry_proc_comerc_NM_EMPRESA.AsString:='';
        qry_proc_comerc_END_EMPRESA.AsString:='';
        qry_proc_comerc_END_NUMERO.AsString:='';
        qry_proc_comerc_END_CIDADE.AsString:='';
        qry_proc_comerc_END_BAIRRO.AsString:='';
        qry_proc_comerc_END_UF.AsString:='';
        qry_proc_comerc_END_CEP.AsString:='';
        qry_proc_comerc_NR_TELEFONE.AsString:= '';
        qry_proc_comerc_NR_FAX.AsString:= '';
        qry_proc_comerc_NM_PAIS.AsString:='';
        qry_proc_comerc_NM_GRUPO.AsString:='';
        Boxmensagem('Código da Empresa Inválido ou não Habilitado para esta Unidade!',2);
        dbedt_cd_empresa.SetFocus;
      end;
    end
   else
    begin
      dbedt_look_nm_empresa.text:='';
      dbedt_look_nr_telefone.text:='';
      dbedt_look_nr_fax.text:='';
      dbedt_look_end_cidade.text:='';
      dbedt_look_end_cep.text:='';
      dbedt_look_nm_pais.text:='';
      dbedt_look_end_empresa.text:='';
      dbedt_look_end_numero.text:='';
      dbedt_look_end_bairro.text:='';
      dbedt_look_uf.text:='';
    end;
  end;
end;

procedure Tfrm_proc_comerc.dbedt_cd_hist_proc_comercChange(Sender: TObject);
begin
  If ( datm_proc_comerc.qry_proc_comerc_historico_.State in [ dsInsert, dsEdit ] ) then
  begin
     Btn_Mi( False, True, True, False );
     dbg_historico.Enabled :=False;
  end;
end;

procedure Tfrm_proc_comerc.btn_incluir_agendaClick(Sender: TObject);
begin
  with datm_proc_comerc do begin
    qry_proc_vendedor_.close;
    qry_proc_vendedor_.paramByName('NR_PROC_COMERC').AsString:=qry_proc_comerc_NR_PROC_COMERC.AsString;
    qry_proc_vendedor_.Prepare;
    qry_proc_vendedor_.Open;
  end;

  if not datm_proc_comerc.qry_proc_vendedor_.IsEmpty then begin
    Get_DataHora_Servidor;
    Application.CreateForm(Tfrm_proc_comerc_agend_visita , frm_proc_comerc_agend_visita  );
    frm_proc_comerc_agend_visita.Tag:=1; /////<-- tag = 1 indica abertura de form para novo agendamento
    frm_proc_comerc_agend_visita.ShowModal;
    with  datm_proc_comerc do
    begin
      qry_agenda_comerc_lista_.DisableControls;
      qry_agenda_comerc_lista_.Close;
      if not chkRetroativo.Checked then qry_agenda_comerc_lista_.ParamByName('DT_AGENDA').asdatetime := dt_server-1;
      qry_agenda_comerc_lista_.ParamByName('NR_PROC_COMERC').AsString := datm_proc_comerc.qry_proc_comerc_NR_PROC_COMERC.AsString;
      qry_agenda_comerc_lista_.Prepare;
      qry_agenda_comerc_lista_.Open;
      qry_agenda_comerc_lista_.Last;
      qry_agenda_comerc_lista_.EnableControls;
      qry_proc_comerc_historico_.Close;
      qry_proc_comerc_historico_.Prepare;
      qry_proc_comerc_historico_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_NR_PROC_COMERC.AsString;
      qry_proc_comerc_historico_.Open;
    end;
    dbg_historico.Enabled :=True; //habilita, no retorno, o grid do tabsheet Histórico
    dbg_agenda.SetFocus;
    Btn_Mi(st_incluir, False, False, st_excluir );
  end else
    ShowMessage('Não existe nenhum vendedor relacionado a este cliente!' + #13#10 +
                'Cadastre um vendedor válido antes de incluir dados na Agenda');
end;

procedure Tfrm_proc_comerc.btn_editar_agendaClick(Sender: TObject);
begin
  with  datm_proc_comerc do
  begin
    qry_agenda_comerc_lista_.DisableControls;
    qry_agenda_comerc_lista_.Close;
    if not chkRetroativo.Checked then qry_agenda_comerc_lista_.ParamByName('DT_AGENDA').asdatetime := dt_server-1;
    qry_agenda_comerc_lista_.ParamByName('NR_PROC_COMERC').AsString := datm_proc_comerc.qry_proc_comerc_NR_PROC_COMERC.AsString;
    qry_agenda_comerc_lista_.Prepare;
    qry_agenda_comerc_lista_.Open;
    qry_agenda_comerc_lista_.Locate('CD_AGENDA', qry_proc_comerc_historico_CD_AGENDA.Value,[]);
    qry_agenda_comerc_lista_.EnableControls;

    if qry_agenda_comerc_lista_.IsEmpty then begin
      ShowMessage('Selecione um registro antes de editá-lo!');
      Exit;
    end;
  end;

  Application.CreateForm(Tfrm_proc_comerc_agend_visita  , frm_proc_comerc_agend_visita  );
  frm_proc_comerc_agend_visita.Tag:=2; /////<-- tag = 2 indica abertura de form para ediçao do agendamento corrente
  frm_proc_comerc_agend_visita.btn_incluir.Visible  := False;
  frm_proc_comerc_agend_visita.BorderIcons := BorderIcons - [biSystemMenu];   //
  frm_proc_comerc_agend_visita.ShowModal;

  with  datm_proc_comerc do
  begin
    qry_agenda_comerc_lista_.DisableControls;
    qry_agenda_comerc_lista_.Close;
    if not chkRetroativo.Checked then qry_agenda_comerc_lista_.ParamByName('DT_AGENDA').asdatetime := dt_server-1;
    qry_agenda_comerc_lista_.ParamByName('NR_PROC_COMERC').AsString := datm_proc_comerc.qry_proc_comerc_NR_PROC_COMERC.AsString;
    qry_agenda_comerc_lista_.Prepare;
    qry_agenda_comerc_lista_.Open;
    qry_agenda_comerc_lista_.Locate('CD_AGENDA', qry_proc_comerc_historico_CD_AGENDA.Value,[]);
    qry_agenda_comerc_lista_.EnableControls;
  end;

  dbg_historico.Enabled :=True; //habilita, no retorno, grid do tabsheet Histórico
  dbg_agenda.SetFocus;

  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_proc_comerc.Get_DataHora_Servidor;
begin
  with datm_main do
  begin
    try
      CloseStoredProc(sp_data_hora_server);
      ExecStoredProc(sp_data_hora_server);
      dt_server := sp_data_hora_server.ParamByName('@dt_nt_server').AsDateTime;
      hr_server := dt_server;
      dt_server := StrToDate(DateToStr(dt_server));
      CloseStoredProc(sp_data_hora_server);
    except
      on E: Exception do
      begin
        TrataErro(E);
        dt_server := Date;
        hr_server := Time;
      end;
    end;
  end;
end;

procedure Tfrm_proc_comerc.btn_cancelar_agendaClick(Sender: TObject);
begin

  with datm_proc_comerc do
  begin
    qry_agenda_comerc_.Close;
    qry_agenda_comerc_.SQL.Clear;
    qry_agenda_comerc_.SQL.Add('select * from TAGENDA_COMERC where CD_AGENDA=:CD_AGENDA'); //como reconstituir??
    qry_agenda_comerc_.ParamByName('CD_AGENDA').AsInteger := qry_agenda_comerc_lista_CD_AGENDA.Value;
    qry_agenda_comerc_.Open;
    if qry_agenda_comerc_.IsEmpty then begin
      qry_agenda_comerc_.Close;
      ShowMessage('Escolha um registro para ser cancelado!');
      Exit;
    end;

    if BoxMensagem( 'Esta visita será cancelada! Confirma cancelamento?', 1 ) then begin
      qry_agenda_comerc_.Edit;

      qry_agenda_comerc_IN_CANCELADO.Value := '1';
      qry_agenda_comerc_OBS_AGENDA.Value := '(*** VISITA CANCELADA ***)' + #13 + qry_agenda_comerc_OBS_AGENDA.Value;

      qry_proc_comerc_historico_.Locate('CD_AGENDA', qry_agenda_comerc_CD_AGENDA.Text,[]);
      qry_proc_comerc_historico_.Edit;
      qry_proc_comerc_historico_TX_OBS_HISTORICO.Value := '(*** VISITA CANCELADA ***)' + #13 + qry_proc_comerc_historico_TX_OBS_HISTORICO.Value;
      qry_proc_comerc_historico_NM_HISTORICO.Value := qry_proc_comerc_historico_NM_HISTORICO.Value + ' (**CANCELADA**)';

      try
        if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
        qry_proc_comerc_historico_.Post;
        qry_agenda_comerc_.Post;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          qry_agenda_comerc_.cancel;
          qry_proc_comerc_historico_.cancel;
          TrataErro(E);
        end;
      end;

      qry_agenda_comerc_.Close;

      qry_agenda_comerc_lista_.DisableControls;
      qry_agenda_comerc_lista_.Close;
      if not chkRetroativo.Checked then qry_agenda_comerc_lista_.ParamByName('DT_AGENDA').asdatetime := dt_server-1;
      qry_agenda_comerc_lista_.ParamByName('NR_PROC_COMERC').AsString := datm_proc_comerc.qry_proc_comerc_NR_PROC_COMERC.AsString;
      qry_agenda_comerc_lista_.Prepare;
      qry_agenda_comerc_lista_.Open;
      qry_agenda_comerc_lista_.Locate('CD_AGENDA', qry_proc_comerc_historico_CD_AGENDA.Value,[]);
      qry_agenda_comerc_lista_.EnableControls;

      BoxMensagem('Agendamento de Visita cancelado com sucesso!', 3);
      dbg_historico.Enabled :=True; //habilita, no retorno, grid do tabsheet Histórico
      dbg_agenda.SetFocus;

      Btn_Mi(st_incluir, False, False, st_excluir );
    end;
  end;
end;

procedure Tfrm_proc_comerc.executa_busca_lista;
var sql_texto:string;
begin
   sql_texto:='';
   //verifica se há data de abertura para filtrar
   sql_texto:='WHERE TPC.CD_UNID_NEG=:CD_UNID_NEG AND TPC.CD_EMPRESA = TE.CD_EMPRESA ';

     datm_proc_comerc.qry_proc_comerc_lista_.Close;

     if msk_dt_abertura.Text <> '  /  /    ' then
      begin
          try  //valida o conteúdo de msk_dt_abertura
            msk_dt_abertura.Text := DateToStr(StrToDate(msk_dt_abertura.Text));
          except
            BoxMensagem('Data de Abertura inválida!    ', 2);
            msk_dt_abertura.SetFocus;
          end;
          sql_texto:= sql_texto + ' AND TPC.DT_ABERTURA =:DT_ABERTURA ';
          datm_proc_comerc.qry_proc_comerc_lista_.SQL[2] := sql_texto;
          datm_proc_comerc.qry_proc_comerc_lista_.ParamByName('DT_ABERTURA').AsDate:=StrToDate(msk_dt_abertura.Text);
       end
      else
        begin
        datm_proc_comerc.qry_proc_comerc_lista_.SQL[2] := sql_texto;
        end;
     datm_proc_comerc.qry_proc_comerc_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
     datm_proc_comerc.qry_proc_comerc_lista_.Open;
    // qry_proc_comerc_lista_AfterScroll(nil);


end;

procedure Tfrm_proc_comerc.msk_dt_aberturaExit(Sender: TObject);
begin
  executa_busca_lista;
end;

procedure Tfrm_proc_comerc.btn_gera_propostaClick(Sender: TObject);
begin
  pmGera.Popup(frm_proc_comerc.Left + 200, frm_proc_comerc.Top + 80);

end;

procedure Tfrm_proc_comerc.dblkup_tp_calc_imp_aeClick(Sender: TObject);
begin
   if ( datm_proc_comerc.qry_proc_vendedor_.State in [ dsInsert, dsEdit ] ) then
         Btn_Mi( False, st_modificar, st_modificar, False );
end;

procedure Tfrm_proc_comerc.dbg_agendaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.Font.Color := clBlack;
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_AGENDA').AsString = '0' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00E2E2C7;
  end else
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_AGENDA').AsString = '1' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00B9FFB9;
  end else
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_AGENDA').AsString = '2' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00A8C5FF;
  end else
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_AGENDA').AsString = '3' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00FFC891;
  end else
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_AGENDA').AsString = '4' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $009393FF;
  end;
  TDBGrid(Sender).Canvas.TextOut(Rect.Left + 2 ,Rect.Top+2, Column.Field.Text );
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_proc_comerc.dbg_agendaDblClick(Sender: TObject);
begin
  btn_editar_agendaClick(nil);
end;

procedure Tfrm_proc_comerc.SpeedButton1Click(Sender: TObject);
begin
//  if frm_proc_comerc.WindowState = wsNormal then begin
//    pnlAgendaCliente.Parent     := frm_proc_comerc;
//    frm_proc_comerc.WindowState := wsMaximized;
//  end else begin
//    pnlAgendaCliente.Parent     := ts_dados_basicos;
//    frm_proc_comerc.WindowState := wsNormal;
//  end;
  if pnlAgendaCliente.Parent = ts_dados_basicos then begin
    pnlAgendaCliente.Parent     := frm_proc_comerc;
//    frm_proc_comerc.WindowState := wsMaximized;
  end else begin
    pnlAgendaCliente.Parent     := ts_dados_basicos;
//    frm_proc_comerc.WindowState := wsNormal;
  end;
end;

procedure Tfrm_proc_comerc.chkRetroativoClick(Sender: TObject);
begin
  with datm_proc_comerc do begin
    qry_agenda_comerc_lista_.Close;
    qry_agenda_comerc_lista_.SQL.Clear;
    qry_agenda_comerc_lista_.SQL.Add('select * from TAGENDA_COMERC');
    qry_agenda_comerc_lista_.SQL.Add('where CD_AGENDA in (select TPCH.CD_AGENDA  from TPROC_COMERC_HISTORICO TPCH');
    qry_agenda_comerc_lista_.SQL.Add('where TPCH.CD_AGENDA IS NOT NULL and TPCH.NR_PROC_COMERC=:NR_PROC_COMERC)');
    if chkRetroativo.Checked then
      qry_agenda_comerc_lista_.SQL.Add('and IN_CANCELADO = 0   ')
    else
      qry_agenda_comerc_lista_.SQL.Add('and IN_CANCELADO = 0   AND (DT_AGENDA > :DT_AGENDA OR DT_AGENDA = :DT_AGENDA)');

    qry_agenda_comerc_lista_.SQL.Add('ORDER BY DT_AGENDA DESC');
    qry_agenda_comerc_lista_.ParamByName('NR_PROC_COMERC').AsString := qry_proc_comerc_lista_NR_PROC_COMERC.Value;;
    if not chkRetroativo.Checked then qry_agenda_comerc_lista_.ParamByName('DT_AGENDA').AsDate := dt_server-1;
    qry_agenda_comerc_lista_.Prepare;
    qry_agenda_comerc_lista_.Open;
    qry_agenda_comerc_lista_.EnableControls;
  end;
end;

procedure Tfrm_proc_comerc.PropostaClick(Sender: TObject);
var
  flt_nr_proposta : Real;
begin
  try
    with datm_proc_comerc do
    begin
      qry_ult_proposta_.Close;
      qry_ult_proposta_.ParamByName('CD_UNID_NEG').Value:= qry_proc_comerc_CD_UNID_NEG.AsString;
      qry_ult_proposta_.Prepare;
      qry_ult_proposta_.Open;

      if qry_ult_proposta_ULTIMO.AsString = '' then
        flt_nr_proposta := 1
      else flt_nr_proposta := StrToFloat(COPY(qry_ult_proposta_ULTIMO.AsString,4,6)) + 1;

      qry_ult_proposta_.Close;
      qry_proposta_.close;

      if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;

      qry_gera_proposta_.Close;
      qry_gera_proposta_.ParamByName('NR_PROPOSTA').AsString:= qry_proc_comerc_CD_UNID_NEG.AsString +'-'+FormatFloat('000000',flt_nr_proposta)+ copy(uppercase(str_nm_usuario),1,2);
      qry_gera_proposta_.ParamByName('CD_UNID_NEG').AsString:=qry_proc_comerc_CD_UNID_NEG.AsString;
      qry_gera_proposta_.ParamByName('CD_EMPRESA').AsString:=qry_proc_comerc_CD_EMPRESA.AsString;
      qry_gera_proposta_.ParamByName('CD_VENDEDOR').AsString:= qry_proc_comerc_CD_VENDEDOR.AsString;
      qry_gera_proposta_.ParamByName('NR_PROC_COMERC').AsString:= qry_proc_comerc_NR_PROC_COMERC.AsString;
      qry_gera_proposta_.ParamByName('DT_ABERTURA').AsDateTime:=dt_server;
      qry_gera_proposta_.ParamByName('CD_STATUS').AsString:='1';
      qry_gera_proposta_.ParamByName('DT_STATUS').AsDateTime:=dt_server;
      qry_gera_proposta_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
      qry_gera_proposta_.ParamByName('TP_PROPOSTA').AsString:='0';
      qry_gera_proposta_.Prepare;
      qry_gera_proposta_.ExecSql;

      datm_main.db_broker.Commit;

      Application.CreateForm(Tfrm_proposta, frm_proposta);
      Frm_proposta.ST_cliente:= qry_gera_proposta_.ParamByName('NR_PROPOSTA').AsString;//qry_proc_comerc_CD_EMPRESA.AsString;
      frm_proposta.St_Modulo:='P';
      frm_proposta.Caption:='Proposta';
      Frm_proposta.ShowModal;

      qry_proposta_.close;
      qry_proposta_.ParamByName('CD_EMPRESA').AsString := qry_proc_comerc_CD_EMPRESA.AsString;
      qry_proposta_.ParamByName('CD_UNID_NEG').AsString := qry_proc_comerc_CD_UNID_NEG.AsString;
      qry_proposta_.Prepare;
      qry_proposta_.Open;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

end;

procedure Tfrm_proc_comerc.cotacaoClick(Sender: TObject);
var
  flt_nr_proposta : Real;
begin
  try
    with datm_proc_comerc do
    begin
      qry_ult_proposta_.Close;
      qry_ult_proposta_.ParamByName('CD_UNID_NEG').Value:= qry_proc_comerc_CD_UNID_NEG.AsString;
      qry_ult_proposta_.Prepare;
      qry_ult_proposta_.Open;

      if qry_ult_proposta_ULTIMO.AsString = '' then
        flt_nr_proposta := 1
      else flt_nr_proposta := StrToFloat(COPY(qry_ult_proposta_ULTIMO.AsString,4,6)) + 1;

      qry_ult_proposta_.Close;
      qry_proposta_.close;

      if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;

      qry_gera_proposta_.Close;
      qry_gera_proposta_.ParamByName('NR_PROPOSTA').AsString:= qry_proc_comerc_CD_UNID_NEG.AsString +'-'+FormatFloat('000000',flt_nr_proposta)+ copy(uppercase(str_nm_usuario),1,2);
      qry_gera_proposta_.ParamByName('CD_UNID_NEG').AsString:=qry_proc_comerc_CD_UNID_NEG.AsString;
      qry_gera_proposta_.ParamByName('CD_EMPRESA').AsString:=qry_proc_comerc_CD_EMPRESA.AsString;
      qry_gera_proposta_.ParamByName('CD_VENDEDOR').AsString:= qry_proc_comerc_CD_VENDEDOR.AsString;
      qry_gera_proposta_.ParamByName('NR_PROC_COMERC').AsString:= qry_proc_comerc_NR_PROC_COMERC.AsString;
      qry_gera_proposta_.ParamByName('DT_ABERTURA').AsDateTime:=dt_server;
      qry_gera_proposta_.ParamByName('CD_STATUS').AsString:='1';
      qry_gera_proposta_.ParamByName('DT_STATUS').AsDateTime:=dt_server;
      qry_gera_proposta_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
      qry_gera_proposta_.ParamByName('TP_PROPOSTA').AsString:='1';
      qry_gera_proposta_.Prepare;
      qry_gera_proposta_.ExecSql;

      with TQuery.Create(application) do begin
        DataBaseName := 'DBBroker';
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO TPROPOSTA_ITEM (NR_PROPOSTA, CD_UNID_NEG, CD_PRODUTO, NR_ITEM_PROPOSTA, CD_VIA_TRANSP)');
        SQL.Add('VALUES ("' + qry_proc_comerc_CD_UNID_NEG.AsString +'-'+FormatFloat('000000',flt_nr_proposta)+ copy(uppercase(str_nm_usuario),1,2) + '", "' + qry_proc_comerc_CD_UNID_NEG.AsString + '", "01", 1, "01")');
        ExecSQL;
        Free;
      end;

      datm_main.db_broker.Commit;

      Application.CreateForm(Tfrm_cotacao, frm_cotacao);
      frm_cotacao.vPropostaIni := qry_proc_comerc_CD_UNID_NEG.AsString +'-'+FormatFloat('000000',flt_nr_proposta)+ copy(uppercase(str_nm_usuario),1,2);
      Frm_cotacao.ShowModal;

      qry_proposta_.close;
      qry_proposta_.ParamByName('CD_EMPRESA').AsString := qry_proc_comerc_CD_EMPRESA.AsString;
      qry_proposta_.ParamByName('CD_UNID_NEG').AsString := qry_proc_comerc_CD_UNID_NEG.AsString;
      qry_proposta_.Prepare;
      qry_proposta_.Open;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

end;

procedure Tfrm_proc_comerc.DBGrid1DblClick(Sender: TObject);
begin
  if datm_proc_comerc.qry_proposta_TIPO_PROPOSTA.AsString = 'Proposta' then begin
    Application.CreateForm(Tfrm_proposta, frm_proposta);
    Frm_proposta.ST_cliente:= datm_proc_comerc.qry_proposta_NR_PROPOSTA.AsString;
    frm_proposta.St_Modulo:='P';
    frm_proposta.Caption:='Proposta';
    Frm_proposta.ShowModal;
  end else begin
    Application.CreateForm(Tfrm_cotacao, frm_cotacao);
    frm_cotacao.vPropostaIni := datm_proc_comerc.qry_proposta_NR_PROPOSTA.AsString;
    Frm_cotacao.ShowModal;
  end;
end;

end.

