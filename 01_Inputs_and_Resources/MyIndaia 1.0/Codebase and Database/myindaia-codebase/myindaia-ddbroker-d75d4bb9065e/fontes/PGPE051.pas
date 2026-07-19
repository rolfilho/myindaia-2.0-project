unit PGPE051;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, DBCtrls,
  Mask, ComCtrls, Funcoes;

type
  Tfrm_exp_carta_cred = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    mi_salvar: TMenuItem;
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
    pgctrl_saque: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    dbg_cadastro: TDBGrid;
    pnl_entrada_de_dados: TPanel;
    mi_cancelar: TMenuItem;
    Label2: TLabel;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    DBMemo1: TDBMemo;
    lbl_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    btn_co_proc_new: TSpeedButton;
    Label1: TLabel;
    DBMemo2: TDBMemo;
    Label3: TLabel;
    DBMemo3: TDBMemo;
    Label4: TLabel;
    DBMemo4: TDBMemo;
    Label5: TLabel;
    DBMemo5: TDBMemo;
    Label6: TLabel;
    DBMemo6: TDBMemo;
    Label7: TLabel;
    DBMemo7: TDBMemo;
    Label8: TLabel;
    DBMemo8: TDBMemo;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    Label14: TLabel;
    DBEdit6: TDBEdit;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    DBMemo9: TDBMemo;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_saqueChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_saqueChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbm_observacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_proc_newClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Abertura;
    procedure Cancelar;
    procedure Habilita_Entrada;
    procedure Desabilita_Entrada;

    procedure ProcCartaCred( lMostra : Boolean );
  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine  : TStringField;
    Cons_OnLine_Texto  : String;
  end;

var
  frm_exp_carta_cred: Tfrm_exp_carta_cred;

implementation

uses GSMLIB, PGPE052, PGGP017, PGGP001, PGSM136, PGSM018, PGGP025;

{$R *.DFM}

procedure Tfrm_exp_carta_cred.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_exp_carta_cred.btn_incluirClick(Sender: TObject);
begin
  with datm_exp_carta_cred do
  begin
    qry_exp_carta_cred_.DisableControls;
    qry_exp_carta_cred_.Cancel;
    qry_exp_carta_cred_.Append;
    qry_exp_carta_cred_.EnableControls;
  end;
  pgctrl_saque.ActivePage := ts_dados_basicos;

  Desabilita_Entrada;

  btn_mi( False, True, True, False );

  ProcCartaCred( True );

  msk_nr_processo.Text := '';

  msk_nr_processo.SetFocus;
end;

procedure Tfrm_exp_carta_cred.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  with datm_exp_carta_cred do
  begin
    qry_exp_carta_cred_.Close;

    Free;

  end;

  Action := caFree;

end;

procedure Tfrm_exp_carta_cred.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module}
  Application.CreateForm( Tdatm_exp_carta_cred, datm_exp_carta_cred );
end;

procedure Tfrm_exp_carta_cred.btn_excluirClick(Sender: TObject);
begin
  with datm_exp_carta_cred do
  begin
    if BoxMensagem( 'Este Processo/Saque será excluído! Confirma exclusão?', 1 ) then
    begin
      try
        datm_main.db_broker.StartTransaction;
        qry_exp_carta_cred_.Delete;
        qry_exp_carta_cred_.ApplyUpdates;
        Abertura;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          qry_exp_carta_cred_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
    if qry_lista_.EOF then
    begin
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := False;
    end;
  end;
  pgctrl_saque.ActivePage := ts_lista;
  pgctrl_saqueChange(nil);
end;

procedure Tfrm_exp_carta_cred.FormShow(Sender: TObject);
begin
  with datm_exp_carta_cred do
  begin
    st_modificar := False;
    st_incluir   := False;
    st_excluir   := False;

    AtribuiDireitos( st_modificar, st_incluir, st_excluir );

    ds_exp_carta_cred.AutoEdit := st_modificar;

    qry_lista_.Close;
    qry_lista_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
    qry_lista_.Prepare;
    qry_lista_.Open;

    a_str_indices[0] := 'NR_PROCESSO';

    with cb_ordem do
    begin
      Clear;
      Items.Add('Processo');
      ItemIndex := 0;
    end;

    btn_incluir.Enabled := st_incluir;
    mi_incluir.Enabled  := st_incluir;
    btn_excluir.Enabled := st_excluir;
    mi_excluir.Enabled  := st_excluir;

    qry_exp_carta_cred_.Close;
    qry_exp_carta_cred_.Prepare;
    qry_exp_carta_cred_.Open;

    pgctrl_saque.ActivePage := ts_lista;
    edt_chave.SetFocus;
    lNaoConsiste := False;

    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    msk_cd_unid_neg.Text := str_cd_unid_neg;
    edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
  end;
end;

procedure Tfrm_exp_carta_cred.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_exp_carta_cred.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_exp_carta_cred.cb_ordemClick(Sender: TObject);
begin
  with datm_exp_carta_cred do
  begin
    Pesquisa := qry_lista_NR_PROCESSO.AsString;

    edt_chave.Text := '';
    qry_lista_.Close;
    qry_lista_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
    qry_lista_.Prepare;
    qry_lista_.Open;
    Localiza( qry_lista_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_exp_carta_cred.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_exp_carta_cred.qry_lista_, Trim( msk_cd_unid_neg.Text ) + '02' + edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

function Tfrm_exp_carta_cred.Consiste : Boolean;
begin
  if datm_exp_carta_cred.qry_exp_carta_cred_.State in [dsEdit, dsInsert] then
  begin
    if Not lNaoConsiste then
    begin
      if msk_nr_processo.Text = '' then
      begin
        BoxMensagem( 'Processo deve ser preenchido!', 2 );
        pgctrl_saque.ActivePage := ts_dados_basicos;
        msk_nr_processo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  Consiste := True;
end;

function Tfrm_exp_carta_cred.Grava : Boolean;
begin
  with datm_exp_carta_cred do
  begin
    Grava := Commit( qry_exp_carta_cred_ );

    Abertura;
  end;

  btn_mi( st_incluir, False, False, st_excluir );

  pgctrl_saque.SetFocus;
end;

function Tfrm_exp_carta_cred.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_exp_carta_cred.qry_exp_carta_cred_.State in [dsEdit] ) and st_modificar ) or
     ( datm_exp_carta_cred.qry_exp_carta_cred_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Tabela de Saque foi alterado.' + #13#10 +
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

procedure Tfrm_exp_carta_cred.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_exp_carta_cred.Cancelar;
begin
  with datm_exp_carta_cred do
  begin
    try
      qry_exp_carta_cred_.CancelUpdates;
      pgctrl_saque.ActivePage := ts_lista;
      Abertura;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_exp_carta_cred.pgctrl_saqueChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_exp_carta_cred.pgctrl_saqueChange(Sender: TObject);
begin
  with datm_exp_carta_cred do
  begin
    if ( pgctrl_saque.ActivePage = ts_lista ) then
    begin
      dbnvg.Enabled := True;
      edt_chave.Enabled := True;
      cb_ordem.Enabled := True;
      ProcCartaCred( True );
      btn_mi( st_incluir, False, False, ( ( Not ( qry_lista_NR_PROCESSO.AsString = '' ) ) and st_excluir ) );
    end
    else
    begin
      msk_nr_processo.Text := qry_lista_CalcNrProcesso.AsString;
      str_nr_processo      := qry_lista_NR_PROCESSO.AsString;
      if Not ( qry_exp_carta_cred_.FieldByName('NR_PROCESSO').AsString = '' ) then
      begin
        Habilita_Entrada;

        dbnvg.Enabled           := False;
        edt_chave.Enabled       := False;
        cb_ordem.Enabled        := False;

        btn_mi( st_incluir, False, False, st_excluir );

        ProcCartaCred( False );
      end
      else
        Desabilita_Entrada;
    end;
  end;
end;

procedure Tfrm_exp_carta_cred.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then close;
end;

procedure Tfrm_exp_carta_cred.dbm_observacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_nr_processo   then btn_co_proc_newClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_exp_carta_cred.msk_cd_unid_negExit(Sender: TObject);
var
   nNumero : Double;
   bAchou  : Boolean;

begin
  nNumero := 0;

  with datm_exp_carta_cred do
  begin
    msk_cd_unid_neg.Text := Trim(msk_cd_unid_neg.Text);
    if Trim(msk_cd_unid_neg.Text) <> '' then
       nNumero := StrToFloat(msk_cd_unid_neg.Text);

    msk_cd_unid_neg.Text   := StrZero( nNumero, msk_cd_unid_neg.MaxLength );
    if ( msk_cd_unid_neg.Text <> '' ) then
    begin
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_habilitacao_.Prepare;
      qry_usuario_habilitacao_.Open;

      bAchou := qry_usuario_habilitacao_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive]);
      if Not (bAchou) then
      begin
        BoxMensagem('Unidade não encontrada, sem habilitação ou desativado!', 2);
        msk_cd_unid_neg.Text := '';
        edt_nm_unid_neg.Text := '';
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        qry_unid_neg_.Close;
        qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_unid_neg_.Prepare;
        qry_unid_neg_.Open;

        if not (qry_unid_neg_.EOF) then
           edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end;
    end;

    if ( msk_cd_unid_neg.Text = '' )  then
      edt_nm_unid_neg.Text := '';

    qry_lista_.Close;
    qry_lista_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_lista_.Prepare;
    qry_lista_.Open;

  end;
end;

procedure Tfrm_exp_carta_cred.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
  end;
end;

procedure Tfrm_exp_carta_cred.btn_co_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo        := '23';
  str_cd_rotina        := '2301';

  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    lCons_OnLine       := True;
    Caption            := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine       := False;
  end;
  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  vStr_cd_modulo        := '01';
  str_cd_rotina        := '0102';

  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_exp_carta_cred.btn_co_proc_newClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_exp,frm_consulta_exp);
  frm_consulta_exp.str_cd_unid := frm_exp_carta_cred.msk_cd_unid_neg.Text;
  frm_consulta_exp.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_exp.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_exp.Nr_Processo, 5, 14 );
    str_nr_processo := frm_consulta_exp.Nr_Processo;
  end;

end;

procedure Tfrm_exp_carta_cred.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.ReadOnly then Exit;

  if msk_nr_processo.Text <> '' then
  begin
    with datm_exp_carta_cred do
    begin
      qry_processo_.Close;
      //qry_processo_.ParamByName('NR_PROCESSO').AsString := str_cd_unid_neg + '02' + msk_nr_processo.Text;
      // Comentado acima e utilizando abaixo, pois quando o usuário alterava a unidade na tela o sistema continuava utilizando a padrão - Michel - 25/06/2012
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.EOF then
      begin
        BoxMensagem( 'Nr. Processo não existente !! ', 3 );
        msk_nr_processo.Text := '';
        Cancelar;
        Exit;
      end;

      str_nr_processo := qry_processo_NR_PROCESSO.AsString;
      msk_nr_processo.Text := Copy( str_nr_processo, 5, 14 );
      Habilita_Entrada;

      {Verificar inclusão}
      if Not qry_lista_.Locate( 'NR_PROCESSO', str_nr_processo, [] ) then
      begin
        try
          datm_main.db_broker.StartTransaction;
          CloseStoredProc(sp_exp_carta_cred);
          sp_exp_carta_cred.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
          ExecStoredProc(sp_exp_carta_cred);
          CloseStoredProc(sp_exp_carta_cred);
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
        Abertura;
      end;
    end;
  end;
end;

procedure Tfrm_exp_carta_cred.Habilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel ) then
       TLabel( Components[i] ).Enabled        := True;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled       := True;
    if ( Components[i] is TComboBox ) then
       TComboBox( Components[i] ).Enabled     := False;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := True;
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled  := True;
    if ( Components[i] is  TDBMemo ) then
       TDbMemo( Components[i] ).Enabled       := True;
  end;

  btn_sair.Enabled    := True;
  mi_sair.Enabled     := True;
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
end;

procedure Tfrm_exp_carta_cred.Desabilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel ) then
       TLabel( Components[i] ).Enabled        := False;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled       := False;
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled  := False;
    if ( Components[i] is TComboBox ) then
       TComboBox( Components[i] ).Enabled     := False;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := False;
    if ( Components[i] is  TDBMemo ) then
       TDbMemo( Components[i] ).Enabled       :=  False;
  end;

  mi_salvar.Enabled   := btn_salvar.Enabled;
  mi_cancelar.Enabled := btn_cancelar.Enabled;
  mi_excluir.Enabled  := btn_excluir.Enabled;

  btn_sair.Enabled    := True;
  mi_sair.Enabled     := btn_sair.Enabled;
end;

procedure Tfrm_exp_carta_cred.ProcCartaCred( lMostra : Boolean );
begin
  if Not lMostra then
  begin
    msk_nr_processo.Color := clMenu;
    msk_cd_unid_neg.Color := clMenu;
  end
  else
  begin
    msk_nr_processo.Color := clWindow;
    msk_cd_unid_neg.Color := clWindow;
  end;

  msk_nr_processo.ReadOnly := Not lMostra;
  msk_cd_unid_neg.ReadOnly := Not lMostra;
  msk_nr_processo.Enabled  := lMostra;
  msk_cd_unid_neg.Enabled  := lMostra;
  msk_nr_processo.TabStop  := lMostra;
  msk_cd_unid_neg.TabStop  := lMostra;
  btn_co_proc_new.Enabled  := lMostra;
  btn_co_unid_neg.Enabled  := lMostra;
end;

procedure Tfrm_exp_carta_cred.Abertura;
begin
  with datm_exp_carta_cred do
  begin
    qry_lista_.Close;
    qry_lista_.Prepare;
    qry_lista_.Open;
    if str_nr_processo <> '' then
      qry_lista_.Locate('NR_PROCESSO', str_nr_processo, [loCaseInsensitive]);
  end;
end;

end.

