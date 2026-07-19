(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGPE018.PAS - Processzo de Exportação
AUTOR: Leandro Stipanich
DATA: dd/mm/yyyy

Manutenção: Leandro Stipanich
Data: 26/10/2001
*************************************************************************************************)
unit PGPE018;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, Funcoes, ConsOnLineEx, Excel97, Variants, uDocumentosExportacao;


type

  Tfrm_exp = class(TForm)
    pnl_cadastro: TPanel;
    btn_nova_exp: TSpeedButton;
    btn_sair_exp: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_nova_exp: TMenuItem;
    mi_capa_exp: TMenuItem;
    mi_item_exp: TMenuItem;
    btn_itens_exp: TSpeedButton;
    btn_capa_exp: TSpeedButton;
    mi_saida: TMenuItem;
    btn_duplica_exp: TSpeedButton;
    mi_duplica_exp: TMenuItem;
    pnlEspaco: TPanel;
    dbnvg: TDBNavigator;
    mi_exclui: TMenuItem;
    btn_exclui: TSpeedButton;
    mi_docs: TMenuItem;
    mi_docs_fatura: TMenuItem;
    mi_docs_cert_orig: TMenuItem;
    mi_docs_packing: TMenuItem;
    mi_docs_cert_seg: TMenuItem;
    mi_docs_instr_emb: TMenuItem;
    btn_manut_proc: TSpeedButton;
    mi_manut_proc: TMenuItem;
    FaturaComercialModelo21: TMenuItem;
    PackingListModelo21: TMenuItem;
    btn_re: TSpeedButton;
    mi_re: TMenuItem;
    shpPesquisa: TShape;
    lblPesquisar: TLabel;
    edt_chave: TEdit;
    lblOrdem: TLabel;
    cmbOrdem: TComboBox;
    shpNavigator: TShape;
    miPaletizacao: TMenuItem;
    mi_PlanilhaFIESP: TMenuItem;
    miCertificadodeOrigemFIESP: TMenuItem;
    relatrioRiex1: TMenuItem;
    Nestl1: TMenuItem;
    ProgramaoRodoviria1: TMenuItem;
    Saque1: TMenuItem;
    CertificadodeQualidade1: TMenuItem;
    Border1: TMenuItem;
    CARICOM1: TMenuItem;
    PackingList1: TMenuItem;
    FaturaComercial1: TMenuItem;
    pnlProcExp: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    dbgrd_exp: TDBGrid;
    chkProcessos: TCheckBox;
    Petronas1: TMenuItem;
    PackingList2: TMenuItem;
    SpeedButton8: TSpeedButton;
    CertificadoVigilnciaSanitria1: TMenuItem;
    FaturaComercial2: TMenuItem;
    validarLotesNestle: TMenuItem;
    btnDraftBl: TSpeedButton;
    Apolo1: TMenuItem;
    PackingList3: TMenuItem;
    FaturaComercial3: TMenuItem;
    procedure btn_sair_expClick(Sender: TObject);
    procedure btn_nova_expClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_itens_expClick(Sender: TObject);
    procedure btn_capa_expClick(Sender: TObject);
    procedure btn_duplica_expClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrd_expEnter(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cmbOrdemClick(Sender: TObject);
    procedure dbgrd_expDblClick(Sender: TObject);
    procedure btn_excluiClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure mi_docs_faturaClick(Sender: TObject);
    procedure mi_docs_cert_origClick(Sender: TObject);
    procedure mi_docs_packingClick(Sender: TObject);
    procedure mi_docs_cert_segClick(Sender: TObject);
    procedure mi_docs_instr_embClick(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure btn_manut_procClick(Sender: TObject);
    procedure FaturaComercialModelo21Click(Sender: TObject);
    procedure PackingListModelo21Click(Sender: TObject);
    procedure btn_reClick(Sender: TObject);
    procedure chkProcessosClick(Sender: TObject);
    procedure miPaletizacaoClick(Sender: TObject);
    procedure mi_PlanilhaFIESPClick(Sender: TObject);
    procedure miCertificadodeOrigemFIESPClick(Sender: TObject);
    procedure relatrioRiex1Click(Sender: TObject);
    procedure ProgramaoRodoviria1Click(Sender: TObject);
    procedure Saque1Click(Sender: TObject);
    procedure CertificadodeQualidade1Click(Sender: TObject);
    procedure Border1Click(Sender: TObject);
    procedure CARICOM1Click(Sender: TObject);
    procedure PackingList1Click(Sender: TObject);
    procedure FaturaComercial1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure CertificadoVigilnciaSanitria1Click(Sender: TObject);
    procedure FaturaComercial2Click(Sender: TObject);
    procedure PackingList2Click(Sender: TObject);
    procedure validarLotesNestleClick(Sender: TObject);
    procedure btnDraftBlClick(Sender: TObject);
    procedure PackingList3Click(Sender: TObject);
    procedure FaturaComercial3Click(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    Pesquisa, st_unid_neg : String;
  public
    { Public declarations }
    cState : String[1];
    i_seletor : Integer;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    in_DI_Registrada : Boolean;
    in_DI_Retificacao : Boolean;
    pesq_cd_unid_neg : String[2];
    pesq_nr_processo : String[20];
    procedure HabilitaBotoes( lResp : Boolean);
    procedure Verifica;
    procedure DocumentosExportacao(TipoRelatorio: TRelatorio);
  end;

var
  frm_exp : Tfrm_exp;
  Criando_exp : Boolean;
  bCriando : Boolean;

implementation

uses GSMLIB, PGGP001, PGGP017, PGPE017, PGPE019, PGPE020, PGPE023, PGPE031,
  PGPE033, PGPE035, PGPE037, uFaturaComercial2, uPackingList2, uExpMontaRe,
  dReCapa, uReCapa, uPackingList, PGPE029, uSistema_Cool,
  URelatoriosNestle, uValidarLotesNestle;{ PGSM096, PGGP015, PGSM018, PGPE029, PGGP018, UCRPE32}
  
{$R *.DFM}

procedure Tfrm_exp.btn_sair_expClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '';
  str_nr_processo := '';
  Close;
end;

procedure Tfrm_exp.btn_nova_expClick(Sender: TObject);
begin
  with datm_exp do
  begin
    HabilitaBotoes( False );

    Criando_exp := True;
    bCriando    := True;
    btn_capa_expClick(Sender);
    bCriando := False;
  end;
end;

procedure Tfrm_exp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  nr_processo_gestao := datm_exp.qry_exp_NR_PROCESSO.AsString;
  with datm_exp do begin
    qry_exp_.Close;
    qry_emp_nac_.Close;
    qry_unid_neg_.Close;
    qry_usuario_habilitacao_.Close;

    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_exp.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then
  begin
    str_cd_rotina_atalho := '';
    str_nr_processo := '';
    Close;
  end;
end;

procedure Tfrm_exp.HabilitaBotoes( lResp : Boolean);
begin
  btn_nova_exp.Enabled    := lResp;
  btn_capa_exp.Enabled    := Not lResp;
  btn_itens_exp.Enabled   := Not lResp;
  btn_duplica_exp.Enabled := Not lResp;
  btn_exclui.Enabled      := Not lResp;

  mi_nova_exp.Enabled     := lResp;
  mi_capa_exp.Enabled     := Not lResp;
  mi_item_exp.Enabled     := Not lResp;
  mi_duplica_exp.Enabled  := Not lResp;
  mi_exclui.Enabled       := Not lResp;
end;

procedure Tfrm_exp.btn_capa_expClick(Sender: TObject);
begin
  if Criando_exp <> True then Criando_exp := False;
  if Trim(str_nr_processo) = '' then str_nr_processo := datm_exp.qry_exp_NR_PROCESSO.AsString;

  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_exp_Capa, frm_exp_Capa);
  Application.ProcessMessages;
  Screen.Cursor := crArrow;
  frm_exp_Capa.ShowModal;
  //by carlos - 29/06/2011
  if Criando_exp then
     if frm_exp_capa.mskedt_nr_processo.Text<>'' then
        str_nr_processo:=msk_cd_unid_neg.Text+'02'+frm_exp_capa.mskedt_nr_processo.Text;

  case i_seletor of
    2: begin
         i_seletor := 0;
         btn_itens_expClick(Sender);
       end;
    3: begin
         str_cd_rotina_atalho := '0102';
         Close;
         Exit;
       end;
  end;
  Verifica;
end;

procedure Tfrm_exp.btn_itens_expClick(Sender: TObject);
begin
  Criando_exp := False;
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_exp_Itens, frm_exp_Itens);
  Application.ProcessMessages;
  Screen.Cursor := crArrow;
  frm_exp_Itens.ShowModal;

  case i_seletor of
    1: begin
         i_seletor := 0;
         btn_capa_expClick(Sender);
       end;
    3: begin
         str_cd_rotina_atalho := '0102';
         Close;
         Exit;
       end;
  end;
  Verifica;
end;

procedure Tfrm_exp.btn_duplica_expClick(Sender: TObject);
var
  cProc1, cProc2 : String[18];
begin
  Application.CreateForm( Tfrm_exp_duplica, frm_exp_duplica );
  frm_exp_duplica.ShowModal;

  If frm_exp_duplica.edt_novo_processo.Text <> '' then
  begin
    cProc1 := str_cd_unid_neg + '02' + frm_exp_duplica.msk_nr_processo.Text;
    cProc2 := str_cd_unid_neg + '02' + frm_exp_duplica.edt_novo_processo.Text;

    datm_exp.qry_exp_.Close;
    frm_exp_duplica.Close;
    frm_exp_duplica.Destroy;

    try
      datm_main.db_broker.StartTransaction;
      datm_exp.qry_exec_sp_.SQL.Clear;
      datm_exp.qry_exec_sp_.SQL.Add( 'EXEC sp_exp_duplica "' + cProc1 + '","' + cProc2 + '"' );
      datm_exp.qry_exec_sp_.ExecSQL;

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;

    with datm_exp do begin
      qry_exp_.Close;
      qry_exp_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      if chkProcessos.Checked then
        qry_exp_.ParamByName('DT_CONS_PROC').AsDate := Date - vQtdeDiasConsProc
      else
        qry_exp_.ParamByName('DT_CONS_PROC').AsDate := StrToDate('01/01/1900');
      qry_exp_.Open;
    end;
  end;
  dbgrd_exp.SetFocus;
  str_nr_processo := '';
  Application.ProcessMessages;
end;

procedure Tfrm_exp.FormCreate(Sender: TObject);
begin
  Criando_exp    := False;
  { Inicializa o Data Module para Senha }
  Application.CreateForm( Tdatm_exp, datm_exp );

  str_nr_processo := '';

  if (frm_main.mi_Exp_doc_fat_com.Visible) or
     (frm_main.mi_Exp_doc_cert_orig.Visible) or
     (frm_main.mi_Exp_doc_packing_list.Visible) or
     (frm_main.mi_Exp_doc_cert_seguro.Visible) or
     (frm_main.mi_Exp_doc_instr_emb.Visible) then
    mi_docs.Enabled := True;

  if frm_main.mi_Exp_doc_fat_com.Visible      then mi_docs_fatura.Enabled    := True;
  if frm_main.mi_Exp_doc_cert_orig.Visible    then mi_docs_cert_orig.Enabled := True;
  if frm_main.mi_Exp_doc_packing_list.Visible then mi_docs_packing.Enabled   := True;
  if frm_main.mi_Exp_doc_cert_seguro.Visible  then mi_docs_cert_seg.Enabled  := True;
  if frm_main.mi_Exp_doc_instr_emb.Visible    then mi_docs_instr_emb.Enabled := True;
end;

procedure Tfrm_exp.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  with datm_exp do
  begin
    AtribuiDireitos( st_modificar, st_incluir, st_excluir);

    a_str_indices[0] := 'NR_PROCESSO';
    a_str_indices[1] := 'NM_EXPORTADOR';

    with cmbOrdem do
    begin
      Clear;
      Items.Add('Nr. Processo');
      Items.Add('Empresa Nac.');
      ItemIndex := 0;
    end;

    qry_unid_neg_.Close;
    if pesq_cd_unid_neg <> '' then
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := pesq_cd_unid_neg
    else
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    if pesq_cd_unid_neg <> '' then
      msk_cd_unid_neg.Text := pesq_cd_unid_neg
    else
      msk_cd_unid_neg.Text := str_cd_unid_neg;

    edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;

    datm_exp.qry_exp_.Close;
    datm_exp.qry_exp_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    if chkProcessos.Checked then
      datm_exp.qry_exp_.ParamByName('DT_CONS_PROC').AsDate := Date - vQtdeDiasConsProc
    else
      datm_exp.qry_exp_.ParamByName('DT_CONS_PROC').AsDate := StrToDate('01/01/1900');
    datm_exp.qry_exp_.Open;

    btn_nova_exp.Enabled    := True;
    btn_capa_exp.Enabled    := True;
    btn_itens_exp.Enabled   := True;
    btn_exclui.Enabled      := True;
    btn_duplica_exp.Enabled := True;

    mi_nova_exp.Enabled     := True;
    mi_capa_exp.Enabled     := True;
    mi_item_exp.Enabled     := True;
    mi_exclui.Enabled       := True;
    mi_duplica_exp.Enabled  := True;

    if datm_exp.qry_exp_.EOF then
    begin
      btn_capa_exp.Enabled    := False;
      btn_itens_exp.Enabled   := False;
      btn_exclui.Enabled      := False;
      btn_duplica_exp.Enabled := False;

      mi_capa_exp.Enabled     := False;
      mi_item_exp.Enabled     := False;
      mi_exclui.Enabled       := False;
      mi_duplica_exp.Enabled  := False;
    end;

    edt_chave.Text := copy(pesq_nr_processo,5,12);
    //if pesq_nr_processo <> '' then
    //  qry_exp_.Locate('NR_PROCESSO', pesq_nr_processo, [loCaseInsensitive]);
    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_exp.dbgrd_expEnter(Sender: TObject);
begin
  if Not datm_exp.qry_exp_.EOF then HabilitaBotoes( False );
end;

procedure Tfrm_exp.msk_nr_processoChange(Sender: TObject);
begin
  btn_nova_exp.Enabled    := False;
  btn_capa_exp.Enabled    := False;
  btn_itens_exp.Enabled   := False;
  btn_duplica_exp.Enabled := False;

  mi_nova_exp.Enabled     := False;
  mi_capa_exp.Enabled     := False;
  mi_item_exp.Enabled     := False;
  mi_duplica_exp.Enabled  := False;
end;

procedure Tfrm_exp.edt_chaveChange(Sender: TObject);
begin
  if cmbOrdem.ItemIndex = 0 then
    Localiza( datm_exp.qry_exp_, msk_cd_unid_neg.Text + '02' + edt_chave.Text, a_str_indices[cmbOrdem.ItemIndex] )
  else
    Localiza( datm_exp.qry_exp_, edt_chave.Text, a_str_indices[cmbOrdem.ItemIndex] );
end;

procedure Tfrm_exp.cmbOrdemClick(Sender: TObject);
begin
  Pesquisa := datm_exp.qry_exp_NR_PROCESSO.AsString;

  edt_chave.Text := '';
  with datm_exp do begin
    qry_exp_.Close;
    qry_exp_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    if chkProcessos.Checked then
      qry_exp_.ParamByName('DT_CONS_PROC').AsDate := Date - vQtdeDiasConsProc
    else
      qry_exp_.ParamByName('DT_CONS_PROC').AsDate := StrToDate('01/01/1900');
    qry_exp_.SQL[6] := a_str_indices[cmbOrdem.ItemIndex];
    qry_exp_.Open;
    Localiza(qry_exp_, Pesquisa, a_str_indices[0] );
  end;
  edt_chave.SetFocus;
end;

procedure Tfrm_exp.dbgrd_expDblClick(Sender: TObject);
begin
  btn_capa_expClick(nil);
end;

procedure Tfrm_exp.btn_excluiClick(Sender: TObject);
var
  cProcesso : String[18];
begin
  if BoxMensagem( 'Deseja realmente excluir o Processo [' + Trim( Copy(datm_exp.qry_exp_NR_PROCESSO.AsString,5,14) ) + '] ?', 1 ) then
  begin
    cProcesso := datm_exp.qry_exp_NR_PROCESSO.AsString;

    datm_exp.qry_exp_.Close;
    try
      datm_main.db_broker.StartTransaction;
      datm_exp.qry_exec_sp_.SQL.Clear;
      datm_exp.qry_exec_sp_.SQL.Add( 'EXEC sp_exp_exclui "' + cProcesso + '"' );
      datm_exp.qry_exec_sp_.ExecSQL;

      datm_main.db_broker.Commit;

      with datm_exp do begin
        qry_exp_.Close;
        qry_exp_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        if chkProcessos.Checked then
          qry_exp_.ParamByName('DT_CONS_PROC').AsDate := Date - vQtdeDiasConsProc
        else
          qry_exp_.ParamByName('DT_CONS_PROC').AsDate := StrToDate('01/01/1900');
        qry_exp_.Open;
      end;

      if datm_exp.qry_exp_.EOF then HabilitaBotoes( True );
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
  str_nr_processo := '';
end;

procedure Tfrm_exp.Verifica;
begin
  with datm_exp do begin
    qry_exp_.Close;
    qry_exp_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    if chkProcessos.Checked then
      qry_exp_.ParamByName('DT_CONS_PROC').AsDate := Date - vQtdeDiasConsProc
    else
      qry_exp_.ParamByName('DT_CONS_PROC').AsDate := StrToDate('01/01/1900');
    qry_exp_.Open;
  end;

  if Trim(str_nr_processo) <> '' then
     datm_exp.qry_exp_.Locate( 'NR_PROCESSO', str_nr_processo, [] );

  if Trim(datm_exp.qry_exp_NR_PROCESSO.AsString) <> '' then
  begin
    btn_nova_exp.Enabled := True;
    mi_nova_exp.Enabled  := True;
  end;
  str_nr_processo := '';
end;

procedure Tfrm_exp.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
     msk_cd_unid_neg.Text := ConsultaOnLineExSQL('SELECT CD_UNID_NEG, NM_UNID_NEG ' +
                                                 'FROM TUNID_NEG (NOLOCK) ' +
                                                 'WHERE CGC_UNID_NEG IS NOT NULL' ,'Unidades',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG');

    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'NM_UNID_NEG');
  end
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'NM_UNID_NEG');

  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_exp.msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then btn_co_unid_negClick(btn_co_unid_neg);
end;

procedure Tfrm_exp.msk_cd_unid_negExit(Sender: TObject);
var
   nNumero : Double;
   bAchou  : Boolean;
begin
  if st_unid_neg = Trim( msk_cd_unid_neg.Text ) then Exit;

  nNumero := 0;

  with datm_exp do
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

        if not (qry_unid_neg_.EOF) then edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end;
    end;

    if ( msk_cd_unid_neg.Text = '' )  then edt_nm_unid_neg.Text := '';
    with datm_exp do begin
      qry_exp_.Close;
      qry_exp_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      if chkProcessos.Checked then
        qry_exp_.ParamByName('DT_CONS_PROC').AsDate := Date - vQtdeDiasConsProc
      else
        qry_exp_.ParamByName('DT_CONS_PROC').AsDate := StrToDate('01/01/1900');
      qry_exp_.Open;
    end;

    if Not qry_exp_.EOF then
    begin
      HabilitaBotoes( False );
      btn_nova_exp.Enabled := True;
      mi_nova_exp.Enabled  := True;
    end
    else HabilitaBotoes( True );
  end;
end;

procedure Tfrm_exp.mi_docs_faturaClick(Sender: TObject);
{var
  hMod : THandle;
  AbreFaturaComercial : procedure(nr_processo : string);}
begin
{  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2003';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  hMod := LoadLibrary('FatCom.DLL');
  if (hMod = 0) then Exit;
  @AbreFaturaComercial := GetProcAddress(hMod, 'AbreFaturaComercial');
  if @AbreFaturaComercial <> nil then
    AbreFaturaComercial( datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString );
  FreeLibrary(hMod);}
//  Rotina Anterior
//  Application.CreateForm(Tfrm_exp_impr_fatura, frm_exp_impr_fatura);
//  frm_exp_impr_fatura.str_cd_unid_neg_exp := msk_cd_unid_neg.Text;
//  frm_exp_impr_fatura.str_nr_proc_exp     := datm_exp.qry_exp_CalcNrProcesso.AsString;
//  frm_exp_impr_fatura.ShowModal;

  frm_main.UserUp;
  frm_main.ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2003';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_exp_impr_fatura, frm_exp_impr_fatura);
  frm_exp_impr_fatura.msk_nr_processo.Text := datm_exp.qry_exp_CalcNrProcesso.AsString;
  frm_exp_impr_fatura.ShowModal;
  frm_main.KickUser;
  msk_cd_unid_neg.OnExit( msk_cd_unid_neg);  //Abre o dataset do Grid novamente
//  frm_exp_impr_fatura.Release;
end;

procedure Tfrm_exp.mi_docs_cert_origClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_exp_impr_cert_orig, frm_exp_impr_cert_orig);
  frm_exp_impr_cert_orig.str_cd_unid_neg_exp := msk_cd_unid_neg.Text;
  frm_exp_impr_cert_orig.str_nr_proc_exp     := datm_exp.qry_exp_CalcNrProcesso.AsString;
  frm_exp_impr_cert_orig.ShowModal;
end;

procedure Tfrm_exp.mi_docs_packingClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_exp_impr_packing, frm_exp_impr_packing);
  frm_exp_impr_packing.str_cd_unid_neg_exp := msk_cd_unid_neg.Text;
  frm_exp_impr_packing.str_nr_proc_exp     := datm_exp.qry_exp_CalcNrProcesso.AsString;
  frm_exp_impr_packing.ShowModal;
end;

procedure Tfrm_exp.mi_docs_cert_segClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_exp_impr_cert_seg, frm_exp_impr_cert_seg);
  frm_exp_impr_cert_seg.str_cd_unid_neg_exp := msk_cd_unid_neg.Text;
  frm_exp_impr_cert_seg.str_nr_proc_exp     := datm_exp.qry_exp_CalcNrProcesso.AsString;
  frm_exp_impr_cert_seg.ShowModal;
end;

procedure Tfrm_exp.mi_docs_instr_embClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_exp_impr_instr_emb, frm_exp_impr_instr_emb);
  frm_exp_impr_instr_emb.str_cd_unid_neg_exp := msk_cd_unid_neg.Text;
  frm_exp_impr_instr_emb.str_nr_proc_exp     := datm_exp.qry_exp_CalcNrProcesso.AsString;
  frm_exp_impr_instr_emb.ShowModal;
end;

procedure Tfrm_exp.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := Trim( msk_cd_unid_neg.Text );
end;

procedure Tfrm_exp.btn_manut_procClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0102';
  Close;
end;

procedure Tfrm_exp.FaturaComercialModelo21Click(Sender: TObject);
var
  bkp_unid_neg: String;
begin
  // Alterado por Michel em 20/06/2012 para guardar a unidade padrão e utilizar a unidade selecionada, pois estava passando sempre a unidade padrão para a tela, mesmo quando alterava nesta tela
  bkp_unid_neg := str_cd_unid_neg;
  str_cd_unid_neg := msk_cd_unid_neg.Text;
  try
    Application.CreateForm(Tfrm_fatura_comercial2, frm_fatura_comercial2);
    frm_fatura_comercial2.mskedt_nr_processo.Text := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
    frm_fatura_comercial2.ShowModal;
  finally
    str_cd_unid_neg := bkp_unid_neg;
  end;
end;

procedure Tfrm_exp.PackingListModelo21Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_packing_list2, frm_packing_list2);
  frm_packing_list2.mskedt_nr_processo.Text := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
  frm_packing_list2.ShowModal;
end;

procedure Tfrm_exp.btn_reClick(Sender: TObject);
var
  vVerifica:string;
  Unidade: string;
begin
  // Utilizado abaixo porque estava levando a unidade padrão para a tela do RE ao invés da unidade selecionada - Michel - 18/07/2012
  Unidade := str_cd_unid_neg;
  str_cd_unid_neg := msk_cd_unid_neg.Text;
  try
    with tQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      Close;
      SQL.Add('SELECT IN_MONTADO FROM TPROCESSO_EXP (NOLOCK) WHERE NR_PROCESSO = ' + QuotedStr(datm_exp.qry_exp_NR_PROCESSO.AsString));
      Prepare;
      Open;
      str_nr_processo := datm_exp.qry_exp_NR_PROCESSO.AsString;
      vVerifica:=ConsultaLookUPSQL('SELECT isnull(IN_MONTADO,'''') as in_montado FROM TPROCESSO_EXP (NOLOCK) WHERE NR_PROCESSO = '''+datm_exp.qry_exp_NR_PROCESSO.AsString+''' ','in_montado');
      if (Fields[0].AsString = '0') or (Fields[0].IsNull) or (vVerifica='') then
      begin
        if not VerIntegridade then Exit;
        vStr_cd_modulo := '20';
        str_cd_rotina := '2012';
        str_cd_mod := vStr_cd_modulo;
        str_cd_rot := str_cd_rotina;
        Application.CreateForm(Tfrm_exp_monta_re, frm_exp_monta_re);
        frm_exp_monta_re.ShowModal;
      end
      else
      begin
        if not VerIntegridade then Exit;
        vStr_cd_modulo := '20';
        str_cd_rotina := '2017';
        str_cd_mod := vStr_cd_modulo;
        str_cd_rot := str_cd_rotina;
        Application.CreateForm(Tdatm_re_capa, datm_re_capa);
        Application.CreateForm(Tfrm_re_capa, frm_re_capa);
        frm_re_capa.ShowModal;
      end;
      Free;
    end;
  finally
    str_cd_unid_neg := Unidade;
  end;
end;

procedure Tfrm_exp.chkProcessosClick(Sender: TObject);
begin
  with datm_exp do begin
    qry_exp_.Close;
    qry_exp_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    if chkProcessos.Checked then
      qry_exp_.ParamByName('DT_CONS_PROC').AsDate := Date - vQtdeDiasConsProc
    else
      qry_exp_.ParamByName('DT_CONS_PROC').AsDate := StrToDate('01/01/1900');
    qry_exp_.Open;
  end;
end;

procedure Tfrm_exp.miPaletizacaoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPackingList, frmPackingList);
  frmPackingList.mskUnidade.Text :=  msk_cd_unid_neg.Text;
  frmPackingList.vNrProcesso := datm_exp.qry_exp_.FieldByName('NR_PROCESSO').AsString;
  frmPackingList.ShowModal;
end;

procedure Tfrm_exp.mi_PlanilhaFIESPClick(Sender: TObject);
var
  vExcel: TExcelApplication;
  vSheetMerc, vSheetTotais: Excel97.ExcelWorksheet;
  vWorkBook: ExcelWorkbook;
  LinhaMerc, LinhaTotais, PLinhaMerc: Integer;
  vNCM, vNorma, vMedida, vNomeMedida: String;
  vCorMerc, vCorTotais: Integer;
  Cols: Char;

begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT E.QT_BAIXADA, E.CD_MERCADORIA, E.CD_UNID_MEDIDA, M.NM_UNID_MEDIDA, TX_MERCADORIA, E.CD_NCM, VL_UNITARIO, E.CD_NORMAS, (E.VL_UNITARIO * E.QT_MERCADORIA) AS TOTAL');
    SQL.Add('FROM   TPROCESSO_EXP_ITEM E (NOLOCK) LEFT JOIN TUNID_MEDIDA_BROKER M (NOLOCK) ON E.CD_UNID_MEDIDA = M.CD_UNID_MEDIDA');
    SQL.Add('WHERE  NR_PROCESSO = :NR_PROCESSO');
    SQL.Add('ORDER BY E.CD_NCM, E.CD_NORMAS, M.NM_UNID_MEDIDA, TOTAL');
    ParamByName('NR_PROCESSO').AsString:= datm_exp.qry_exp_NR_PROCESSO.AsString;

    Open;
    // verificar se há registros
    if RecordCount = 0 then
    begin
      MessageDlg('Não foram encontrados ítens para o processo ''' + datm_exp.qry_exp_NR_PROCESSO.AsString + '''.',
         mtInformation, [mbOk], 0);
      Exit;
    end;

    First;
    LinhaMerc   := 4;
    LinhaTotais := 4;

    // Cria arquivo do Excel
    vExcel  := TExcelApplication.Create(Application);
    vExcel.Connect;
    vExcel.Visible[0]:= False;
    vWorkBook := vExcel.Workbooks.Open(cDir_RPT + '\REL_FIESP.XLS', EmptyParam, EmptyParam, EmptyParam,
                 EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                 EmptyParam, EmptyParam, 0);
    vExcel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_FIESP' +
       Copy(DateToStr(DATE), 1, 2) + Copy(DateToStr(DATE), 4, 2) + Copy(DateToStr(DATE), 7, 4) + '.XLS',
       EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, ACCESS_OBJECT_GUID, EmptyParam, EmptyParam,
       EmptyParam, EmptyParam, 0);
    vSheetMerc := (vWorkBook.Sheets[1] as ExcelWorkSheet);
    vSheetTotais := (vWorkBook.Sheets[2] as ExcelWorkSheet);

    // Células com o nome do processo
    vSheetMerc.Range['B1', 'B1'].Value   := datm_exp.qry_exp_NR_PROCESSO.AsString;
    vSheetTotais.Range['B1', 'B1'].Value := datm_exp.qry_exp_NR_PROCESSO.AsString;

    vCorTotais := 35;

    // Loop em todos os registros
    while not EOF do
    begin
      vNCM        := FieldByName('CD_NCM').AsString;
      vNorma      := FieldByName('CD_NORMAS').AsString;
      vMedida     := FieldByName('CD_UNID_MEDIDA').AsString;
      vNomeMedida := FieldByName('NM_UNID_MEDIDA').AsString;
      PLinhaMerc      := LinhaMerc;
      vCorMerc    := 35;
      
      // Loop por agrupamento
      while (not EOF) and (FieldByName('CD_NCM').AsString = vNCM) and (FieldByName('CD_NORMAS').AsString = vNorma) and
         (FieldByName('CD_UNID_MEDIDA').AsString = vMedida) do
      begin
        if vCorMerc = 35 then
          vCorMerc := 37
        else
          vCorMerc := 35;

        vSheetMerc.Range['A' + IntToStr(LinhaMerc), 'A' + IntToStr(LinhaMerc)].Value := FieldByName('QT_BAIXADA').AsInteger;
        vSheetMerc.Range['B' + IntToStr(LinhaMerc), 'B' + IntToStr(LinhaMerc)].Value := FieldByName('CD_MERCADORIA').AsString;
        vSheetMerc.Range['C' + IntToStr(LinhaMerc), 'C' + IntToStr(LinhaMerc)].Value := FieldByName('NM_UNID_MEDIDA').AsString;
        vSheetMerc.Range['D' + IntToStr(LinhaMerc), 'D' + IntToStr(LinhaMerc)].Value := FieldByName('TX_MERCADORIA').AsString;
        vSheetMerc.Range['E' + IntToStr(LinhaMerc), 'E' + IntToStr(LinhaMerc)].Value := FieldByName('CD_NCM').AsString;
        vSheetMerc.Range['F' + IntToStr(LinhaMerc), 'F' + IntToStr(LinhaMerc)].Value := FieldByName('TOTAL').AsFloat;

        // Definir bordas
        for Cols:= 'A' to 'F' do
        begin
          vSheetMerc.Range[Cols + IntToStr(LinhaMerc), Cols + IntToStr(LinhaMerc)].BorderAround(xlInsideHorizontal, xlThin, xlAutomatic, xlAutomatic);
          vSheetMerc.Range[Cols + IntToStr(LinhaMerc), Cols + IntToStr(LinhaMerc)].BorderAround(xlInsideVertical,   xlThin, xlAutomatic, xlAutomatic);
        end;
        vSheetMerc.Range['A' + IntToStr(LinhaMerc), 'F' + IntToStr(LinhaMerc)].Interior.ColorIndex := vCorMerc;

        // MUDA DE LINHA
        Inc(LinhaMerc);
        Next;
      end; // Loop por agrupamento

      // Soma valores anteriores de Quantidade
      vSheetMerc.Range['A' + IntToStr(LinhaMerc), 'A' + IntToStr(LinhaMerc)].Formula :=
         '=SUM(A' + IntToStr(PLinhaMerc) + ':A' + IntToStr(LinhaMerc-1) + ')';
      // Soma valores anteriores de Valores
      vSheetMerc.Range['F' + IntToStr(LinhaMerc), 'F' + IntToStr(LinhaMerc)].Formula :=
         '=SUM(F' + IntToStr(PLinhaMerc) + ':F' + IntToStr(LinhaMerc-1) + ')';

      vSheetMerc.Range['A' + IntToStr(LinhaMerc), 'A' + IntToStr(LinhaMerc)].BorderAround(xlInsideHorizontal, xlThin, xlAutomatic, xlAutomatic);
      vSheetMerc.Range['A' + IntToStr(LinhaMerc), 'A' + IntToStr(LinhaMerc)].BorderAround(xlInsideVertical,   xlThin, xlAutomatic, xlAutomatic);
      vSheetMerc.Range['F' + IntToStr(LinhaMerc), 'F' + IntToStr(LinhaMerc)].BorderAround(xlInsideHorizontal, xlThin, xlAutomatic, xlAutomatic);
      vSheetMerc.Range['F' + IntToStr(LinhaMerc), 'F' + IntToStr(LinhaMerc)].BorderAround(xlInsideVertical,   xlThin, xlAutomatic, xlAutomatic);

      // Passar os valores para a WorkSheet de totais
      vSheetTotais.Range['A' + IntToStr(LinhaTotais), 'A' + IntToStr(LinhaTotais)].Formula := '=Mercadorias!A' + IntToStr(LinhaMerc);
      vSheetTotais.Range['B' + IntToStr(LinhaTotais), 'B' + IntToStr(LinhaTotais)].Value   := vNomeMedida;
      vSheetTotais.Range['C' + IntToStr(LinhaTotais), 'C' + IntToStr(LinhaTotais)].Value   := vNCM;
      vSheetTotais.Range['D' + IntToStr(LinhaTotais), 'D' + IntToStr(LinhaTotais)].Formula := '=Mercadorias!F' + IntToStr(LinhaMerc);
      // Definir bordas
      for Cols:= 'A' to 'D' do
      begin
        vSheetTotais.Range[Cols + IntToStr(LinhaTotais), Cols + IntToStr(LinhaTotais)].BorderAround(xlInsideHorizontal, xlThin, xlAutomatic, xlAutomatic);
        vSheetTotais.Range[Cols + IntToStr(LinhaTotais), Cols + IntToStr(LinhaTotais)].BorderAround(xlInsideVertical,   xlThin, xlAutomatic, xlAutomatic);
      end;
      if vCorTotais = 35 then
        vCorTotais := 37
      else
        vCorTotais := 35;
      vSheetTotais.Range['A' + IntToStr(LinhaTotais), 'D' + IntToStr(LinhaTotais)].Interior.ColorIndex := vCorTotais;

      // PULA UMA LINHA
      Inc(LinhaMerc, 2);
      Inc(LinhaTotais);
    end; // Loop em todos os registros

    vExcel.Visible[1] := True;

    Close;
    Free;
  end;
end;

procedure Tfrm_exp.miCertificadodeOrigemFIESPClick(Sender: TObject);
begin
  if Trim(str_nr_processo) = '' then str_nr_processo := datm_exp.qry_exp_NR_PROCESSO.AsString;

  frm_main.UserUp;
  frm_main.ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2026';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Sistema_Cool, frm_sistema_cool);
  frm_sistema_cool.ShowModal;
  frm_main.KickUser;

  Verifica;
end;

procedure Tfrm_exp.relatrioRiex1Click(Sender: TObject);
var
  Excel: TExcelApplication;
  WorkBook: ExcelWorkbook;
  Sheet: ExcelWorksheet;
  Linha: Integer;
  vNrCde, vFornecimento : String;
  vVlTotal, vVlMerc : Double;
begin
  Application.ProcessMessages;
  with Tquery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add( ' SELECT EI.NR_PEDIDO, RF.CD_FORNECIMENTO, EI.CD_NCM, EI.TX_MERCADORIA, UM.NM_SIGLA, EI.QT_MERCADORIA, EI.VL_UNITARIO, EI.VL_TOT_ITEM,');
    SQL.Add( ' (SELECT TOP 1 ISNULL(VL_TAXA, 1) FROM TPROCESSO_EXP_NF (NOLOCK) WHERE NR_PROCESSO = EI.NR_PROCESSO) VL_TAXA, ');
    SQL.Add( ' (SELECT SUM(ISNULL(VL_PRECO_TOT, 0)) FROM  MYINDAIA.DBO.TRAP_FORNECIMENTO RF WHERE RF.CD_RAP = R.CD_RAP AND RF.CD_RAP_ANO = R.CD_RAP_ANO AND RF.CD_MERCADORIA = EI.CD_MERCADORIA) VL_TOTAL');
    SQL.Add( ' FROM TPROCESSO_EXP_ITEM EI (NOLOCK) ');
    SQL.Add( ' INNER JOIN TUNID_MEDIDA_BROKER UM (NOLOCK) ON UM.CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA');
    SQL.Add( ' INNER JOIN MYINDAIA.DBO.TRAP R (NOLOCK) ON R.NR_PROCESSO = EI.NR_PROCESSO ');
    SQL.Add( ' INNER JOIN MYINDAIA.DBO.TRAP_FORNECIMENTO RF (NOLOCK) ON RF.CD_RAP = R.CD_RAP AND RF.CD_RAP_ANO = R.CD_RAP_ANO AND RF.CD_MERCADORIA = EI.CD_MERCADORIA');
    SQL.Add( ' WHERE EI.NR_PROCESSO = :NR_PROCESSO');
    SQL.Add( ' ORDER BY EI.NR_PEDIDO');
    ParamByName('NR_PROCESSO').AsString := datm_exp.qry_exp_NR_PROCESSO.AsString;
    Open;
    First;
    vNrCde := FieldByName('NR_PEDIDO').asString;
    Linha := 4;
    vVlTotal := 0;
    vFornecimento := FieldByName('CD_FORNECIMENTO').asString;
    while not EOF do
    begin
      if ((vNrCde <> FieldByName('NR_PEDIDO').asString) or BOF) then
      begin
        try
          vNrCde := FieldByName('NR_PEDIDO').asString;
          Excel := TExcelApplication.Create(Self);
          WorkBook := Excel.Workbooks.Open(cDir_Rpt + '\Planilha_RIEX.XLS', EmptyParam,
               EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
               EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0) as ExcelWorkBook;
          WorkBook.SaveAs(cDir_Rpt + '\Planilha_RIEX' + StringReplace(FieldByName('NR_PEDIDO').asString, '/','', []) + '.XLS',
             EmptyParam, EmptyParam, EmptyParam, False, False, xlNoChanges, EmptyParam, False, EmptyParam, EmptyParam, 0)
        except
          MessageDlg('Erro ao abrir o arquivo ''' + cDir_Rpt + '\Planilha_RIEX.XLS''.'#13 +
             'Verifique se o arquivo existe e se não está sendo utilizado.', mtError, [mbOk], 0);
          Excel.Quit;
          Exit;
        end;
      end;
      try
        vVlMerc := FieldByName('VL_TOT_ITEM').AsFloat;
        if vFornecimento <> FieldByName('CD_FORNECIMENTO').asString then
        begin
          vVlTotal := 0;
          vFornecimento := FieldByName('CD_FORNECIMENTO').asString;
        end;
        vVlTotal := vVlTotal + vVlMerc;

        Sheet := WorkBook.Sheets[1] as ExcelWorkSheet;
        Sheet.Range['A' + IntToStr(Linha), 'A' + IntToStr(Linha)].Value := FieldByName('CD_FORNECIMENTO').asString;
        Sheet.Range['B' + IntToStr(Linha), 'B' + IntToStr(Linha)].Value := FieldByName('CD_NCM').asString;
        Sheet.Range['C' + IntToStr(Linha), 'C' + IntToStr(Linha)].Value := FieldByName('TX_MERCADORIA').asString;
        Sheet.Range['D' + IntToStr(Linha), 'D' + IntToStr(Linha)].Value := FieldByName('NM_SIGLA').asString;
        Sheet.Range['E' + IntToStr(Linha), 'E' + IntToStr(Linha)].Value := FieldByName('QT_MERCADORIA').asString;
        Sheet.Range['F' + IntToStr(Linha), 'F' + IntToStr(Linha)].Value := FieldByName('VL_UNITARIO').AsFloat;
        Sheet.Range['G' + IntToStr(Linha), 'G' + IntToStr(Linha)].Value := FieldByName('VL_TOT_ITEM').AsFloat / FieldByName('VL_TAXA').AsFloat;
        Sheet.Range['H' + IntToStr(Linha), 'H' + IntToStr(Linha)].Value := FieldByName('VL_TAXA').AsFloat;
        Sheet.Range['I' + IntToStr(Linha), 'I' + IntToStr(Linha)].Value := vVlMerc;
        Next;
        if ((vFornecimento <> FieldByName('CD_FORNECIMENTO').asString) or EOF) then
        begin
          Sheet.Range['J' + IntToStr(Linha), 'J' + IntToStr(Linha)].Value := vVlTotal;
          vVlTotal := 0;
        end;
        Inc(Linha);
      except
        on E: Exception do
          MessageDlg('Erro preenchendo o arquivo.'#13 + E.Message, mtError, [mbOk], 0);
      end;
      if (vNrCde <> FieldByName('NR_PEDIDO').asString) then
      begin
        Excel.Visible[0] := True;
        WorkBook.Save(0);
        Linha := 4;
      end;
    end;
    Excel.Quit;
  end;
end;

procedure Tfrm_exp.ProgramaoRodoviria1Click(Sender: TObject);
begin
  try
    frmRelatoriosNestle := TfrmRelatoriosNestle.Create(nil);
    frmRelatoriosNestle.lblNomeRelatorio.Caption := ProgramaoRodoviria1.caption;
    frmRelatoriosNestle.Caption                  := frmRelatoriosNestle.Caption +  StringReplace(ProgramaoRodoviria1.caption, '&', '', [rfReplaceAll]);
    frmRelatoriosNestle.TipoRelatorio            := 0; //Programacao Rodoviaria
    frmRelatoriosNestle.edtNrProcesso.Text       := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
    frmRelatoriosNestle.cbProduto.KeyValue       := '02';
    frmRelatoriosNestle.edtProduto.text          := '02';
    frmRelatoriosNestle.cbUnidade.KeyValue       :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.edUnidade.text           :=  msk_cd_unid_neg.Text;

    frmRelatoriosNestle.ShowModal;
  finally
    FreeAndNil(frmRelatoriosNestle);
  end;
end;

procedure Tfrm_exp.Saque1Click(Sender: TObject);
begin
  try
    frmRelatoriosNestle := TfrmRelatoriosNestle.Create(nil);
    frmRelatoriosNestle.lblNomeRelatorio.Caption := Saque1.caption;
    frmRelatoriosNestle.Caption                  := frmRelatoriosNestle.Caption + StringReplace(Saque1.caption, '&', '', [rfReplaceAll]);
    frmRelatoriosNestle.TipoRelatorio            := 1; //Saque
    frmRelatoriosNestle.edtNrProcesso.Text       := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
    frmRelatoriosNestle.cbProduto.KeyValue       := '02';
    frmRelatoriosNestle.edtProduto.text          := '02';
    frmRelatoriosNestle.cbUnidade.KeyValue       :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.edUnidade.text           :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.ShowModal;
  finally
    FreeAndNil(frmRelatoriosNestle);
  end;
end;

procedure Tfrm_exp.CertificadodeQualidade1Click(Sender: TObject);
begin
  try
    frmRelatoriosNestle := TfrmRelatoriosNestle.Create(nil);
    frmRelatoriosNestle.lblNomeRelatorio.Caption := CertificadodeQualidade1.caption;
    frmRelatoriosNestle.Caption                  := frmRelatoriosNestle.Caption + StringReplace(CertificadodeQualidade1.caption, '&', '', [rfReplaceAll]);
    frmRelatoriosNestle.TipoRelatorio            := 2; //Internal Export Document
    frmRelatoriosNestle.edtNrProcesso.Text       := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
    frmRelatoriosNestle.cbProduto.KeyValue       := '02';
    frmRelatoriosNestle.edtProduto.text          := '02';
    frmRelatoriosNestle.cbUnidade.KeyValue       :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.edUnidade.text           :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.ShowModal;
  finally
    FreeAndNil(frmRelatoriosNestle);
  end;
end;

procedure Tfrm_exp.Border1Click(Sender: TObject);
begin
  try
    frmRelatoriosNestle := TfrmRelatoriosNestle.Create(nil);
    frmRelatoriosNestle.lblNomeRelatorio.Caption := Border1.caption;
    frmRelatoriosNestle.Caption                  := frmRelatoriosNestle.Caption + StringReplace(Border1.caption, '&', '', [rfReplaceAll]);
    frmRelatoriosNestle.TipoRelatorio            := 3; //Bordero
    frmRelatoriosNestle.edtNrProcesso.Text       := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
    frmRelatoriosNestle.cbProduto.KeyValue       := '02';
    frmRelatoriosNestle.edtProduto.text          := '02';
    frmRelatoriosNestle.cbUnidade.KeyValue       :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.edUnidade.text           :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.ShowModal;
  finally
    FreeAndNil(frmRelatoriosNestle);
  end;
end;

procedure Tfrm_exp.CARICOM1Click(Sender: TObject);
begin
  try
    frmRelatoriosNestle := TfrmRelatoriosNestle.Create(nil);
    frmRelatoriosNestle.lblNomeRelatorio.Caption := CARICOM1.caption;
    frmRelatoriosNestle.Caption                  := frmRelatoriosNestle.Caption + StringReplace(CARICOM1.caption, '&', '', [rfReplaceAll]);
    frmRelatoriosNestle.TipoRelatorio            := 4; //CARICOM
    frmRelatoriosNestle.edtNrProcesso.Text       := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
    frmRelatoriosNestle.cbProduto.KeyValue       := '02';
    frmRelatoriosNestle.edtProduto.text          := '02';
    frmRelatoriosNestle.cbUnidade.KeyValue       :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.edUnidade.text           :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.ShowModal;
  finally
    FreeAndNil(frmRelatoriosNestle);
  end;
end;

procedure Tfrm_exp.PackingList1Click(Sender: TObject);
begin
  try
    frmRelatoriosNestle := TfrmRelatoriosNestle.Create(nil);
    frmRelatoriosNestle.lblNomeRelatorio.Caption := PackingList1.caption;
    frmRelatoriosNestle.Caption                  := frmRelatoriosNestle.Caption + StringReplace(PackingList1.caption, '&', '', [rfReplaceAll]);
    frmRelatoriosNestle.TipoRelatorio            := 6; //Packing List
    frmRelatoriosNestle.edtNrProcesso.Text       := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
    frmRelatoriosNestle.cbProduto.KeyValue       := '02';
    frmRelatoriosNestle.edtProduto.text          := '02';
    frmRelatoriosNestle.cbUnidade.KeyValue       :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.edUnidade.text           :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.ShowModal;
  finally
    FreeAndNil(frmRelatoriosNestle);
  end;
end;

procedure Tfrm_exp.FaturaComercial1Click(Sender: TObject);
begin
  try
    frmRelatoriosNestle := TfrmRelatoriosNestle.Create(nil);
    frmRelatoriosNestle.lblNomeRelatorio.Caption := FaturaComercial1.caption;
    frmRelatoriosNestle.Caption                  := frmRelatoriosNestle.Caption + StringReplace(FaturaComercial1.caption, '&', '', [rfReplaceAll]);
    frmRelatoriosNestle.TipoRelatorio            := 7; //Fatura Comercial
    frmRelatoriosNestle.edtNrProcesso.Text       := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
    frmRelatoriosNestle.cbProduto.KeyValue       := '02';
    frmRelatoriosNestle.edtProduto.text          := '02';
    frmRelatoriosNestle.cbUnidade.KeyValue       :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.edUnidade.text           :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.ShowModal;
  finally
    FreeAndNil(frmRelatoriosNestle);
  end;
end;

procedure Tfrm_exp.SpeedButton8Click(Sender: TObject);
begin
  if Trim(str_nr_processo) = '' then str_nr_processo := datm_exp.qry_exp_NR_PROCESSO.AsString;
  frm_main.AbrirMiniBroker('ProcessosDue1', str_nr_processo);
end;

procedure Tfrm_exp.CertificadoVigilnciaSanitria1Click(Sender: TObject);
begin
  try
    frmRelatoriosNestle := TfrmRelatoriosNestle.Create(nil);
    frmRelatoriosNestle.lblNomeRelatorio.Caption := CertificadoVigilnciaSanitria1.caption;
    frmRelatoriosNestle.Caption                  := frmRelatoriosNestle.Caption + StringReplace(CertificadoVigilnciaSanitria1.caption, '&', '', [rfReplaceAll]);
    frmRelatoriosNestle.TipoRelatorio            := 9; //Certificado Vigilancia Sanitaria
    frmRelatoriosNestle.edtNrProcesso.Text       := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
    frmRelatoriosNestle.cbProduto.KeyValue       := '02';
    frmRelatoriosNestle.edtProduto.text          := '02';
    frmRelatoriosNestle.cbUnidade.KeyValue       :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.edUnidade.text           :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.ShowModal;
  finally
    FreeAndNil(frmRelatoriosNestle);
  end;
end;

procedure Tfrm_exp.FaturaComercial2Click(Sender: TObject);
begin
//  try
//    frmDocumentosExportacao := tfrmDocumentosExportacao.Create(nil);
//    frmDocumentosExportacao.lblNomeRelatorio.Caption := FaturaComercial2.caption;
//    frmDocumentosExportacao.Caption                  := frmRelatoriosNestle.Caption + StringReplace(FaturaComercial2.caption, '&', '', [rfReplaceAll]);
//    frmDocumentosExportacao.TipoRelatorio            := 1; //Fatura Comercial
//    frmDocumentosExportacao.edtNrProcesso.Text       := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
//    frmDocumentosExportacao.cbProduto.KeyValue       := '02';
//    frmDocumentosExportacao.edtProduto.text          := '02';
//    frmDocumentosExportacao.cbUnidade.KeyValue       :=  msk_cd_unid_neg.Text;
//    frmDocumentosExportacao.edUnidade.text           :=  msk_cd_unid_neg.Text;
//    frmDocumentosExportacao.ShowModal;
//  finally
//    FreeAndNil(frmDocumentosExportacao);
//  end;

  DocumentosExportacao(trFaturaComercial);
end;


procedure Tfrm_exp.PackingList2Click(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_exp_impr_packing, frm_exp_impr_packing);
  frm_exp_impr_packing.str_cd_unid_neg_exp := msk_cd_unid_neg.Text;
  frm_exp_impr_packing.str_nr_proc_exp     := datm_exp.qry_exp_CalcNrProcesso.AsString;
  frm_exp_impr_packing.Petronas := True;
  frm_exp_impr_packing.ShowModal;   }
//
//  try
//    frmDocumentosExportacao := tfrmDocumentosExportacao.Create(nil);
//    frmDocumentosExportacao.lblNomeRelatorio.Caption := PackingList2.caption;
//    frmDocumentosExportacao.Caption                  := frmRelatoriosNestle.Caption + StringReplace(PackingList2.caption, '&', '', [rfReplaceAll]);
//    frmDocumentosExportacao.TipoRelatorio            := 2; //Packing List
//    frmDocumentosExportacao.edtNrProcesso.Text       := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
//    frmDocumentosExportacao.cbProduto.KeyValue       := '02';
//    frmDocumentosExportacao.edtProduto.text          := '02';
//    frmDocumentosExportacao.cbUnidade.KeyValue       :=  msk_cd_unid_neg.Text;
//    frmDocumentosExportacao.edUnidade.text           :=  msk_cd_unid_neg.Text;
//    frmDocumentosExportacao.ShowModal;
//  finally
//    FreeAndNil(frmDocumentosExportacao);
//  end;

  DocumentosExportacao(trPackingList);
end;

procedure Tfrm_exp.validarLotesNestleClick(Sender: TObject);
begin
  try
    frmValidarLotesNestle := tfrmValidarLotesNestle.create(nil);
    frmValidarLotesNestle.showModal;
  finally
    freeAndNil(frmValidarLotesNestle);
  end;
end;

procedure Tfrm_exp.btnDraftBlClick(Sender: TObject);
begin
  frm_main.AbrirMiniBroker('DraftBL', str_nr_processo);
end;

procedure Tfrm_exp.PackingList3Click(Sender: TObject);
begin
  DocumentosExportacao(trPackingList);
end;

procedure Tfrm_exp.DocumentosExportacao(TipoRelatorio: TRelatorio);
begin
  try
    frmDocumentosExportacao := tfrmDocumentosExportacao.Create(nil);
    frmDocumentosExportacao.lblNomeRelatorio.Caption := PackingList2.caption;
    frmDocumentosExportacao.Caption                  := frmRelatoriosNestle.Caption + StringReplace(PackingList2.caption, '&', '', [rfReplaceAll]);
    frmDocumentosExportacao.TipoRelatorio            := TipoRelatorio;
    frmDocumentosExportacao.edtNrProcesso.Text       := datm_exp.qry_exp_.FieldByName('CALCNRPROCESSO').AsString;
    frmDocumentosExportacao.cbProduto.KeyValue       := '02';
    frmDocumentosExportacao.edtProduto.text          := '02';
    frmDocumentosExportacao.cbUnidade.KeyValue       :=  msk_cd_unid_neg.Text;
    frmDocumentosExportacao.edUnidade.text           :=  msk_cd_unid_neg.Text;
    frmDocumentosExportacao.ShowModal;
  finally
    FreeAndNil(frmDocumentosExportacao);
  end;
end;

procedure Tfrm_exp.FaturaComercial3Click(Sender: TObject);
begin
  DocumentosExportacao(trFaturaComercial);
end;

end.
