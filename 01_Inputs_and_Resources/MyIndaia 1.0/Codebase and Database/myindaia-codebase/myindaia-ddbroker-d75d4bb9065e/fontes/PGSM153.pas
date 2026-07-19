unit PGSM153;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls;

type
  Tfrm_arm_rec = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_armrec: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_periodo: TLabel;
    lbl_cd_recinto: TLabel;
    dbedt_qt_dias: TDBEdit;
    dbedt_cd_recinto: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    ts_periodos: TTabSheet;
    pnl_periodo: TPanel;
    dbedt_nm_recinto: TEdit;
    btn_co_recinto: TSpeedButton;
    dbchbx_sabdom: TDBCheckBox;
    dbchbx_feriado: TDBCheckBox;
    dbg_normal: TDBGrid;
    Label1: TLabel;
    Panel1: TPanel;
    Label109: TLabel;
    dbedt_nr_periodo: TDBEdit;
    Label2: TLabel;
    dbedt_nr_dias: TDBEdit;
    Label3: TLabel;
    dbedt_nr_perc: TDBEdit;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure dbedt_qt_diasChange(Sender: TObject);
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
    procedure pgctrl_armrecChange(Sender: TObject);
    procedure pgctrl_armrecChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_recintoChange(Sender: TObject);
    procedure btn_co_recintoClick(Sender: TObject);
    procedure dbedt_cd_recintoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_recintoExit(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    lRecDesp, lRec : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_arm_rec: Tfrm_arm_rec;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM154, ConsOnLineEx;

procedure Tfrm_arm_rec.dbedt_qt_diasChange(Sender: TObject);
begin
  if ( datm_arm_rec.qry_arm_rec_.State in [ dsInsert, dsEdit ] ) then
     btn_Mi( False, True, True, False );
end;

procedure Tfrm_arm_rec.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  lRecDesp     := False;
  lRec         := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  Application.CreateForm( Tdatm_arm_rec, datm_arm_rec );

  with datm_arm_rec do
  begin
    ds_arm_rec.AutoEdit := st_modificar;
    qry_arm_rec_.Prepare;
    qry_arm_rec_.Open;

    a_str_indices[0] := 'CD_RECINTO';
    a_str_indices[1] := 'LookNmRecinto';

    With cb_ordem do
    begin
      Clear;
      Items.Add('Código');
      Items.Add('Recinto');
      ItemIndex := 1;
    end;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_arm_rec.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_armrec.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_arm_rec do
  begin
    qry_arm_rec_.Close;
    qry_arm_rec_.Prepare;
    qry_arm_rec_.Open;

    if qry_arm_rec_.RecordCount > 0 then
    begin
      btn_excluir.Enabled := True;
      mi_excluir.Enabled  := True;
    end
    else
    begin
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := False;
    end;
  end;

  dbchbx_sabdom.Checked  := False;
  dbchbx_feriado.Checked := False;

end;

procedure Tfrm_arm_rec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_arm_rec do
    begin
      qry_arm_rec_.Close;
      qry_arm_rec_per_.Close;
      qry_recinto_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_arm_rec.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_arm_rec.qry_arm_rec_CD_RECINTO.AsString;
    except
      try
        Cons_OnLine_Texto := datm_arm_rec.qry_arm_rec_CD_RECINTO.AsString;
      except
        BoxMensagem('Não consegui retornar Código do Recinto Alfandegado !', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_arm_rec.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_arm_rec.btn_incluirClick(Sender: TObject);
var
  nNum, Code : Integer;
begin

  btn_Mi( False, True, True, False );

  If pgctrl_armrec.ActivePage <> ts_periodos then
  begin
    with datm_arm_rec do
    begin
      qry_arm_rec_.DisableControls;
      qry_arm_rec_.Cancel;
      qry_arm_rec_.Append;
      qry_arm_rec_.EnableControls;
    end;

    pgctrl_armrec.ActivePage := ts_dados_basicos;

    dbchbx_sabdom.Checked  := False;
    dbchbx_feriado.Checked := False;

    ts_dados_basicos.Enabled := True;
    dbedt_cd_recinto.SetFocus;
  end
  else
  begin

    Val( dbedt_qt_dias.Text, nNum, Code );
    If nNum <> 0 then
    begin
      BoxMensagem( 'Dias p/ Período não pode estar preenchido', 3 );

      Btn_mi( True, False, False, True );

      ts_periodos.Enabled := True;
      If datm_arm_rec.qry_arm_rec_per_.RecordCount = 0 then
      begin
        ts_periodos.Enabled := False;
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end;
      exit;
    end;

    ts_periodos.Enabled := True;

    with datm_arm_rec do
    begin
      qry_arm_rec_per_.DisableControls;
      qry_arm_rec_per_.Cancel;
      qry_arm_rec_per_.Append;
      qry_arm_rec_per_.EnableControls;

      dbedt_nr_periodo.SetFocus;
    end;
  end;

end;

procedure Tfrm_arm_rec.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_arm_rec.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_arm_rec.Cancelar;
begin

  btn_mi( True, False, False, True );

  try
    if (datm_arm_rec.qry_arm_rec_.State in [dsInsert, dsEdit]) then
    begin
      datm_arm_rec.qry_arm_rec_.Cancel;

      pgctrl_armrec.ActivePage := ts_lista;

      if datm_arm_rec.qry_arm_rec_IN_SABDOM.AsString = '1' then
         dbchbx_sabdom.Checked  := True
      else
         dbchbx_sabdom.Checked  := False;

      if datm_arm_rec.qry_arm_rec_IN_FERIADO.AsString = '1' then
         dbchbx_feriado.Checked  := True
      else
         dbchbx_feriado.Checked  := False;

      ts_periodos.Enabled := True;
      If datm_arm_rec.qry_arm_rec_.RecordCount = 0 then
      begin
        ts_periodos.Enabled := False;
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end;

      pgctrl_armrec.SetFocus;
    end;

    if (datm_arm_rec.qry_arm_rec_per_.State in [dsInsert, dsEdit]) then
    begin
      datm_arm_rec.qry_arm_rec_per_.Cancel;
      pgctrl_armrec.ActivePage := ts_periodos;
      pgctrl_armrec.SetFocus;

      ts_periodos.Enabled := True;
      If datm_arm_rec.qry_arm_rec_per_.RecordCount = 0 then
      begin
        ts_periodos.Enabled := False;
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end;
    end;

  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;

end;

procedure Tfrm_arm_rec.btn_excluirClick(Sender: TObject);
begin

  btn_mi( True, False, False, True );

  If pgctrl_armrec.ActivePage <> ts_periodos then
  begin

    datm_arm_rec.qry_arm_rec_per_.Close;
    datm_arm_rec.qry_arm_rec_per_.ParamByName( 'CD_RECINTO' ).AsString := datm_arm_rec.qry_arm_rec_CD_RECINTO.AsString;
    datm_arm_rec.qry_arm_rec_per_.Prepare;
    datm_arm_rec.qry_arm_rec_per_.Open;
    If datm_arm_rec.qry_arm_rec_per_.RecordCount > 0 then
    begin
      BoxMensagem( 'Recinto Alfandegado não pode ser excluído. Apague primeiro os períodos ! ', 3 );
      exit;
    end;

    if BoxMensagem( 'Este Recinto Alfandegado será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_arm_rec.qry_arm_rec_.Delete;
      datm_main.db_broker.Commit;

      if datm_arm_rec.qry_arm_rec_.RecordCount > 0 then
      begin
        btn_excluir.Enabled := True;
        mi_excluir.Enabled  := True;
      end
      else
      begin
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end;

    except
      on E: Exception do
      begin
        datm_arm_rec.qry_arm_rec_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_armrec.ActivePage := ts_lista;

  end
  else
  begin

    if BoxMensagem( 'Este Período será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_arm_rec.qry_arm_rec_per_.Delete;
      datm_main.db_broker.Commit;

      if datm_arm_rec.qry_arm_rec_.RecordCount > 0 then
      begin
        btn_excluir.Enabled := True;
        mi_excluir.Enabled  := True;
      end
      else
      begin
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end;

    except
      on E: Exception do
      begin
        datm_arm_rec.qry_arm_rec_per_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_armrec.ActivePage := ts_periodos;
  end;

end;

procedure Tfrm_arm_rec.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_arm_rec.edt_chaveChange(Sender: TObject);
var Book : TBookMark;
begin
  if cb_ordem.ItemIndex = 0 then Localiza(datm_arm_rec.qry_arm_rec_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
  else
  begin
     if Length( edt_chave.text ) <> 0 then
     begin
      try
        with datm_arm_rec do
        begin
          Book := qry_arm_rec_.GetBookmark;
          qry_arm_rec_.First;
          while not achou_( edt_chave.Text, qry_arm_rec_CalcNmRecinto.AsString ) do
          begin
             if ( not achou_( edt_chave.Text, qry_arm_rec_CalcNmRecinto.AsString )) and ( qry_arm_rec_.EOF ) then
             begin
               messageDlg('Registro não encontrado.',MtWarning,[MbOk],0);
               qry_arm_rec_.First;
               qry_arm_rec_.GotoBookmark( Book );
               qry_arm_rec_.FreeBookmark( Book );
               Break;
             end
             else qry_arm_rec_.Next;
          end;
        end;
      except
      end;
     end
     else datm_arm_rec.qry_arm_rec_.First; 
  end;
end;

procedure Tfrm_arm_rec.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_arm_rec.qry_arm_rec_CD_RECINTO.AsString;

  edt_chave.Text := '';
  datm_arm_rec.qry_arm_rec_.Close;
  datm_arm_rec.qry_arm_rec_.Open;
  Localiza(datm_arm_rec.qry_arm_rec_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;

end;


function Tfrm_arm_rec.Consiste : Boolean;
begin
  Consiste := True;

  If (pgctrl_armrec.ActivePage <> ts_periodos) then
  begin
    if dbedt_cd_recinto.text = '' then
    begin
      BoxMensagem( 'Código do Recinto Alfandegado não informado !', 3 );
      pgctrl_armrec.ActivePage := ts_dados_basicos;
      dbedt_cd_recinto.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dbedt_nm_recinto.text = '' then
    begin
      BoxMensagem('Código do Recinto Alfandegado inválido!',2);
      pgctrl_armrec.ActivePage := ts_dados_basicos;
      dbedt_cd_recinto.SetFocus;
      Consiste := False;
      Exit;
    end;
  end
  else
  begin

    if dbedt_nr_periodo.Text = '' then
    begin
      BoxMensagem('Período não informado !',2);
      pgctrl_armrec.ActivePage := ts_periodos;
      dbedt_nr_periodo.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dbedt_nr_dias.Text = '' then
    begin
      BoxMensagem('Total de Dias não informado !',2);
      pgctrl_armrec.ActivePage := ts_periodos;
      dbedt_nr_dias.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dbedt_nr_perc.Text = '' then
    begin
      BoxMensagem('Percentual não informado !',2);
      pgctrl_armrec.ActivePage := ts_periodos;
      dbedt_nr_perc.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

end;

function Tfrm_arm_rec.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;

    with datm_arm_rec do
    begin

      If pgctrl_armrec.ActivePage <> ts_periodos then
      begin
        If ( qry_arm_rec_.State in [dsInsert, dsEdit] ) then
        begin
          qry_arm_rec_.Post;
          Pesquisa := qry_arm_rec_CD_RECINTO.AsString;
          qry_arm_rec_.Close;
          qry_arm_rec_.Prepare;
          qry_arm_rec_.Open;
          Localiza( qry_arm_rec_, Pesquisa, a_str_indices[0] );
        end;
      end
      else
      begin
        If ( qry_arm_rec_per_.State in [dsInsert, dsEdit] ) then
        begin
          qry_arm_rec_per_CD_RECINTO.AsString := qry_arm_rec_CD_RECINTO.AsString;
          qry_arm_rec_per_.Post;
          Pesquisa := qry_arm_rec_per_CD_RECINTO.AsString;
          qry_arm_rec_per_.Close;
          qry_arm_rec_per_.Prepare;
          qry_arm_rec_per_.Open;
          Localiza(qry_arm_rec_per_, Pesquisa, a_str_indices[0] );
        end;
      end;
    end;

    datm_main.db_broker.Commit;
    Grava := True;

  except
    on E: Exception do
    begin
      datm_arm_rec.qry_arm_rec_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;

  Btn_Mi(st_incluir, False, False, st_excluir );

end;

procedure Tfrm_arm_rec.pgctrl_armrecChange(Sender: TObject);
begin

  with datm_arm_rec do
  begin

    if (pgctrl_armrec.ActivePage = ts_lista ) then
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

      ts_dados_basicos.Enabled := True;

      If qry_arm_rec_.RecordCount = 0 then
      begin
        ts_dados_basicos.Enabled := False;
        ts_periodos.Enabled      := False;
        btn_excluir.Enabled      := False;
        mi_excluir.Enabled       := False;

      end
      else
      begin
        btn_excluir.Enabled := True;
        mi_excluir.Enabled  := True;

        if qry_arm_rec_IN_SABDOM.AsString = '1' then
           dbchbx_sabdom.Checked  := True
        else
           dbchbx_sabdom.Checked  := False;

        if qry_arm_rec_IN_FERIADO.AsString = '1' then
           dbchbx_feriado.Checked  := True
        else
           dbchbx_feriado.Checked  := False;

      end;

      If (pgctrl_armrec.ActivePage = ts_periodos ) then
      begin
        qry_arm_rec_per_.Close;
        qry_arm_rec_per_.ParamByName( 'CD_RECINTO' ).AsString := qry_arm_rec_CD_RECINTO.AsString;
        qry_arm_rec_per_.Prepare;
        qry_arm_rec_per_.Open;
        If qry_arm_rec_per_.RecordCount > 0 then
        begin
          ts_periodos.Enabled := True;
          btn_excluir.Enabled := True;
          mi_excluir.Enabled  := True;
        end
        else
        begin
          ts_periodos.Enabled := False;
          btn_excluir.Enabled := False;
          mi_excluir.Enabled  := False;
        end;
      end;
    end;

  end;

end;

procedure Tfrm_arm_rec.pgctrl_armrecChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;

end;

function Tfrm_arm_rec.VerAlt : Boolean;
var
   valida : boolean;

begin

  VerAlt := True;
  valida := True;

  if ( ( datm_arm_rec.qry_arm_rec_.State in [dsEdit] ) and st_modificar and btn_salvar.Enabled = True) or
     ( datm_arm_rec.qry_arm_rec_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Armazém p/ Recinto foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not Consiste then
      begin
        valida := False;
      end;
      if Not Grava then
      begin
        valida := False;
      end;
    end
    else
      Cancelar;
  end;

  if ( ( datm_arm_rec.qry_arm_rec_per_.State in [dsEdit] ) and st_modificar and btn_salvar.Enabled = True) or
       ( datm_arm_rec.qry_arm_rec_per_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Periodos foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not Consiste then
      begin
        valida := False;
      end;
      if Not Grava then
      begin
        valida := False;
      end;
    end
    else
      Cancelar;
  end;

  If not valida then
  begin
    VerAlt := False;
    Exit;
  end;

end;

procedure Tfrm_arm_rec.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;
  mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;
  mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;
  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;
  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_arm_rec.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_arm_rec.dbedt_cd_recintoChange(Sender: TObject);
begin
  if ( datm_arm_rec.qry_arm_rec_.State in [ dsInsert, dsEdit ] ) then
     btn_Mi( False, True, True, False );
end;


procedure Tfrm_arm_rec.btn_co_recintoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_arm_rec.qry_arm_rec_) then exit;
    datm_arm_rec.qry_arm_rec_CD_RECINTO.AsString := ConsultaOnLineEx('TREC_ALFANDEGADO','Recinto Alfandegado',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil)
  end else
    dbedt_nm_recinto.Text := ConsultaLookUP('TREC_ALFANDEGADO','CODIGO',datm_arm_rec.qry_arm_rec_CD_RECINTO.AsString,'DESCRICAO')
end;

procedure Tfrm_arm_rec.dbedt_cd_recintoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_recinto  then btn_co_recintoClick(nil);
  end;

end;

procedure Tfrm_arm_rec.dbedt_cd_recintoExit(Sender: TObject);
begin
  If ((dbedt_cd_recinto.Text <> '') and (btn_salvar.Enabled = True)) then
     If (datm_arm_rec.qry_arm_rec_.State in [ dsInsert, dsEdit ] ) then
        ValidCodigo( dbedt_cd_recinto );
end;

end.
