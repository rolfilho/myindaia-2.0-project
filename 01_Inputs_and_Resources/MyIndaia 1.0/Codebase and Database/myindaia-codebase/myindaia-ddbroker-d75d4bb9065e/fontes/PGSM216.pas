unit PGSM216;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, Funcoes;

type
  Tfrm_evento_po = class(TForm)
    pgctrl_evento_po: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbg_cadastro: TDBGrid;
    btn_duplicar: TSpeedButton;
    mi_duplicar: TMenuItem;
    pnl_evento_po: TPanel;
    lbl_evento: TLabel;
    lbl_pz_ev_base: TLabel;
    lbl_pz_ev_futuro: TLabel;
    lbl_ordem: TLabel;
    btn_co_evento: TSpeedButton;
    lbl_ev_base: TLabel;
    btn_co_ev_base: TSpeedButton;
    lbl_ev_futuro: TLabel;
    btn_co_ev_futuro: TSpeedButton;
    dbedt_pz_do_ev_base: TDBEdit;
    dbedt_pz_ate_ev_futuro: TDBEdit;
    dbedt_ordem: TDBEdit;
    dbedt_cd_evento: TDBEdit;
    dbedt_nm_evento: TDBEdit;
    dbedt_cd_ev_base: TDBEdit;
    dbedt_nm_ev_base: TDBEdit;
    dbedt_cd_ev_futuro: TDBEdit;
    dbedt_nm_ev_futuro: TDBEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_evento_poChange(Sender: TObject);
    procedure dbedt_cd_eventoChange(Sender: TObject);
    procedure dbedt_cd_eventoExit(Sender: TObject);
    procedure dbedt_cd_ev_baseExit(Sender: TObject);
    procedure dbedt_cd_ev_futuroExit(Sender: TObject);
    procedure btn_co_eventoClick(Sender: TObject);
    procedure btn_co_ev_baseClick(Sender: TObject);
    procedure btn_co_ev_futuroClick(Sender: TObject);
    procedure dbedt_ordemExit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure pgctrl_evento_poChanging(Sender: TObject; var AllowChange: Boolean);
    procedure Cancelar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_eventoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
  end;

var
  frm_evento_po: Tfrm_evento_po;

implementation

uses GSMLIB, PGSM217, PGSM036, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_evento_po.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_evento_po.btn_incluirClick(Sender: TObject);
begin
  with datm_evento_po do
  begin
    qry_evento_po_.DisableControls;
    qry_evento_po_.Cancel;
    qry_evento_po_.Append;
    qry_evento_po_.EnableControls;

    {Verificando número da última ordem}
    qry_ult_ordem_.Close;
    qry_ult_ordem_.Prepare;
    qry_ult_ordem_.Open;
    qry_evento_po_NR_ORDEM.AsInteger := qry_ult_ordem_ULTIMO.AsInteger + 1;
    qry_ult_ordem_.Close;

    if qry_evento_po_NR_ORDEM.AsInteger = 1 then
    begin
      dbedt_cd_ev_base.Text       := '';
      dbedt_pz_do_ev_base.Text    := '';

      dbedt_cd_ev_base.Color      := clMenu;
      dbedt_pz_do_ev_base.Color   := clMenu;

      dbedt_cd_ev_base.Enabled    := False;
      dbedt_pz_do_ev_base.Enabled := False;

      btn_co_ev_base.Enabled      := False;
    end
    else
    begin
      dbedt_cd_ev_base.Color      := clWindow;
      dbedt_pz_do_ev_base.Color   := clWindow;

      dbedt_cd_ev_base.Enabled    := True;
      dbedt_pz_do_ev_base.Enabled := True;

      btn_co_ev_base.Enabled      := True;
    end;
  end;
  pgctrl_evento_po.ActivePage := ts_dados_basicos;
  pnl_evento_po.Enabled              := True;
  dbedt_cd_evento.SetFocus;

  btn_mi( False, True, True, False );

  dbnvg.Enabled     := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled  := False;

end;

procedure Tfrm_evento_po.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_evento_po do
    begin
      qry_evento_po_.Close;
      qry_evento_.Close;
      qry_lista_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_evento_po.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Eventos X PO}
  Application.CreateForm( Tdatm_evento_po, datm_evento_po );

  with datm_evento_po do
  begin
    ds_evento_po.AutoEdit := st_modificar;
    ds_evento_po.AutoEdit := st_modificar;

    qry_lista_.Close;
    qry_lista_.Prepare;
    qry_lista_.Open;

    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;

    qry_evento_po_.Close;
    qry_evento_po_.ParamByName('CD_EVENTO').AsString := qry_lista_CD_EVENTO.AsString;
    qry_evento_po_.Prepare;
    qry_evento_po_.Open;
  end;

  a_str_indices[0] := 'NM_EVENTO';
  a_str_indices[1] := 'NR_ORDEM';
  a_str_indices[2] := 'CD_EVENTO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Nº Ordem');
    Items.Add('Evento');
    Items.Add('Cód.');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_evento_po.btn_excluirClick(Sender: TObject);
begin
  with datm_evento_po do
  begin
    if qry_evento_po_.RecordCount = 0 then Exit;
    if BoxMensagem( 'Este Evento X PO será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      CloseStoredProc(sp_exclui_evento_po);
      sp_exclui_evento_po.ParamByName('@CD_EVENTO').AsString    := qry_evento_po_CD_EVENTO.AsString;
      sp_exclui_evento_po.ParamByName('@IN_CONSISTE').AsBoolean := True;
      ExecStoredProc(sp_exclui_evento_po);
      if sp_exclui_evento_po.ParamByName('Result').AsInteger = 1 then
      begin
        BoxMensagem('Não posso excluir este evento pois é um evento base/futuro', 2);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        qry_evento_po_.Cancel;
      end
      else
         datm_main.db_broker.Commit;
      CloseStoredProc(sp_exclui_evento_po);
      qry_lista_.Close;
      qry_lista_.Prepare;
      qry_lista_.Open;
    except
      on E: Exception do
      begin
        qry_evento_po_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_evento_po.ActivePage := ts_lista;
  end;
end;

procedure Tfrm_evento_po.FormShow(Sender: TObject);
begin
  lNaoConsiste                := False;
  pgctrl_evento_po.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_evento_po.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_evento_po.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_evento_po.qry_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_evento_po.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_evento_po.qry_lista_CD_EVENTO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_evento_po.qry_lista_.Close;
  datm_evento_po.qry_lista_.SQL[4] := a_str_indices[cb_ordem.ItemIndex];
  datm_evento_po.qry_lista_.Prepare;
  datm_evento_po.qry_lista_.Open;
  Localiza(datm_evento_po.qry_lista_, Pesquisa, a_str_indices[2]);
  edt_chave.SetFocus;
end;

procedure Tfrm_evento_po.pgctrl_evento_poChange(Sender: TObject);
begin
  if datm_evento_po.qry_evento_po_NR_ORDEM.AsInteger = 1 then
  begin
    dbedt_cd_ev_base.Text       := '';
    dbedt_pz_do_ev_base.Text    := '';
    dbedt_cd_ev_base.Color      := clMenu;
    dbedt_pz_do_ev_base.Color   := clMenu;
    dbedt_cd_ev_base.Enabled    := False;
    dbedt_pz_do_ev_base.Enabled := False;
    btn_co_ev_base.Enabled      := False;
  end
  else
  begin
    dbedt_cd_ev_base.Color      := clWindow;
    dbedt_pz_do_ev_base.Color   := clWindow;
    dbedt_cd_ev_base.Enabled    := True;
    dbedt_pz_do_ev_base.Enabled := True;
    btn_co_ev_base.Enabled      := True;
  end;

  if pgctrl_evento_po.ActivePage = ts_lista then
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
end;

procedure Tfrm_evento_po.dbedt_cd_eventoChange(Sender: TObject);
begin
 if ( datm_evento_po.qry_evento_po_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );

  with datm_evento_po do
  begin
    if ( datm_evento_po.qry_evento_po_NR_ORDEM.AsInteger = 1 ) and
       ( frm_evento_po.pgctrl_evento_po.ActivePage = ts_dados_basicos ) then
    begin
      dbedt_cd_ev_base.Text       := '';
      dbedt_pz_do_ev_base.Text    := '';
      dbedt_nm_ev_base.Text       := '';

      dbedt_cd_ev_base.Color      := clMenu;
      dbedt_pz_do_ev_base.Color   := clMenu;

      dbedt_cd_ev_base.Enabled    := False;
      dbedt_pz_do_ev_base.Enabled := False;

      btn_co_ev_base.Enabled      := False;
    end
    else
    begin
      dbedt_cd_ev_base.Color      := clWindow;
      dbedt_pz_do_ev_base.Color   := clWindow;

      dbedt_cd_ev_base.Enabled    := True;
      dbedt_pz_do_ev_base.Enabled := True;

      btn_co_ev_base.Enabled      := True;
    end;
  end;
end;

procedure Tfrm_evento_po.dbedt_cd_eventoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_evento_po.dbedt_cd_ev_baseExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_evento_po.dbedt_cd_ev_futuroExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_evento_po.btn_co_eventoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  frm_evento.Cons_OnLine := datm_evento_po.qry_evento_po_CD_EVENTO;
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_evento_po.qry_evento_po_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_evento_po.qry_evento_po_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_evento_po do
  begin
    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  dbedt_cd_eventoExit(nil);
end;

procedure Tfrm_evento_po.btn_co_ev_baseClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  frm_evento.Cons_OnLine := datm_evento_po.qry_evento_po_CD_EV_BASICO;
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_evento_po.qry_evento_po_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_evento_po.qry_evento_po_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_evento_po do
  begin
    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  dbedt_cd_ev_baseExit(nil);
end;

procedure Tfrm_evento_po.btn_co_ev_futuroClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  frm_evento.Cons_OnLine := datm_evento_po.qry_evento_po_CD_EV_FUTURO;
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_evento_po.qry_evento_po_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_evento_po.qry_evento_po_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_evento_po do
  begin
    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  dbedt_cd_ev_futuroExit(nil);
end;

procedure Tfrm_evento_po.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_evento_po.dbedt_ordemExit(Sender: TObject);
begin
  if ( datm_evento_po.qry_evento_po_NR_ORDEM.AsInteger = 1 ) and
     ( frm_evento_po.pgctrl_evento_po.ActivePage = ts_dados_basicos ) then
  begin
    dbedt_cd_ev_base.Text       := '';
    dbedt_pz_do_ev_base.Text    := '';
    dbedt_nm_ev_base.Text       := '';

    dbedt_cd_ev_base.Color      := clMenu;
    dbedt_pz_do_ev_base.Color   := clMenu;

    dbedt_cd_ev_base.Enabled    := False;
    dbedt_pz_do_ev_base.Enabled := False;

    btn_co_ev_base.Enabled      := False;

    dbedt_cd_ev_futuro.SetFocus;
  end
  else
  begin
    dbedt_cd_ev_base.Color      := clWindow;
    dbedt_pz_do_ev_base.Color   := clWindow;

    dbedt_cd_ev_base.Enabled    := True;
    dbedt_pz_do_ev_base.Enabled := True;

    btn_co_ev_base.Enabled      := True;
  end;
end;

function Tfrm_evento_po.Consiste : Boolean;
begin
  {Evento}
  if Not lNaoConsiste then
  begin
    if dbedt_cd_evento.Text = '' then
    begin
      BoxMensagem('Campo Evento deve ser preenchido!', 2);
      pgctrl_evento_po.ActivePage := ts_dados_basicos;
      dbedt_cd_evento.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if ( datm_evento_po.qry_evento_po_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_evento );
    if dbedt_cd_evento.Text <> '' Then
    begin
      if dbedt_nm_evento.Text = '' then
      begin
        BoxMensagem('Código do evento inválido!',2);
        pgctrl_evento_po.ActivePage := ts_dados_basicos;
        dbedt_cd_evento.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Evento  Base}
  if ( datm_evento_po.qry_evento_po_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ev_base.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_ev_base );
      if dbedt_nm_ev_base.Text = '' then
      begin
        BoxMensagem('Código do Evento Base inválido!',2);
        pgctrl_evento_po.ActivePage := ts_dados_basicos;
        dbedt_cd_ev_base.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Evento Futuro}
  if ( datm_evento_po.qry_evento_po_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ev_futuro.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_ev_futuro );
      if dbedt_nm_ev_futuro.Text = '' then
      begin
        BoxMensagem('Código do Evento Futuro inválido!',2);
        pgctrl_evento_po.ActivePage := ts_dados_basicos;
        dbedt_cd_ev_futuro.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Evento Base existente no processo e com nº ordem inferior ao atual}
  if ( datm_evento_po.qry_evento_po_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ev_base.Text <> '' then
    begin
      with datm_evento_po do
      begin
        qry_ev_base_.Close;
        qry_ev_base_.ParamByName('CD_EV_BASICO').AsString := qry_evento_po_CD_EV_BASICO.AsString;
        qry_ev_base_.Prepare;
        qry_ev_base_.Open;
        if ( qry_ev_base_.RecordCount = 0 ) then
        begin
          BoxMensagem('Evento Base não cadastrado!', 2);
          pgctrl_evento_po.ActivePage := ts_dados_basicos;
          dbedt_cd_ev_base.SetFocus;
          Consiste := False;
          Exit;
        end
        else
        begin
//                         anterior           >=              atual
          if ( qry_ev_base_NR_ORDEM.AsInteger >= qry_evento_po_NR_ORDEM.AsInteger ) then
          begin
            BoxMensagem('Evento Base deve possuir nº ordem menor que a origem!', 2);
            pgctrl_evento_po.ActivePage := ts_dados_basicos;
            dbedt_cd_ev_base.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;

    {Evento Futuro existente no processo e com nº ordem superior ao atual}
    if dbedt_cd_ev_futuro.Text <> '' then
    begin
      with datm_evento_po do
      begin
        qry_ev_futuro_.Close;
        qry_ev_futuro_.ParamByName('CD_EV_FUTURO').AsString := datm_evento_po.qry_evento_po_CD_EV_FUTURO.AsString;
        qry_ev_futuro_.Prepare;
        qry_ev_futuro_.Open;
        if ( datm_evento_po.qry_ev_futuro_.RecordCount = 0 ) then
        begin
          if ( datm_evento_po.qry_evento_po_.State in [dsEdit] ) then
          begin
            BoxMensagem('Evento Futuro não cadastrado!', 2);
            pgctrl_evento_po.ActivePage := ts_dados_basicos;
            dbedt_cd_ev_futuro.SetFocus;
            btn_salvar.Enabled := True;
            Consiste := False;
            Exit;
          end;
        end
        else
        begin
          if ( qry_ev_futuro_NR_ORDEM.AsInteger <= qry_evento_po_NR_ORDEM.AsInteger ) then
          begin
            BoxMensagem('Evento Futuro deve possuir nº ordem maior que a Origem!', 2);
            pgctrl_evento_po.ActivePage := ts_dados_basicos;
            dbedt_cd_ev_futuro.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;

    {Nº Ordem Nulo}
    if dbedt_ordem.Text = '' then
    begin
      BoxMensagem('Campo Ordem deve ser preenchido!', 2);
      pgctrl_evento_po.ActivePage := ts_dados_basicos;
      dbedt_ordem.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
  Consiste := True;
end;

function Tfrm_evento_po.Grava : Boolean;
var
  sp_ok : Boolean;
  OrdemAnterior : Integer;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_evento_po.qry_evento_po_.State in [dsInsert, dsEdit] ) then
    begin
      with datm_evento_po do
      begin
        if ( qry_evento_po_NR_ORDEM.AsInteger = 1 ) then
        begin
          qry_evento_po_CD_EV_BASICO.AsString := '';
          qry_evento_po_PZ_DO_EV_BASICO.IsNull; { ou deve ser 0??}
        end;

        if qry_evento_po_.State in [dsInsert] then
        begin
          OrdemAnterior := StrToInt(Trim(dbedt_ordem.Text));
          {Forçando o número da última ordem}
          qry_ult_ordem_.Close;
          qry_ult_ordem_.Prepare;
          qry_ult_ordem_.Open;
          qry_evento_po_NR_ORDEM.AsInteger  := qry_ult_ordem_ULTIMO.AsInteger + 1;
          qry_ult_ordem_.Close;
          qry_evento_po_.Post;
          Nr_Ordem := StrToInt(Trim(dbedt_ordem.Text));
          qry_evento_po_.Edit;
          qry_evento_po_NR_ORDEM.AsInteger  := OrdemAnterior;
        end;

        sp_ok := True;
        CloseStoredProc(sp_ordena_evento_po);
        sp_ordena_evento_po.ParamByName('@NR_ORDEM_DESTINO').AsInteger := StrToInt( Trim( dbedt_ordem.Text ) );
        sp_ordena_evento_po.ParamByName('@NR_ORDEM_ORIGEM').AsInteger  := Nr_Ordem;
        ExecStoredProc(sp_ordena_evento_po);
        case sp_ordena_evento_po.ParamByName('Result').AsInteger of
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
        CloseStoredProc(sp_ordena_evento_po);
        if Not sp_ok then
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          Grava := False;
          Exit;
        end;

        Pesquisa := qry_evento_po_CD_EVENTO.AsString;
        if qry_evento_po_.State in [dsInsert, dsEdit] then qry_evento_po_.Post;

        qry_lista_.Close;
        qry_lista_.Prepare;
        qry_lista_.Open;
        Localiza(qry_lista_, Pesquisa, 'CD_EVENTO' );
      end;
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      if datm_evento_po.qry_evento_po_.State in [dsInsert, dsEdit] then datm_evento_po.qry_evento_po_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_evento_po.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_evento_po.pgctrl_evento_poChanging(Sender: TObject;
var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_evento_po.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_evento_po.qry_evento_po_.State in [dsEdit] ) and st_modificar ) or
     ( datm_evento_po.qry_evento_po_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Tabela de Eventos X PO foi alterada.' + #13#10 +
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

procedure Tfrm_evento_po.Cancelar;
begin
  try
    {Evento X PO }
    if datm_evento_po.qry_evento_po_.State in [dsInsert, dsEdit] then
      datm_evento_po.qry_evento_po_.Cancel;
    pgctrl_evento_po.ActivePage := ts_dados_basicos;
    dbedt_cd_evento.SetFocus;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_evento_po.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_evento_po.dbedt_cd_eventoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_evento    then btn_co_eventoClick(nil);
    if Sender = dbedt_cd_ev_base   then btn_co_ev_baseClick(nil);
    if Sender = dbedt_cd_ev_futuro then btn_co_ev_futuroClick(nil);
  end;
end;

end.
