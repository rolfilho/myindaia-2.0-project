unit PGPE002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, PGGP001, UCRPE32, Funcoes;

type
  Tfrm_pe = class(TForm)
    pnl_cadastro: TPanel;
    btn_nova_pe: TSpeedButton;
    btn_sair_pe: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_nova_pe: TMenuItem;
    mi_capa_pe: TMenuItem;
    mi_item_pe: TMenuItem;
    btn_itens_pe: TSpeedButton;
    btn_capa_pe: TSpeedButton;
    mi_saida: TMenuItem;
    btn_duplica_pe: TSpeedButton;
    mi_duplica_pe: TMenuItem;
    Panel1: TPanel;
    dbgrd_pe: TDBGrid;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    mi_exclui: TMenuItem;
    btn_exclui: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    procedure btn_sair_peClick(Sender: TObject);
    procedure btn_nova_peClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_itens_peClick(Sender: TObject);
    procedure btn_capa_peClick(Sender: TObject);
    procedure btn_duplica_peClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrd_peEnter(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbgrd_PEDblClick(Sender: TObject);
    procedure btn_excluiClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_negExit(Sender: TObject);
  private
    st_modificar, st_incluir, st_excluir : Boolean;
    Pesquisa : String;

  public
    { Public declarations }
    cState : String[1];
    i_seletor : Integer;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    in_DI_Registrada : Boolean;
    in_DI_Retificacao : Boolean;
    procedure HabilitaBotoes( lResp : Boolean);
    procedure Verifica;
  end;

var
  frm_pe: Tfrm_pe;
  Criando_pe:Boolean;
  bCriando : Boolean;

implementation

uses GSMLIB,  PGGP017, PGPE004, PGPE001, PGSM096, PGGP015, PGPE003, PGPE009,
  PGSM018;
{$R *.DFM}

procedure Tfrm_pe.btn_sair_peClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_pe.btn_nova_peClick(Sender: TObject);
begin
  with datm_pe do
  begin
    HabilitaBotoes( False );

    Criando_pe := True;
    bCriando   := True;

    btn_capa_peClick(Sender);

    bCriando := False;
  end;
end;

procedure Tfrm_pe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_pe.Destroy;
  Action := caFree;
end;

procedure Tfrm_pe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_pe.HabilitaBotoes( lResp : Boolean);
begin
  btn_nova_pe.Enabled    := lResp;
  btn_capa_pe.Enabled    := Not lResp;
  btn_itens_pe.Enabled   := Not lResp;
  btn_duplica_pe.Enabled := Not lResp;
  btn_exclui.Enabled     := Not lResp;

  mi_nova_pe.Enabled     := lResp;
  mi_capa_pe.Enabled     := Not lResp;
  mi_item_pe.Enabled     := Not lResp;
  mi_duplica_pe.Enabled  := Not lResp;
  mi_exclui.Enabled      := Not lResp;
end;

procedure Tfrm_pe.btn_capa_peClick(Sender: TObject);
begin
  If Criando_pe <> True then
     Criando_pe := False;

  Application.CreateForm(TFrm_pe_Capa, Frm_pe_Capa);

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  Frm_pe_Capa.ShowModal;

  Application.ProcessMessages; 

  case i_seletor of
    2: begin
         i_seletor := 0;
         btn_itens_peClick(Sender);
       end;
  end;

  Verifica;
end;

procedure Tfrm_pe.btn_itens_peClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  Criando_pe := False;

  Application.CreateForm(TFrm_pe_Itens, Frm_pe_Itens);

  Frm_pe_Itens.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;
  Screen.Cursor := crArrow;

  case i_seletor of
    1: begin
         i_seletor := 0;
         btn_capa_peClick(Sender);
       end;
  end;

  Verifica;
end;

procedure Tfrm_pe.btn_duplica_peClick(Sender: TObject);
var
  cProc1, cProc2 : String[18];

begin
  Application.CreateForm( Tfrm_pe_duplica, frm_pe_duplica );
  frm_pe_duplica.ShowModal;

  If frm_pe_duplica.edt_novo_processo.Text <> '' then
  begin
    cProc1 := datm_pe.qry_pe_NR_PROCESSO.AsString;
    cProc2 := frm_pe_duplica.edt_novo_processo.Text;

    datm_PE.qry_pe_.Close;
    frm_pe_duplica.Close;
    frm_pe_duplica.Destroy;

    try
      datm_main.db_broker.StartTransaction;
      datm_pe.qry_exec_sp_.SQL.Clear;
      datm_pe.qry_exec_sp_.SQL.Add( 'EXEC sp_pe_duplica "' + cProc1 + '","' + cProc2 + '"' );
      datm_pe.qry_exec_sp_.ExecSQL;

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;

    datm_PE.qry_pe_.Close;
    datm_PE.qry_pe_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
    datm_PE.qry_pe_.Prepare;
    datm_PE.qry_pe_.Open;

    dbgrd_pe.SetFocus;
  end;

  Application.ProcessMessages;

end;


procedure Tfrm_pe.FormCreate(Sender: TObject);
begin
  Criando_pe    := False;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  { Inicializa o Data Module para Senha }
  Application.CreateForm( Tdatm_pe, datm_pe );
end;

procedure Tfrm_pe.FormShow(Sender: TObject);
begin
  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  a_str_indices[0] := 'NR_PROCESSO';
  a_str_indices[1] := 'CD_IMPORTADOR';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Nr. Processo');
    Items.Add('Código do Cliente');
    ItemIndex := 0;
  end;

  datm_PE.qry_unid_neg_.Close;
  datm_PE.qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
  datm_PE.qry_unid_neg_.Prepare;
  datm_PE.qry_unid_neg_.Open;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  edt_nm_unid_neg.Text := datm_PE.qry_unid_neg_NM_UNID_NEG.AsString;

  datm_PE.qry_pe_.Close;
  datm_PE.qry_pe_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
  datm_PE.qry_pe_.Prepare;
  datm_PE.qry_pe_.Open;

  btn_nova_pe.Enabled    := True;
  btn_capa_pe.Enabled    := True;
  btn_itens_pe.Enabled   := True;
  btn_exclui.Enabled     := True;
  btn_duplica_pe.Enabled := True;

  mi_nova_pe.Enabled     := True;
  mi_capa_pe.Enabled     := True;
  mi_item_pe.Enabled     := True;
  mi_exclui.Enabled      := True;
  mi_duplica_pe.Enabled  := True;

  if datm_PE.qry_pe_.EOF then
  begin
    btn_capa_pe.Enabled    := False;
    btn_itens_pe.Enabled   := False;
    btn_exclui.Enabled     := False;
    btn_duplica_pe.Enabled := False;

    mi_capa_pe.Enabled     := False;
    mi_item_pe.Enabled     := False;
    mi_exclui.Enabled      := False;
    mi_duplica_pe.Enabled  := False;
  end;

  edt_chave.SetFocus;
end;

procedure Tfrm_pe.dbgrd_peEnter(Sender: TObject);
begin
  if datm_pe.qry_pe_nr_processo.AsString <> '' then
      HabilitaBotoes( False );
end;

procedure Tfrm_pe.msk_nr_processoChange(Sender: TObject);
begin
  btn_nova_pe.Enabled    := False;

  btn_capa_pe.Enabled    := False;
  btn_itens_pe.Enabled   := False;
  btn_duplica_pe.Enabled := False;

  mi_nova_pe.Enabled     := False;
  mi_capa_pe.Enabled     := False;
  mi_item_pe.Enabled     := False;
  mi_duplica_pe.Enabled  := False;
end;

procedure Tfrm_pe.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_PE.qry_pe_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_pe.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_pe.qry_pe_NR_PROCESSO.AsString;

  edt_chave.Text := '';
  datm_pe.qry_pe_.Close;
  datm_PE.qry_pe_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
  datm_pe.qry_pe_.SQL[3] := 'ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];
  datm_pe.qry_pe_.Open;
  Localiza(datm_pe.qry_pe_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;

end;

procedure Tfrm_pe.dbgrd_PEDblClick(Sender: TObject);
begin
  btn_capa_peClick(nil);
end;

procedure Tfrm_pe.btn_excluiClick(Sender: TObject);
var
  cProcesso : String[18];

begin
  if BoxMensagem( 'Deseja realmente excluir o Pedido[ ' + Trim( datm_PE.qry_pe_NR_PROCESSO.AsString ) + '] ?', 1 ) then
  begin
    cProcesso := datm_PE.qry_pe_NR_PROCESSO.AsString;

    datm_PE.qry_pe_.Close;

    try
      datm_main.db_broker.StartTransaction;
      datm_pe.qry_exec_sp_.SQL.Clear;
      datm_pe.qry_exec_sp_.SQL.Add( 'EXEC sp_pe_exclui "' + cProcesso + '","' + msk_cd_unid_neg.Text + '"' );
      datm_pe.qry_exec_sp_.ExecSQL;

      datm_main.db_broker.Commit;

      datm_PE.qry_pe_.Close;
      datm_PE.qry_pe_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
      datm_PE.qry_pe_.Prepare;
      datm_PE.qry_pe_.Open;

      If datm_PE.qry_pe_NR_PROCESSO.AsString = '' then
      begin
        HabilitaBotoes( True );
      end;

    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;


procedure Tfrm_pe.Verifica;
begin

  datm_pe.qry_pe_.Close;
  datm_PE.qry_pe_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
  datm_pe.qry_pe_.Prepare;
  datm_pe.qry_pe_.Open;

  If Trim(str_nr_processo) <> '' then
     datm_pe.qry_pe_.Locate( 'NR_PROCESSO', str_nr_processo, [] );

  If not (datm_pe.qry_pe_.EOF) then
  begin
    btn_nova_pe.Enabled := True;
    mi_nova_pe.Enabled := True;
  end;
end;



procedure Tfrm_pe.btn_co_unid_negClick(Sender: TObject);
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

procedure Tfrm_pe.msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
  end;

end;

procedure Tfrm_pe.msk_cd_unid_negExit(Sender: TObject);
var
   nNumero : Double;
   bAchou  : Boolean;

begin
  nNumero := 0;
  
  with datm_PE do
  begin
    msk_cd_unid_neg.Text   := Trim(msk_cd_unid_neg.Text);
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

    qry_PE_.Close;
    qry_PE_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_PE_.Prepare;
    qry_PE_.Open;

    if qry_PE_.EOF then
       HabilitaBotoes( True )
    else
    begin
      HabilitaBotoes( False );
      btn_nova_pe.Enabled := True;
      mi_nova_pe.Enabled  := True;
    end;

  end;
end;


end.
