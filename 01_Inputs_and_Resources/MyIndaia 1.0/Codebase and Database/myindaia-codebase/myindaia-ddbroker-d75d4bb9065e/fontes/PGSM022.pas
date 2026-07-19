unit PGSM022;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, Funcoes;

type
  Tfrm_servico = class(TForm)
    pgctrl_servico: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_codigo: TLabel;
    lbl_nome: TLabel;
    dbedt_cd_servico: TDBEdit;
    dbedt_descricao: TDBEdit;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbg_cadastro: TDBGrid;
    lbl_via_transp: TLabel;
    dbedt_cd_classif: TDBEdit;
    dbedt_nm_classif: TDBEdit;
    btn_co_classif: TSpeedButton;
    lbl_calssif: TLabel;
    dbedt_cd_via_transp: TDBEdit;
    dbedt_nm_via_transp: TDBEdit;
    btn_co_via_transp: TSpeedButton;
    dblkpcbox_ativo: TDBLookupComboBox;
    lblAtivo: TLabel;
    ts_servico_evento: TTabSheet;
    pgctrl_servico_evento: TPageControl;
    ts_lista2: TTabSheet;
    dbg_contatos: TDBGrid;
    ts_dados_basicos2: TTabSheet;
    pnl_servico_evento: TPanel;
    lbl_evento: TLabel;
    lbl_pz_ev_basico: TLabel;
    lbl_pz_ev_futuro: TLabel;
    lbl_ordem: TLabel;
    btn_co_evento: TSpeedButton;
    lbl_ev_basico: TLabel;
    btn_co_ev_basico: TSpeedButton;
    lbl_ev_futuro: TLabel;
    btn_co_ev_futuro: TSpeedButton;
    lbl_servico: TLabel;
    dbedt_pz_do_ev_basico: TDBEdit;
    dbedt_pz_ate_ev_futuro: TDBEdit;
    dbedt_ordem: TDBEdit;
    dbedt_cd_evento: TDBEdit;
    dbedt_nm_evento: TDBEdit;
    dbedt_cd_ev_basico: TDBEdit;
    dbedt_nm_ev_basico: TDBEdit;
    dbedt_cd_ev_futuro: TDBEdit;
    dbedt_nm_ev_futuro: TDBEdit;
    dbedt_cd_servico3: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    Label3: TLabel;
    dbedt_cd_servico2: TDBEdit;
    dbedt_nm_servico2: TDBEdit;
    btn_duplicar: TSpeedButton;
    mi_duplicar: TMenuItem;
    dbedt_nr_dias_conclusao: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbedt_cd_ev_conclusor: TDBEdit;
    dbedt_nm_ev_conclusor: TDBEdit;
    btn_co_ev_conclusor: TSpeedButton;
    Label6: TLabel;
    dblkpcbox_followup: TDBLookupComboBox;
    lbl_adm_temp: TLabel;
    dblckpbox_adm_temp: TDBLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dblckpbox_indent: TDBLookupComboBox;
    dbedt_cd_ev_inicial: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    dbedt_cd_ev_final: TDBEdit;
    dbedt_nm_ev_inicial: TDBEdit;
    dbedt_nm_ev_final: TDBEdit;
    btn_co_ev_inicial: TSpeedButton;
    btn_co_ev_final: TSpeedButton;
    btn_co_grupo_servico: TSpeedButton;
    Label12: TLabel;
    dbedt_nm_grupo_servico: TDBEdit;
    dbedt_cd_grupo_servico: TDBEdit;
    Label13: TLabel;
    dblckpbox_cont_venc: TDBLookupComboBox;
    dblckpbox_tipo_evento: TDBLookupComboBox;
    Label14: TLabel;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbradgrp_servico: TDBRadioGroup;
    dblckpbox_aladi: TDBLookupComboBox;
    Label15: TLabel;
    dblckpbox_fumigacao: TDBLookupComboBox;
    Label16: TLabel;
    dbedtConfigStatus: TDBEdit;
    Label17: TLabel;
    btnConfigStatus: TSpeedButton;
    edtNomeConfig: TEdit;
    dbchkInSubstitui: TDBCheckBox;
    lblInSubstitui: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label18: TLabel;
    Label19: TLabel;
    dbchkIN_PRAZO_UTIL: TDBCheckBox;
    dbchkIN_PRAZO_FERIADO: TDBCheckBox;
    btn_atualiza_processo: TSpeedButton;
    Panel1: TPanel;
    chkServicoNovo: TCheckBox;
    btnAtualizaFollowup: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_descricaoChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_cd_classifExit(Sender: TObject);
    procedure dbedt_cd_via_transpExit(Sender: TObject);
    procedure btn_co_classifClick(Sender: TObject);
    procedure btn_co_via_transpClick(Sender: TObject);
    procedure pgctrl_servicoChange(Sender: TObject);
    procedure dbedt_cd_eventoChange(Sender: TObject);
    procedure dbedt_cd_eventoExit(Sender: TObject);
    procedure dbedt_cd_ev_basicoExit(Sender: TObject);
    procedure dbedt_cd_ev_futuroExit(Sender: TObject);
    procedure btn_co_eventoClick(Sender: TObject);
    procedure btn_co_ev_basicoClick(Sender: TObject);
    procedure btn_co_ev_futuroClick(Sender: TObject);
    procedure dbedt_ordemExit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure pgctrl_servicoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure Cancelar;
    procedure Atualiza_Duplica;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_classifKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_duplicarClick(Sender: TObject);
    procedure btn_co_ev_conclusorClick(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_ev_inicialChange(Sender: TObject);
    procedure dbedt_cd_ev_finalChange(Sender: TObject);
    procedure dbedt_cd_ev_inicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_ev_finalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_ev_inicialClick(Sender: TObject);
    procedure btn_co_ev_finalClick(Sender: TObject);
    procedure btn_co_grupo_servicoClick(Sender: TObject);
    procedure dbedt_cd_ev_inicialExit(Sender: TObject);
    procedure dbedt_cd_ev_finalExit(Sender: TObject);
    procedure dbedt_cd_grupo_servicoChange(Sender: TObject);
    procedure dbedt_cd_grupo_servicoExit(Sender: TObject);
    procedure dbedt_cd_grupo_servicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblckpbox_cont_vencClick(Sender: TObject);
    procedure btnConfigStatusClick(Sender: TObject);
    procedure edt_chaveExit(Sender: TObject);
    procedure dbchkIN_PRAZO_UTILClick(Sender: TObject);
    procedure btn_atualiza_processoClick(Sender: TObject);
    procedure chkServicoNovoClick(Sender: TObject);
    procedure btnAtualizaFollowupClick(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..3] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_Online_Texto : String;
  end;

var
  frm_servico: Tfrm_servico;
  AlterouFiltro: Boolean = False;

implementation

uses GSMLIB, PGSM011, PGSM026, PGSM028, PGSM033, PGSM036, PGGP001, PGGP017,
  PGSM097, PGSM098, ConsOnLineEx, StrUtils;

{$R *.DFM}

procedure Tfrm_servico.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_servico.btn_incluirClick(Sender: TObject);
begin
  if ( pgctrl_servico.ActivePage = ts_dados_basicos ) or
     ( pgctrl_servico.ActivePage = ts_lista ) then
  begin
    with datm_servico do
    begin
      //if qry_servico_.RequestLive then
      begin
        qry_servico_.DisableControls;
        qry_servico_.Cancel;
        qry_servico_.Append;
        qry_servico_.EnableControls;
        if datm_servico.ServicoNovo then
          qry_servico_CD_SERVICO.AsInteger := 0//StrToInt(UltCod(qry_ult_servico_, qry_ult_servico_ULTIMO))
        else
          qry_servico_CD_SERVICO.AsString  := UltCod(qry_ult_servico_, qry_ult_servico_ULTIMO);
        qry_servico_IN_ATIVO.AsString      := '1';
        qry_servico_IN_FOLLOWUP.AsString   := '1';
        qry_servico_IN_ADM_TEMP.AsString   := '0';
        qry_servico_IN_INDENT.AsString     := '0';
      end
      //else
      //begin
      //  BoxMensagem('Você não poderá incluir novos registros, pois um filtro por clientes está ativo',2);
      //  Exit;
      //end;
    end;
    pgctrl_servico.ActivePage := ts_dados_basicos;
    dbedt_descricao.SetFocus;
  end
  else //Serviço X Evento
  begin
    with datm_servico do
    begin
      if qry_servico_.RecordCount = 0  then
      begin
        BoxMensagem('Selecione um Serviço!', 2);
        pgctrl_servico.ActivePage := ts_lista;
        Cancelar;
        Exit;
      end;

      qry_servico_evento_.DisableControls;
      qry_servico_evento_.Cancel;
      qry_servico_evento_.Append;
      qry_servico_evento_.EnableControls;

      //Verificando número da última ordem
      qry_ult_ordem_.Close;
      if datm_servico.ServicoNovo then
        qry_ult_ordem_.ParamByName('CD_SERVICO').AsInteger := qry_servico_CD_SERVICO.AsInteger
      else
        qry_ult_ordem_.ParamByName('CD_SERVICO').AsString  := qry_servico_CD_SERVICO.AsString;
      qry_ult_ordem_.Open;
      qry_servico_evento_NR_ORDEM.AsInteger                := qry_ult_ordem_ULTIMO.AsInteger + 1;
      qry_ult_ordem_.Close;

      if datm_servico.ServicoNovo then
        qry_servico_evento_CD_SERVICO.AsInteger            := qry_servico_CD_SERVICO.AsInteger
      else
        qry_servico_evento_CD_SERVICO.AsString             := qry_servico_CD_SERVICO.AsString;

      if qry_servico_evento_NR_ORDEM.AsInteger = 1 then
      begin
        dbedt_cd_ev_basico.Text       := '';
        dbedt_pz_do_ev_basico.Text    := '';

        dbedt_cd_ev_basico.Color      := clMenu;
        dbedt_pz_do_ev_basico.Color   := clMenu;

        dbedt_cd_ev_basico.Enabled    := False;
        dbedt_pz_do_ev_basico.Enabled := False;

        btn_co_ev_basico.Enabled      := False;
      end
      else
      begin
        dbedt_cd_ev_basico.Color      := clWindow;
        dbedt_pz_do_ev_basico.Color   := clWindow;

        dbedt_cd_ev_basico.Enabled    := True;
        dbedt_pz_do_ev_basico.Enabled := True;

        btn_co_ev_basico.Enabled      := True;
      end;
    end;
    pgctrl_servico_evento.ActivePage := ts_dados_basicos2;
    pnl_servico_evento.Enabled       := True;
    dbedt_cd_evento.SetFocus;
  end;

  btn_mi( False, True, True, False );

  dbnvg.Enabled     := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled  := False;

end;

procedure Tfrm_servico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_servico do
    begin
      tbl_yesno_.Close;
      qry_classif_.Close;
      qry_via_transp_.Close;
      qry_servico_.Close;
      qry_ttp_tipo_evento_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_servico.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      if datm_servico.ServicoNovo then
        Cons_OnLine.AsInteger := datm_servico.qry_servico_CD_SERVICO.AsInteger
      else
        Cons_OnLine.AsString  := datm_servico.qry_servico_CD_SERVICO.AsString;
    except
      try
         Cons_Online_Texto := datm_servico.qry_servico_CD_SERVICO.AsString;
      except
         BoxMensagem('Não foi possível retornar o Código do Serviço!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_servico.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_servico.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  // Inicializa o Data Module para Serviços
  Application.CreateForm( Tdatm_servico, datm_servico );

  with datm_servico do
  begin
    ds_servico.AutoEdit        := st_modificar;
    ds_servico_evento.AutoEdit := st_modificar;

    tbl_yesno_.Open;

    qry_classif_.Close;
    qry_classif_.Prepare;
    qry_classif_.Open;

    qry_via_transp_.Close;
    qry_via_transp_.Prepare;
    qry_via_transp_.Open;

    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;

    qry_servico_.Close;
    //qry_servico_.SQL[2] := 'NM_SERVICO';
    qry_servico_.Prepare;
    qry_servico_.Open;

    qry_servico_evento_.Close;
    if datm_servico.ServicoNovo then
      qry_servico_evento_.ParamByName('CD_SERVICO').AsInteger := qry_servico_CD_SERVICO.AsInteger
    else
      qry_servico_evento_.ParamByName('CD_SERVICO').AsString  := qry_servico_CD_SERVICO.AsString;
    qry_servico_evento_.Prepare;
    qry_servico_evento_.Open;

    qry_ttp_tipo_evento_.Close;
    qry_ttp_tipo_evento_.Prepare;
    qry_ttp_tipo_evento_.Open;
  end;

  a_str_indices[0] := 'CD_SERVICO';
  a_str_indices[1] := 'NM_SERVICO';
  a_str_indices[2] := 'NM_CLASSIFICACAO';
  a_str_indices[3] := 'NM_VIA_TRANSP';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    Items.Add('Classificação');
    Items.Add('Via de Transporte');
    Items.Add('Pesquisa Geral');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_servico.btn_excluirClick(Sender: TObject);
begin
  with datm_servico do
  begin
    if ( pgctrl_servico.ActivePage = ts_dados_basicos ) or
       ( pgctrl_servico.ActivePage = ts_lista ) then
    begin
      if not qry_servico_.RequestLive then
      begin
        BoxMensagem('Você não poderá excluir registros, pois um filtro por clientes está ativo',2);
        Exit;
      end;

      if BoxMensagem( 'Este Serviço será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        //Serviço X Evento
        qry_servico_evento_.First;
        while Not qry_servico_evento_.EOF do
        begin
          if ServicoNovo then
          begin
            CloseStoredProc(sp_exclui_servico_evento_novo);
            sp_exclui_servico_evento_novo.ParamByName('@CD_SERVICO').AsInteger  := qry_servico_evento_CD_SERVICO.AsInteger;
            sp_exclui_servico_evento_novo.ParamByName('@CD_EVENTO').AsString    := qry_servico_evento_CD_EVENTO.AsString;
            sp_exclui_servico_evento_novo.ParamByName('@IN_CONSISTE').AsBoolean := False;
            ExecStoredProc(sp_exclui_servico_evento_novo);
            CloseStoredProc(sp_exclui_servico_evento_novo);
          end
          else
          begin
            CloseStoredProc(sp_exclui_servico_evento);
            sp_exclui_servico_evento.ParamByName('@CD_SERVICO').AsString   := qry_servico_evento_CD_SERVICO.AsString;
            sp_exclui_servico_evento.ParamByName('@CD_EVENTO').AsString    := qry_servico_evento_CD_EVENTO.AsString;
            sp_exclui_servico_evento.ParamByName('@IN_CONSISTE').AsBoolean := False;
            ExecStoredProc(sp_exclui_servico_evento);
            CloseStoredProc(sp_exclui_servico_evento);
          end;
          qry_servico_evento_.Next;
        end;
        //Serviço
        qry_servico_.Delete;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          qry_servico_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_servico.ActivePage := ts_lista;
    end
    else
    begin
      if qry_servico_evento_.RecordCount = 0 then Exit;
      if BoxMensagem( 'Este Serviço x Evento será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        if ServicoNovo then
        begin
          CloseStoredProc(sp_exclui_servico_evento_novo);
          sp_exclui_servico_evento_novo.ParamByName('@CD_SERVICO').AsInteger  := qry_servico_evento_CD_SERVICO.AsInteger;
          sp_exclui_servico_evento_novo.ParamByName('@CD_EVENTO').AsString    := qry_servico_evento_CD_EVENTO.AsString;
          sp_exclui_servico_evento_novo.ParamByName('@IN_CONSISTE').AsBoolean := True;
          ExecStoredProc(sp_exclui_servico_evento_novo);
          if sp_exclui_servico_evento_novo.ParamByName('Result').AsInteger = 1 then
          begin
            BoxMensagem('Não posso excluir este evento pois é um evento base/futuro', 2);
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            qry_servico_evento_.Cancel;
          end
          else
             datm_main.db_broker.Commit;
          CloseStoredProc(sp_exclui_servico_evento_novo);
        end
        else
        begin
          CloseStoredProc(sp_exclui_servico_evento);
          sp_exclui_servico_evento.ParamByName('@CD_SERVICO').AsString   := qry_servico_evento_CD_SERVICO.AsString;
          sp_exclui_servico_evento.ParamByName('@CD_EVENTO').AsString    := qry_servico_evento_CD_EVENTO.AsString;
          sp_exclui_servico_evento.ParamByName('@IN_CONSISTE').AsBoolean := True;
          ExecStoredProc(sp_exclui_servico_evento);
          if sp_exclui_servico_evento.ParamByName('Result').AsInteger = 1 then
          begin
            BoxMensagem('Não posso excluir este evento pois é um evento base/futuro', 2);
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            qry_servico_evento_.Cancel;
          end
          else
             datm_main.db_broker.Commit;
          CloseStoredProc(sp_exclui_servico_evento);
        end;
        qry_servico_evento_.Close;
        qry_servico_evento_.Prepare;
        qry_servico_evento_.Open;
      except
        on E: Exception do
        begin
          qry_servico_evento_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_servico_evento.ActivePage := ts_lista2;
    end;
  end;
  Atualiza_Duplica;
end;

procedure Tfrm_servico.FormShow(Sender: TObject);
begin
  lNaoConsiste              := False;
  pgctrl_servico.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_servico.dbedt_descricaoChange(Sender: TObject);
begin
 if ( datm_servico.qry_servico_.State in [ dsInsert, dsEdit ]) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_servico.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_servico.edt_chaveChange(Sender: TObject);
begin
  case cb_ordem.ItemIndex of
    0, 1, 2, 3: Localiza(datm_servico.qry_servico_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex]);
    4: Localiza(datm_servico.qry_servico_, edt_chave.Text, a_str_indices[1]);
  end;
  AlterouFiltro := (Sender = edt_chave) or (Sender = cb_ordem);
end;

procedure Tfrm_servico.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_servico.qry_servico_CD_SERVICO.AsString;
  // Apaga o campo de pesquisa
  edt_chave.Text := '';
  datm_servico.qry_servico_.Close;
  datm_servico.qry_servico_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_servico.qry_servico_.Open;
  Localiza(datm_servico.qry_servico_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_servico.dbedt_cd_classifExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;    
end;

procedure Tfrm_servico.dbedt_cd_via_transpExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_servico.btn_co_classifClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2306';
  Application.CreateForm(Tfrm_serv_classif, frm_serv_classif);
  frm_serv_classif.Cons_OnLine := datm_servico.qry_servico_CD_CLASSIFICACAO;
  with frm_serv_classif do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_servico.qry_servico_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
    begin
      datm_servico.qry_servico_evento_.Edit;
      datm_servico.qry_servico_.Edit;
    end;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_servico do
  begin
    qry_classif_.Close;
    qry_classif_.Prepare;
    qry_classif_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  dbedt_cd_classifExit(nil);
end;

procedure Tfrm_servico.btn_co_via_transpClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2212';
  Application.CreateForm(Tfrm_via_transp, frm_via_transp);
  frm_via_transp.Cons_OnLine := datm_servico.qry_servico_CD_VIA_TRANSPORTE;
  with frm_via_transp do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_servico.qry_servico_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_servico.qry_servico_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_servico do
  begin
    qry_via_transp_.Close;
    qry_via_transp_.Prepare;
    qry_via_transp_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  dbedt_cd_via_transpExit(Sender);
end;

procedure Tfrm_servico.pgctrl_servicoChange(Sender: TObject);
begin
  if datm_servico.qry_servico_evento_NR_ORDEM.AsInteger = 1 then
  begin
    dbedt_cd_ev_basico.Text       := '';
    dbedt_pz_do_ev_basico.Text    := '';
    dbedt_cd_ev_basico.Color      := clMenu;
    dbedt_pz_do_ev_basico.Color   := clMenu;
    dbedt_cd_ev_basico.Enabled    := False;
    dbedt_pz_do_ev_basico.Enabled := False;
    btn_co_ev_basico.Enabled      := False;
  end
  else
  begin
    dbedt_cd_ev_basico.Color      := clWindow;
    dbedt_pz_do_ev_basico.Color   := clWindow;
    dbedt_cd_ev_basico.Enabled    := True;
    dbedt_pz_do_ev_basico.Enabled := True;
    btn_co_ev_basico.Enabled      := True;
  end;

  if ( pgctrl_servico.ActivePage = ts_dados_basicos ) or
     ( pgctrl_servico.ActivePage = ts_lista ) then
  begin
    dbnvg.DataSource     := datm_servico.ds_servico;
    btn_duplicar.Enabled := False;
    mi_duplicar.Enabled  := False;
    btn_atualiza_processo.Enabled:=true;
  end
  else
  begin
    btn_atualiza_processo.Enabled:=false;
    dbnvg.DataSource := datm_servico.ds_servico_evento;
    if datm_servico.qry_servico_evento_.RecordCount = 0 then
    begin
      btn_duplicar.Enabled := True;
      mi_duplicar.Enabled  := True;
    end
    else
    begin
      btn_duplicar.Enabled := False;
      mi_duplicar.Enabled  := False;
    end;
  end;

  pnl_pesquisa.Enabled := (pgctrl_servico.ActivePage = ts_lista);
  {if (   pgctrl_servico.ActivePage = ts_lista ) or
     ( ( pgctrl_servico.ActivePage = ts_servico_evento ) and
       ( pgctrl_servico_evento.ActivePage = ts_lista2 ) ) then
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
  end;}
end;

procedure Tfrm_servico.dbedt_cd_eventoChange(Sender: TObject);
begin
  if ( datm_servico.qry_servico_evento_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );

  with datm_servico do
  begin
    if ( datm_servico.qry_servico_evento_NR_ORDEM.AsInteger = 1 ) and
       ( frm_servico.pgctrl_servico.ActivePage = ts_servico_evento ) and
       ( frm_servico.pgctrl_servico_evento.ActivePage = ts_dados_basicos2 ) then
    begin
      dbedt_cd_ev_basico.Text       := '';
      dbedt_pz_do_ev_basico.Text    := '';
      dbedt_nm_ev_basico.Text       := '';

      dbedt_cd_ev_basico.Color      := clMenu;
      dbedt_pz_do_ev_basico.Color   := clMenu;

      dbedt_cd_ev_basico.Enabled    := False;
      dbedt_pz_do_ev_basico.Enabled := False;

      btn_co_ev_basico.Enabled      := False;
    end
    else
    begin
      dbedt_cd_ev_basico.Color      := clWindow;
      dbedt_pz_do_ev_basico.Color   := clWindow;

      dbedt_cd_ev_basico.Enabled    := True;
      dbedt_pz_do_ev_basico.Enabled := True;

      btn_co_ev_basico.Enabled      := True;
    end;
  end;
end;

procedure Tfrm_servico.dbedt_cd_eventoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_servico.dbedt_cd_ev_basicoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_servico.dbedt_cd_ev_futuroExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_servico.btn_co_eventoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  frm_evento.Cons_OnLine := datm_servico.qry_servico_evento_CD_EVENTO;
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_servico.qry_servico_evento_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_servico.qry_servico_evento_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_servico do
  begin
    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  dbedt_cd_eventoExit(nil);
end;

procedure Tfrm_servico.btn_co_ev_basicoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  frm_evento.Cons_OnLine := datm_servico.qry_servico_evento_CD_EV_BASICO;
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_servico.qry_servico_evento_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_servico.qry_servico_evento_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_servico do
  begin
    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  dbedt_cd_ev_basicoExit(nil);
end;

procedure Tfrm_servico.btn_co_ev_futuroClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  frm_evento.Cons_OnLine := datm_servico.qry_servico_evento_CD_EV_FUTURO;
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_servico.qry_servico_evento_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_servico.qry_servico_evento_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_servico do
  begin
    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  dbedt_cd_ev_futuroExit(nil);
end;

procedure Tfrm_servico.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_servico.dbedt_ordemExit(Sender: TObject);
begin
  if ( datm_servico.qry_servico_evento_NR_ORDEM.AsInteger = 1 ) and
     ( frm_servico.pgctrl_servico.ActivePage = ts_servico_evento ) and
     ( frm_servico.pgctrl_servico_evento.ActivePage = ts_dados_basicos2 ) then
  begin
    dbedt_cd_ev_basico.Text       := '';
    dbedt_pz_do_ev_basico.Text    := '';
    dbedt_nm_ev_basico.Text       := '';

    dbedt_cd_ev_basico.Color      := clMenu;
    dbedt_pz_do_ev_basico.Color   := clMenu;

    dbedt_cd_ev_basico.Enabled    := False;
    dbedt_pz_do_ev_basico.Enabled := False;

    btn_co_ev_basico.Enabled      := False;

    dbedt_cd_ev_futuro.SetFocus;
  end
  else
  begin
    dbedt_cd_ev_basico.Color      := clWindow;
    dbedt_pz_do_ev_basico.Color   := clWindow;

    dbedt_cd_ev_basico.Enabled    := True;
    dbedt_pz_do_ev_basico.Enabled := True;

    btn_co_ev_basico.Enabled      := True;
  end;
end;

function Tfrm_servico.Consiste : Boolean;
begin
  with datm_servico do
  begin
    if ( pgctrl_servico.ActivePage = ts_dados_basicos ) or
       ( pgctrl_servico.ActivePage = ts_lista ) then
    begin
      //Descrição do serviço
      if Not lNaoConsiste then
      begin
        if dbedt_descricao.Text = '' then
        begin
          BoxMensagem('Campo Descrição deve ser preenchido!', 2);
          pgctrl_servico.ActivePage := ts_dados_basicos;
          dbedt_descricao.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      //Grupo
      if ( qry_servico_.State in [dsEdit, dsInsert] ) then
      begin;
        ValidCodigo( dbedt_cd_grupo_servico );
        if dbedt_cd_grupo_servico.Text <> '' then
        begin
          if dbedt_nm_grupo_servico.Text = '' then
          begin
            BoxMensagem('Código do Grupo Inválido!',2);
            pgctrl_servico.ActivePage := ts_dados_basicos;
            dbedt_cd_grupo_servico.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      //Classificação de Serviços
      if Not lNaoConsiste then
      begin
        if dbedt_cd_classif.Text = '' then
        begin
          BoxMensagem('Campo Classificação deve ser preenchido!', 2);
          pgctrl_servico.ActivePage := ts_dados_basicos;
          dbedt_cd_classif.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if ( qry_servico_.State in [dsEdit, dsInsert] ) then
      begin;
        ValidCodigo( dbedt_cd_classif );
        if dbedt_cd_classif.Text <> '' then
        begin
          if dbedt_nm_classif.Text = '' then
          begin
            BoxMensagem('Código da Classificação inválido!',2);
            pgctrl_servico.ActivePage := ts_dados_basicos;
            dbedt_cd_classif.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      //Evento Inicial
      if Not lNaoConsiste then
      begin
        if dbedt_cd_ev_inicial.Text = '' then
        begin
          BoxMensagem('Campo Evento Inicial deve ser Preenchido!', 2);
          pgctrl_servico.ActivePage := ts_dados_basicos;
          dbedt_cd_ev_inicial.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if ( qry_servico_.State in [dsEdit, dsInsert] ) then
      begin;
        ValidCodigo( dbedt_cd_ev_inicial );
        if dbedt_cd_ev_inicial.Text <> '' then
        begin
          if dbedt_nm_ev_inicial.Text = '' then
          begin
            BoxMensagem('Código do Evento Inicial Inválido!',2);
            pgctrl_servico.ActivePage := ts_dados_basicos;
            dbedt_cd_ev_inicial.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      //Evento Final
      if Not lNaoConsiste then
      begin
        if dbedt_cd_ev_final.Text = '' then
        begin
          BoxMensagem('Campo Evento Final deve ser Preenchido!', 2);
          pgctrl_servico.ActivePage := ts_dados_basicos;
          dbedt_cd_ev_final.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if ( qry_servico_.State in [dsEdit, dsInsert] ) then
      begin;
        ValidCodigo( dbedt_cd_ev_final );
        if dbedt_cd_ev_final.Text <> '' then
        begin
          if dbedt_nm_ev_final.Text = '' then
          begin
            BoxMensagem('Código do Evento Final Inválido!',2);
            pgctrl_servico.ActivePage := ts_dados_basicos;
            dbedt_cd_ev_final.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      //Via de Transporte
      if Not lNaoConsiste then
      begin
        if dbedt_cd_via_transp.Text = '' then
        begin
          BoxMensagem('Campo Via de Transporte deve ser preenchido!', 2);
          pgctrl_servico.ActivePage := ts_dados_basicos;
          dbedt_cd_via_transp.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if ( qry_servico_.State in [dsEdit, dsInsert] ) then
      begin
        ValidCodigo( dbedt_cd_via_transp );
        if dbedt_cd_via_transp.Text <> '' then
        begin
          if dbedt_nm_via_transp.Text = '' then
          begin
            BoxMensagem('Código da Via de Transporte inválido!',2);
            pgctrl_servico.ActivePage := ts_dados_basicos;
            dbedt_cd_via_transp.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      //Prazo para Conclusão
      if Not lNaoConsiste then
      begin
        if ( qry_servico_CD_EVENTO_CONCLUSOR.AsString <> '' ) and
           ( qry_servico_NR_DIAS_CONCLUSAO.AsInteger = 0 ) then
        begin
          BoxMensagem('O Prazo para conclusão deve ser informado!', 2);
          pgctrl_servico.ActivePage := ts_dados_basicos;
          dbedt_nr_dias_conclusao.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      //Evento Conclusor
      if ( qry_servico_.State in [dsEdit, dsInsert] ) then
      begin;
        ValidCodigo( dbedt_cd_ev_conclusor );
        if dbedt_cd_ev_conclusor.Text <> '' Then
        begin
          if dbedt_nm_ev_conclusor.Text = '' then
          begin
            BoxMensagem('Código do evento conclusor inválido!',2);
            pgctrl_servico.ActivePage := ts_dados_basicos;
            dbedt_cd_ev_conclusor.SetFocus;
            Consiste := False;
            Exit;
          end
          else
          begin
            if ( qry_servico_.State in [dsEdit] ) then
            begin
  //            Localiza(qry_servico_evento_, dbedt_cd_ev_conclusor.Text, 'CD_EVENTO' );
  //            if qry_servico_evento_CD_EVENTO.AsString <> dbedt_cd_ev_conclusor.Text then
              qry_se_conclusor_.Close;
              if datm_servico.ServicoNovo then
                qry_se_conclusor_.ParamByName('CD_SERVICO').AsInteger := qry_servico_CD_SERVICO.AsInteger
              else
                qry_se_conclusor_.ParamByName('CD_SERVICO').AsString  := qry_servico_CD_SERVICO.AsString;
              qry_se_conclusor_.ParamByName('CD_EVENTO').AsString     := dbedt_cd_ev_conclusor.Text;
              qry_se_conclusor_.Prepare;
              qry_se_conclusor_.Open;
              if Not qry_se_conclusor_.RecordCount = 0 then
              begin
                BoxMensagem('Código do evento conclusor não está relacionado a este serviço!', 3);
                pgctrl_servico.ActivePage := ts_dados_basicos;
                Consiste := True;
                qry_se_conclusor_.Close;
                Exit;
              end;
              qry_se_conclusor_.Close;
            end;
          end;
        end;
      end;
    end
    else //Serviço X Evento
    begin
      //Evento nulo
      if Not lNaoConsiste then
      begin
        if dbedt_cd_evento.Text = '' then
        begin
          BoxMensagem('Campo Evento deve ser preenchido!', 2);
          pgctrl_servico_evento.ActivePage := ts_dados_basicos2;
          dbedt_cd_evento.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if ( qry_servico_evento_.State in [dsEdit, dsInsert] ) then
      begin
        ValidCodigo( dbedt_cd_evento );
        if dbedt_cd_evento.Text <> '' Then
        begin
          if dbedt_nm_evento.Text = '' then
          begin
            BoxMensagem('Código do evento inválido!',2);
            pgctrl_servico.ActivePage        := ts_servico_evento;
            pgctrl_servico_evento.ActivePage := ts_dados_basicos2;
            dbedt_cd_evento.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      if ( qry_servico_evento_.State in [dsEdit, dsInsert] ) then
      begin
        if dbedt_cd_ev_basico.Text <> '' then
        begin
          ValidCodigo( dbedt_cd_ev_basico );
          if dbedt_nm_ev_basico.Text = '' then
          begin
            BoxMensagem('Código do Evento Base inválido!',2);
            pgctrl_servico.ActivePage        := ts_servico_evento;
            pgctrl_servico_evento.ActivePage := ts_dados_basicos2;
            dbedt_cd_ev_basico.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      if ( qry_servico_evento_.State in [dsEdit, dsInsert] ) then
      begin
        if dbedt_cd_ev_futuro.Text <> '' then
        begin
          ValidCodigo( dbedt_cd_ev_futuro );
          if dbedt_nm_ev_futuro.Text = '' then
          begin
            BoxMensagem('Código do Evento Futuro inválido!',2);
            pgctrl_servico.ActivePage        := ts_servico_evento;
            pgctrl_servico_evento.ActivePage := ts_dados_basicos2;
            dbedt_cd_ev_futuro.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      //Evento Base existente no processo e com nº ordem inferior ao atual
      if ( qry_servico_evento_.State in [dsEdit, dsInsert] ) then
      begin
        if dbedt_cd_ev_basico.Text <> '' then
        begin
          with datm_servico do
          begin
            qry_ev_base_.Close;
            if datm_servico.ServicoNovo then
              qry_ev_base_.ParamByName('CD_SERVICO').AsInteger := qry_servico_evento_CD_SERVICO.AsInteger
            else
              qry_ev_base_.ParamByName('CD_SERVICO').AsString  := qry_servico_evento_CD_SERVICO.AsString;
            qry_ev_base_.ParamByName('CD_EV_BASICO').AsString  := qry_servico_evento_CD_EV_BASICO.AsString;
            qry_ev_base_.Prepare;
            qry_ev_base_.Open;
            if ( qry_ev_base_.RecordCount = 0 ) then
            begin
              BoxMensagem('Evento Base não cadastrado para este serviço!', 2);
              pgctrl_servico_evento.ActivePage := ts_dados_basicos2;
              dbedt_cd_ev_basico.SetFocus;
              Consiste := False;
              Exit;
            end
            else
            begin
              //               anterior           >=              atual
//              if ( qry_ev_base_NR_ORDEM.AsInteger >= qry_servico_evento_NR_ORDEM.AsInteger ) then
//              begin
//                BoxMensagem('Evento Base deve possuir nº ordem menor que a origem!', 2);
//                pgctrl_servico_evento.ActivePage := ts_dados_basicos2;
//                dbedt_cd_ev_basico.SetFocus;
//                Consiste := False;
//                Exit;
//              end;
            end;
          end;
        end;

        //Evento Futuro existente no processo e com nº ordem superior ao atual
        if dbedt_cd_ev_futuro.Text <> '' then
        begin
          qry_ev_futuro_.Close;
          if datm_servico.ServicoNovo then
            qry_ev_futuro_.ParamByName('CD_SERVICO').AsInteger := datm_servico.qry_servico_evento_CD_SERVICO.AsInteger
          else
            qry_ev_futuro_.ParamByName('CD_SERVICO').AsString  := datm_servico.qry_servico_evento_CD_SERVICO.AsString;
          qry_ev_futuro_.ParamByName('CD_EV_FUTURO').AsString  := datm_servico.qry_servico_evento_CD_EV_FUTURO.AsString;
          qry_ev_futuro_.Prepare;
          qry_ev_futuro_.Open;
          if ( datm_servico.qry_ev_futuro_.RecordCount = 0 ) then
          begin
            if ( datm_servico.qry_servico_evento_.State in [dsEdit] ) then
            begin
              BoxMensagem('Evento Futuro não cadastrado para este serviço!', 2);
              pgctrl_servico_evento.ActivePage := ts_dados_basicos2;
              dbedt_cd_ev_futuro.SetFocus;
              btn_salvar.Enabled := True;
              Consiste := False;
              Exit;
            end;
          end
          else
          begin
            if ( qry_ev_futuro_NR_ORDEM.AsInteger <= qry_servico_evento_NR_ORDEM.AsInteger ) then
            begin
              BoxMensagem('Evento Futuro deve possuir nº ordem maior que a Origem!', 2);
              pgctrl_servico_evento.ActivePage := ts_dados_basicos2;
              dbedt_cd_ev_futuro.SetFocus;
              Consiste := False;
              Exit;
            end;
          end;
        end;

        //Nº Ordem Nulo
        if dbedt_ordem.Text = '' then
        begin
          BoxMensagem('Campo Ordem deve ser preenchido!', 2);
          pgctrl_servico_evento.ActivePage := ts_dados_basicos2;
          dbedt_ordem.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
    Consiste := True;
  end;
end;

function Tfrm_servico.Grava : Boolean;
var
  sp_ok : Boolean;
  OrdemAnterior : Integer;
begin
  if ( pgctrl_servico.ActivePage = ts_dados_basicos ) or
     ( pgctrl_servico.ActivePage = ts_lista ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_servico.qry_servico_.State in [dsInsert, dsEdit] ) then
      begin
        datm_servico.qry_servico_.Post;
        Pesquisa := datm_servico.qry_servico_CD_SERVICO.AsString;
        datm_servico.qry_servico_.Close;
        datm_servico.qry_servico_.Prepare;
        datm_servico.qry_servico_.Open;
        Localiza(datm_servico.qry_servico_, Pesquisa, a_str_indices[0] );
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_servico.qry_servico_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
    end;
    end;
  end
  else //Serviço X Evento
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_servico.qry_servico_evento_.State in [dsInsert, dsEdit] ) then
      begin
        with datm_servico do
        begin
          if ( qry_servico_evento_NR_ORDEM.AsInteger = 1 ) then
          begin
            qry_servico_evento_CD_EV_BASICO.AsString := '';
            qry_servico_evento_PZ_DO_EV_BASICO.IsNull; // ou deve ser 0??
          end;

          if qry_servico_evento_.State in [dsInsert] then
          begin
            OrdemAnterior := StrToInt(Trim(dbedt_ordem.Text));
            //Forçando o número da última ordem
            qry_ult_ordem_.Close;
            if datm_servico.ServicoNovo then
              qry_ult_ordem_.ParamByName('CD_SERVICO').AsInteger := qry_servico_CD_SERVICO.AsInteger
            else
              qry_ult_ordem_.ParamByName('CD_SERVICO').AsString  := qry_servico_CD_SERVICO.AsString;
            qry_ult_ordem_.Prepare;
            qry_ult_ordem_.Open;
            qry_servico_evento_NR_ORDEM.AsInteger  := qry_ult_ordem_ULTIMO.AsInteger + 1;
            if datm_servico.ServicoNovo then
              qry_servico_evento_CD_SERVICO.AsInteger := qry_servico_CD_SERVICO.AsInteger
            else
              qry_servico_evento_CD_SERVICO.AsString  := qry_servico_CD_SERVICO.AsString;
            qry_ult_ordem_.Close;
            qry_servico_evento_.Post;
            Nr_Ordem := StrToInt(Trim(dbedt_ordem.Text));
            qry_servico_evento_.Edit;
            qry_servico_evento_NR_ORDEM.AsInteger  := OrdemAnterior;
          end;

          sp_ok := True;
          if ServicoNovo then
          begin
            CloseStoredProc(sp_ordena_eventos_novo);
            sp_ordena_eventos_novo.ParamByName('@CD_SERVICO').AsString        := qry_servico_evento_CD_SERVICO.AsString;
            sp_ordena_eventos_novo.ParamByName('@NR_ORDEM_DESTINO').AsInteger := StrToInt(Trim(dbedt_ordem.Text));
            sp_ordena_eventos_novo.ParamByName('@NR_ORDEM_ORIGEM').AsInteger  := Nr_Ordem;
            ExecStoredProc(sp_ordena_eventos_novo);
            case sp_ordena_eventos_novo.ParamByName('Result').AsInteger of
              1: begin
                   BoxMensagem('O primeiro evento não pode ter evento base!', 2);
                   sp_ok := False;
                 end;
              2: begin
                   BoxMensagem('O evento futuro não pode ter nº de ordem inferior ao do evento!', 2);
                   sp_ok := False;
                 end;
              3: begin
                   BoxMensagem('O último evento não pode ter evento futuro!', 2);
                   sp_ok := False;
                 end;
              4: begin
                   BoxMensagem('O evento base não pode ter nº ordem superior ao do evento!', 2);
                   sp_ok := False;
                 end;
              5: begin
                   BoxMensagem('Nº Ordem Destino não existe!', 2);
                   sp_ok := False;
                 end;
            end;
            CloseStoredProc(sp_ordena_eventos_novo);
          end
          else
          begin
            CloseStoredProc(sp_ordena_evento);
            sp_ordena_evento.ParamByName('@CD_SERVICO').AsString        := qry_servico_evento_CD_SERVICO.AsString;
            sp_ordena_evento.ParamByName('@NR_ORDEM_DESTINO').AsInteger := StrToInt(Trim(dbedt_ordem.Text));
            sp_ordena_evento.ParamByName('@NR_ORDEM_ORIGEM').AsInteger  := Nr_Ordem;
            ExecStoredProc(sp_ordena_evento);
            case sp_ordena_evento.ParamByName('Result').AsInteger of
              1: begin
                   BoxMensagem('O primeiro evento não pode ter evento base!', 2);
                   sp_ok := False;
                 end;
              2: begin
                   BoxMensagem('O evento futuro não pode ter nº de ordem inferior ao do evento!', 2);
                   sp_ok := False;
                 end;
              3: begin
                   BoxMensagem('O último evento não pode ter evento futuro!', 2);
                   sp_ok := False;
                 end;
              4: begin
                   BoxMensagem('O evento base não pode ter nº ordem superior ao do evento!', 2);
                   sp_ok := False;
                 end;
              5: begin
                   BoxMensagem('Nº Ordem Destino não existe!', 2);
                   sp_ok := False;
                 end;
            end;
            CloseStoredProc(sp_ordena_evento);
          end;

          if Not sp_ok then
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            Grava := False;
            Exit;
          end;

          if qry_servico_evento_.State in [dsInsert, dsEdit] then qry_servico_evento_.Post;

          Pesquisa := qry_servico_evento_CD_EVENTO.AsString;
          qry_servico_evento_.Close;
          qry_servico_evento_.Prepare;
          qry_servico_evento_.Open;
          Localiza(qry_servico_evento_, Pesquisa, 'CD_EVENTO' );
          Atualiza_Duplica;
        end;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        if datm_servico.qry_servico_evento_.State in [dsInsert, dsEdit] then datm_servico.qry_servico_evento_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_servico.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_servico.pgctrl_servicoChanging(Sender: TObject;
   var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_servico.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( pgctrl_servico.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_servico.qry_servico_.State in [dsEdit] ) and st_modificar ) or
       ( datm_servico.qry_servico_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Tabela de Serviços foi alterada.' + #13#10 +
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
  if (pgctrl_servico.ActivePage = ts_servico_evento) and
     (pgctrl_servico_evento.ActivePage = ts_dados_basicos2) then
  begin
    if ( ( datm_servico.qry_servico_evento_.State in [dsEdit] ) and st_modificar ) or
       ( datm_servico.qry_servico_evento_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Tabela de Serviços X Eventos foi alterada.' + #13#10 +
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

procedure Tfrm_servico.Cancelar;
begin
  try
    if ( pgctrl_servico.ActivePage = ts_dados_basicos ) or
       ( pgctrl_servico.ActivePage = ts_lista ) then
    begin
      //Serviço
      if datm_servico.qry_servico_.State in [dsInsert, dsEdit] then
        datm_servico.qry_servico_.Cancel;
      pgctrl_servico.ActivePage := ts_dados_basicos;
      dbedt_descricao.SetFocus;
    end
    else if (pgctrl_servico.ActivePage = ts_servico_evento) then
    begin
      //Serviço X Evento
      if datm_servico.qry_servico_evento_.State in [dsInsert, dsEdit] then
        datm_servico.qry_servico_evento_.Cancel;
      pgctrl_servico_evento.ActivePage := ts_dados_basicos2;
      dbedt_cd_evento.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_servico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_servico.dbedt_cd_classifKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_classif      then btn_co_classifClick(nil);
    if Sender = dbedt_cd_via_transp   then btn_co_via_transpClick(nil);
    if Sender = dbedt_cd_evento       then btn_co_eventoClick(nil);
    if Sender = dbedt_cd_ev_basico    then btn_co_ev_basicoClick(nil);
    if Sender = dbedt_cd_ev_futuro    then btn_co_ev_futuroClick(nil);
    if Sender = dbedt_cd_ev_conclusor then btn_co_ev_conclusorClick(nil);
    if Sender = dbedtConfigStatus     then btnConfigStatusClick(btnConfigStatus);
  end;
end;

procedure Tfrm_servico.btn_duplicarClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_duplica_eventos, frm_duplica_eventos );
  frm_duplica_eventos.nr_form := 1;
  frm_duplica_eventos.str_servico_destino := datm_servico.qry_servico_CD_SERVICO.AsString;
  frm_duplica_eventos.cd_nm_destino := 'Serviço Destino: '+ #13#10 +dbedt_cd_servico2.Text+' - '+dbedt_nm_servico2.Text;
  frm_duplica_eventos.ShowModal;
  datm_servico.qry_servico_evento_.Close;
  datm_servico.qry_servico_evento_.Prepare;
  datm_servico.qry_servico_evento_.Open;
  if datm_servico.qry_servico_evento_.RecordCount = 0 then
  begin
    btn_duplicar.Enabled := True;
    mi_duplicar.Enabled  := True;
  end
  else
  begin
    btn_duplicar.Enabled := False;
    mi_duplicar.Enabled  := False;
  end;
end;

procedure Tfrm_servico.btn_co_ev_conclusorClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  frm_evento.Cons_OnLine := datm_servico.qry_servico_CD_EVENTO_CONCLUSOR;
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_servico.qry_servico_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_servico.qry_servico_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_servico do
  begin
    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  dbedt_cd_eventoExit(nil);

end;

procedure Tfrm_servico.Atualiza_Duplica;
begin
  if ( pgctrl_servico.ActivePage = ts_dados_basicos ) or
     ( pgctrl_servico.ActivePage = ts_lista ) then
  begin
    dbnvg.DataSource     := datm_servico.ds_servico;
    btn_duplicar.Enabled := False;
    mi_duplicar.Enabled  := False;
  end
  else
  begin
    dbnvg.DataSource := datm_servico.ds_servico_evento;
    if datm_servico.qry_servico_evento_.RecordCount = 0 then
    begin
      btn_duplicar.Enabled := True;
      mi_duplicar.Enabled  := True;
    end
    else
    begin
      btn_duplicar.Enabled := False;
      mi_duplicar.Enabled  := False;
    end;
  end;
end;

procedure Tfrm_servico.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then
   dbg_cadastroDblClick(nil);
end;

procedure Tfrm_servico.dbedt_cd_ev_inicialChange(Sender: TObject);
begin
  if ( datm_servico.qry_servico_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_servico.dbedt_cd_ev_finalChange(Sender: TObject);
begin
  if ( datm_servico.qry_servico_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_servico.dbedt_cd_ev_inicialKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_F5 then
 begin
  if Sender = dbedt_cd_classif      then btn_co_classifClick(nil);
  if Sender = dbedt_cd_via_transp   then btn_co_via_transpClick(nil);
  if Sender = dbedt_cd_evento       then btn_co_eventoClick(nil);
  if Sender = dbedt_cd_ev_basico    then btn_co_ev_basicoClick(nil);
  if Sender = dbedt_cd_ev_futuro    then btn_co_ev_futuroClick(nil);
  if Sender = dbedt_cd_ev_conclusor then btn_co_ev_conclusorClick(nil);
  if Sender = dbedt_cd_ev_inicial   then btn_co_ev_inicialClick(nil);
 end;
end;

procedure Tfrm_servico.dbedt_cd_ev_finalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_classif      then btn_co_classifClick(nil);
    if Sender = dbedt_cd_via_transp   then btn_co_via_transpClick(nil);
    if Sender = dbedt_cd_evento       then btn_co_eventoClick(nil);
    if Sender = dbedt_cd_ev_basico    then btn_co_ev_basicoClick(nil);
    if Sender = dbedt_cd_ev_futuro    then btn_co_ev_futuroClick(nil);
    if Sender = dbedt_cd_ev_conclusor then btn_co_ev_conclusorClick(nil);
    if Sender = dbedt_cd_ev_final     then btn_co_ev_finalClick(nil);
  end;
end;

procedure Tfrm_servico.btn_co_ev_inicialClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  frm_evento.Cons_OnLine := datm_servico.qry_servico_CD_EV_INI;
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_servico.qry_servico_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_servico.qry_servico_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_servico do
  begin
    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  dbedt_cd_ev_inicialExit(nil);
end;

procedure Tfrm_servico.btn_co_ev_finalClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  frm_evento.Cons_OnLine := datm_servico.qry_servico_CD_EV_FIM;
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_servico.qry_servico_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_servico.qry_servico_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_servico do
  begin
    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  dbedt_cd_ev_finalExit(nil);
end;

procedure Tfrm_servico.btn_co_grupo_servicoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_grupo_servico, frm_grupo_servico);
  frm_grupo_servico.Cons_OnLine := datm_servico.qry_servico_CD_GRUPO;
  with frm_grupo_servico do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_servico.qry_servico_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_servico.qry_servico_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_servico do
  begin
    qry_grupo_servico_.Close;
    qry_grupo_servico_.Prepare;
    qry_grupo_servico_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  dbedt_cd_grupo_servicoExit(nil);
end;

procedure Tfrm_servico.dbedt_cd_ev_inicialExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_servico.dbedt_cd_ev_finalExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_servico.dbedt_cd_grupo_servicoChange(Sender: TObject);
begin
 if ( datm_servico.qry_servico_.State in [ dsInsert, dsEdit ]) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_servico.dbedt_cd_grupo_servicoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_servico.dbedt_cd_grupo_servicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_classif      then btn_co_classifClick(nil);
    if Sender = dbedt_cd_via_transp   then btn_co_via_transpClick(nil);
    if Sender = dbedt_cd_evento       then btn_co_eventoClick(nil);
    if Sender = dbedt_cd_ev_basico    then btn_co_ev_basicoClick(nil);
    if Sender = dbedt_cd_ev_futuro    then btn_co_ev_futuroClick(nil);
    if Sender = dbedt_cd_ev_conclusor then btn_co_ev_conclusorClick(nil);
    if Sender = dbedt_cd_grupo_servico then btn_co_grupo_servicoClick(nil);
  end;
end;

procedure Tfrm_servico.dblckpbox_cont_vencClick(Sender: TObject);
begin
  if ( datm_servico.qry_servico_.State in [ dsInsert, dsEdit ]) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_servico.btnConfigStatusClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_servico.qry_servico_) then
      datm_servico.qry_servico_.FieldByName('NR_CAD_CONFIG_STATUS').AsString :=
        ConsultaOnLineEx('TCAD_CONFIG_STATUS','COnfigurações de Status', ['NR_CAD_CONFIG_STATUS','TX_CAD_CONFIG_STATUS'],['Código','Descrição'],'NR_CAD_CONFIG_STATUS');
  end
  else
  begin
    edtNomeConfig.Text := ConsultaLookUp('TCAD_CONFIG_STATUS','NR_CAD_CONFIG_STATUS',dbedtConfigStatus.Text,'TX_CAD_CONFIG_STATUS');
  end;
  if ( datm_servico.qry_servico_.State in [ dsInsert, dsEdit ]) then
    btn_mi( False, True, True, False );
end;

procedure Tfrm_servico.edt_chaveExit(Sender: TObject);
var
  vOrdem: String;
begin
  if not AlterouFiltro then
    Exit;
  AlterouFiltro := False;
  vOrdem := IfThen(cb_ordem.ItemIndex < 4, a_str_indices[cb_ordem.ItemIndex], a_str_indices[1]);
  datm_servico.qry_servico_.Close;
  datm_servico.qry_servico_.SQL.Clear;
  datm_servico.qry_servico_.SQL.Add(' SELECT S.*, SC.NM_CLASSIFICACAO, VT.NM_VIA_TRANSP                                               ');
  if datm_servico.ServicoNovo then
    datm_servico.qry_servico_.SQL.Add(' FROM TSERVICO_NOVO S LEFT JOIN TSERVICO_CLASSIFICACAO SC ON SC.CD_CLASSIFICACAO = S.CD_CLASSIFICACAO ')
  else
    datm_servico.qry_servico_.SQL.Add(' FROM TSERVICO S LEFT JOIN TSERVICO_CLASSIFICACAO SC ON SC.CD_CLASSIFICACAO = S.CD_CLASSIFICACAO ');
  datm_servico.qry_servico_.SQL.Add('   LEFT JOIN TVIA_TRANSP_BROKER VT ON VT.CD_VIA_TRANSP = S.CD_VIA_TRANSPORTE                     ');
  if Trim(edt_chave.Text) <> '' then
  begin
    case cb_ordem.ItemIndex of
      0: if datm_servico.ServicoNovo then
           datm_servico.qry_servico_.SQL.Add(' WHERE S.CD_SERVICO = ' + edt_chave.Text + '               ')
         else
           datm_servico.qry_servico_.SQL.Add(' WHERE S.CD_SERVICO = ''' + edt_chave.Text + '''           ');
      1: datm_servico.qry_servico_.SQL.Add(' WHERE S.NM_SERVICO LIKE ''%' + edt_chave.Text + '%''        ');
      2: datm_servico.qry_servico_.SQL.Add(' WHERE SC.NM_CLASSIFICACAO LIKE ''%' + edt_chave.Text + '%'' ');
      3: datm_servico.qry_servico_.SQL.Add(' WHERE VT.NM_VIA_TRANSP LIKE ''%' + edt_chave.Text + '%''    ');
      4: begin
           if datm_servico.ServicoNovo then
             datm_servico.qry_servico_.SQL.Add(' WHERE S.CD_SERVICO = ' + edt_chave.Text + '              ')
           else
             datm_servico.qry_servico_.SQL.Add(' WHERE S.CD_SERVICO = ''' + edt_chave.Text + '''          ');
           datm_servico.qry_servico_.SQL.Add('   OR S.NM_SERVICO LIKE ''%' + edt_chave.Text + '%''        ');
           datm_servico.qry_servico_.SQL.Add('   OR SC.NM_CLASSIFICACAO LIKE ''%' + edt_chave.Text + '%'' ');
           datm_servico.qry_servico_.SQL.Add('   OR VT.NM_VIA_TRANSP LIKE ''%' + edt_chave.Text + '%''    ');
        end;
    end;
  end;
  datm_servico.qry_servico_.SQL.Add(' ORDER BY ' + vOrdem);
  datm_servico.qry_servico_.Open;
  edt_chaveChange(nil);
end;

procedure Tfrm_servico.dbchkIN_PRAZO_UTILClick(Sender: TObject);
begin
  if ( datm_servico.qry_servico_evento_.State in [ dsInsert, dsEdit ] ) then
    btn_mi( False, True, True, False );
end;

procedure Tfrm_servico.btn_atualiza_processoClick(Sender: TObject);
var
vAux:Tquery;
begin
  //by Carlos - 31/08/2011 - acertar os eventos deste serviço em todos os processos
  try
    vAux:=TQuery.Create(nil);
    with vAux do begin
      DatabaseName := 'DBBROKER';
      SQL.Add(' exec sp_muda_servico :NR_PROCESSO ' );
    end;
    //
    with TQuery.Create(Application) do  begin
      DatabaseName := 'DBBROKER';
      SQL.Add(' SELECT ltrim(rtrim(p.nr_processo)) NR_PROCESSO FROM TFOLLOWUP F, TPROCESSO P  ' );
      SQL.Add(' WHERE F.CD_EVENTO = "092" ');
      SQL.Add(' AND F.DT_REALIZACAO IS NULL ');
      SQL.Add(' AND P.NR_PROCESSO = F.NR_PROCESSO ');
      SQL.Add(' AND P.CD_SERVICO = :CD_SERVICO ');
      if datm_servico.ServicoNovo then
        ParamByName('CD_SERVICO').AsInteger := datm_servico.qry_servico_CD_SERVICO.AsInteger
      else
        ParamByName('CD_SERVICO').AsString  := datm_servico.qry_servico_CD_SERVICO.AsString;
      Open;
      while not eof do begin
        vAux.ParamByName('NR_PROCESSO').AsString:=fieldByName('NR_PROCESSO').AsString;
        vAux.ExecSQL;
        next;
      end;
      close;
      vAux.Free;
      Free;
    end;
    Showmessage('Eventos Atualizados com sucesso!!!');
  except
    Showmessage('Ocorreu um erro na atualização dos eventos!!!');
  end;
end;

procedure Tfrm_servico.chkServicoNovoClick(Sender: TObject);
begin
  datm_servico.ServicoNovo := chkServicoNovo.Checked;
end;

procedure Tfrm_servico.btnAtualizaFollowupClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente atualizar todos os processos com este serviço?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) = mrYes then
    try
      FastExecSQL('EXEC SP_ATUALIZA_PROCESSOS_SERVICO ''' + datm_servico.qry_servico_CD_SERVICO.AsString + '''');
      ShowMessage('Processos atualizados.');
    except
      on E: Exception do
        MessageDlg('Erro executando a operação.'#13 + E.Message, mtError, [mbOk], 0);
    end;
end;

end.
