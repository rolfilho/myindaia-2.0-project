unit PGSM240;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, DBTables, Funcoes, RxDBComb, ConsOnLineEx;

type
  Tfrm_viagem = class(TForm)
    pgctrl_viagem: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_ag: TPanel;
    lbl_nr_viagem: TLabel;
    lbl_armazem_atracacao: TLabel;
    Label8: TLabel;
    btn_co_armazem_atracacao: TSpeedButton;                                                                          
    dbedt_nr_viagem: TDBEdit;
    dbedt_cd_armazem_atracacao: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_nm_armazem_atracacao: TDBEdit;
    pnl_btn_ag: TPanel;
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
    dbg_viagem: TDBGrid;
    lbl_nr_manifesto: TLabel;
    dbedt_nr_manifesto: TDBEdit;
    Label1: TLabel;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    Label2: TLabel;
    dbedt_cd_embarcacao: TDBEdit;
    dbedt_nm_embarcacao: TDBEdit;
    lbl_esperada: TLabel;
    dbedt_dt_esperada: TDBEdit;
    lbl_ent: TLabel;
    dbedt_dt_ent: TDBEdit;
    lbl_transbordo: TLabel;
    dblckpbox_transbordo: TDBLookupComboBox;
    dbedt_cd_local: TDBEdit;
    lbl_tipo_produto: TLabel;
    dbedt_nm_local: TDBEdit;
    btn_co_local: TSpeedButton;
    Panel1: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    Label6: TLabel;
    btn_co_embarcacao: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_embarcacao: TMaskEdit;
    edt_nm_embarcacao: TEdit;
    Shape3: TShape;
    lbl3: TLabel;
    dbedt_transit_time: TDBEdit;
    pnlAguarde: TPanel;
    pnl1: TPanel;
    lbl5: TLabel;
    pb1: TProgressBar;
    lblPrevOrigem: TLabel;
    dbedtPrevOrigemDestino: TDBEdit;
    dbedtNrViagemArmador: TDBEdit;
    Label4: TLabel;
    ts_DeadLines: TTabSheet;
    Panel2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbedt_deadline_bl: TDBEdit;
    dbedt_deadline_carga: TDBEdit;
    dbedtAbreGate: TDBEdit;
    dbedt_deadline_imo: TDBEdit;
    dbedtDeadLineTemp: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    dbehrAbreGate: TDBEdit;
    lbl7: TLabel;
    rxdbcbEstufagem: TRxDBComboBox;
    Label20: TLabel;
    dbedt_cd_agente: TDBEdit;
    dbedt_nm_agente: TEdit;
    btn_agente: TSpeedButton;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    lblAberturaGate: TLabel;
    dbedt_DT_ABERTURA_GATE: TDBEdit;
    DBEdit1: TDBEdit;
    Label13: TLabel;
    DBText1: TDBText;
    lbl_usuario: TLabel;
    lbl_alteracao: TLabel;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    dbedtDT_DEADLINE_VGM: TDBEdit;
    dbedtHR_DEADLINE_VGM: TDBEdit;
    dbedt_hr_abertura_gate: TDBEdit;
    Label17: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbg_viagemDblClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbedt_nr_viagemChange(Sender: TObject);
    procedure pgctrl_viagemChange(Sender: TObject);
    procedure dbg_viagemKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure pgctrl_viagemChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CodExits;
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_embarcacaoEnter(Sender: TObject);
    procedure msk_cd_embarcacaoExit(Sender: TObject);
    procedure btn_co_embarcacaoClick(Sender: TObject);
    procedure dbedt_cd_armazem_atracacaoExit(Sender: TObject);
    procedure dbedt_dt_esperadaExit(Sender: TObject);
    procedure btn_co_armazem_atracacaoClick(Sender: TObject);
    procedure dbedt_dt_esperadaChange(Sender: TObject);
    procedure dbedt_dt_entChange(Sender: TObject);
    procedure btn_co_localClick(Sender: TObject);
    procedure dbedt_cd_localExit(Sender: TObject);
    procedure dbedt_dt_entExit(Sender: TObject);
    procedure dbedt_deadline_blChange(Sender: TObject);
    procedure dbedt_deadline_cargaChange(Sender: TObject);
    procedure dbedt_transit_timeChange(Sender: TObject);
    procedure dbedtAbreGateChange(Sender: TObject);
    procedure dbedtPrevOrigemDestinoChange(Sender: TObject);
    procedure dbedt_deadline_imoChange(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure btn_agenteClick(Sender: TObject);
    procedure rxdbcbEstufagemChange(Sender: TObject);
    procedure dbedt_cd_agenteExit(Sender: TObject);
    procedure dbedtDeadLineTempChange(Sender: TObject);
    procedure dbedt_hr_abertura_gateChange(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir: Boolean;
    cd_unid_neg_viagem, cd_produto_viagem : String[2];
    cd_embarcacao_viagem : String[4];
    nr_dias_entre_viagens : Integer;
    vAlterouData: Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    function VerUnidNegProduto : Boolean;
    procedure Cancelar;
    procedure Abertura;
    procedure AtzFollowUp;
    function ExisteProcessoVinculado: Boolean;
    procedure PreencheAberturaGateDeadLines;
  public
    co_cd_unid_neg, co_cd_produto : String[2];
    co_cd_embarcacao : String[4];
    lCons_OnLine : Boolean;
    Cons_OnLine, Cons_OnLine2, Cons_OnLine3, Cons_Online4 : TStringField;
    Cons_OnLine_Texto, Cons_OnLine_Texto2, Cons_OnLine_Texto3, Cons_OnLine_Texto4 : String;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  end;

var
  frm_viagem: Tfrm_viagem;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM010, PGSM018, PGSM064, PGSM088, PGSM241,
  PGSM014, DateUtils;

{$R *.DFM}

procedure Tfrm_viagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_viagem do
    begin
      qry_lista_.Close;
      qry_unid_neg_.Close;
      qry_produto_.Close;
      qry_usuario_habilitacao_.Close;
      qry_embarcacao_.Close;
      qry_armazem_.Close;
      qry_viagem_.Close;
      Free;
    end;
    Action := caFree;
  end
  else
    Action := caNone;
end;

procedure Tfrm_viagem.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  // Inicializa o DataModule para Viagens
  Application.CreateForm( Tdatm_viagem, datm_viagem );

  with datm_viagem do
  begin
    ds_viagem.AutoEdit := st_modificar;

    qry_viagem_.Close;
    qry_viagem_.Prepare;
    qry_viagem_.Open;
  end;

  btn_incluir.Enabled := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_incluir.Enabled  := st_incluir;
  mi_excluir.Enabled  := st_excluir;
end;

procedure Tfrm_viagem.dbg_viagemDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString  := datm_viagem.qry_viagem_NR_VIAGEM.AsString;
      if ( Trim( msk_cd_produto.Text ) <> '02' ) and ( Trim( msk_cd_produto.Text ) <> '10' ) then
        Cons_OnLine2.AsString := datm_viagem.qry_viagem_NR_MANIFESTO.AsString;
      Cons_OnLine3.AsString := datm_viagem.qry_viagem_CD_ARMAZEM_ATRACACAO.AsString;
      Cons_OnLine4.AsString := datm_viagem.qry_viagem_CD_LOCAL.AsString;
    except
      try
        Cons_OnLine_Texto  := datm_viagem.qry_viagem_NR_VIAGEM.AsString;
        if ( Trim( msk_cd_produto.Text ) <> '02' ) or ( Trim( msk_cd_produto.Text ) <> '10' ) then
          Cons_OnLine_Texto2 := datm_viagem.qry_viagem_NR_MANIFESTO.AsString;
        Cons_OnLine_Texto3 := datm_viagem.qry_viagem_CD_ARMAZEM_ATRACACAO.AsString;
        Cons_OnLine_Texto4 := datm_viagem.qry_viagem_CD_LOCAL.AsString;
      except
        BoxMensagem( 'Não foi possível retornar o Nº da Viagem!', 2 )
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_viagem.btn_incluirClick(Sender: TObject);
begin
  with datm_viagem do
  begin
    if pgctrl_viagem.ActivePage = ts_lista then
       dbg_viagem.SetFocus;
    if Trim( msk_cd_unid_neg.Text ) = '' then
    begin
      BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
      pgctrl_viagem.ActivePage := ts_lista;
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;
    if Trim( msk_cd_produto.Text ) = '' then
    begin
      BoxMensagem( 'Informe um Produto!', 2 );
      pgctrl_viagem.ActivePage := ts_lista;
      msk_cd_produto.SetFocus;
      Exit;
    end;
    if Trim( msk_cd_embarcacao.Text ) = '' then
    begin
      BoxMensagem( 'Informe uma Embarcação!', 2 );
      pgctrl_viagem.ActivePage := ts_lista;
      msk_cd_embarcacao.SetFocus;
      Exit;
    end;

    if pgctrl_viagem.ActivePage = ts_lista then
    begin
      qry_viagem_.DisableControls;
      qry_viagem_.Cancel;
      qry_viagem_.Append;
      vAlterouData := False;
      qry_viagem_.EnableControls;
      qry_viagem_.FieldByName('CD_UNID_NEG').AsString       := Trim( msk_cd_unid_neg.Text );
      qry_viagem_.FieldByName('CD_PRODUTO').AsString        := Trim( msk_cd_produto.Text );
      qry_viagem_.FieldByName('CD_EMBARCACAO').AsString     := Trim( msk_cd_embarcacao.Text );
      qry_viagem_.FieldByName('IN_TRANSBORDO').AsString     := '0';
      qry_ult_viagem_.Close;
      qry_ult_viagem_.ParamByName('CD_UNID_NEG').AsString   := Trim( msk_cd_unid_neg.Text );
      qry_ult_viagem_.ParamByName('CD_PRODUTO').AsString    := Trim( msk_cd_produto.Text );
      qry_ult_viagem_.ParamByName('CD_EMBARCACAO').AsString := Trim( msk_cd_embarcacao.Text );
      qry_ult_viagem_.ParamByName('NR_ANO').AsString        := FormatDateTime( 'yy', dt_server );
      qry_ult_viagem_.Prepare;
      qry_ult_viagem_.Open;
      if qry_ult_viagem_.RecordCount > 0 then
      begin
        if qry_ult_viagem_.FieldByName('ULTIMO').AsString = '' then
          qry_viagem_.FieldByName('NR_VIAGEM').AsString     := '01' + FormatDateTime( 'yy', dt_server )
        else
          qry_viagem_.FieldByName('NR_VIAGEM').AsString     := StrZero( StrToInt( qry_ult_viagem_.FieldByName('ULTIMO').AsString ) + 1, 2 ) + FormatDateTime( 'yy', dt_server );
      end
      else
        qry_viagem_.FieldByName('NR_VIAGEM').AsString       := '01' + FormatDateTime( 'yy', dt_server );

      qry_ult_viagem_.Close;
      pgctrl_viagem.ActivePage := ts_dados_basicos;
      dbedt_dt_esperada.SetFocus;
    end
    else if pgctrl_viagem.ActivePage = ts_DeadLines then
    begin
      vAlterouData := False;
      dbedt_cd_agente.SetFocus;
      qry_viagem_DeadLine.Append;
{ by carlos - 01/06/2011 coloquei no OnNewRecord da Query
      qry_viagem_DeadLineCD_UNID_NEG.AsString   := qry_viagem_CD_UNID_NEG.AsString;
      qry_viagem_DeadLineCD_PRODUTO.AsString    := qry_viagem_CD_PRODUTO.AsString;
      qry_viagem_DeadLineCD_EMBARCACAO.AsString := qry_viagem_CD_EMBARCACAO.AsString;
      qry_viagem_DeadLineNR_VIAGEM.AsString     := qry_viagem_NR_VIAGEM.AsString;
}

      if datm_viagem.qry_viagem_.FieldByName('DT_ABERTURA_GATE').AsDateTime > 0 then
        dbedtAbreGate.Text := FormatDateTime('dd/mm/yyyy', datm_viagem.qry_viagem_.FieldByName('DT_ABERTURA_GATE').AsDateTime);

     if (datm_viagem.qry_viagem_.FieldByName('HR_ABERTURA_GATE').AsString <> '') and
        (datm_viagem.qry_viagem_.FieldByName('HR_ABERTURA_GATE').AsString <> '  :  :  ') then
        dbehrAbreGate.Text := datm_viagem.qry_viagem_.FieldByName('HR_ABERTURA_GATE').AsString;

    end;
  end;
  btn_mi( False, True, True, False );
end;

procedure Tfrm_viagem.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then Exit;
  if not Grava then Exit;
  vAlterouData := False;
end;

procedure Tfrm_viagem.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  vAlterouData := False;
end;

procedure Tfrm_viagem.Cancelar;
begin
  try
    if pgctrl_viagem.ActivePage = ts_dados_basicos then
    begin
      if datm_viagem.qry_viagem_.State in [dsInsert, dsEdit] then
      begin
        datm_viagem.qry_viagem_.Cancel;
        pgctrl_viagem.ActivePage := ts_dados_basicos;
        dbedt_dt_esperada.SetFocus;
      end;
    end
    else if pgctrl_viagem.ActivePage = ts_DeadLines then
    begin
      if datm_viagem.qry_viagem_DeadLine.State in [dsInsert, dsEdit] then
      begin
        datm_viagem.qry_viagem_DeadLine.Cancel;
        pgctrl_viagem.ActivePage := ts_DeadLines;
        dbedt_cd_agente.SetFocus;
      end;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente!', 2 );
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_viagem.btn_excluirClick(Sender: TObject);
begin
  with datm_viagem do
  begin
    if pgctrl_viagem.ActivePage <> ts_DeadLines then
    begin
      if not ExisteProcessoVinculado then
      begin
        if BoxMensagem( 'Esta Viagem será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
        begin
        with TQuery.Create(application) do
        begin
          DataBaseName := 'DBBROKER';
          Close;
          SQL.Clear;
          SQL.Add(' DELETE FROM TVIAGEM_DEADLINE ');
          SQL.Add(' WHERE CD_PRODUTO = ''' + qry_viagem_CD_PRODUTO.AsString  + '''');
          SQL.Add('   AND CD_UNID_NEG = ''' + qry_viagem_CD_UNID_NEG.AsString  + '''');
          SQL.Add('   AND NR_VIAGEM = ''' + qry_viagem_NR_VIAGEM.AsString  + '''');
          SQL.Add('   AND CD_EMBARCACAO = ''' + qry_viagem_CD_EMBARCACAO.AsString  + '''');
          ExecSQL;
          Free;
        end;
        try
          datm_main.db_broker.StartTransaction;
          qry_viagem_.Delete;
          qry_lista_.Close;
          qry_lista_.Prepare;
          qry_lista_.Open;
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            qry_viagem_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
        end;
        pgctrl_viagem.ActivePage := ts_lista;
      end
      else
        BoxMensagem('Esta Viagem está relacionada a um processo e não pode ser excluída !', 3 );
    end
    else
    begin
      if not ExisteProcessoVinculado then
      begin
        if BoxMensagem( 'Este Deadline será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
        try
          datm_main.db_broker.StartTransaction;
          qry_viagem_DeadLine.Delete;
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            qry_viagem_DeadLine.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
        pgctrl_viagem.ActivePage := ts_DeadLines;
      end
      else
        BoxMensagem('Esta Viagem está relacionada a um processo e não pode ser excluída !', 3 );
    end;
  end;
end;

function Tfrm_viagem.Grava : Boolean;
var
  Local : String;
  Viagem, Agente: String;
begin
  Result := True;
  with datm_viagem do
  begin
    if pgctrl_viagem.ActivePage = ts_dados_basicos then
    begin
      try
        if datm_viagem.qry_viagem_.State in [dsInsert, dsEdit] then
        begin
          if Trim( dbedt_cd_local.Text ) = '' then
          begin
            if (dbedt_cd_produto.Text = '01') or (dbedt_cd_produto.Text = '03') then
              Local := 'Local de desembarque deve ser preenchido !'
            else
              Local := 'Local de embarque deve ser preenchido !';

            BoxMensagem(Local, 2);
            dbedt_cd_local.SetFocus;
            Result :=  False;
            Exit;
           end;
        end;

        Screen.Cursor := crHourGlass;
        datm_main.db_broker.StartTransaction;
        if ( qry_viagem_.State in [dsInsert, dsEdit] ) then
        begin
          Pesquisa := qry_viagem_NR_VIAGEM.AsString;

          Viagem := qry_viagem_NR_VIAGEM.AsString;
          qry_viagem_.Post;
          //if vAlterouData then //AtzFollowUp;

          qry_lista_.Close;
          qry_lista_.Prepare;
          qry_lista_.Open;
          qry_lista_.Locate('NR_VIAGEM', Viagem, []);

          qry_viagem_.Close;
          qry_viagem_.Prepare;
          qry_viagem_.Open;
          //qry_viagem_.Locate( 'CD_UNID_NEG;CD_PRODUTO;CD_EMBARCACAO;NR_VIAGEM; CD_LOCAL',
          //                    VarArrayOf([ Trim( msk_cd_unid_neg.Text ), Trim( msk_cd_produto.Text ),
          //                                 Trim( msk_cd_embarcacao.Text ), Pesquisa, Trim( dbedt_cd_local.Text ) ] ), [] );
          qry_viagem_.Locate('NR_VIAGEM', Viagem, []);
        end;
        datm_main.db_broker.Commit;

        PreencheAberturaGateDeadLines;
      except
        on E: Exception do
        begin
          datm_viagem.qry_viagem_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Grava := False;
        end;
      end;
      Screen.Cursor:=crDefault;
      btn_mi( st_incluir, False, False, st_excluir );
    end
    else if pgctrl_viagem.ActivePage = ts_DeadLines then
    begin
      try
        Screen.Cursor := crHourGlass;

        datm_main.db_broker.StartTransaction;
        if ( qry_viagem_DeadLine.State in [dsInsert, dsEdit] ) then
        begin
          qry_viagem_DeadLineCD_RESP_ALTERACAO.AsString:= str_cd_usuario;
          qry_viagem_DeadLineDT_ALTERACAO.AsDateTime:= Now;
          qry_viagem_DeadLine.Post;

          Local := qry_viagem_DeadLine.FieldByName('CD_AGENTE').AsString;
          qry_viagem_DeadLine.DisableControls;
          qry_viagem_DeadLine.Close;
          qry_viagem_DeadLine.Open;
          qry_viagem_DeadLine.Locate('CD_AGENTE',local, []);
          qry_viagem_DeadLine.EnableControls;
        end;
        // Comentado abaixo e executando AP_ATZ_FOLLOWUP por trigger na TVIAGEM_DEADLINE - Michel - 10/09/2012
        //if vAlterouData then
        //  AtzFollowUp;
        datm_main.db_broker.Commit;
        Grava := True;
      except
        on E: Exception do
        begin    
          datm_viagem.qry_viagem_DeadLine.Cancel;
          if datm_main.db_broker.InTransaction then
            datm_main.db_broker.Rollback;

          TrataErro(E);
          Grava := False;
        end;
      end;
      Screen.Cursor:=crDefault;
      btn_mi( st_incluir, False, False, st_excluir );
    end;
  end;
end;

procedure Tfrm_viagem.PreencheAberturaGateDeadLines;
var
  vQryUpdate: TQuery;
begin
  if (datm_viagem.qry_viagem_.FieldByName('CD_UNID_NEG').AsString <> '') and
     (datm_viagem.qry_viagem_.FieldByName('CD_PRODUTO').AsString <> '') and
     (datm_viagem.qry_viagem_.FieldByName('CD_EMBARCACAO').AsString <> '') and
     (datm_viagem.qry_viagem_.FieldByName('NR_VIAGEM').AsString <> '') and
     (datm_viagem.qry_viagem_.FieldByName('DT_ABERTURA_GATE').AsDateTime > 0) and
     (datm_viagem.qry_viagem_.FieldByName('HR_ABERTURA_GATE').AsString <> '') and
     (datm_viagem.qry_viagem_.FieldByName('HR_ABERTURA_GATE').AsString <> '  :  :  ') then
  begin

    vQryUpdate := TQuery.Create(Application);
    try
      vQryUpdate.DatabaseName := 'DBBROKER';
      vQryUpdate.SQL.Text := 'UPDATE TVIAGEM_DEADLINE SET DT_ABERTURA_GATE = :DT_ABERTURA_GATE, HR_ABERTURA_GATE = :HR_ABERTURA_GATE ' +
                             'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND ' +
                             '       CD_PRODUTO = :CD_PRODUTO AND ' +
                             '       CD_EMBARCACAO = :CD_EMBARCACAO AND ' +
                             '       NR_VIAGEM = :NR_VIAGEM ';

      vQryUpdate.ParamByName('CD_UNID_NEG').AsString        := datm_viagem.qry_viagem_.FieldByName('CD_UNID_NEG').AsString;
      vQryUpdate.ParamByName('CD_PRODUTO').AsString         := datm_viagem.qry_viagem_.FieldByName('CD_PRODUTO').AsString;
      vQryUpdate.ParamByName('CD_EMBARCACAO').AsString      := datm_viagem.qry_viagem_.FieldByName('CD_EMBARCACAO').AsString;
      vQryUpdate.ParamByName('NR_VIAGEM').AsString          := datm_viagem.qry_viagem_.FieldByName('NR_VIAGEM').AsString;
      vQryUpdate.ParamByName('DT_ABERTURA_GATE').AsDateTime := datm_viagem.qry_viagem_.FieldByName('DT_ABERTURA_GATE').AsDateTime;
      vQryUpdate.ParamByName('HR_ABERTURA_GATE').AsString   := datm_viagem.qry_viagem_.FieldByName('HR_ABERTURA_GATE').AsString;

      vQryUpdate.ExecSQL;

      datm_viagem.qry_viagem_DeadLine.Close;
      datm_viagem.qry_viagem_DeadLine.Open;

    finally
      vQryUpdate.Free;
    end;
  end;

end;

function Tfrm_viagem.Consiste : Boolean;
var
  local :string;
  cont_viagem :integer;
begin
  // Consistências da Lista
  if pgctrl_viagem.ActivePage = ts_lista then
  begin
    // Unidade
    ValCodEdt( msk_cd_unid_neg );
    if msk_cd_unid_neg.Text <> '' then
    begin
      with datm_viagem do
      begin
        qry_unid_neg_.Close;
        qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
        qry_unid_neg_.Prepare;
        qry_unid_neg_.Open;
        if qry_unid_neg_.RecordCount > 0 then
        begin
          edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString;
        end
        else
        begin
          BoxMensagem( 'Unidade de Negócio não cadastrada!', 2 );
          edt_nm_unid_neg.Text := '';
          pgctrl_viagem.ActivePage := ts_lista;
          msk_cd_unid_neg.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    // Produto
    ValCodEdt( msk_cd_produto );
    if msk_cd_produto.Text <> '' then
    begin
      with datm_viagem do
      begin
        qry_produto_.Close;
        qry_produto_.ParamByName( 'CD_PRODUTO' ).AsString := Trim( msk_cd_produto.Text );
        qry_produto_.Prepare;
        qry_produto_.Open;
        if qry_produto_.RecordCount > 0 then
        begin
          edt_nm_produto.Text := qry_produto_.FieldByName('AP_PRODUTO').AsString;
          if ( Trim( msk_cd_produto.text ) = '01' ) or ( Trim( msk_cd_produto.text ) = '03' ) then
            dbg_viagem.Columns[3].Title.Caption := 'Local Desemb.';
          if ( Trim( msk_cd_produto.text ) = '02' ) or ( Trim( msk_cd_produto.text ) = '10' ) then
            dbg_viagem.Columns[3].Title.Caption := 'Local Embarque';
        end
        else
        begin
          BoxMensagem( 'Produto não cadastrado!', 2 );
          edt_nm_produto.Text := '';
          pgctrl_viagem.ActivePage := ts_lista;
          msk_cd_produto.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    // Unidade X Produto
    if Not VerUnidNegProduto then
    begin
      edt_nm_unid_neg.Text := '';
      edt_nm_produto.Text  := '';
      pgctrl_viagem.ActivePage := ts_lista;
      msk_cd_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end;

    // Embarcação
    ValCodEdt( msk_cd_embarcacao );
    if msk_cd_embarcacao.Text <> '' then
    begin
      with datm_viagem do
      begin
        qry_embarcacao_.Close;
        qry_embarcacao_.ParamByName( 'CD_EMBARCACAO' ).AsString := Trim( msk_cd_embarcacao.Text );
        qry_embarcacao_.Prepare;
        qry_embarcacao_.Open;
        if qry_embarcacao_.RecordCount > 0 then
        begin
          edt_nm_embarcacao.Text := qry_embarcacao_.FieldByName('NM_EMBARCACAO').AsString;
        end
        else
        begin
          BoxMensagem( 'Embarcação não cadastrado!', 2 );
          edt_nm_embarcacao.Text := '';
          pgctrl_viagem.ActivePage := ts_lista;
          msk_cd_embarcacao.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end
  // Consistências de Dados Básicos
  else if pgctrl_viagem.ActivePage = ts_dados_basicos then
  begin
    // Armazém de Atracação
    with datm_viagem do
    begin
      if ( qry_viagem_.State in [dsEdit, dsInsert] ) then
      begin;
        ValidCodigo( dbedt_cd_armazem_atracacao );
        if dbedt_cd_armazem_atracacao.Text <> '' then
        begin
          if dbedt_nm_armazem_atracacao.Text = '' then
          begin
            BoxMensagem( 'Código do Armazém de Atracação inválido!', 2 );
            pgctrl_viagem.ActivePage := ts_dados_basicos;
            dbedt_cd_armazem_atracacao.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      if ( Not lNaoConsiste ) and ( ( dbedt_dt_esperada.Text = '  /  /    ' ) or ( Trim( dbedt_dt_esperada.Text ) = '' ) ) then
      begin
        BoxMensagem( 'Campo Data Esperada deve ser preenchido!', 2 );
        pgctrl_viagem.ActivePage := ts_dados_basicos;
        dbedt_dt_esperada.SetFocus;
        Consiste := False;
        Exit;
      end;


      if ( Not lNaoConsiste ) then
      begin
        if qry_viagem_.State in [dsInsert, dsEdit] then
        begin
          qry_ult_dt_esperada_.Close;
          qry_ult_dt_esperada_.ParamByName('CD_UNID_NEG').AsString   := Trim( msk_cd_unid_neg.Text );
          qry_ult_dt_esperada_.ParamByName('CD_PRODUTO').AsString    := Trim( msk_cd_produto.Text );
          qry_ult_dt_esperada_.ParamByName('CD_EMBARCACAO').AsString := Trim( msk_cd_embarcacao.Text );
          qry_ult_dt_esperada_.ParamByName('NR_VIAGEM').AsString     := qry_viagem_NR_VIAGEM.AsString;
          qry_ult_dt_esperada_.ParamByName('CD_LOCAL').AsString      := qry_viagem_CD_LOCAL.AsString;
          qry_ult_dt_esperada_.Prepare;
          qry_ult_dt_esperada_.Open;

          if qry_ult_dt_esperada_.RecordCount > 0 then
          begin
            with TQuery.Create(application) do
            begin
              DataBaseName := 'DBBROKER';
              Close;
              SQL.Clear;
              SQL.Add(' SELECT COUNT(NR_VIAGEM) AS CONT_VIAGEM ');
              SQL.Add(' FROM TVIAGEM (NOLOCK) ');
              SQL.Add(' WHERE CD_PRODUTO     = ''' + qry_viagem_CD_PRODUTO.AsString     + '''');
              SQL.Add('   AND CD_UNID_NEG    = ''' + qry_viagem_CD_UNID_NEG.AsString    + '''');
              SQL.Add('   AND CD_EMBARCACAO  = ''' + qry_viagem_CD_EMBARCACAO.AsString  + '''');
              Sql.add('   AND CD_LOCAL       = ''' + qry_viagem_CD_LOCAL.AsString       + '''');
              Sql.add('   AND NR_VIAGEM     <> ''' + qry_viagem_NR_VIAGEM.AsString      + '''');
              SQL.Add('   AND (CONVERT(DATETIME, DT_ESPERADA, 103) + ' + IntToStr(nr_dias_entre_viagens) + ' > CONVERT(DATETIME, ''' + qry_viagem_DT_ESPERADA.AsString + ''', 103) ');
              SQL.Add('   AND  CONVERT(DATETIME, DT_ESPERADA, 103) - ' + IntToStr(nr_dias_entre_viagens) + ' < CONVERT(DATETIME, ''' + qry_viagem_DT_ESPERADA.AsString + ''', 103)) ');
              Open;
              cont_viagem := FieldByName('CONT_VIAGEM').AsInteger;
              Close;
              Free;
            end;
            
            if ( cont_viagem > 0 ) then
            begin
              BoxMensagem( 'Campo Data Esperada deve ter ' + IntToStr( nr_dias_entre_viagens ) + #13#10 +
                           ' dias em relação a última viagem cadastrada!', 2 );
              pgctrl_viagem.ActivePage := ts_dados_basicos;
              dbedt_dt_esperada.SetFocus;
              Consiste := False;
              Exit;
            end;
          end;
          qry_ult_dt_esperada_.Close;
        end;
      end;

      // Local de Embarque/Desembarque
      ValidCodigo( dbedt_cd_local );
      if dbedt_cd_local.Text <> '' then
      begin
        with datm_viagem do
        begin
          qry_local_.Close;
          qry_local_.ParamByName( 'CD_LOCAL' ).AsString := Trim( dbedt_cd_local.Text );
          qry_local_.Prepare;
          qry_local_.Open;
          if qry_local_.RecordCount > 0 then
          begin
            dbedt_nm_local.Text := qry_local_.FieldByName('DESCRICAO').AsString;
          end
          else
          begin
            if ( dbedt_cd_produto.Text = '01' ) or ( dbedt_cd_produto.Text = '03' ) then
              local := 'Local de desembarque não cadastrado !'
            else
              local := 'Local de embarque não cadastrado !';

            BoxMensagem( local, 2 );
            edt_nm_embarcacao.Text := '';
            pgctrl_viagem.ActivePage := ts_dados_basicos;
            dbedt_cd_local.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;
  end
  // Consistências de DeadLines
  else if pgctrl_viagem.ActivePage = ts_DeadLines then
  begin
    ValidCodigo( dbedt_cd_agente );
    if dbedt_cd_agente.Text <> '' then
    begin
      if dbedt_nm_agente.Text = '' then
      begin
        BoxMensagem( 'Agente inválido!', 2 );
        pgctrl_viagem.ActivePage := ts_DeadLines;
        dbedt_cd_agente.SetFocus;
        Consiste := False;
        Exit;
      end;
    end
    else
    begin
      BoxMensagem( 'Campo Agente precisa ser preenchido !', 2 );
      pgctrl_viagem.ActivePage := ts_DeadLines;
      dbedt_cd_agente.SetFocus;
      Consiste := False;
      Exit;
    end;

    if rxdbcbEstufagem.Text = '' then
    begin
      BoxMensagem( 'Campo Tipo de estufagem precisa ser preenchido !', 2 );
      pgctrl_viagem.ActivePage := ts_DeadLines;
      rxdbcbEstufagem.SetFocus;
      Consiste := False;
      Exit;
    end
    else if rxdbcbEstufagem.Text = 'FCL' then
    begin
      if (dbedtDT_DEADLINE_VGM.Text = '  /  /    ') or (dbedtDT_DEADLINE_VGM.Text = '') or
         (dbedtHR_DEADLINE_VGM.Text = '  :  :  ') or (dbedtHR_DEADLINE_VGM.Text = '') or
         (dbedt_deadline_bl.Text = '  /  /    ') or (dbedt_deadline_bl.Text = '') or
         (DBEdit3.Text = '  :  :  ') or (DBEdit3.Text = '') or
         (dbedt_DEADLINE_CARGA.Text = '  /  /    ') or (dbedt_DEADLINE_CARGA.Text = '') or
         (DBEdit4.Text = '  :  :  ') or (DBEdit4.Text = '') then
      begin
        BoxMensagem( 'Obrigatório o preenchimento dos campos "Dead-Line VGM", "Dead-Line BL Draft" e "Dead-Line Carga".', 2 );
        pgctrl_viagem.ActivePage := ts_DeadLines;
        dbedtDT_DEADLINE_VGM.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
  Consiste := True;
end;

procedure Tfrm_viagem.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_viagem.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_viagem.dbedt_nr_viagemChange(Sender: TObject);
begin
  if ( datm_viagem.qry_viagem_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_viagem.pgctrl_viagemChange(Sender: TObject);
begin
  if ( pgctrl_viagem.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled := True;
  end
  else
  begin
    if ( Trim( msk_cd_produto.Text ) = '01' ) or ( Trim( msk_cd_produto.Text ) = '03' ) or ( Trim( msk_cd_produto.Text ) = '06' ) then
    begin
      lbl_esperada.Caption     := 'Dt. Esperada';
      lbl_ent.Caption          := 'Dt. Entrada';
      lbl_tipo_produto.Caption := 'Local de Desembarque';
    end
    else
    begin
      lbl_esperada.Caption     := 'Dt. Prevista';
      lbl_ent.Caption          := 'Dt. Embarque';
      lbl_tipo_produto.Caption := 'Local de Embarque';
    end;
    dbnvg.Enabled := False;
    //exibe para Importação a Previsão de Saída na Origem
    lblPrevOrigem.Visible := ( Trim( msk_cd_produto.Text ) = '01' ) or ( Trim( msk_cd_produto.Text ) = '03' ) or ( Trim( msk_cd_produto.Text ) = '06' );
    dbedtPrevOrigemDestino.Visible := ( Trim( msk_cd_produto.Text ) = '01' ) or ( Trim( msk_cd_produto.Text ) = '03' ) or ( Trim( msk_cd_produto.Text ) = '06' );
  end;
  if ( pgctrl_viagem.ActivePage = ts_DeadLines ) then
  begin
    lbl_usuario.Caption:= ConsultaLookUPSQL('SELECT isnull(AP_USUARIO,'''') AP_USUARIO1 FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = '''+ datm_viagem.qry_viagem_DeadLineCD_RESP_ALTERACAO.AsString +''' ','AP_USUARIO1');
    if datm_viagem.qry_viagem_DeadLineCD_RESP_ALTERACAO.AsString <> '' then
      lbl_alteracao.Visible:= true
    else
      lbl_alteracao.Visible:= false;
  end;

end;

procedure Tfrm_viagem.dbg_viagemKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    dbg_viagemDblClick(Sender);
end;

procedure Tfrm_viagem.FormShow(Sender: TObject);
begin
  pnl_btn_ag.Color := clMenuBroker;

  with datm_viagem do
  begin
    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    nr_dias_entre_viagens := qry_param_.FieldByName('NR_DIAS_ENTRE_VIAGENS').AsInteger;
    qry_param_.Close;

    pgctrl_viagem.ActivePage := ts_lista;

    if lCons_OnLine then
    begin
      msk_cd_unid_neg.Text       := co_cd_unid_neg;
      msk_cd_unid_negExit(nil);
      msk_cd_produto.Text        := co_cd_produto;
      msk_cd_produtoExit(nil);
      msk_cd_embarcacao.Text     := co_cd_embarcacao;
      msk_cd_embarcacaoExit(nil);
      msk_cd_embarcacao.TabStop  := False;
      msk_cd_embarcacao.ReadOnly := True;
      msk_cd_embarcacao.Color    := clMenu;
      dbg_viagem.SetFocus;
    end
    else
    begin
      msk_cd_unid_neg.Text       := str_cd_unid_neg;
      msk_cd_unid_negExit(nil);
      msk_cd_produto.Text        := str_cd_produto;
      msk_cd_produtoExit(nil);
      lNaoConsiste               := False;
      pgctrl_viagem.ActivePage   := ts_lista;
      msk_cd_embarcacao.SetFocus;
      qry_lista_.Close;
      qry_lista_.Prepare;
      qry_lista_.Open;
    end;
  end;
end;

procedure Tfrm_viagem.pgctrl_viagemChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_viagem.VerAlt : Boolean;
begin
  with datm_viagem do
  begin
    VerAlt := True;
    if ( ( qry_viagem_.State in [dsEdit] ) and st_modificar ) or
       ( qry_viagem_.State in [dsInsert] ) then
    begin
      if BoxMensagem( 'Cadastro de Viagens foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1 ) then
      begin
        if not Consiste then
        begin
          VerAlt := False;
          Exit;
        end;
        if not Grava then
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

procedure Tfrm_viagem.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_viagem.CodExits;
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_viagem.btn_co_unid_negClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_unidade, frm_unidade );

  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_viagem.btn_co_produtoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_produto, frm_produto );

  with frm_produto do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_viagem.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg_viagem := msk_cd_unid_neg.Text;
end;

procedure Tfrm_viagem.msk_cd_unid_negExit(Sender: TObject);
begin
  If Trim(msk_cd_unid_neg.Text) = '07' then
    msk_cd_unid_neg.Text := '01';

  if cd_unid_neg_viagem = msk_cd_unid_neg.Text then Exit;
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
  Abertura;
end;

procedure Tfrm_viagem.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg            then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto             then btn_co_produtoClick(nil);
    if Sender = msk_cd_embarcacao          then btn_co_embarcacaoClick(nil);
    if Sender = dbedt_cd_armazem_atracacao then btn_co_armazem_atracacaoClick(nil);
    if Sender = dbedt_cd_local             then btn_co_localClick(nil);

    if Sender = dbedt_cd_agente            then btn_agenteClick(btn_agente);
  end;
end;

procedure Tfrm_viagem.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto_viagem := msk_cd_produto.Text;
end;

procedure Tfrm_viagem.msk_cd_produtoExit(Sender: TObject);
begin
  if cd_produto_viagem = msk_cd_produto.Text then Exit;
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
  Abertura;
end;

function Tfrm_viagem.VerUnidNegProduto : Boolean;
begin
  with datm_viagem do
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    VerUnidNegProduto := True;
    if ( Trim( msk_cd_unid_neg.Text ) <> '') and ( Trim( msk_cd_produto.Text ) <> '' ) then
    begin
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_habilitacao_.Prepare;
      qry_usuario_habilitacao_.Open;
      if Not qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([Trim( msk_cd_unid_neg.Text ), Trim( msk_cd_produto.Text )]), [loCaseInsensitive]) then
      begin
        BoxMensagem( 'Unidade x Produto não encontrado ou sem habilitação para o usuário!', 2 );
        edt_nm_unid_neg.Text := '';
        edt_nm_produto.Text  := '';
        VerUnidNegProduto    := False;
      end
      else
      begin
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;
        edt_nm_unid_neg.Text := qry_usuario_habilitacao_.FieldByName('AP_UNID_NEG').AsString;
        edt_nm_produto.Text  := qry_usuario_habilitacao_.FieldByName('AP_PRODUTO').AsString;
        Screen.Cursor := crDefault;
        Application.ProcessMessages;
      end;
    end;

    Screen.Cursor := crDefault;
    Application.ProcessMessages;
  end;
end;

procedure Tfrm_viagem.Abertura;
begin
  with datm_viagem do
  begin
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and
       ( Trim( msk_cd_produto.Text ) <> '' ) and
       ( Trim( msk_cd_embarcacao.Text ) <> '' ) then
    begin
      qry_lista_.Close;
      qry_lista_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_lista_.ParamByName('CD_PRODUTO').AsString := Trim( msk_cd_produto.Text );
      qry_lista_.ParamByName('CD_EMBARCACAO').AsString := Trim( msk_cd_embarcacao.Text );
      qry_lista_.Close;
      qry_lista_.Prepare;
      qry_lista_.Open;
    end;
  end;
end;

procedure Tfrm_viagem.msk_cd_embarcacaoEnter(Sender: TObject);
begin
  cd_embarcacao_viagem := msk_cd_embarcacao.Text;
end;

procedure Tfrm_viagem.msk_cd_embarcacaoExit(Sender: TObject);
begin
  if cd_embarcacao_viagem = msk_cd_embarcacao.Text then
    Exit;
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
  Abertura;
end;

procedure Tfrm_viagem.btn_co_embarcacaoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_emb, frm_emb );

  with frm_emb do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_embarcacao.Text := frm_emb.Cons_OnLine_Texto;
  msk_cd_embarcacaoExit(nil);
end;

procedure Tfrm_viagem.dbedt_cd_armazem_atracacaoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_viagem.dbedt_dt_esperadaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_viagem.btn_co_armazem_atracacaoClick(Sender: TObject);
begin
  with datm_viagem do
  begin
    Application.CreateForm( Tfrm_amz, frm_amz );
    with frm_amz do
    begin
      Cons_OnLine := qry_viagem_CD_ARMAZEM_ATRACACAO;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_viagem_.State in [dsEdit] ) then
        qry_viagem_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;
    dbedt_cd_armazem_atracacaoExit(nil);
  end;
end;

procedure Tfrm_viagem.dbedt_dt_esperadaChange(Sender: TObject);
begin
  if ( datm_viagem.qry_viagem_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi( False, True, True, False );
    vAlterouData := True;
  end;

  if dbedt_dt_esperada.Text = '  /  /    ' then
    if datm_viagem.qry_viagem_.State in [dsInsert, dsEdit] then
      datm_viagem.qry_viagem_DT_ESPERADA.AsVariant := Null;
end;

procedure Tfrm_viagem.dbedt_dt_entChange(Sender: TObject);
begin
  if ( datm_viagem.qry_viagem_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi( False, True, True, False );
    vAlterouData := True;
  end;
  if dbedt_dt_ent.Text = '  /  /    ' then
    if datm_viagem.qry_viagem_.State in [dsInsert, dsEdit] then
      datm_viagem.qry_viagem_DT_ENT.AsVariant := Null;
end;

procedure Tfrm_viagem.btn_co_localClick(Sender: TObject);
begin
  with datm_viagem do
  begin
    Application.CreateForm( Tfrm_local_embarque, frm_local_embarque );
    with frm_local_embarque do
    begin
      Cons_OnLine := qry_viagem_CD_LOCAL;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_viagem_.State in [dsEdit] ) then
         qry_viagem_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;
    dbedt_cd_localExit(nil);
  end;
end;

procedure Tfrm_viagem.dbedt_cd_localExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_viagem.dbedt_dt_entExit(Sender: TObject);
begin
  if dbedt_dt_ent.Text = '  /  /    ' then
    Exit;
end;

procedure Tfrm_viagem.dbedt_deadline_blChange(Sender: TObject);
begin
  if ( datm_viagem.qry_viagem_DeadLine.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi( False, True, True, False );
    vAlterouData := True;
  end;
  if dbedt_deadline_bl.Text = '  /  /    ' then
    if datm_viagem.qry_viagem_DeadLine.State in [dsInsert, dsEdit] then
      datm_viagem.qry_viagem_DeadLineDT_DEADLINE_BL.AsVariant := Null;
end;

procedure Tfrm_viagem.dbedt_deadline_cargaChange(Sender: TObject);
begin
  if ( datm_viagem.qry_viagem_DeadLine.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi( False, True, True, False );
    vAlterouData := True;
  end;
  if dbedt_deadline_carga.Text = '  /  /    ' then
    if datm_viagem.qry_viagem_DeadLine.State in [dsInsert, dsEdit] then
      datm_viagem.qry_viagem_DeadLineDT_DEADLINE_CARGA.AsVariant := Null;
end;

procedure Tfrm_viagem.dbedt_transit_timeChange(Sender: TObject);
begin
  if ( datm_viagem.qry_viagem_.State in [ dsInsert, dsEdit ] ) then
    btn_mi( False, True, True, False );
end;

procedure Tfrm_viagem.dbedtAbreGateChange(Sender: TObject);
begin
  if ( datm_viagem.qry_viagem_DeadLine.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi( False, True, True, False );
    vAlterouData := True;
  end;
  if dbedtAbreGate.Text = '  /  /    ' then
    if datm_viagem.qry_viagem_DeadLine.State in [dsInsert, dsEdit] then
      datm_viagem.qry_viagem_DeadLineDT_ABERTURA_GATE.AsVariant := Null;
end;

procedure Tfrm_viagem.AtzFollowUp;
var
  vSQL,vResp: String;
  vHora: TDateTime;
  vDT_ABERTURA_GATE, vDT_DEADLINE_CARTA_TEMP: TDateTime;
begin
  vResp:= str_cd_usuario;
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT NR_PROCESSO');
    SQL.Add('FROM TPROCESSO (NOLOCK) ');
    SQL.Add('WHERE CD_UNID_NEG   = "' + datm_viagem.qry_viagem_CD_UNID_NEG.AsString + '"');
    SQL.Add('  AND CD_PRODUTO    = "' + datm_viagem.qry_viagem_CD_PRODUTO.AsString + '"');
    SQL.Add('  AND CD_EMBARCACAO = "' + datm_viagem.qry_viagem_CD_EMBARCACAO.AsString + '"');
    SQL.Add('  AND NR_VIAGEM     = "' + datm_viagem.qry_viagem_NR_VIAGEM.AsString + '"');
    if (datm_viagem.qry_viagem_CD_PRODUTO.AsString = '02') and (not datm_viagem.qry_viagem_DeadLine.Eof) then
    begin
      SQL.Add('  AND TP_ESTUFAGEM  = "' + datm_viagem.qry_viagem_DeadLineTP_ESTUFAGEM.AsString + '"');
      SQL.Add('  AND CD_AGENTE     = "' + datm_viagem.qry_viagem_DeadLineCD_AGENTE.AsString + '"');
    end; // IF incluído para exportação apenas - Michel - 28/09/2010
    Open;

    if datm_viagem.qry_viagem_DeadLineDT_ABERTURA_GATE.AsDateTime > 0 then
    begin
      vDT_ABERTURA_GATE := datm_viagem.qry_viagem_DeadLineDT_ABERTURA_GATE.AsDateTime;
      if TryStrToTime(datm_viagem.qry_viagem_DeadLineHR_ABERTURA_GATE.AsString, vHora) then
        vDT_ABERTURA_GATE := vDT_ABERTURA_GATE + vHora;
    end
    else
    begin
      vDT_ABERTURA_GATE := datm_viagem.qry_viagem_DT_ABERTURA_GATE.AsDateTime;
      if TryStrToTime(datm_viagem.qry_viagem_HR_ABERTURA_GATE.AsString, vHora) then
        vDT_ABERTURA_GATE := vDT_ABERTURA_GATE + vHora;
    end;

    if datm_viagem.qry_viagem_DeadLineDT_DEADLINE_CARTA_TEMP.AsDateTime > 0 then
    begin
      vDT_DEADLINE_CARTA_TEMP := datm_viagem.qry_viagem_DeadLineDT_DEADLINE_CARTA_TEMP.AsDateTime;
      if TryStrToTime(datm_viagem.qry_viagem_DeadLineHR_DEADLINE_CARTA_TEMP.AsString, vHora) then
        vDT_DEADLINE_CARTA_TEMP := vDT_DEADLINE_CARTA_TEMP + vHora;
    end
    else
    begin
      vDT_DEADLINE_CARTA_TEMP := datm_viagem.qry_viagem_DT_DEADLINE_CARTA_TEMP.AsDateTime;
      if TryStrToTime(datm_viagem.qry_viagem_HR_DEADLINE_CARTA_TEMP.AsString, vHora) then
        vDT_DEADLINE_CARTA_TEMP := vDT_DEADLINE_CARTA_TEMP + vHora;
    end;

    if not IsEmpty then
    begin
      pnlAguarde.Visible := True;
      pb1.Max := RecordCount;
      pb1.Position := 0;
      Application.ProcessMessages;

      if vDT_ABERTURA_GATE > 0 then
      begin
        vSQL := ' UPDATE F ' +
                ' SET DT_REALIZACAO      = CONVERT(DATETIME, ''' + DateToStr(vDT_ABERTURA_GATE) + ''', 103) + ' +
                '   CASE ISNULL(CS.IN_HORA_EVENTOS, 0) ' +
                '       WHEN 0 THEN 0 ' +
                '   ELSE ';

        // Incluir a hora - Michel - 06/04/2010
        if TimeOf(vDT_ABERTURA_GATE) > 0 then
        begin
          vSQL := vSQL + ' CONVERT(DATETIME, ''' + TimeToStr(vDT_ABERTURA_GATE) + ''', 108) '
        end
        else
          begin
            if vDT_ABERTURA_GATE = 0 then
            begin
              vSQL := vSQL + ' CONVERT(DATETIME, CONVERT(VARCHAR, null, 108), 108) ' ;
              vResp:= '';
            end
            else
             vSQL := vSQL + ' CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 108), 108) ';
          end;


        vSQL := vSQL +
                '   END, ' +
                '     CD_RESP_REALIZACAO = ''' + vResp + ''' ' +
                ' FROM TFOLLOWUP F (NOLOCK) INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = F.NR_PROCESSO ' +
                '    LEFT JOIN TCLIENTE_SERVICO CS (NOLOCK) ON CS.CD_SERVICO  = P.CD_SERVICO ' +
                '                                  AND CS.CD_CLIENTE  = P.CD_CLIENTE ' +
                '                                  AND CS.CD_UNID_NEG = P.CD_UNID_NEG ' +
                '                                  AND CS.CD_PRODUTO  = P.CD_PRODUTO ' +
                ' WHERE DT_REALIZACAO IS NULL ' +
                '   AND F.CD_EVENTO     = ''528'' ' +
                '   AND P.CD_UNID_NEG   = ''' + datm_viagem.qry_viagem_CD_UNID_NEG.AsString + ''' ' +
                '   AND P.CD_PRODUTO    = ''' + datm_viagem.qry_viagem_CD_PRODUTO.AsString + ''' ' +
                '   AND P.CD_EMBARCACAO = ''' + datm_viagem.qry_viagem_CD_EMBARCACAO.AsString + ''' ' +
                '   AND P.NR_VIAGEM     = ''' + datm_viagem.qry_viagem_NR_VIAGEM.AsString + ''' ';
        FastExecSQL(vSQL);
      end;

      while not Eof do
      begin
        // Atualiza apenas se houver data - Michel - 21/05/2009
        if vDT_DEADLINE_CARTA_TEMP >= 0 then
        begin
          {vSQL := ' UPDATE TFOLLOWUP ' +
                  ' SET DT_REALIZACAO = CONVERT(DATETIME,''' + DateToStr(datm_viagem.qry_viagem_DT_DEADLINE_CARTA_TEMP.AsDateTime) + ''', 103) + ';
          if TryStrToTime(datm_viagem.qry_viagem_HR_DEADLINE_CARTA_TEMP.AsString, vHora) then
            vSQL := vSQL + 'CONVERT(DATETIME, ''' + TimeToStr(vHora) + ''', 108)'
          else
            vSQL := vSQL + 'CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 108), 108)';
          vSQL := vSQL + ' WHERE CD_EVENTO = 562 AND NR_PROCESSO = ''' + Fields[0].ASString + ''' ';}

          // Comentado acima para utilizar a hora apenas quando estiver cadastrado no serviço do cliente - Michel - 13/05/2010

          vSQL := ' UPDATE F ' +
                ' SET DT_REALIZACAO      = CONVERT(DATETIME, ''' + DateToStr(vDT_DEADLINE_CARTA_TEMP) + ''', 103) + ' +
                '   CASE ISNULL(CS.IN_HORA_EVENTOS, 0) ' +
                '       WHEN 0 THEN 0 ' +
                '   ELSE ';

          // Incluir a hora - Michel - 06/04/2010
          if TimeOf(vDT_DEADLINE_CARTA_TEMP) > 0 then
          begin
            vSQL := vSQL + ' CONVERT(DATETIME, ''' + TimeToStr(vDT_DEADLINE_CARTA_TEMP) + ''', 108) ';
          end
          else
          begin
            if vDT_DEADLINE_CARTA_TEMP = 0 then
            begin
              vSQL := vSQL + ' CONVERT(DATETIME, CONVERT(VARCHAR, null, 108), 108) ' ;
              vResp:= '';
            end
            else
             vSQL := vSQL + ' CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 108), 108) ';
          end;

          vSQL := vSQL +
                  '   END, ' +
                  '     CD_RESP_REALIZACAO = ''' + vResp + ''' ' +
                  ' FROM TFOLLOWUP F (NOLOCK) INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = F.NR_PROCESSO ' +
                  '    LEFT JOIN TCLIENTE_SERVICO CS (NOLOCK) ON CS.CD_SERVICO  = P.CD_SERVICO ' +
                  '                                  AND CS.CD_CLIENTE  = P.CD_CLIENTE ' +
                  '                                  AND CS.CD_UNID_NEG = P.CD_UNID_NEG ' +
                  '                                  AND CS.CD_PRODUTO  = P.CD_PRODUTO ' +
                  ' WHERE F.CD_EVENTO     = ''562'' ' +
                  '   AND P.NR_PROCESSO   = ''' + Fields[0].ASString + ''' ';

          FastExecSQL(vSQL);
        end;

        // Atualizar o evento 528 (Abertura do Gate) - Michel - 19/11/2009
        if vDT_ABERTURA_GATE > 0 then
        begin
          {vSQL := ' UPDATE TFOLLOWUP ' +
                  ' SET DT_REALIZACAO = ISNULL(DT_REALIZACAO, CONVERT(DATETIME,''' + datm_viagem.qry_viagem_DT_ABERTURA_GATE.AsString + ''', 103)) + ';
          if TryStrToTime(datm_viagem.qry_viagem_HR_ABERTURA_GATE.AsString, vHora) then
            vSQL := vSQL + 'CONVERT(DATETIME, ''' + TimeToStr(vHora) + ''', 108)'
          else
            vSQL := vSQL + 'CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 108), 108)';
          vSQL := vSQL + ' WHERE CD_EVENTO = 528 AND NR_PROCESSO = ''' + Fields[0].ASString + ''' ';}

          // Comentado acima para utilizar a hora apenas quando estiver cadastrado no serviço do cliente - Michel - 13/05/2010

          vSQL := ' UPDATE F ' +
                ' SET DT_REALIZACAO      = CONVERT(DATETIME, ''' + DateToStr(vDT_ABERTURA_GATE) + ''', 103) + ' +
                '   CASE ISNULL(CS.IN_HORA_EVENTOS, 0) ' +
                '       WHEN 0 THEN 0 ' +
                '   ELSE ';

          // Incluir a hora - Michel - 06/04/2010
          if TimeOf(vDT_ABERTURA_GATE) > 0 then
            vSQL := vSQL + ' CONVERT(DATETIME, ''' + TimeToStr(vDT_ABERTURA_GATE) + ''', 108) '
          else
          begin
            if vDT_ABERTURA_GATE = 0 then
            begin
              vSQL := vSQL + ' CONVERT(DATETIME, CONVERT(VARCHAR, null, 108), 108) ' ;
              vResp:= '';
            end
            else
             vSQL := vSQL + ' CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 108), 108) ';
          end;

          vSQL := vSQL +
                  '   END, ' +
                  '     CD_RESP_REALIZACAO = ''' + vResp + ''' ' +
                  ' FROM TFOLLOWUP F (NOLOCK) INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = F.NR_PROCESSO ' +
                  '    LEFT JOIN TCLIENTE_SERVICO CS (NOLOCK) ON CS.CD_SERVICO  = P.CD_SERVICO ' +
                  '                                  AND CS.CD_CLIENTE  = P.CD_CLIENTE ' +
                  '                                  AND CS.CD_UNID_NEG = P.CD_UNID_NEG ' +
                  '                                  AND CS.CD_PRODUTO  = P.CD_PRODUTO ' +
                  ' WHERE F.CD_EVENTO     = ''528'' ' +
                  '   AND P.NR_PROCESSO   = ''' + Fields[0].ASString + ''' ';

          FastExecSQL(vSQL);
        end;
        
        FastExecSQL(' EXEC sp_atz_followup "' + Fields[0].ASString + '" ');
        pb1.StepIt;
        Application.ProcessMessages;
        Next;
      end;
      pnlAguarde.Visible := False;
    end;
    Free;
  end;
end;

procedure Tfrm_viagem.dbedtPrevOrigemDestinoChange(Sender: TObject);
begin
  if ( datm_viagem.qry_viagem_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi( False, True, True, False );
    vAlterouData := True;
  end;
  if dbedtPrevOrigemDestino.Text = '  /  /    ' then
    if datm_viagem.qry_viagem_.State in [dsInsert, dsEdit] then
      datm_viagem.qry_viagem_DT_PREVISTA_ORIGEM_DESTINO.AsVariant := Null;
end;

procedure Tfrm_viagem.dbedt_deadline_imoChange(Sender: TObject);
begin
  if ( datm_viagem.qry_viagem_DeadLine.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi( False, True, True, False );
    vAlterouData := True;
   end;
  if dbedt_deadline_imo.Text = '  /  /    ' then
    if datm_viagem.qry_viagem_DeadLine.State in [dsInsert, dsEdit] then
      datm_viagem.qry_viagem_DeadLineDT_DEADLINE_IMO.AsVariant := Null;
end;

procedure Tfrm_viagem.DBEdit3Exit(Sender: TObject);
begin
  DBEdit3.Text := FormatDateTime('hh:mm:ss',StrToDateTime(DBEdit3.Text))
end;

procedure Tfrm_viagem.btn_agenteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_viagem.qry_viagem_DeadLine) then
      Exit;
    datm_viagem.qry_viagem_DeadLineCD_AGENTE.AsString := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE'],['Código','Descrição'],'CD_AGENTE',frm_main.mi_agentes, 1, dbedt_cd_agente.Text)
  end
  else
    dbedt_nm_agente.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente.Text,'NM_AGENTE');
  if ( pgctrl_viagem.ActivePage = ts_DeadLines ) then
  begin
    lbl_usuario.Caption:= ConsultaLookUPSQL('SELECT isnull(AP_USUARIO,'''') AP_USUARIO1 FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = '''+ datm_viagem.qry_viagem_DeadLineCD_RESP_ALTERACAO.AsString +''' ','AP_USUARIO1');
    if datm_viagem.qry_viagem_DeadLineCD_RESP_ALTERACAO.AsString <> '' then
      lbl_alteracao.Visible:= true
    else
      lbl_alteracao.Visible:= false;
  end;

end;

procedure Tfrm_viagem.rxdbcbEstufagemChange(Sender: TObject);
begin
  if ( datm_viagem.qry_viagem_DeadLine.State in [ dsInsert, dsEdit ] ) then
  begin
    vAlterouData := True;
    btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_viagem.dbedt_cd_agenteExit(Sender: TObject);
begin
  ValidCodigo(dbedt_cd_agente);
end;

function Tfrm_viagem.ExisteProcessoVinculado : Boolean;
//Rodrigo Capra - 25/11/2008  -   06575/08
begin
  with TQuery.Create(Application)do
  begin
    DatabaseName := 'DBBROKER';
    Sql.Add('select count(*) Cont from TPROCESSO (NOLOCK) ');
    Sql.Add('where');
    Sql.Add('  CD_UNID_NEG   =:CD_UNID_NEG   and CD_PRODUTO =:CD_PRODUTO and');
    Sql.Add('  CD_EMBARCACAO =:CD_EMBARCACAO and NR_VIAGEM  =:NR_VIAGEM');
    if pgctrl_viagem.ActivePage = ts_DeadLines then
    begin
      Sql.Add('AND CD_AGENTE =:CD_AGENTE and TP_ESTUFAGEM =:TP_ESTUFAGEM');
      ParamByName('CD_AGENTE').AsString    := datm_viagem.qry_viagem_DeadLineCD_AGENTE.AsString;
      ParamByName('TP_ESTUFAGEM').AsString := datm_viagem.qry_viagem_DeadLineTP_ESTUFAGEM.AsString
    end;
    ParamByName('CD_UNID_NEG').AsString   := datm_viagem.qry_lista_CD_UNID_NEG.AsString;
    ParamByName('CD_PRODUTO').AsString    := datm_viagem.qry_lista_CD_PRODUTO.AsString;
    ParamByName('CD_EMBARCACAO').AsString := datm_viagem.qry_lista_CD_EMBARCACAO.AsString;
    ParamByName('NR_VIAGEM').AsString     := datm_viagem.qry_lista_NR_VIAGEM.AsString;
    Open;
    Result := FieldByName('Cont').AsInteger > 0;
    Free;
  end;
end;

procedure Tfrm_viagem.dbedtDeadLineTempChange(Sender: TObject);
begin
  if ( datm_viagem.qry_viagem_DeadLine.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi( False, True, True, False );
    vAlterouData := True;
  end;
  if dbedtDeadLineTemp.Text = '  /  /    ' then
    if datm_viagem.qry_viagem_DeadLine.State in [dsInsert, dsEdit] then
      datm_viagem.qry_viagem_DeadLineDT_DEADLINE_CARTA_TEMP.AsVariant := Null;
end;

procedure Tfrm_viagem.dbedt_hr_abertura_gateChange(Sender: TObject);
begin
  if ( datm_viagem.qry_viagem_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi( False, True, True, False );
    vAlterouData := True;
  end;

end;

end.
