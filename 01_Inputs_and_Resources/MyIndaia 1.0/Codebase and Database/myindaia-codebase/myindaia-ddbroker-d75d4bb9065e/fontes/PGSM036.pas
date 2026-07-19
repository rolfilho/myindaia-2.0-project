unit PGSM036;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, DBCtrls,
  Mask, ComCtrls, StdCtrls, Funcoes, ConsOnLineEx, Gauges, cxRadioGroup;

type
  Tfrm_evento = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_evento: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_descricao: TLabel;
    lbl_prazo_inspecao: TLabel;
    lbl_codigo: TLabel;
    lbl_inspecionavel: TLabel;
    Label1: TLabel;
    lbl_reponsavel: TLabel;
    lbl_etapa: TLabel;
    btn_co_etapa: TSpeedButton;
    dbedt_descricao: TDBEdit;
    dbedtInspecao1Exp: TDBEdit;
    dbedt_codigo: TDBEdit;
    dblkpcbox_responsavel: TDBLookupComboBox;
    dbedt_cd_etapa: TDBEdit;
    dbedt_nm_etapa: TDBEdit;
    lblAtivo: TLabel;
    dblkpcbox_ativo: TDBLookupComboBox;
    dbg_cadastro: TDBGrid;
    mi_cancelar: TMenuItem;
    Label2: TLabel;
    dbedt_ap_evento: TDBEdit;
    dbedt_ap_espanhol: TDBEdit;
    Label3: TLabel;
    dbedt_ap_ingles: TDBEdit;
    Label4: TLabel;
    dblkpcbox_ttp_prest_serv: TDBLookupComboBox;
    Label5: TLabel;
    lblNomeIngles: TLabel;
    dbedtNomeIngles: TDBEdit;
    lblNomeEspanhol: TLabel;
    dbedtNomeEspanhol: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    dbedtInspecao2Exp: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    dbedtInspecao3Exp: TDBEdit;
    pnl1: TPanel;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    bvl1: TBevel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    dbedtInspecao1Imp: TDBEdit;
    dbedtInspecao2Imp: TDBEdit;
    dbedtInspecao3Imp: TDBEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Shape6: TShape;
    dbedtInspecao1Gp: TDBEdit;
    dbedtInspecao2Gp: TDBEdit;
    dbedtInspecao3Gp: TDBEdit;
    ChkTrackingImp: TDBCheckBox;
    ChkTrackingExp: TDBCheckBox;
    Label17: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    Gauge: TGauge;
    lblbarra: TLabel;
    ChkTrackingImpFiltro: TDBCheckBox;
    Shape9: TShape;
    Label18: TLabel;
    Label19: TLabel;
    Shape10: TShape;
    ChkTrackingExpFiltro: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    Shape11: TShape;
    Shape12: TShape;
    dbedtInspecao1fi_exp: TDBEdit;
    dbedtInspecao2fi_exp: TDBEdit;
    dbedtInspecao3fi_exp: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Shape13: TShape;
    Label26: TLabel;
    Label27: TLabel;
    Shape14: TShape;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    dbedtInspecao1fi_imp: TDBEdit;
    dbedtInspecao2fi_imp: TDBEdit;
    dbedtInspecao3fi_imp: TDBEdit;
    Shape15: TShape;
    Label34: TLabel;
    dbcheck_insp_exp: TDBCheckBox;
    dbcheck_insp_imp: TDBCheckBox;
    dbcheck_insp_gp: TDBCheckBox;
    dbcheck_insp_fi_imp: TDBCheckBox;
    dbcheck_insp_fi_exp: TDBCheckBox;
    dbedtOBS_AUT: TDBEdit;
    Label35: TLabel;
    cb_IN_OBS_AUT: TDBCheckBox;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_eventoChange(Sender: TObject);
    procedure dbedt_cd_etapaExit(Sender: TObject);
    procedure btn_co_etapaClick(Sender: TObject);
    procedure pgctrl_eventoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_etapaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rb_exp_simClick(Sender: TObject);
    procedure rb_exp_naoClick(Sender: TObject);
    procedure dbcheck_insp_expClick(Sender: TObject);
    procedure dbcheck_insp_impClick(Sender: TObject);
    procedure dbcheck_insp_gpClick(Sender: TObject);
    procedure dbcheck_insp_fi_impClick(Sender: TObject);
    procedure dbcheck_insp_fi_expClick(Sender: TObject);
    procedure edt_chaveExit(Sender: TObject);

  private
    OnChanging : boolean;
    a_str_indices : Array[0..2] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    lnm_evento : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure CriaCamposWeb;
    procedure HabilitaInspecao(tp_insp : integer);

  public
    { Public declarations }
    Pesquisa: String;
    lCons_OnLine, AlterouFiltro: Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_evento: Tfrm_evento;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM037, StrUtils;

{$R *.DFM}

procedure Tfrm_evento.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_evento.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
  with datm_evento do
  begin
    qry_evento_.DisableControls;
    qry_evento_.Cancel;
    qry_evento_.Append;
    qry_evento_.EnableControls;
    qry_evento_CD_EVENTO.AsString  := UltCod( qry_ult_evento_, qry_ult_evento_ULTIMO );
    qry_evento_IN_ATIVO.AsString                  := '1';
    qry_evento_IN_MOSTRAR_WEB_IMP.AsString        := '0';
    qry_evento_IN_MOSTRAR_WEB_IMP_FILTRO.AsString := '0';
    qry_evento_IN_MOSTRAR_WEB_EXP.AsString        := '0';
    qry_evento_IN_MOSTRAR_WEB_EXP_FILTRO.AsString := '0';
    qry_evento_IN_ACEITA_DESVIOS.AsString         := '0';
    qry_evento_CD_RESPONSAVEL.AsString            := 'D';
    qry_evento_IN_INSPECIONAVEL.AsString          := '0';
    qry_evento_IN_INSPECIONAVEL_IMP.AsString      := '0';
    qry_evento_IN_INSPECIONAVEL_GP.AsString       := '0';
    qry_evento_IN_INSPECIONAVEL_FI_IMP.AsString   := '0';
    qry_evento_IN_INSPECIONAVEL_FI_EXP.AsString   := '0';
  end;
  pgctrl_evento.ActivePage := ts_dados_basicos;
  dbedt_descricao.SetFocus;
end;

procedure Tfrm_evento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_evento do
  begin
    tbl_responsavel_.Close;
    tbl_yesno_.Close;
    //qry_etapa_.Close;
    qry_evento_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_evento.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      if Not (TTable(Cons_OnLine.DataSet).State in [dsEdit, dsInsert]) then
         TTable(Cons_OnLine.DataSet).Edit;
      Cons_OnLine.AsString := datm_evento.qry_evento_CD_EVENTO.AsString;
    except
      try
        Cons_Online_Texto := datm_evento.qry_evento_CD_EVENTO.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Evento!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_evento.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_evento.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Evento}
  Application.CreateForm( Tdatm_evento, datm_evento );

  with datm_evento do
  begin
    ds_evento.AutoEdit := st_modificar;
    tbl_responsavel_.Open;
    tbl_yesno_.Open;

    {qry_etapa_.Close;
    qry_etapa_.Prepare;
    qry_etapa_.Open;}

    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;
  end;

  a_str_indices[0] := 'CD_EVENTO';
  a_str_indices[1] := 'NM_EVENTO';
  a_str_indices[2] := 'NM_RESPONSAVEL';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    Items.Add('Responsável');
    Items.Add('Pesquisa Geral');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
end;

procedure Tfrm_evento.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este evento será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_evento.qry_evento_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_evento.qry_evento_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_evento.ActivePage := ts_lista;
end;

procedure Tfrm_evento.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_evento.FormShow(Sender: TObject);
begin
  pgctrl_evento.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_evento.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_evento.edt_chaveChange(Sender: TObject);
begin
  case cb_ordem.ItemIndex of
    0, 1, 2: Localiza(datm_evento.qry_evento_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex]);
    3: Localiza(datm_evento.qry_evento_, edt_chave.Text, a_str_indices[1]);
  end;
  AlterouFiltro := (Sender = edt_chave) or (Sender = cb_ordem);
end;

procedure Tfrm_evento.pgctrl_eventoChange(Sender: TObject);
begin
  OnChanging := False;

  if pgctrl_evento.ActivePage = ts_dados_basicos then
  begin
    HabilitaInspecao(0);
    if datm_evento.qry_evento_IN_INSPECIONAVEL.AsString = '1' then begin {Sim}
      dbedtInspecao1Exp.TabStop   := True;
      dbedtInspecao2Exp.TabStop   := True;
      dbedtInspecao3Exp.TabStop   := True;
    end else begin
      if (datm_evento.qry_evento_PRZ_INSPECAO.AsFloat  > 0) or
         (datm_evento.qry_evento_PRZ_INSPECAO2.AsFloat > 0) or
         (datm_evento.qry_evento_PRZ_INSPECAO3.AsFloat > 0) then
      begin
        if ( Not ( datm_evento.qry_evento_.State in [dsInsert, dsEdit] ) )
          and ( st_modificar ) then datm_evento.qry_evento_.Edit;

        datm_evento.qry_evento_PRZ_INSPECAO.AsFloat  := 0;
        datm_evento.qry_evento_PRZ_INSPECAO2.AsFloat := 0;
        datm_evento.qry_evento_PRZ_INSPECAO3.AsFloat := 0;
        datm_evento.qry_evento_.Post;
      end;
      dbedtInspecao1Exp.TabStop := False;
      dbedtInspecao2Exp.TabStop := false;
      dbedtInspecao3Exp.TabStop := false;
    end;
    if datm_evento.qry_evento_IN_INSPECIONAVEL_IMP.AsString = '1' then begin {Sim}
      dbedtInspecao1Imp.TabStop := True;
      dbedtInspecao2Imp.TabStop := True;
      dbedtInspecao3Imp.TabStop := True;
    end else begin
      if (datm_evento.qry_evento_PRZ_INSPECAO1_IMP.AsFloat  > 0) or
         (datm_evento.qry_evento_PRZ_INSPECAO2_IMP.AsFloat > 0) or
         (datm_evento.qry_evento_PRZ_INSPECAO3_IMP.AsFloat > 0) then
      begin
        if ( Not ( datm_evento.qry_evento_.State in [dsInsert, dsEdit] ) )
           and ( st_modificar ) then datm_evento.qry_evento_.Edit;

        datm_evento.qry_evento_PRZ_INSPECAO1_IMP.AsFloat  := 0;
        datm_evento.qry_evento_PRZ_INSPECAO2_IMP.AsFloat := 0;
        datm_evento.qry_evento_PRZ_INSPECAO3_IMP.AsFloat := 0;
        datm_evento.qry_evento_.Post;
      end;
      dbedtInspecao1Imp.TabStop := false;
      dbedtInspecao2Imp.TabStop := false;
      dbedtInspecao3Imp.TabStop := false;
    end;
  end;

  if lnm_evento then
  begin
    lnm_evento := false;
    pgctrl_evento.ActivePage := ts_dados_basicos;
    dbedt_descricao.SetFocus;
    Exit;
  end;
  {
  if lcd_etapa then
  begin
    lcd_etapa := False;
    pgctrl_evento.ActivePage := ts_dados_basicos;
    dbedt_cd_etapa.SetFocus;
    Exit;
  end;
  }
  pnl_pesquisa.Enabled := pgctrl_evento.ActivePage = ts_lista;
  {if (pgctrl_evento.ActivePage = ts_lista ) then
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
  end;}
end;

procedure Tfrm_evento.dbedt_cd_etapaExit(Sender: TObject);
begin
{  if Not OnChanging then
  begin
    Consiste;
    lcd_etapa := False;
  end; }
end;

procedure Tfrm_evento.btn_co_etapaClick(Sender: TObject);
begin
{  str_cd_rotina := '2305';

  Application.CreateForm(Tfrm_etapa, frm_etapa);
  frm_etapa.Cons_OnLine := datm_evento.qry_evento_CD_ETAPA;
  With frm_etapa Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_evento.qry_evento_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_evento.qry_evento_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  str_cd_rotina := '2304';

  with datm_evento do
  begin
    qry_etapa_.Close;
    qry_etapa_.Prepare;
    qry_etapa_.Open;
  end;   }
  {if Not ( datm_evento.qry_evento_.State in [dsEdit, dsInsert] )
     and ( st_modificar ) then datm_evento.qry_evento_.Edit;
  datm_evento.qry_evento_CD_ETAPA.AsString := ConsultaOnLineEx('TETAPA', 'Etapas', ['CD_ETAPA','NM_ETAPA'], ['Código','Descrição'], 'CD_ETAPA', nil, 1, dbedt_cd_etapa.Text );

  dbedt_cd_etapaExit(Sender); }
end;

function Tfrm_evento.Consiste : Boolean;
begin
  Consiste := False;
  if dbedt_descricao.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_evento.ActivePage := ts_dados_basicos;
    dbedt_descricao.SetFocus;
    lnm_evento := True;
    Consiste := False;
    Exit;
  end;

  If Not ( datm_evento.qry_evento_.State in [dsEdit, dsInsert] ) then Exit;
  {ValidCodigo( dbedt_cd_etapa );
  if dbedt_cd_etapa.Text <> '' Then
  begin
    if dbedt_nm_etapa.Text = '' Then
    begin
      BoxMensagem('Código da etapa inválido!',2);
      pgctrl_evento.ActivePage := ts_dados_basicos;
      dbedt_cd_etapa.SetFocus;
      lcd_etapa := True;
      Consiste := False;
      Exit;
    end;
  end;}
  Consiste := True;
end;

function Tfrm_evento.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_evento.qry_evento_.State in [dsInsert, dsEdit] ) then
    begin
      datm_evento.qry_evento_.Post;
      Pesquisa := datm_evento.qry_evento_CD_EVENTO.AsString;
      datm_evento.qry_evento_.Close;
      datm_evento.qry_evento_.Prepare;
      datm_evento.qry_evento_.Open;
      Localiza(datm_evento.qry_evento_, Pesquisa, a_str_indices[0] );

      CriaCamposWeb;
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      datm_evento.qry_evento_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_evento.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_evento.qry_evento_.State in [dsEdit] ) and st_modificar ) or
     ( datm_evento.qry_evento_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Tabela de Eventos foi alterada.' + #13#10 +
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

procedure Tfrm_evento.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_evento.Cancelar;
begin
  try
    if datm_evento.qry_evento_.State in [dsInsert, dsEdit] then
    begin
      datm_evento.qry_evento_.Cancel;
      pgctrl_evento.ActivePage := ts_dados_basicos;
      dbedt_descricao.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_evento.pgctrl_eventoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

procedure Tfrm_evento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_evento.dbedt_cd_etapaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{ if key = VK_F5 then
  begin
    if Sender = dbedt_cd_etapa then btn_co_etapaClick(nil);
  end; }
end;

procedure Tfrm_evento.CriaCamposWeb;
var
  pCodigo : string;
  FlagCampoCriado : Boolean;

  procedure CriaCampo(const pNmTabela : string; const pNmCampo : string; const pTipo : string);
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'MYINDAIA';
      Sql.Clear;
      Sql.Add('ALTER TABLE ' + pNmTabela + ' add ' + pNmCampo + datm_evento.qry_evento_CD_EVENTO.AsString + pTipo);
      ExecSql;
      Free;
    end;
  end;

  procedure InsereM10_DADOS;
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'MYINDAIA';
      Sql.Clear;
      Sql.Add('select M10_CD_DADO from M10_DADOS where M10_TP_DADO = ''1'' and m10_cd_broker = ''' + datm_evento.qry_evento_CD_EVENTO.AsString + '''');
      //Sql.Add('select count(*) cont from M10_DADOS where M10_TP_DADO = ''1'' and m10_cd_broker = ''' + datm_evento.qry_evento_CD_EVENTO.AsString + '''');
      Open;
      if IsEmpty then
      //if FieldByName('cont').AsString = '0' then //só insere se ainda não tem registro na tabela com o evento atual
      begin
        Sql.Clear;
        Sql.Add('SELECT isnull( MAX( M10_CD_DADO ),0 ) ULTCOD FROM M10_DADOS');
        Open;
        pCodigo := StrZero(FieldByName('ULTCOD').AsInteger + 1, 4);

        Sql.Clear;
        Sql.Add('INSERT INTO M10_DADOS');
        Sql.Add('(M10_CD_DADO, M10_NM_DADO, M10_NM_ENG, M10_NM_ESP, M10_AP_FILTRO, M10_AP_CAMPO, M10_TP_DADO, ');
        Sql.Add(' M10_TP_CONSULTA, M10_NM_TABELA, M10_CD_ALIAS, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, ');
        Sql.Add(' M10_IN_FILTRO, M10_IN_CAMPO, M10_IN_ATIVO, M10_IN_CHECK)');
        Sql.Add('VALUES');
        Sql.Add('(:M10_CD_DADO, :M10_NM_DADO, :M10_NM_ENG, :M10_NM_ESP, :M10_AP_FILTRO, :M10_AP_CAMPO, :M10_TP_DADO, ');
        Sql.Add(' :M10_TP_CONSULTA, :M10_NM_TABELA, :M10_CD_ALIAS, :M10_NM_CHAVE, :M10_NM_DESCRICAO, :M10_CD_BROKER, ');
        Sql.Add(' :M10_IN_FILTRO, :M10_IN_CAMPO, :M10_IN_ATIVO, :M10_IN_CHECK)');

        ParamByName('M10_CD_DADO').AsString      := pCodigo;
        ParamByName('M10_NM_DADO').AsString      := datm_evento.qry_evento_NM_EVENTO.AsString;
        ParamByName('M10_NM_ENG').AsString       := datm_evento.qry_evento_NM_INGLES.AsString;
        ParamByName('M10_NM_ESP').AsString       := datm_evento.qry_evento_NM_ESPANHOL.AsString;
        ParamByName('M10_AP_FILTRO').AsString    := 'dt_ev'+ datm_evento.qry_evento_CD_EVENTO.AsString;
        ParamByName('M10_AP_CAMPO').AsString     := 'DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString;
        ParamByName('M10_TP_DADO').AsString      := '1';
        ParamByName('M10_TP_CONSULTA').AsString  := '0';
        ParamByName('M10_NM_TABELA').AsString    :=  '';
        ParamByName('M10_CD_ALIAS').AsString     :=  '';
        ParamByName('M10_NM_CHAVE').AsString     :=  '';
        ParamByName('M10_NM_DESCRICAO').AsString :=  '';
        ParamByName('M10_CD_BROKER').AsString    := datm_evento.qry_evento_CD_EVENTO.AsString;
        ParamByName('M10_IN_FILTRO').AsInteger   := 1;
        ParamByName('M10_IN_CAMPO').AsInteger    := 1;
        ParamByName('M10_IN_ATIVO').AsInteger    := 1;
        ParamByName('M10_IN_CHECK').AsInteger    := 0;
        ExecSql;

      end
      else  //se ja´existir então guarda o código M10_CD_DADO para uso posterior nas próximas procedures
        pCodigo := FieldByName('M10_CD_DADO').AsString;
      Free;
    end;
  end;

  procedure InsereM11_FILTRO(const pCodMenu : string); //'01' Imp or '02' Exp
  var
    vNrOrdem : Integer;
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'MYINDAIA';

      //Pega o próximo código
      Sql.Clear;
      Sql.Add('select max(m11_nr_ordem)+1 ORDEM from MYINDAIA.DBO.M11_FILTRO');
      Open;
      vNrOrdem := FieldByName('ORDEM').AsInteger;

      //Verifica se já existe evento para este menu
      Close;
      Sql.Clear;
      Sql.Add('select count(*) cont from M11_FILTRO where M11_CD_DADO =:M11_CD_DADO and M11_CD_MENU =:M11_CD_MENU and M11_CD_SUBM = ''01''');
      ParamByName('M11_CD_DADO').AsString := pCodigo;
      ParamByName('M11_CD_MENU').AsString := pCodMenu;
      Open;

      if FieldByName('cont').AsInteger = 0 then
      begin
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO M11_FILTRO');
        Sql.Add('( M11_CD_FILTRO, M11_CD_MENU, M11_CD_SUBM, M11_CD_DADO, M11_TP_EXIBIR, M11_TP_GRUPO,');
        Sql.Add('  M11_TP_FROM, M11_NR_ORDEM, M11_IN_ATIVO ,M11_IN_CHECK, M11_IN_OBRIGADO)');
        Sql.Add('VALUES');
        Sql.Add('(:M11_CD_FILTRO, :M11_CD_MENU,  :M11_CD_SUBM,  :M11_CD_DADO,  :M11_TP_EXIBIR, :M11_TP_GRUPO,');
        Sql.Add(' :M11_TP_FROM,   :M11_NR_ORDEM, :M11_IN_ATIVO, :M11_IN_CHECK, :M11_IN_OBRIGADO)');

        ParamByName('M11_CD_FILTRO').AsString        := pCodMenu + '01-F' + pCodigo;
        ParamByName('M11_CD_MENU').AsString          := pCodMenu;
        ParamByName('M11_CD_SUBM').AsString          := '01';
        ParamByName('M11_CD_DADO').AsString          := pCodigo;
        ParamByName('M11_TP_EXIBIR').AsString        := '2';
        ParamByName('M11_TP_GRUPO').AsString         := '0';
        ParamByName('M11_TP_FROM').AsString          := '1';
        ParamByName('M11_NR_ORDEM').AsInteger        := vNrOrdem;
        ParamByName('M11_IN_ATIVO').AsString         := '1';
        ParamByName('M11_IN_CHECK').AsString         := '0';
        ParamByName('M11_IN_OBRIGADO').AsString      := '0';

        ExecSql;

        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO M11_FILTRO');
        Sql.Add('( M11_CD_FILTRO, M11_CD_MENU, M11_CD_SUBM, M11_CD_DADO, M11_TP_EXIBIR, M11_TP_GRUPO,');
        Sql.Add('  M11_TP_FROM, M11_NR_ORDEM, M11_IN_ATIVO ,M11_IN_CHECK, M11_IN_OBRIGADO)');
        Sql.Add('VALUES');
        Sql.Add('(:M11_CD_FILTRO, :M11_CD_MENU,  :M11_CD_SUBM,  :M11_CD_DADO,  :M11_TP_EXIBIR, :M11_TP_GRUPO,');
        Sql.Add(' :M11_TP_FROM,   :M11_NR_ORDEM, :M11_IN_ATIVO, :M11_IN_CHECK, :M11_IN_OBRIGADO)');

        ParamByName('M11_CD_FILTRO').AsString        := pCodMenu + '03-F' + pCodigo;
        ParamByName('M11_CD_MENU').AsString          := pCodMenu;
        ParamByName('M11_CD_SUBM').AsString          := '03';
        ParamByName('M11_CD_DADO').AsString          := pCodigo;
        ParamByName('M11_TP_EXIBIR').AsString        := '2';
        ParamByName('M11_TP_GRUPO').AsString         := '0';
        ParamByName('M11_TP_FROM').AsString          := '1';
        ParamByName('M11_NR_ORDEM').AsInteger        := vNrOrdem;
        ParamByName('M11_IN_ATIVO').AsString         := '1';
        ParamByName('M11_IN_CHECK').AsString         := '0';
        ParamByName('M11_IN_OBRIGADO').AsString      := '0';

        ExecSql;
      end;
      Free;
    end;
  end;

  procedure InsereM12_campo(const pCodMenu : string); //'01' Imp or '02' Exp
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'MYINDAIA';

      //Verifica se já existe evento para este menu
      Close;
      Sql.Clear;
      Sql.Add('select count(*) cont from M12_campo where M12_CD_DADO =:M12_CD_DADO and M12_CD_MENU =:M12_CD_MENU and M12_CD_SUBM = ''01''');
      ParamByName('M12_CD_DADO').AsString := pCodigo;
      ParamByName('M12_CD_MENU').AsString := pCodMenu;
      Open;

      if FieldByName('cont').AsInteger = 0 then
      begin
        Sql.Clear;
        Sql.Add('INSERT INTO M12_campo');
        Sql.Add('( M12_CD_CAMPO, M12_CD_MENU, M12_CD_SUBM, M12_CD_DADO, M12_TP_EXIBIR, M12_TP_GRUPO,');
        Sql.Add('  M12_IN_ATIVO ,M12_IN_MONTA_SQL ,M12_IN_OBRIGADO ,M12_TP_EXIBIR_EXPORT)');
        Sql.Add('VALUES');
        Sql.Add('(:M12_CD_CAMPO, :M12_CD_MENU, :M12_CD_SUBM, :M12_CD_DADO, :M12_TP_EXIBIR, :M12_TP_GRUPO, ');
        Sql.Add(' :M12_IN_ATIVO ,:M12_IN_MONTA_SQL ,:M12_IN_OBRIGADO ,:M12_TP_EXIBIR_EXPORT)');

        ParamByName('M12_CD_CAMPO').AsString         := pCodMenu + '01-C' + pCodigo;
        ParamByName('M12_CD_MENU').AsString          := pCodMenu;
        ParamByName('M12_CD_SUBM').AsString          := '01';
        ParamByName('M12_CD_DADO').AsString          := pCodigo;
        ParamByName('M12_TP_EXIBIR').AsString        := '2';
        ParamByName('M12_TP_GRUPO').AsString         := '0';
        ParamByName('M12_IN_ATIVO').AsString         := '1';
        ParamByName('M12_IN_MONTA_SQL').AsString     := '1';
        ParamByName('M12_IN_OBRIGADO').AsString      := '0';
        ParamByName('M12_TP_EXIBIR_EXPORT').AsString := '2';

        ExecSql;

        Sql.Clear;
        Sql.Add('INSERT INTO M12_campo');
        Sql.Add('( M12_CD_CAMPO, M12_CD_MENU, M12_CD_SUBM, M12_CD_DADO, M12_TP_EXIBIR, M12_TP_GRUPO,');
        Sql.Add('  M12_IN_ATIVO ,M12_IN_MONTA_SQL ,M12_IN_OBRIGADO ,M12_TP_EXIBIR_EXPORT)');
        Sql.Add('VALUES');
        Sql.Add('(:M12_CD_CAMPO, :M12_CD_MENU, :M12_CD_SUBM, :M12_CD_DADO, :M12_TP_EXIBIR, :M12_TP_GRUPO, ');
        Sql.Add(' :M12_IN_ATIVO ,:M12_IN_MONTA_SQL ,:M12_IN_OBRIGADO ,:M12_TP_EXIBIR_EXPORT)');

        ParamByName('M12_CD_CAMPO').AsString         := pCodMenu + '03-C' + pCodigo;
        ParamByName('M12_CD_MENU').AsString          := pCodMenu;
        ParamByName('M12_CD_SUBM').AsString          := '03';
        ParamByName('M12_CD_DADO').AsString          := pCodigo;
        ParamByName('M12_TP_EXIBIR').AsString        := '2';
        ParamByName('M12_TP_GRUPO').AsString         := '0';
        ParamByName('M12_IN_ATIVO').AsString         := '1';
        ParamByName('M12_IN_MONTA_SQL').AsString     := '1';
        ParamByName('M12_IN_OBRIGADO').AsString      := '0';
        ParamByName('M12_TP_EXIBIR_EXPORT').AsString := '2';

        ExecSql;
      end;
      Free;
    end;
  end;


  procedure AtualizaPassado;
  begin
    if ChkTrackingExp.Checked then
    begin
      Gauge.MaxValue := 1;
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        Sql.Clear;
        Sql.Add('UPDATE FE SET');
        Sql.Add('   RLZ_DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FU.DT_REALIZACAO,');
        Sql.Add('   PVT_DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FU.DT_PREVISTA,');
        Sql.Add('   EFT_DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FU.DT_REALIZACAO_EFETIVA,');
        Sql.Add('   IN_DT_EV'  + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FU.IN_APLICAVEL');
        Sql.Add('FROM MYINDAIA.DBO.TFLP_EXPORT2 FE (NOLOCK)');
        Sql.Add('   INNER JOIN TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = FE.NR_PROCESSO AND ');
        Sql.Add('       SUBSTRING(PR.NR_PROCESSO,5,2) NOT IN (''EW'',''FT'',''IF'',''PO'',''TE'',''TS''))');
        Sql.Add('   INNER JOIN TFOLLOWUP FU (NOLOCK) ON (FU.NR_PROCESSO = FE.NR_PROCESSO AND ');
        Sql.Add('       FU.CD_EVENTO =:CD_EVENTO)');
        Sql.Add('WHERE');
        Sql.Add('   YEAR(PR.DT_ABERTURA) >= ''2005''');
        ParamByName('CD_EVENTO').AsString := datm_evento.qry_evento_CD_EVENTO.AsString;
        ExecSql;
        Gauge.Progress := Gauge.Progress + 1;
      end;
    end;

    if ChkTrackingImp.Checked then
    begin
      Gauge.MaxValue := 3;
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        Sql.Clear;

        Sql.Add('SELECT COUNT(*) AS COUNT FROM TEVENTO_ATZ WHERE CD_EVENTO = :CD_EVENTO');
        ParamByName('CD_EVENTO').AsString    := datm_evento.qry_evento_CD_EVENTO.AsString;
        Open;

        if FieldByName('COUNT').AsInteger = 0 then
        begin
          Close;
          Sql.Clear;
          Sql.Add('INSERT INTO TEVENTO_ATZ ');
          Sql.Add('VALUES (:CD_EVENTO)');

          ParamByName('CD_EVENTO').AsString    := datm_evento.qry_evento_CD_EVENTO.AsString;
          ExecSql;
        end;

        Sql.Clear;
        Sql.Add('UPDATE FI SET');
        Sql.Add('   RLZ_DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FP.DT_REALIZACAO,');
        Sql.Add('   PVT_DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FP.DT_PREVISTA,');
        Sql.Add('   IN_DT_EV'  + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FP.IN_APLICAVEL');
        Sql.Add('FROM MYINDAIA.DBO.TFLP_IMPORT2 FI (NOLOCK)');
        Sql.Add('   INNER JOIN TPO PO (NOLOCK) ON (PO.NR_PROCESSO = FI.NR_REFERENCIA)');
        Sql.Add('   INNER JOIN MYINDAIA.DBO.TFLP_PO FP (NOLOCK) ON (FP.NR_PROCESSO = FI.NR_REFERENCIA AND CD_EVENTO =:CD_EVENTO )');
        Sql.Add('WHERE');
        Sql.Add('   FI.NR_PROCESSO_ADM IS NOT NULL AND YEAR(PO.DT_ABERTURA) >= ''2005''');
        ParamByName('CD_EVENTO').AsString := datm_evento.qry_evento_CD_EVENTO.AsString;
        ExecSql;
        Application.ProcessMessages;
        Gauge.Progress := Gauge.Progress + 1;

        Sql.Clear;
        Sql.Add('UPDATE FI SET');
        Sql.Add('   RLZ_DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FP.DT_REALIZACAO,');
        Sql.Add('   PVT_DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FP.DT_PREVISTA,');
        Sql.Add('   IN_DT_EV'  + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FP.IN_APLICAVEL');
        Sql.Add('FROM MYINDAIA.DBO.TFLP_IMPORT2 FI (NOLOCK)');
        Sql.Add('   INNER JOIN TPO PO (NOLOCK) ON (PO.NR_PROCESSO = FI.NR_REFERENCIA)');
        Sql.Add('   INNER JOIN MYINDAIA.DBO.TFLP_PO_ITEM FP (NOLOCK) ON (FP.NR_PROCESSO = FI.NR_REFERENCIA AND FP.NR_ITEM_CLIENTE = FI.NR_ITEM_CLIENTE AND CD_EVENTO =:CD_EVENTO)');
        Sql.Add('WHERE');
        Sql.Add('   FI.NR_PROCESSO_ADM IS NOT NULL AND YEAR(PO.DT_ABERTURA) >= ''2005''');
        ParamByName('CD_EVENTO').AsString := datm_evento.qry_evento_CD_EVENTO.AsString;
        ExecSql;
        Application.ProcessMessages;
        Gauge.Progress := Gauge.Progress + 1;


        Sql.Clear;
        Sql.Add('UPDATE FI SET');
        Sql.Add('   RLZ_DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FU.DT_REALIZACAO,');
        Sql.Add('   PVT_DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FU.DT_PREVISTA,');
        Sql.Add('   EFT_DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FU.DT_REALIZACAO_EFETIVA,');
        Sql.Add('   IN_DT_EV'  + datm_evento.qry_evento_CD_EVENTO.AsString + ' = FU.IN_APLICAVEL');
        Sql.Add('FROM MYINDAIA.DBO.TFLP_IMPORT2 FI (NOLOCK)');
        Sql.Add('   INNER JOIN TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = FI.NR_PROCESSO_DES)');
        Sql.Add('   INNER JOIN TFOLLOWUP FU (NOLOCK) ON (FU.NR_PROCESSO = FI.NR_PROCESSO_DES AND FU.CD_EVENTO =:CD_EVENTO )');
        Sql.Add('WHERE');
        //FI.NR_PROCESSO_ADM IS NOT NULL AND - Comentado por Rodrigo Capra - 30/07/2008  -  A pedido do Vitor Zanin
        Sql.Add('   YEAR(PR.DT_ABERTURA) >= ''2005''');
        ParamByName('CD_EVENTO').AsString := datm_evento.qry_evento_CD_EVENTO.AsString;
        ExecSql;
        Application.ProcessMessages;
        Gauge.Progress := Gauge.Progress + 1;

        Free;
      end;
    end;
  end;
begin
  try
    with TDatabase.Create(Application) do
    begin
      try
        FlagCampoCriado := False;
        lblbarra.Visible := True;
        Gauge.Visible    := True;
        lblbarra.Caption := 'Atualizando os registros para a WEB ...';
        Application.ProcessMessages;
        Params.Add('DATABASE NAME=MYINDAIA');
        Params.Add('SERVER NAME=INDAIA10');
        Params.Add('USER NAME=sa');
        Params.Add('PASSWORD=123');
        DatabaseName := 'MYINDAIA';
        AliasName    := 'MYINDAIA';
        DriverName   := 'MSSQL';
        LoginPrompt  := false;
        Connected    := True;

        if ChkTrackingImp.Checked then
        begin
          with TQuery.Create(Application) do
          begin
            DatabaseName := 'MYINDAIA';
            Sql.Clear;
            Sql.Add('select count(*) cont from SYSOBJECTS SO, SYSCOLUMNS SC');
            Sql.Add('where');
            Sql.Add('  (SO.NAME = ''TFLP_IMPORT2'' or SO.NAME = ''TFLP_IMPORT1'') and');
            Sql.Add('  SC.name = ''PVT_DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString + ''' and');
            Sql.Add('  SC.ID = SO.ID');
            Open;
            if FieldByName('cont').AsString = '0' then
            begin
              CriaCampo('TFLP_IMPORT2','RLZ_DT_EV', ' datetime');
              CriaCampo('TFLP_IMPORT2','PVT_DT_EV', ' datetime');
              CriaCampo('TFLP_IMPORT2','EFT_DT_EV', ' datetime');
              CriaCampo('TFLP_IMPORT2','IN_DT_EV' , ' char(1)');
              FlagCampoCriado := True;
            end;
            Free;
          end;
          InsereM10_DADOS;
          InsereM11_FILTRO('01');
          InsereM12_campo('01');
        end;

        if ChkTrackingExp.Checked then
        begin
          with TQuery.Create(Application) do
          begin
            DatabaseName := 'MYINDAIA';
            Sql.Clear;
            Sql.Add('select count(*) cont from SYSOBJECTS SO, SYSCOLUMNS SC');
            Sql.Add('where');
            Sql.Add('  (SO.NAME = ''TFLP_EXPORT2'' or SO.NAME = ''TFLP_EXPORT1'') and');
            Sql.Add('  SC.name = ''PVT_DT_EV' + datm_evento.qry_evento_CD_EVENTO.AsString + ''' and');
            Sql.Add('  SC.ID = SO.ID');
            Open;
            if FieldByName('cont').AsString = '0' then
            begin
              CriaCampo('TFLP_EXPORT2','RLZ_DT_EV', ' datetime');
              CriaCampo('TFLP_EXPORT2','PVT_DT_EV', ' datetime');
              CriaCampo('TFLP_EXPORT2','EFT_DT_EV', ' datetime');
              CriaCampo('TFLP_EXPORT2','IN_DT_EV' , ' char(1)');
              FlagCampoCriado := True;
            end;
            Free;
          end;
          InsereM10_DADOS;
          InsereM11_FILTRO('02');
          InsereM12_campo('02');
        end;
        //Atualiza o passado apenas se o campo estiver sido criado no exato momento
        if FlagCampoCriado then
          AtualizaPassado;
      finally
          lblbarra.Visible := False;
        Gauge.Visible    := False;
      end;
      Free;
    end;
  except
    on e : exception do
      showmessage(e.message);
  end;
end;

procedure Tfrm_evento.rb_exp_simClick(Sender: TObject);
begin
//  rb_exp_nao.Checked := False;
end;

procedure Tfrm_evento.rb_exp_naoClick(Sender: TObject);
begin
//  rb_exp_sim.Checked := False;
end;

procedure Tfrm_evento.dbcheck_insp_expClick(Sender: TObject);
begin
  if ( datm_evento.qry_evento_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
  HabilitaInspecao(2);
end;

procedure Tfrm_evento.dbcheck_insp_impClick(Sender: TObject);
begin
  if ( datm_evento.qry_evento_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
  HabilitaInspecao(1);
end;

procedure Tfrm_evento.HabilitaInspecao(tp_insp : integer);
begin
  if (tp_insp = 1) or (tp_insp = 0) then
    if dbcheck_insp_imp.Checked then
    begin
      dbedtInspecao1Imp.color := clWindow;
      dbedtInspecao2Imp.color := clWindow;
      dbedtInspecao3Imp.color := clWindow;
      dbedtInspecao1Imp.Enabled := True;
      dbedtInspecao2Imp.Enabled := True;
      dbedtInspecao3Imp.Enabled := True;
    end
    else
    begin
      dbedtInspecao1Imp.color := clSilver;
      dbedtInspecao2Imp.color := clSilver;
      dbedtInspecao3Imp.color := clSilver;
      dbedtInspecao1Imp.Enabled := False;
      dbedtInspecao2Imp.Enabled := False;
      dbedtInspecao3Imp.Enabled := False;
      dbedtInspecao1Imp.Text := '';
      dbedtInspecao2Imp.Text := '';
      dbedtInspecao3Imp.Text := '';
    end;
  if (tp_insp = 2) or (tp_insp = 0) then
    if dbcheck_insp_exp.Checked then
    begin
      dbedtInspecao1Exp.color := clWindow;
      dbedtInspecao2Exp.color := clWindow;
      dbedtInspecao3Exp.color := clWindow;
      dbedtInspecao1Exp.Enabled := True;
      dbedtInspecao2Exp.Enabled := True;
      dbedtInspecao3Exp.Enabled := True;
    end
    else
    begin
      dbedtInspecao1Exp.color := clSilver;
      dbedtInspecao2Exp.color := clSilver;
      dbedtInspecao3Exp.color := clSilver;
      dbedtInspecao1Exp.Enabled := False;
      dbedtInspecao2Exp.Enabled := False;
      dbedtInspecao3Exp.Enabled := False;
      dbedtInspecao1Exp.Text := '';
      dbedtInspecao2Exp.Text := '';
      dbedtInspecao3Exp.Text := '';
    end;
  if (tp_insp = 3) or (tp_insp = 0) then
    if dbcheck_insp_gp.Checked then
    begin
      dbedtInspecao1gp.color := clWindow;
      dbedtInspecao2gp.color := clWindow;
      dbedtInspecao3gp.color := clWindow;
      dbedtInspecao1gp.Enabled := True;
      dbedtInspecao2gp.Enabled := True;
      dbedtInspecao3gp.Enabled := True;
    end
    else
    begin
      dbedtInspecao1gp.color := clSilver;
      dbedtInspecao2gp.color := clSilver;
      dbedtInspecao3gp.color := clSilver;
      dbedtInspecao1gp.Enabled := False;
      dbedtInspecao2gp.Enabled := False;
      dbedtInspecao3gp.Enabled := False;
      dbedtInspecao1gp.Text := '';
      dbedtInspecao2gp.Text := '';
      dbedtInspecao3gp.Text := '';
    end;
  if (tp_insp = 4) or (tp_insp = 0) then
    if dbcheck_insp_fi_imp.Checked then
    begin
      dbedtInspecao1fi_imp.color := clWindow;
      dbedtInspecao2fi_imp.color := clWindow;
      dbedtInspecao3fi_imp.color := clWindow;
      dbedtInspecao1fi_imp.Enabled := True;
      dbedtInspecao2fi_imp.Enabled := True;
      dbedtInspecao3fi_imp.Enabled := True;
    end
    else
    begin
      dbedtInspecao1fi_imp.color := clSilver;
      dbedtInspecao2fi_imp.color := clSilver;
      dbedtInspecao3fi_imp.color := clSilver;
      dbedtInspecao1fi_imp.Enabled := False;
      dbedtInspecao2fi_imp.Enabled := False;
      dbedtInspecao3fi_imp.Enabled := False;
      dbedtInspecao1fi_imp.Text := '';
      dbedtInspecao2fi_imp.Text := '';
      dbedtInspecao3fi_imp.Text := '';
    end;
  if (tp_insp = 5) or (tp_insp = 0) then
    if dbcheck_insp_fi_exp.Checked then
    begin
      dbedtInspecao1fi_exp.color := clWindow;
      dbedtInspecao2fi_exp.color := clWindow;
      dbedtInspecao3fi_exp.color := clWindow;
      dbedtInspecao1fi_exp.Enabled := True;
      dbedtInspecao2fi_exp.Enabled := True;
      dbedtInspecao3fi_exp.Enabled := True;
    end
    else
    begin
      dbedtInspecao1fi_exp.color := clSilver;
      dbedtInspecao2fi_exp.color := clSilver;
      dbedtInspecao3fi_exp.color := clSilver;
      dbedtInspecao1fi_exp.Enabled := False;
      dbedtInspecao2fi_exp.Enabled := False;
      dbedtInspecao3fi_exp.Enabled := False;
      dbedtInspecao1fi_exp.Text := '';
      dbedtInspecao2fi_exp.Text := '';
      dbedtInspecao3fi_exp.Text := '';
    end;
end;

procedure Tfrm_evento.dbcheck_insp_gpClick(Sender: TObject);
begin
  if ( datm_evento.qry_evento_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
  HabilitaInspecao(3);
end;

procedure Tfrm_evento.dbcheck_insp_fi_impClick(Sender: TObject);
begin
  if ( datm_evento.qry_evento_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
  HabilitaInspecao(4);
end;

procedure Tfrm_evento.dbcheck_insp_fi_expClick(Sender: TObject);
begin
  if ( datm_evento.qry_evento_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
  HabilitaInspecao(5);
end;

procedure Tfrm_evento.edt_chaveExit(Sender: TObject);
var
  vOrdem: String;
begin
  if not AlterouFiltro then
    Exit;
  AlterouFiltro := False;
  vOrdem := IfThen(cb_ordem.ItemIndex < 3, a_str_indices[cb_ordem.ItemIndex], a_str_indices[1]);
  datm_evento.qry_evento_.Close;
  datm_evento.qry_evento_.SQL.Clear;
  datm_evento.qry_evento_.SQL.Add(' SELECT E.*, R.NM_RESPONSAVEL                                                    ');
  datm_evento.qry_evento_.SQL.Add(' FROM TEVENTO E INNER JOIN TRESPONSAVEL R ON R.CD_RESPONSAVEL = E.CD_RESPONSAVEL ');
  if Trim(edt_chave.Text) <> '' then
  begin
    case cb_ordem.ItemIndex of
      0: datm_evento.qry_evento_.SQL.Add(' WHERE E.CD_EVENTO = ''' + edt_chave.Text + '''');
      1: datm_evento.qry_evento_.SQL.Add(' WHERE E.NM_EVENTO LIKE ''%' + edt_chave.Text + '%''');
      2: datm_evento.qry_evento_.SQL.Add(' WHERE R.NM_RESPONSAVEL LIKE ''%' + edt_chave.Text + '%''');
      3: begin
          datm_evento.qry_evento_.SQL.Add(' WHERE E.CD_EVENTO = ''' + edt_chave.Text + '''        ');
          datm_evento.qry_evento_.SQL.Add('   OR E.NM_EVENTO LIKE ''%' + edt_chave.Text + '%''    ');
          datm_evento.qry_evento_.SQL.Add('   OR NM_RESPONSAVEL LIKE ''%' + edt_chave.Text + '%'' ');
        end;
    end;
  end;
  datm_evento.qry_evento_.SQL.Add(' ORDER BY ' + vOrdem);
  datm_evento.qry_evento_.Open;
  edt_chaveChange(nil);
end;

end.




















